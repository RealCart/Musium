class Either<L, R> {
  Either._(this._left, this._right);

  factory Either.left(L? left) =>  Either._(left, null);
  factory Either.right(R? right) => Either._(null, right);

  final L? _left;
  final R? _right;

  L? get left => _left;
  R? get right => _right;

  void fold(void Function(L left) l, void Function(R right) r) {
    if (_left == null) {
      r.call(_right!);
    } else {
      l.call(_left);
    }
  }
}