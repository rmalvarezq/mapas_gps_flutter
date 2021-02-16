import 'package:flutter/material.dart';
import 'package:mapas_gps_flutter/pages/mapa_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart' as Geolocator;

import 'package:mapas_gps_flutter/helpers/helpers.dart';
import 'package:mapas_gps_flutter/pages/acceso_gps_pages.dart';
// import 'package:mapas_gps_flutter/pages/mapa_page.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      if (await Geolocator.Geolocator.isLocationServiceEnabled()) {
        Navigator.pushReplacement(
            context, navegarMapaFadeIn(context, MapaPage()));
      }
    }
    // print('=======================> $state');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Loading'),),
      body: FutureBuilder(
        future: this.checkGpsLocation(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: Text(snapshot.data),
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              strokeWidth: 2,
            ));
          }
        },
      ),
    );
  }

  Future checkGpsLocation(BuildContext context) async {
// ver permisoGPS
    final permisosGPS = await Permission.location.isGranted;
// TODO: GPS está activo ?
    final gpsActivo = await Geolocator.Geolocator.isLocationServiceEnabled();

    if (permisosGPS && gpsActivo) {
      Navigator.pushReplacement(
          context, navegarMapaFadeIn(context, MapaPage()));
      return '';
    } else if (!permisosGPS) {
      Navigator.pushReplacement(
          context, navegarMapaFadeIn(context, AccesoGpsPage()));
      return 'Es necesario el permiso de GPS';
    } else {
      return 'Active el GPS';
    }
    // await Future.delayed(Duration(milliseconds: 100));

    // print('Loading page hola mundo!!!');
    // Navigator.pushReplacement(
    //     context, navegarMapaFadeIn(context, MapaPage()));
  }
}
