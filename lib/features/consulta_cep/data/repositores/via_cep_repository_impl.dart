import 'package:flutter/cupertino.dart';
import 'package:meu_cep/core/error/exceptions.dart';
import 'package:meu_cep/core/network/network_info.dart';
import 'package:meu_cep/features/consulta_cep/data/datasources/via_cep_remote_datasource.dart';
import 'package:meu_cep/features/consulta_cep/domain/entities/via_cep.dart';
import 'package:meu_cep/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:meu_cep/features/consulta_cep/domain/repositores/via_cep_repository.dart';

class ViaCepRepositoryImpl implements ViaCepRepository {
  final ViaCepRemoteDataSource viaCepRemoteDatasource;
  final NetworkInfo networkInfo;

  ViaCepRepositoryImpl({
    @required this.viaCepRemoteDatasource,
    @required this.networkInfo,
  });

  @override
  Future<Either<Failure, ViaCep>> getViaCepByCep(String cep) async {
    if (await networkInfo.isConnected == true) {
      try {
        return Right(await viaCepRemoteDatasource.getViaCepByCep(cep));
      } on ServerException {
        return Left(ServerFailure(detail: "Erro ao tentar procurar o Cep"));
      }
    } else {
      return Left(ServerFailure(detail: "Você não está com internet"));
    }
  }
}
