import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/mensagem.dart';

class Recuperar extends StatefulWidget {
  const Recuperar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RecuperarState();
}

//ainda em criação
class _RecuperarState extends State<Recuperar> {
  final txtEmail = TextEditingController();

  @override
  void dispose() {
    txtEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar senha'),
        backgroundColor: Colors.indigo.shade600,
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset("lib/imagens/reset.png"),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                "Esqueceu a senha?",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Por favor, informar o e-mail associado a sua conta, para que possa ser enviado um link com as instruções para recuperar a sua senha.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            CaixaTexto("E-mail", txtEmail),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                //evento que será disparado quando o usuário
                //acionar o botão
                onPressed: () {
                  enviarEmail();
                },
                child: const Text(
                  "Enviar",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo.shade600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  CaixaTexto(campo, controller) {
    return TextFormField(
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontSize: 20,
          color: Colors.grey.shade900,
        ),
        decoration: InputDecoration(
          labelText: campo,
          labelStyle: TextStyle(
            fontSize: 20,
            color: Colors.grey.shade600,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ));
  }

  caixaDialogo(msg) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(''),
            content: Text(msg),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('fechar')),
            ],
          );
        });
  }

  ///função para realizar o envio do e-mail para criar uma nova senha
  Future enviarEmail() async {
    //circulo que carrega enquanto busca as informações
    /**showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));**/

    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: txtEmail.text.trim())
        .then((res) {
      Navigator.pushReplacementNamed(context, 'Login');
      caixaDialogo(
          "Encaminhado para o e-mail informado! Verifique a caixa de Spam");
    }).catchError((e) {
      switch (e.code) {
        case 'user-not-found':
          erro(context, "Usuário não localizado.");
          break;
        default:
          erro(context, e.code.toString());
      }
    });
  }
}
