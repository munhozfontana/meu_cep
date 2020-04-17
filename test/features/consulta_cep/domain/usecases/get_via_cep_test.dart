import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meu_cep/features/consulta_cep/domain/entities/via_cep.dart';
import 'package:meu_cep/features/consulta_cep/domain/repositores/via_cep_repository.dart';
import 'package:meu_cep/features/consulta_cep/domain/usecases/get_via_cep.dart';
import 'package:mockito/mockito.dart';

class MockViaCepRepository extends Mock implements ViaCepRepository {}

void main() {
  GetViaCep usecase;
  MockViaCepRepository mockViaCepRepository;

  setUp(() {
    mockViaCepRepository = MockViaCepRepository();
    usecase = GetViaCep(mockViaCepRepository);
  });

  final tCep = "71010057";
  final tViaCep = ViaCep(
      cep: "71010-057",
      logradouro: "QI 10 Bloco E",
      complemento: "",
      bairro: "Guará I",
      localidade: "Brasília",
      uf: "DF",
      unidade: "",
      ibge: "5300108",
      gia: "");

  test('Should get return andress from the repository', () async {
    // arrange
    when(mockViaCepRepository.getViaCepByCep(any))
        .thenAnswer((_) async => Right(tViaCep));

    // act
    final result = await usecase(Params(cep: tCep));

    // assert
    expect(result, Right(tViaCep));
    verify(mockViaCepRepository.getViaCepByCep(tCep));
    verifyNoMoreInteractions(mockViaCepRepository);
  });
}
