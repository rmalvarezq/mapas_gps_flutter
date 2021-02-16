import 'package:flutter/material.dart';
import 'package:mapas_gps_flutter/pages/acceso_gps_pages.dart';
import 'package:mapas_gps_flutter/pages/loading_page.dart';
import 'package:mapas_gps_flutter/pages/mapa_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: LoadingPage(),
      // home: AccesoGpsPage(),
      routes: {
        'mapa': (_) => MapaPage(),
        'loading': (_) => LoadingPage(),
        'acceso_gps': (_) => AccesoGpsPage(),
      },
    );
  }
}
