import 'package:flutter/cupertino.dart';
import 'package:meu_cep/core/error/failures.dart';
import 'package:meu_cep/features/consulta_cep/domain/entities/via_cep.dart';
import 'package:meu_cep/features/consulta_cep/domain/usecases/get_via_cep.dart';
import 'package:mobx/mobx.dart';

part 'via_cep.g.dart';

class ViaCepStore = ViaCepStoreBase with _$ViaCepStore;

abstract class ViaCepStoreBase with Store {
  final GetViaCep getViaCep;

  ViaCepStoreBase({
    @required GetViaCep getViaCep,
  })  : assert(getViaCep != null),
        getViaCep = getViaCep;

  @observable
  String inputCep = "";

  @action
  void setText(String newState) => inputCep = newState;

  @observable
  bool loading = false;

  @action
  void setLoading(bool newState) => loading = newState;

  @observable
  ViaCep viaCep = ViaCep(
      bairro: null,
      cep: null,
      uf: null,
      complemento: null,
      gia: null,
      ibge: null,
      localidade: null,
      logradouro: null,
      unidade: null);

  @action
  void setCep(ViaCep newState) => viaCep = newState;

  void requestViaCep() async {
    setLoading(true);
    final result = await getViaCep(Params(cep: inputCep));

    result.fold(
        (failure) => throw ServerFailure(detail: "Erro ao tentar acessar rest"),
        (response) => setCep(response));

    setLoading(false);
  }
}
