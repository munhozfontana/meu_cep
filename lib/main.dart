import 'package:flutter/material.dart';
import 'package:meu_cep/features/consulta_cep/presentation/pages/ViaCep.dart';
import 'injection_container.dart' as di;

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ViaCep(),
    );
  }
}
