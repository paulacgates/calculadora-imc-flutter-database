class Imc {
  int _id = 0;
  double _peso = 0;
  double _altura = 0;
  String _categoria = "";
  double _resultado = 0;

  Imc(this._id, this._peso, this._altura, this._resultado, this._categoria);

  int get id => _id;

  double get peso => _peso;

  set peso(double peso) {
    _peso = peso;
  }

  double get altura => _altura;

  set altura(double altura) {
    _altura = altura;
  }

  double get resultado => _resultado;

  set resultado(double resultado) {
    _resultado = resultado;
  }

  String get categoria => _categoria;

  set categoria(String categoria) {
    _categoria = categoria;
  }
}
