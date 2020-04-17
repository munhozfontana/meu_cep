import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meu_cep/core/error/exceptions.dart';
import 'package:meu_cep/core/error/failures.dart';
import 'package:meu_cep/core/network/network_info.dart';
import 'package:meu_cep/features/consulta_cep/data/datasources/via_cep_remote_datasource.dart';
import 'package:meu_cep/features/consulta_cep/data/models/via_cep_model.dart';
import 'package:meu_cep/features/consulta_cep/data/repositores/via_cep_repository_impl.dart';
import 'package:meu_cep/features/consulta_cep/domain/entities/via_cep.dart';
import 'package:mockito/mockito.dart';

class MockViaCepRemoteDataSource extends Mock
    implements ViaCepRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  ViaCepRepositoryImpl repository;
  MockViaCepRemoteDataSource mockViaCepRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockViaCepRemoteDataSource = MockViaCepRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ViaCepRepositoryImpl(
      viaCepRemoteDatasource: mockViaCepRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      body();
    });
  }

  void runTestsOffOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
      body();
    });
  }

  runTestsOnline(() {
    final tCepInvalidChars = "A101005A";
    final tCep = "71010057";
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
    final ViaCep tViaCep = tCepModel;
    test('shold check if the device is online', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      repository.getViaCepByCep(tCep);

      verify(mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test(
          'Should return remote data when the call to remote data source is successfull',
          () async {
        when(mockViaCepRemoteDataSource.getViaCepByCep(any))
            .thenAnswer((_) async => tCepModel);

        final result = await repository.getViaCepByCep(tCep);

        verify(mockViaCepRemoteDataSource.getViaCepByCep(tCep));
        expect(result, equals(Right(tViaCep)));
      });

      test(
          'Should return data not find when the call to remote data source is successfull',
          () async {
        when(mockViaCepRemoteDataSource.getViaCepByCep(any))
            .thenAnswer((_) async => tCepModel);

        final result = await repository.getViaCepByCep(tCep);

        verify(mockViaCepRemoteDataSource.getViaCepByCep(tCep));
        expect(result, equals(Right(tViaCep)));
      });

      test('Should return Server Error', () async {
        when(mockViaCepRemoteDataSource.getViaCepByCep(any))
            .thenThrow(ServerException());

        final result = await repository.getViaCepByCep(tCepInvalidChars);

        expect(
            result,
            equals(
              Left(ServerFailure(detail: "Erro ao tentar procurar o Cep")),
            ));
      });
    });

    runTestsOffOnline(() {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      test('Should return Server Error', () async {
        when(mockViaCepRemoteDataSource.getViaCepByCep(any))
            .thenThrow(ServerException());

        final result = await repository.getViaCepByCep(tCepInvalidChars);

        expect(
          result,
          equals(
            Left(ServerFailure(detail: "Erro ao tentar procurar o Cep")),
          ),
        );
      });
    });
  });
}
