import 'package:flutter/material.dart';

class Componentes {
  static criaCaixaTexto(rotulo, dica, controlador, validacao,
      {bool senha = false, bool numero = false}) {
    return TextFormField(
      controller: controlador,
      validator: validacao,
      obscureText: senha,
      keyboardType: numero == true ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: TextStyle(fontSize: 18),
          hintText: dica,
          hintStyle: TextStyle(fontSize: 12, color: Colors.red)),
    );
  }

  static criaBotao(texto, Function clique) {
    return Container(
      color: Colors.black,
      child: RaisedButton(
        onPressed: clique,
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: Colors.black, width: 2),
        ),
        child: Text(
          texto,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}