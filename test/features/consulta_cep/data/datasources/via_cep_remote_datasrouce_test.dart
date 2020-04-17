import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:meu_cep/core/error/exceptions.dart';
import 'package:meu_cep/features/consulta_cep/data/datasources/via_cep_remote_datasource.dart';
import 'package:meu_cep/features/consulta_cep/data/models/via_cep_model.dart';
import 'package:mockito/mockito.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  ViaCepRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  final tViaCepModel =
      ViaCepModel.fromJson(json.decode(fixture('response.json')));
  final tViaCepModelError =
      ViaCepModel.fromJson(json.decode(fixture('response_error.json')));

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = ViaCepRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get via cep', () {
    final tCep = "71010057";
    test('should preform a GET request to endpoint VIACEP', () {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture("response.json"), 200),
      );

      dataSource.getViaCepByCep(tCep);

      verify(
        mockHttpClient.get(
          'https://viacep.com.br/ws/$tCep/json/',
          headers: {'Content-Type': 'application/json'},
        ),
      );
    });

    test('should return VIACEP when the response code is 200 (success)',
        () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture("response.json"), 200),
      );

      final result = await dataSource.getViaCepByCep(tCep);

      expect(result, equals(tViaCepModel));
    });

    test('should return VIACEP when the response code is 200 (error)',
        () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async => http.Response(fixture("response_error.json"), 200),
      );

      final result = await dataSource.getViaCepByCep(tCep);

      expect(result, equals(tViaCepModelError));
    });

    test(
        "should throw a ServerExcption when the response code is diff of value 200",
        () async {
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('Something went wrong', 404));

      final call = dataSource.getViaCepByCep;

      expect(() => call(tCep), throwsA(isInstanceOf<ServerException>()));
    });
  });
}
