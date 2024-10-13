import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Relatorio extends StatefulWidget {
  const Relatorio({Key? key}) : super(key: key);

  @override
  _Relatorio createState() => _Relatorio();
}

class _Relatorio extends State<Relatorio> {
  //Declaração da coleção de Cafés
  var semana;
  var nomeUsuario;

  //pegando o ID do usuário logado e pesquisando na coleção semana pelo ID e puxando os dados
  @override
  void initState() {
    super.initState();
    semana = FirebaseFirestore.instance
        .collection('semana')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dias acessado'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 69, 67, 201),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.brown[50],
      body: Container(
        padding: const EdgeInsets.all(50),
        //
        // Exibir os documentos da Coleção
        //
        child: StreamBuilder<QuerySnapshot>(
          //fonte de dados
          stream: semana.snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(child: Text('Não foi possível conectar.'));
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                final dados = snapshot.requireData;
                print(dados);
                return ListView.builder(
                  itemCount: dados.size,
                  itemBuilder: (context, index) {
                    return exibirDocumento(dados.docs[index]);
                  },
                );
            }
          },
        ),
      ),
    );
  }

  exibirDocumento(item) {
    List<String> semana = [
      'Segunda',
      'Teça',
      'Quarta',
      'Quinta',
      'Sexta',
      'Sábado',
      'Domingo'
    ];
    print("Entrou aqui");
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text(semana[0]),
          subtitle: Text((item.data()[semana[0]])),
        ),
        ListTile(
          title: Text(semana[1]),
          subtitle: Text((item.data()[semana[1]])),
        ),
        ListTile(
          title: Text(semana[2]),
          subtitle: Text((item.data()[semana[2]])),
        ),
        ListTile(
          title: Text(semana[3]),
          subtitle: Text((item.data()[semana[3]])),
        ),
        ListTile(
          title: Text(semana[4]),
          subtitle: Text((item.data()[semana[4]])),
        ),
        ListTile(
          title: Text(semana[5]),
          subtitle: Text((item.data()[semana[5]])),
        ),
        ListTile(
          title: Text(semana[6]),
          subtitle: Text((item.data()[semana[6]])),
        ),
        ListTile(
          title: Text(semana[7]),
          subtitle: Text((item.data()[semana[7]])),
        ),
      ],
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
