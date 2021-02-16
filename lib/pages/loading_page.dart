import 'package:flutter/material.dart';
import 'package:mapas_gps_flutter/helpers/helpers.dart';
import 'package:mapas_gps_flutter/pages/acceso_gps_pages.dart';
// import 'package:mapas_gps_flutter/pages/mapa_page.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: this.checkGpsLocation(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Center(
              child: CircularProgressIndicator(
            strokeWidth: 2,
          ));
        },
      ),
    );
  }

  Future checkGpsLocation(BuildContext context) async {
// ver permisoGPS
// TODO: GPS está activo ?
    await Future.delayed(Duration(milliseconds: 100));

    print('Loading page hola mundo!!!');
    // Navigator.pushReplacement(
    //     context, navegarMapaFadeIn(context, MapaPage()));

    // Navigator.pushReplacement(
    //     context, navegarMapaFadeIn(context, AccesoGpsPage()));
  }
}
