import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

diaSemanaInt() {
  DateTime data = DateTime.now(); //para pegar a data atual
  return data;
}

diaSemanaString() {
  DateTime data = DateTime.now(); //para pegar a data atual
  String semana = "";
  switch (data.weekday) {
    case 7:
      semana = "Domingo";
      break;
    case 1:
      semana = "Segunda";
      break;
    case 2:
      semana = "Terca";
      break;
    case 3:
      semana = "Quarta";
      break;
    case 4:
      semana = "Quinta";
      break;
    case 5:
      semana = "Sexta";
      break;
    case 6:
      semana = "Sabado";
      break;
  }

  return semana;
}


