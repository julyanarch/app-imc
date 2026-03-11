import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculadoraIMC(),
    ),
  );
}

class CalculadoraIMC extends StatefulWidget {
  @override
  _CalculadoraIMCState createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  TextEditingController _controllerPeso = TextEditingController();
  TextEditingController _controllerAltura = TextEditingController();

  String _textoResultado = "Informe seus dados";
  Color _corResultado = Colors.black87;

  void _limparCampos() {
    _controllerPeso.clear();
    _controllerAltura.clear();
    setState(() {
      _textoResultado = "Informe seus dados";
      _corResultado = Colors.black87;
    });
  }

  void _calcular() {
    double? peso = double.tryParse(_controllerPeso.text.replaceAll(",", "."));
    double? altura = double.tryParse(_controllerAltura.text.replaceAll(",", "."));

    if (peso == null || altura == null || altura <= 0) {
      setState(() {
        _textoResultado = "Dados inválidos!";
        _corResultado = Colors.red;
      });
    } else {
      double imc = peso / (altura * altura);
      String classificacao = "";
      Color corTemp = Colors.black;

      // Tabela IMC (Adultos)
      if (imc < 18.5) {
        classificacao = "Abaixo do peso";
        corTemp = Colors.orange;
      } else if (imc >= 18.5 && imc <= 24.9) {
        classificacao = "Peso Normal (Eutrófico)";
        corTemp = Colors.green;
      } else if (imc >= 25.0 && imc <= 29.9) {
        classificacao = "Sobrepeso (Pré-obesidade)";
        corTemp = Colors.yellow.shade800;
      } else if (imc >= 30.0 && imc <= 34.9) {
        classificacao = "Obesidade Grau I";
        corTemp = Colors.orange.shade900;
      } else if (imc >= 35.0 && imc <= 39.9) {
        classificacao = "Obesidade Grau II";
        corTemp = Colors.red.shade700;
      } else { // Maior ou igual a 40
        classificacao = "Obesidade Grau III (Mórbida)";
        corTemp = Colors.red.shade900;
      }

      setState(() {
        _corResultado = corTemp;
        _textoResultado = "IMC: ${imc.toStringAsFixed(1)}\n$classificacao";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.teal,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: _limparCampos,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Bloco da Imagem
            Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Image.asset(
                "lib/img/imc.jpg",
                fit: BoxFit.contain,
              ),
            ),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _controllerPeso,
                    decoration: InputDecoration(
                      labelText: "Peso em kg (ex: 70.5)",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.monitor_weight),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _controllerAltura,
                    decoration: InputDecoration(
                      labelText: "Altura em m (ex: 1.70)",
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.height),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30, bottom: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: EdgeInsets.all(18),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Text("CALCULAR",
                          style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)
                      ),
                      onPressed: _calcular,
                    ),
                  ),
                  // Resultado dinâmico
                  Text(
                    _textoResultado,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: _corResultado,
                    ),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}