import 'package:calculadora_imc_flutter/model/imc.dart';
import 'package:calculadora_imc_flutter/repositories/imc_repository.dart';
import 'package:flutter/material.dart';

class HistoricoPage extends StatefulWidget {
  const HistoricoPage({Key? key}) : super(key: key);

  @override
  _HistoricoPageState createState() => _HistoricoPageState();
}

class _HistoricoPageState extends State<HistoricoPage> {
  var imcRepository = ImcRepository();
  var _imcs = const <Imc>[];

  @override
  void initState() {
    super.initState();
    obterImcs();
  }

  void obterImcs() async {
    _imcs = await imcRepository.obterDados();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: const Text("HISTÓRICO"),
        ),
        body: ListView.builder(
          itemCount: _imcs.length,
          itemBuilder: (BuildContext context, int index) {
            var imc = _imcs[index];
            return ListTile(
              trailing: Text(imc.categoria.toString()),
              title: Text(imc.resultado.toString()),
            );
          },
        ),
      ),
    );
  }
}
