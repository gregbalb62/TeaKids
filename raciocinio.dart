import 'package:flutter/material.dart';

class Raciocinio extends StatefulWidget {
  const Raciocinio({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Raciocinio();
}

class _Raciocinio extends State<Raciocinio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: <Widget>[
            SizedBox(
              width: 400,
              height: 650,
              child: Image.asset("lib/imagens/8_teste.png"),
            ),
          ],
        ),
        appBar: AppBar(
          title: const Text(
            'JOGO DE RACIOCÍNIO',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.indigo.shade600,
        ));
  }
}
