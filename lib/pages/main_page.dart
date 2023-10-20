import 'package:calculadora_imc_flutter/model/imc.dart';
import 'package:calculadora_imc_flutter/repositories/imc_repository.dart';
import 'package:calculadora_imc_flutter/service/calcula_imc_service.dart';
import 'package:calculadora_imc_flutter/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  var imcRepository = ImcRepository();
  double resultado = 0;
  String categoria = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: const Text("CALCULADORA IMC"),
        ),
        drawer: const CustomDrawer(),
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
              child: Column(
                children: [
                  Column(children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "PESO:",
                          style: TextStyle(fontSize: 16),
                        ),
                        TextField(
                            keyboardType: TextInputType.number,
                            key: const Key('peso_input'),
                            controller: pesoController,
                            decoration: const InputDecoration(
                                hintText: "Digite seu peso...",
                                contentPadding:
                                    EdgeInsets.only(top: 0, left: 10),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(
                                            255, 179, 178, 177))))),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("ALTURA:", style: TextStyle(fontSize: 16)),
                        TextField(
                            keyboardType: TextInputType.number,
                            key: const Key('altura_input'),
                            controller: alturaController,
                            decoration: const InputDecoration(
                                hintText: "Digite sua Altura...",
                                contentPadding:
                                    EdgeInsets.only(top: 0, left: 10),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromARGB(
                                            255, 179, 178, 177))))),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 50,
                          child: TextButton(
                              onPressed: () async {
                                resultado = CalculaImcService.calculaImc(
                                    double.parse(pesoController.text),
                                    int.parse(alturaController.text));
                                categoria = CalculaImcService.defineCategoria(
                                    resultado);
                                await imcRepository.salvar(Imc(
                                    0,
                                    double.parse(pesoController.text),
                                    double.parse(alturaController.text),
                                    CalculaImcService.calculaImc(
                                        double.parse(pesoController.text),
                                        int.parse(alturaController.text)),
                                    CalculaImcService.defineCategoria(
                                        resultado)));
                                setState(() {});
                              },
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 207, 73, 28)),
                              ),
                              child: const Text("CALCULAR",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16))),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("SEU IMC É: $resultado"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("SUA CATEGORIA É: $categoria")],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
