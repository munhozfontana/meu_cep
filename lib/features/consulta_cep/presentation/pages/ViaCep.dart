import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meu_cep/features/consulta_cep/presentation/mobx/via_cep.dart';
import 'package:meu_cep/injection_container.dart';

class ViaCep extends StatelessWidget {
  final vm = sl<ViaCepStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
      ),
      body: Observer(
        builder: (_) {
          return Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * .45,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      inputValue("uf", vm.viaCep.uf),
                      inputValue("cep", vm.viaCep.cep),
                      inputValue("bairro", vm.viaCep.bairro),
                      inputValue("complemento", vm.viaCep.complemento),
                      inputValue("gia", vm.viaCep.gia),
                      inputValue("localidade", vm.viaCep.localidade),
                      inputValue("logradouro", vm.viaCep.logradouro),
                      inputValue("unidade", vm.viaCep.unidade),
                      inputValue("ibge", vm.viaCep.ibge),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * .4,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) => vm.setText(value),
                          onSubmitted: (value) => vm.requestViaCep()),
                    ],
                  ),

                  // child: ,
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Container inputValue(String label, String value) {
    return Container(
      child: Text("$label: $value"),
    );
  }
}
