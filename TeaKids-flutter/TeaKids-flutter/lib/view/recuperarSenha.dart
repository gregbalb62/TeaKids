import 'package:flutter/material.dart';

class Recuperar2 extends StatefulWidget {
  const Recuperar2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RecuperarState();
}

//ainda em criação
class _RecuperarState extends State<Recuperar2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar senha'),
        backgroundColor: Colors.indigo.shade600,
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        children: <Widget>[
          const Text(
            "Informe o seu e-mail para recuperar a senha",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          CaixaTexto('E-mail', 'Informe o seu e-mail'),
          const SizedBox(height: 15),
          botao("Enviar")
        ],
      ),
    );
  }

  CaixaTexto(campo, descricao) {
    return TextFormField(
        //controller: _mailInputController,
        style: TextStyle(
          fontSize: 20,
          color: Colors.grey.shade900,
        ),
        decoration: InputDecoration(
          labelText: campo,
          labelStyle: TextStyle(
            fontSize: 17,
            color: Colors.grey.shade600,
          ),
          hintText: descricao,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ));
  }

  botao(rotulo) {
    return SizedBox(
      width: 250,
      height: 50,
      child: ElevatedButton(
        //evento que será disparado quando o usuário
        //acionar o botão
        onPressed: () {
          caixaDialogo(
              "E-mail de recuperação encaminhado para o e-mail, por favor, verificar!");
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
}
