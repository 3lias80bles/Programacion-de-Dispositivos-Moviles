import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeFoto());
  }
}

class HomeFoto extends StatefulWidget {
  const HomeFoto({super.key});
  @override
  State<HomeFoto> createState() {
    return _HomeFotoState();
  }

  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }
}

class _HomeFotoState extends State<HomeFoto> {
  //bool mostrarMensajeGanador = false;
  String _rutaFoto = "assets/images/compa_1.jpeg";
  var _i = 1;
  var _estaAnimado = false;
  Future<void> girarFoto() async {
    //print("Bandera $_estaAnimado");
    if (!_estaAnimado) {
      _estaAnimado = true;
      List<String> listaFotos = [
        "assets/images/compa_1.jpeg",
        "assets/images/compa_3.jpeg",
        "assets/images/compa_5.jpeg",
        "assets/images/compa_6.jpeg",
        "assets/images/compa_4.jpeg",
        "assets/images/compa_7.jpeg",
        "assets/images/compa_1.jpeg",
        "assets/images/compa_7.jpeg",
        "assets/images/compa_6.jpeg",
        "assets/images/compa_4.jpeg",
        "assets/images/compa_2.jpeg",
        "assets/images/compa_2.jpeg",
      ];
      var duracion = Duration(milliseconds: 200);
      for (var foto in listaFotos) {
        setState(() {
          _i = Random().nextInt(6) + 1;
          _rutaFoto = foto;
        });
        await Future.delayed(duracion);
      }
      //await Future.delayed(Duration(milliseconds: 4000));
      setState(() {
        _i = Random().nextInt(7) + 1;
        _rutaFoto = "assets/images/compa_$_i.jpeg";
        // if (_i == 1) {
        //   mostrarMensajeGanador = true; // Necesitarías una variable de estado para esto
        // } else {
        //   mostrarMensajeGanador = false; // Ocultar mensaje si no es 1
        // }
      });
      _estaAnimado = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [const Color.fromARGB(255, 255, 245, 245), Colors.pink],
            radius: 1.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Column(
                children: [
                  Image.asset(_rutaFoto, width: 250),
                  SizedBox(height: 30), //margen de la parte de abajo
                  TextButton(
                    onPressed: girarFoto,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.black,
                      textStyle: TextStyle(fontSize: 30),
                    ),
                    child: Text(" Iniciar "),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
