import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mapas_gps_flutter/pages/acceso_gps_pages.dart';
import 'package:mapas_gps_flutter/bloc/busqueda/busqueda_bloc.dart';
import 'package:mapas_gps_flutter/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
import 'package:mapas_gps_flutter/bloc/mapa/mapa_bloc.dart';


import 'package:mapas_gps_flutter/pages/loading_page.dart';
import 'package:mapas_gps_flutter/pages/mapa_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ( _ ) => MiUbicacionBloc(),),
        BlocProvider(create: ( _ ) => MapaBloc(),),
        BlocProvider(create: ( _ ) => BusquedaBloc(),),
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: LoadingPage(),
        // home: AccesoGpsPage(),
        routes: {
          'mapa': (_) => MapaPage(),
          'loading': (_) => LoadingPage(),
          'acceso_gps': (_) => AccesoGpsPage(),
        },
      ),
    );
  }
}
