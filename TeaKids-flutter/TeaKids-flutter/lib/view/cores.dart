import 'package:flutter/material.dart';

class Cores extends StatefulWidget {
  const Cores({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Cores();
}

class _Cores extends State<Cores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: <Widget>[
            SizedBox(
              width: 400,
              height: 650,
              child: Image.asset("lib/imagens/7_teste.png"),
            ),
          ],
        ),
        appBar: AppBar(
          title: const Text(
            'JOGO DAS CORES',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.indigo.shade600,
        ));
  }
}
