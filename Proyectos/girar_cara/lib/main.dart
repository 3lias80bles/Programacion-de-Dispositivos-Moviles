//Sergio Elias Robles Ignacio 603
import 'package:flutter/material.dart';
import 'dart:math';


void main() {//Inicio de la aplicación
  runApp(MyApp());
}

class MyApp extends StatelessWidget {// clase principal extiende de StatelessWidget porque no cambia su estado
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeFoto());//retorna la pantalla principal
  }
}


//HomeFoto es la clase que extiende de StatefulWidget y representa la pantalla principal se encarga de mostrar la imagen y el botón
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
      List<String> listaFotos = [//Lista de imágenes de las fotos de mis amigos
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
      var duracion = Duration(milliseconds: 200);//tiempo de la animacion
      for (var foto in listaFotos) {//recorre la lista de fotos
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
//La vista de la pantalla principal
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
            //Text("Hola Compa", style: TextStyle(fontSize: 40)),
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
