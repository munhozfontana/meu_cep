import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:meu_cep/core/error/exceptions.dart';
import 'package:meu_cep/features/consulta_cep/data/models/via_cep_model.dart';
import 'package:meu_cep/features/consulta_cep/domain/entities/via_cep.dart';
import 'package:http/http.dart' as http;

abstract class ViaCepRemoteDataSource {
  /// Calls the https://viacep.com.br/ws/{cep}/json/ endpoint.
  ///
  /// Throws a [ServerException] for all erro codes.
  Future<ViaCep> getViaCepByCep(String cep);
}

class ViaCepRemoteDataSourceImpl implements ViaCepRemoteDataSource {
  final http.Client client;

  ViaCepRemoteDataSourceImpl({@required this.client});

  @override
  Future<ViaCep> getViaCepByCep(String cep) async {
    final response = await client.get(
      'https://viacep.com.br/ws/$cep/json/',
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      return ViaCepModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
