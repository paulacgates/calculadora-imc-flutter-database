import 'package:calculadora_imc_flutter/database.dart';
import 'package:calculadora_imc_flutter/model/imc.dart';

class ImcRepository {
  Future<List<Imc>> obterDados() async {
    List<Imc> imcs = [];
    var db = await SQLiteDataBase().obterDataBase();
    var result = await db
        .rawQuery("SELECT id, peso, altura,categoria, resultado FROM imc");
    for (var element in result) {
      imcs.add(Imc(
          int.parse(element["id"].toString()),
          double.parse(element["peso"].toString()),
          double.parse(element["altura"].toString()),
          double.parse(element["resultado"].toString()),
          element["categoria"].toString()));
    }
    return imcs;
  }

  Future<void> salvar(Imc imc) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert(
        'INSERT INTO imc (peso, altura, resultado, categoria) values(?,?,?,?)',
        [imc.peso, imc.altura, imc.resultado, imc.categoria]);
  }

  Future<void> atualizar(Imc imc) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert(
        'UPDATE imc SET peso = ?, altura = ?, resultado = ?, categoria = ? WHERE id = ?',
        [imc.peso, imc.altura, imc.resultado, imc.categoria, imc.id]);
  }

  Future<void> remover(int id) async {
    var db = await SQLiteDataBase().obterDataBase();
    await db.rawInsert('DELETE FROM imc WHERE id = ?', [id]);
  }
}
