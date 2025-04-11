import 'package:flutter/material.dart';

class MyWitgetsCenter extends StatelessWidget {
  const MyWitgetsCenter(this.text,{
    super.key,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(//el const no es seguro
          color: Color.fromARGB(255, 0, 0, 0),
          fontSize: 30,
        ),
      ),
    );
  }
} 