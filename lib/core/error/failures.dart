import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure([List properties = const <dynamic>[]]);
}

// General failures
class ServerFailure extends Failure {
  final String detail;

  ServerFailure({this.detail});

  @override
  // TODO: implement props
  List<Object> get props => [detail];
}
