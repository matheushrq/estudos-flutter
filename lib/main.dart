import 'package:flutter/material.dart';
import 'package:projeto_flutter/utils/componentes.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TelaInicial(),
  ));
}

class TelaInicial extends StatefulWidget {
  @override
  TelaInicialState createState() => TelaInicialState();
}

class TelaInicialState extends State<TelaInicial> {
  String resultado = "Informe seus dados:";
  Color corTxt = Colors.black;

  TextEditingController txtNome = TextEditingController();
  TextEditingController txtPeso = TextEditingController();
  TextEditingController txtAltura = TextEditingController();

  GlobalKey<FormState> formController = GlobalKey<FormState>();

  Function validaNome = ((value) {
    if (value.isEmpty) {
      return "Preencha o campo 'nome'!";
    }
  });

  Function validaPeso = ((value) {
    if (value.isEmpty) {
      return "Preencha o campo 'peso'!";
    }
    if (double.parse(value) <= 0) {
      return "O peso não pode ser negativo!";
    }
  });

  Function validaAltura = ((value) {
    if (value.isEmpty) {
      return "Preencha o campo 'altura'!";
    }
    if (double.parse(value) <= 0) {
      return "A altura não pode ser negativo!";
    }
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: criaBarraStatus("Cálculo IMC", true),
      body: criaPaginaPrincipal(),
      floatingActionButton: criaBotaoFlutuante(),
    );
  }

  criaBarraStatus(String texto, bool centralizado) {
    return AppBar(
      title: criaTexto(texto, 30, Colors.white),
      centerTitle: centralizado,
    );
  }

  criaTexto(String txt, double tam, Color cor) {
    return Text(
      txt,
      style: TextStyle(fontSize: tam, color: cor),
    );
  }

  criaPaginaPrincipal() {
    return Form(
      key: formController,
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Componentes.criaCaixaTexto("Nome", "Informe seu nome", txtNome, validaNome),
              Componentes.criaCaixaTexto("Peso", "Informe seu peso", txtPeso, validaPeso, numero: true),
              Componentes.criaCaixaTexto("Altura", "Informe sua altura", txtAltura, validaAltura, numero: true),
              Componentes.criaBotao("Calcular", calculaIMC()),
              Text(resultado, style: TextStyle(fontSize: 20, color:corTxt),)
            ],
          ),
        ),
      ),
    );
  }

  calculaIMC() {
    if (!formController.currentState.validate()) {
      return null;
    }
    double p = double.parse(txtPeso.text);
    double a = double.parse(txtAltura.text);
    double imc = p / (a * a);
    String avaliacao = "Peso normal.";
    corTxt = Colors.green;
    if (imc < 18.5) {
      avaliacao = "Abaixo do peso ideal!";
      corTxt = Colors.yellow;
    } else {
      if (imc >= 30) {
        avaliacao = "Acima do peso!";
        corTxt = Colors.red;
      }
    }
    setState(() {
      resultado =
          txtNome.text + 'IMC: (${imc.toStringAsPrecision(4)}) - $avaliacao';
    });
    print(resultado);
  }

  criaBotaoFlutuante() {
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: cliqueBotao,
    );
  }

  void cliqueBotao() {
    print("Clicou no botão");
  }
}