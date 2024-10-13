import 'package:flutter/material.dart';

class Animais extends StatelessWidget {
  const Animais({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: <Widget>[
            SizedBox(
              width: 400,
              height: 650,
              child: Image.asset("lib/imagens/9_teste.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Esqueceu a senha?",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        appBar: AppBar(
          title: const Text(
            'FIGURA DE ANIMAIS',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.indigo.shade600,
        ));
    
  }
}