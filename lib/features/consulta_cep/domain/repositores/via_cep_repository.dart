import 'package:dartz/dartz.dart';
import 'package:meu_cep/core/error/failures.dart';
import 'package:meu_cep/features/consulta_cep/domain/entities/via_cep.dart';

abstract class ViaCepRepository {
  Future<Either<Failure, ViaCep>> getViaCepByCep(String cep);
}
