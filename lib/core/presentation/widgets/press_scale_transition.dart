import 'package:flutter/material.dart';

class PressScaleTransition extends StatefulWidget {
  const PressScaleTransition({
    required this.child, 
    required this.onPressed,
    this.endScale = 0.97,
    super.key, 
  });

  final Widget child;
  final VoidCallback onPressed;
  final double endScale;

  @override
  State<PressScaleTransition> createState() => _PressScaleTransitionState();
}

class _PressScaleTransitionState extends State<PressScaleTransition> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;

  bool _childHandledPress = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 150,), );

    _scaleAnimation = Tween<double>(begin: 1.0, end: widget.endScale).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut,),);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void _handleTapDown(TapDownDetails detail) {
    const _PressScaleNotification().dispatch(context);

    Future.microtask(() {
      if (!_childHandledPress && mounted) {
        _controller.forward();
      }

      _childHandledPress = false;
    });
  }

  Future<void> _handleTapUp(TapUpDetails details) async {
    await Future<void>.delayed(const Duration(milliseconds: 50));

    if (!mounted) return;
    widget.onPressed.call();
    await _controller.reverse();
  }

  Future<void> _handleTapCancel() async {
    await Future<void>.delayed(const Duration(milliseconds: 50));

    if (!mounted) return;
    await _controller.reverse();
  }


  @override
  Widget build(BuildContext context) {
    return NotificationListener<_PressScaleNotification>(
      onNotification: (notification) {
        _childHandledPress = true;
        return true;
      },
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTapDown: _handleTapDown,
        onTapUp: _handleTapUp,
        onTapCancel: _handleTapCancel,
        child: ScaleTransition(
          scale: _scaleAnimation, 
          child: widget.child,
        ),
      )
    );
  }
}

class _PressScaleNotification extends Notification {
  const _PressScaleNotification(); 
}