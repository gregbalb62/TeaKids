//IMPORTAÇÕES DA CLASSE
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kids/widgets/mensagem.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //Declaração dos atributos que serão usado
  //para armazenar os dados informados pelo usuário

  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              width: 150,
              height: 150,
              child: Image.asset("lib/imagens/cabeca.png"),
            ),
            const SizedBox(height: 25),
            caixaTexto("E-mail", "Informe o e-mail", txtEmail, Icons.email),
            const SizedBox(height: 20),
            caixaTexto("Senha", "Informe a senha", txtSenha, Icons.lock,
                senha: true),
            const SizedBox(height: 35),
            botao("Entrar"),
            const SizedBox(height: 100),
            cadastar(),
            const SizedBox(height: 10),
            recuperar(),
          ],
        ),
      ),
    );
  }

  //FUNÇÃO DA CAIXA DE TEXTO (E-MAIL E SENHA)
  caixaTexto(texto, info, controller, icone, {senha}) {
    return TextFormField(
        keyboardType: TextInputType.emailAddress, //mostrar o @ no teclado
        controller: controller,
        obscureText: senha != null ? true : false,
        style: TextStyle(
          fontSize: 20,
          color: Colors.grey.shade900,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(icone, color: const Color.fromARGB(255, 25, 0, 255)),
          prefixIconColor: const Color.fromARGB(255, 0, 60, 255),
          labelText: texto,
          labelStyle: const TextStyle(
              fontSize: 17, color: Color.fromARGB(255, 73, 118, 216)),
          hintText: info,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ));
  }

  //FUNÇÃO DO BOTÃO
  botao(rotulo) {
    return SizedBox(
      width: 250,
      height: 50,
      child: ElevatedButton(
        //evento que será disparado quando o usuário
        //acionar o botão
        onPressed: () {
          login(txtEmail.text, txtSenha.text);
        },
        child: Text(
          rotulo,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),

        style: ElevatedButton.styleFrom(
          primary: Colors.indigo.shade600,
        ),
      ),
    );
  }

  //Função do cadastrar novo usuário
  cadastar() {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, 'Cadastro');
      },
      style: TextButton.styleFrom(primary: Colors.black),
      child: const Text("Cadastre-se"),
    );
  }

  //Função recuperar usuário
  recuperar() {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, 'Recuperar');
      },
      style: TextButton.styleFrom(primary: Colors.black),
      child: const Text("Recuperar a senha"),
    );
  }

  //Função do Login do e-mail
  void login(email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((res) {
      Navigator.pushReplacementNamed(context, 'Principal');
      //modificadorData(res.user!.uid.toString());
    }).catchError((e) {
      //a mensagem de erro será validada com uma classe especial para ela
      switch (e.code) {
        case 'invalid-email':
          erro(context, "E-mail informado é inválido!");
          break;
        case 'user-not-found':
          erro(context, "Usuário não encontrado!");
          break;
        case 'wrong-password':
          erro(context, "Senha incorreta!");
          break;
        default:
          erro(context, e.code.toString());
          break;
      }
    });
  }

  //Função da caixa de diálogo
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

                    setState(() {
                      txtEmail.clear();
                      txtSenha.clear();
                    });
                  },
                  child: const Text('fechar')),
            ],
          );
        });
  }
}
