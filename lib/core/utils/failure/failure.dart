import 'package:flutter/material.dart';

@immutable
sealed class  Failure {
  const Failure({
    required this.errorMessage,
    this.statusCode,
  });

  final int? statusCode;
  final String errorMessage;
}

final class NetworkFailure extends Failure {
  const NetworkFailure() : super(
    
  );
}

final class UnexpectedFailure extends Failure {
  const UnexpectedFailure() : super(
    errorMessage: "Unexpected failure"
  );
}