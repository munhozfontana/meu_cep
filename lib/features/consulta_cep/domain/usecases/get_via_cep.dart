import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meu_cep/core/error/failures.dart';
import 'package:meu_cep/core/usecases/usecase.dart';
import 'package:meu_cep/features/consulta_cep/domain/entities/via_cep.dart';
import 'package:meu_cep/features/consulta_cep/domain/repositores/via_cep_repository.dart';

class GetViaCep implements UseCase<ViaCep, Params> {
  final ViaCepRepository repository;

  GetViaCep(this.repository);

  Future<Either<Failure, ViaCep>> call(Params params) async {
    return await repository.getViaCepByCep(params.cep);
  }
}

class Params extends Equatable {
  final String cep;

  Params({@required this.cep}) : super([cep]);
}
