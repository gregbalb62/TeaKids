import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PrincipaState();
}

class _PrincipaState extends State<Principal> {
  var nomeUsuario; //variavel para recuperar o nome do usuário, para ser mostrado
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(30.0),
          children: <Widget>[
            const SizedBox(height: 20),
            Row(
              children: const <Widget>[
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 0, 0, 0),
                  backgroundImage: AssetImage('lib/imagens/iconCamera.png'),
                  radius: 60.0,
                ),
                //Text(nomeUsuario.toString());
              ],
            ),
            const SizedBox(height: 50),
            Row(children: [
              botaoJogos("Memoria", 'lib/imagens/bt_memoria.png'),
              const SizedBox(height: 50),
              botaoJogos("Cores", "lib/imagens/bt_cores.png")
            ]),
            const SizedBox(height: 50),
            Row(children: [
              botaoJogos("Raciocinio", "lib/imagens/bt_raciocinio.png"),
              const SizedBox(height: 50),
              botaoJogos("Animais", "lib/imagens/bt_animais.png")
            ]),
          ],
        ),
      ),
    );
  }

  //icone

  botaoJogos(tela, caminho) {
    return Padding(
      padding: const EdgeInsets.only(top: 24),
      child: SizedBox(
        height: 150,
        width: 200,
        child: OutlinedButton(
          onPressed: () {
            Navigator.pushNamed(context, tela);
          },
          style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 5.0, color: Colors.transparent)),
          //style: ElevatedButton.styleFrom(primary: Colors.transparent),
          child: Center(
            child: Image.asset(caminho),
          ),
        ),
      ),
    );
  }

//Criação dos botão com imagem de cada jogo para ficar mais atrativo
  botaoJogo(tela, caminho) {
    return SizedBox(
      //width: 100,
      //height: 100,

      child: ElevatedButton(
        //evento que será disparado quando o usuário
        //acionar o botão
        onPressed: () {
          Navigator.pushNamed(context, tela);
        },
        child: Image.asset(caminho),
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }

  mostrarUsuarioLogado() async {
    FutureBuilder(
      future: retornarUsuarioLogado(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //return const Text('');
          return const CircularProgressIndicator();
        } else {
          return Text(
            nomeUsuario ?? '',
            style: const TextStyle(fontSize: 12),
          );
        }
      },
    );
  }

  retornarUsuarioLogado() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: uid)
        .get()
        .then((q) {
      if (q.docs.isNotEmpty) {
        nomeUsuario = q.docs[0].data()['nome'];
      } else {
        nomeUsuario = "NENHUM";
      }
    });
  }
}
