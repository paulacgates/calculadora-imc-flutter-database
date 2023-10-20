import 'package:calculadora_imc_flutter/pages/historico_page.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  context: context,
                  builder: (BuildContext bc) {
                    return Wrap(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Camera"),
                          leading: const Icon(Icons.camera_alt),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          title: const Text("Galeria"),
                          leading: const Icon(Icons.insert_photo),
                        )
                      ],
                    );
                  });
            },
            child: UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.orange),
              currentAccountPicture: ClipOval(
                child: Image.network(
                  "https://i.pinimg.com/736x/21/76/8f/21768f3ff0b3cee6a756618b06e41c69.jpg",
                  width: 72, // Defina o tamanho desejado para a imagem
                  height: 72, // Defina o tamanho desejado para a imagem
                  fit: BoxFit.cover, // Para preencher completamente o círculo
                ),
              ),
              accountName: const Text("Paula Gates"),
              accountEmail: const Text("email@email.com"),
            ),
          ),
          InkWell(
            child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                width: double.infinity,
                child: const Row(
                  children: [
                    Icon(Icons.list),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "HISTÓRICO",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                )),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HistoricoPage()));
            },
          ),
        ],
      ),
    );
  }
}
