import 'package:flutter/cupertino.dart';
import 'package:meu_cep/features/consulta_cep/domain/entities/via_cep.dart';

class ViaCepModel extends ViaCep {
  ViaCepModel({
    @required String cep,
    @required String uf,
    @required String logradouro,
    @required String complemento,
    @required String bairro,
    @required String localidade,
    @required String unidade,
    @required String ibge,
    @required String gia,
  }) : super(
          cep: cep,
          logradouro: logradouro,
          complemento: complemento,
          bairro: bairro,
          localidade: localidade,
          uf: uf,
          unidade: unidade,
          ibge: ibge,
          gia: gia,
        );

  factory ViaCepModel.fromJson(Map<String, dynamic> jsonMap) {
    return ViaCepModel(
      cep: jsonMap['cep'],
      uf: jsonMap['uf'],
      bairro: jsonMap['bairro'],
      complemento: jsonMap['complemento'],
      gia: jsonMap['gia'],
      ibge: jsonMap['ibge'],
      localidade: jsonMap['localidade'],
      logradouro: jsonMap['logradouro'],
      unidade: jsonMap['unidade'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cep': cep,
      'uf': uf,
      'bairro': bairro,
      'complemento': complemento,
      'gia': gia,
      'ibge': ibge,
      'localidade': localidade,
      'logradouro': logradouro,
      'unidade': unidade,
    };
  }
}
