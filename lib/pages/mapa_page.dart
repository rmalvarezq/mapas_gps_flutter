import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapas_gps_flutter/bloc/mapa/mapa_bloc.dart';
import 'package:mapas_gps_flutter/bloc/mi_ubicacion/mi_ubicacion_bloc.dart';
import 'package:mapas_gps_flutter/widgets/widgets.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  @override
  void initState() {
    super.initState();
    context.read<MiUbicacionBloc>().iniciarSeguimiento();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    context.read<MiUbicacionBloc>().cancelarSeguimiento();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<MiUbicacionBloc, MiUbicacionState>(
              builder: (_, state) => crearMapa(state)),
          Positioned(
            top: 15,
            child: SearchBar()),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BtnUbicacion(),
          BtnSeguirUbicacion(),
          BtnMiRuta(),
        ],
      ),
    );
  }

  Widget crearMapa(MiUbicacionState state) {
    if (!state.existeUbicacion) return Center(child: Text('Ubicando...'));
    final mapaBloc = BlocProvider.of<MapaBloc>(context);

    mapaBloc.add(OnUNuevaUbicacion(state.ubicacion));

    final cameraPosition =
        new CameraPosition(target: state.ubicacion, zoom: 15);
    return GoogleMap(
      initialCameraPosition: cameraPosition,
      mapType: MapType.normal,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      onMapCreated: mapaBloc.initMapa,
      polylines: mapaBloc.state.polylines.values.toSet(),
      onCameraMove: (cameraPosition) {
        // cameraPosition.target= LatLng central del mapa
        mapaBloc.add(OnMovioMapa(cameraPosition.target));
      },

      // onCameraIdle: () {
      //   print('MapaIdle');
      // },
      // onMapCreated: (GoogleMapController controller) =>
      //     mapaBloc.initMapa(controller), //también sirve, el de arriba es para no usar tanto código
    );
  }
}
