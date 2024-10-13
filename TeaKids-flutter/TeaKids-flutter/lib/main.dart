import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kids/view/animais.dart';
import 'package:kids/view/cadastro.dart';
import 'package:kids/view/cores.dart';
import 'package:kids/view/login.dart';
import 'package:kids/view/memoria.dart';
import 'package:kids/view/principal.dart';
import 'package:kids/view/raciocinio.dart';
import 'package:kids/view/recuperar.dart';
import 'package:kids/view/relatorio.dart';
import 'package:kids/view/sobre.dart';

import 'firebase_options.dart';

Future<void> main() async {
  //inicialização do banco de dados
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); //finalização da inicialização

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TEA KIDS', //nome do porjeto
      initialRoute: 'Login', //primeira tela a ser chamada
      routes: {
        //rotulos das telas, para faciliar chamá-las
        //terá a criação da tela de apresentação Splash Screen
        'Login': (context) => const Login(),
        'Principal': (context) => const Principal(),
        'Memoria': (context) => const Memoria(),
        'Cores': (context) => const Cores(),
        'Raciocinio': (context) => const Raciocinio(),
        'Animais': (context) => const Animais(),
        'Cadastro': (context) => const Cadastro(),
        'Relatorio': (context) => const Relatorio(),
        'Sobre': (context) => const Sobre(),
        'Recuperar': (context) => const Recuperar(),
        //terá a criação da tela de relatório (pensar em como será essa telá, para quem mandará)
      },
    ),
  );
}
