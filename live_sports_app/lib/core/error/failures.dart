import 'package:equatable/equatable.dart';

sealed class Failure extends Equatable {
  const Failure({this.message, this.code});

  final String? message;
  final String? code;

  @override
  List<Object?> get props => [message, code];
}

class NetworkFailure extends Failure {
  const NetworkFailure({super.message, super.code});
}

class ServerFailure extends Failure {
  const ServerFailure({super.message, super.code, this.statusCode});

  final int? statusCode;

  @override
  List<Object?> get props => [...super.props, statusCode];
}

class CacheFailure extends Failure {
  const CacheFailure({super.message, super.code});
}

class TimeoutFailure extends Failure {
  const TimeoutFailure({super.message, super.code});
}

class UnknownFailure extends Failure {
  const UnknownFailure({super.message, super.code});
}