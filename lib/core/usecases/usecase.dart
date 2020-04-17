import 'package:dartz/dartz.dart';
import 'package:meu_cep/core/error/failures.dart';
import 'package:meu_cep/features/consulta_cep/domain/entities/via_cep.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, ViaCep>> call(Params params);
}
