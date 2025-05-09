//Sergio
import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //clase principal
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeDado()); //retorna la pantalla principal
  }
}

class HomeDado extends StatefulWidget {
  // clase dado que extiende de StatefulWidget y representa la pantalla principal
  const HomeDado({super.key}); //es const porque no cambia su estado
  @override
  State<HomeDado> createState() {
    return _HomeDadoState();
  }
//otra forma de escribirlo
  // @override
  // State<StatefulWidget> createState() {
  //   // TODO: implement createState
  //   throw UnimplementedError();
  // }
}

//_HomeDadoState es la clase que maneja el estado de la pantalla
class _HomeDadoState extends State<HomeDado> {
  String _rutaDado = "assets/images/cara1.png";
  var _i = 1;
  var _estaAnimado = false;
  Future<void> girarDado() async {
    //print("Bandera $_estaAnimado");
    if (!_estaAnimado) {
      _estaAnimado = true;
      //Lista de imágenes de las caras de dados
      List<String> listaDados = [
        "assets/images/cara1.png",
        "assets/images/cara5.png",
        "assets/images/cara6.png",
        "assets/images/cara3.png",
        "assets/images/cara2.png",
        "assets/images/cara4.png",
        "assets/images/cara1.png",
        "assets/images/cara5.png",
        "assets/images/cara6.png",
        "assets/images/cara3.png",
        "assets/images/cara2.png",
        "assets/images/cara4.png",
      ];
      var duracion = Duration(
        milliseconds: 200,
      ); //direacion de aparicion de cada dado
      for (var dado in listaDados) {
        setState(() {
          _i =
              Random().nextInt(6) + 1; //geneera un numero aleatorio entre 1 y 6
          _rutaDado = dado;
        });
        await Future.delayed(duracion);
      }
      //await Future.delayed(Duration(milliseconds: 4000));
      setState(() {
        _i = Random().nextInt(6) + 1;
        _rutaDado = "assets/images/cara$_i.png"; //imprime la imagen del dado
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
          mainAxisAlignment: MainAxisAlignment.center,//centrar
          children: [
            Center(
              child: Column(
                children: [
                  Text("Dado", style: TextStyle(fontSize: 50)),//titulo
                  Image.asset(_rutaDado, width: 250),
                  SizedBox(height: 60), //margen de la parte de abajo
                  ElevatedButton(
                    onPressed: girarDado,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      foregroundColor: Colors.black,
                      textStyle: TextStyle(fontSize: 30),
                    ),
                    child: Text("Girar Dado"), //boton para girar el dado
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
