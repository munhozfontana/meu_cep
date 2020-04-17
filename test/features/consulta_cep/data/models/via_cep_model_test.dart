import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:meu_cep/features/consulta_cep/data/models/via_cep_model.dart';
import 'package:meu_cep/features/consulta_cep/domain/entities/via_cep.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tCepModel = ViaCepModel(
      cep: "71010-057",
      bairro: "Guará I",
      uf: "DF",
      complemento: null,
      gia: null,
      ibge: null,
      localidade: null,
      logradouro: null,
      unidade: null);

  test('Sould be a subclass of ViaCepModel', () {
    expect(tCepModel, isA<ViaCep>());
  });

  group('fromJson', () {
    test('should return a valid model when the JSON number cep is correct',
        () async {
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('response.json'));

      final result = ViaCepModel.fromJson(jsonMap);

      expect(result, tCepModel);
    });

    test('should reutnr a valid model to Json', () async {
      final result = tCepModel.toJson();

      final expectedMap = {
        "cep": "71010-057",
        "bairro": "Guará I",
        "uf": "DF",
      };

      expect(result, expectedMap);
    });
  });
}
