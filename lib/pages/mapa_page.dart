import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MapaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: Text('AppBar'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Text('Mapa Page'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        elevation: 10,
        onPressed: () {
          Navigator.pushReplacementNamed(context, 'acceso_gps');
        },
      ),
    );
  }
}
