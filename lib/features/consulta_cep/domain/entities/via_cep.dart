import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ViaCep extends Equatable {
  final String cep;
  final String logradouro;
  final String complemento;
  final String bairro;
  final String localidade;
  final String uf;
  final String unidade;
  final String ibge;
  final String gia;

  ViaCep(
      {@required this.cep,
      @required this.bairro,
      @required this.uf,
      @required this.logradouro,
      @required this.complemento,
      @required this.localidade,
      @required this.unidade,
      @required this.ibge,
      @required this.gia});
}
