import 'package:flutter/material.dart';

class Memoria extends StatefulWidget {
  const Memoria({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Memoria();
}

class _Memoria extends State<Memoria> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: ListView(
          children: <Widget>[
            SizedBox(
              width: 400,
              height: 650,
              child: Image.asset("lib/imagens/6_teste.png"),
            ),
          ],
        ),
        appBar: AppBar(
          title: const Text(
            'JOGO DA MEMÓRIA',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.indigo.shade600,
        ));
  }
}
