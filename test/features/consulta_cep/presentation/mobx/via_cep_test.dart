import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:meu_cep/features/consulta_cep/domain/entities/via_cep.dart';
import 'package:meu_cep/features/consulta_cep/domain/usecases/get_via_cep.dart';
import 'package:meu_cep/features/consulta_cep/presentation/mobx/via_cep.dart';
import 'package:mockito/mockito.dart';

class MockGetViaCep extends Mock implements GetViaCep {}

void main() {
  ViaCepStore store;
  MockGetViaCep mockGetViaCep;

  setUp(() {
    mockGetViaCep = MockGetViaCep();

    store = ViaCepStore(getViaCep: mockGetViaCep);
  });

  String setUpChangeTextCorrect() {
    const tChangeText = "71010057";

    store.setText(tChangeText);
    return tChangeText;
  }

  test('Initial state should be Empty, but not null', () {
    expect(store.inputCep, equals(""));
  });

  test('change text', () {
    String tChangeText = setUpChangeTextCorrect();
    expect(store.inputCep, tChangeText);
  });

  test('test intial state loading', () {
    expect(store.loading, false);
  });

  test('test loading on', () {
    store.setLoading(true);
    expect(store.loading, true);
  });

  test('test loading false', () {
    store.setLoading(false);
    expect(store.loading, false);
  });

  test('test execute post VIACEP', () async {
    ViaCep viaCep = ViaCep(
        bairro: "Bairro x",
        cep: "71010057",
        uf: "DF",
        localidade: null,
        complemento: null,
        gia: null,
        ibge: null,
        logradouro: null,
        unidade: null);
    setUpChangeTextCorrect();

    when(mockGetViaCep(any)).thenAnswer((_) async => Right(viaCep));

    store.requestViaCep();

    expectLater(store.viaCep, viaCep);
  });
}
