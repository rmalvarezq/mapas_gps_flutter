import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';
import 'package:mapas_gps_flutter/theme/uber_map_theme.dart';

part 'mapa_event.dart';
part 'mapa_state.dart';

class MapaBloc extends Bloc<MapaEvent, MapaState> {
  MapaBloc() : super(MapaState());

  // controlador del mapa
  GoogleMapController _mapController;

  // Polylines
  Polyline _miRuta = new Polyline(polylineId: PolylineId('mi_ruta'), width: 4);

  void initMapa(GoogleMapController controller) {
    if (!state.mapaListo) {
      this._mapController = controller;
      this._mapController.setMapStyle(jsonEncode(uberMapTheme));
      add(OnMapaListo());
    }
  }

  void moverCamara(LatLng destino) {
    final cameraUpdate = CameraUpdate.newLatLng(destino);
    this._mapController?.animateCamera(cameraUpdate);
  }

  @override
  Stream<MapaState> mapEventToState(
    MapaEvent event,
  ) async* {
    if (event is OnMapaListo) {
      print('mapa listo ');
      yield state.copyWith(mapaListo: true);
    } else if (event is OnUNuevaUbicacion) {
      // print('Nueva Ubicacion: ${event.ubicacion}');
      List<LatLng> points = [
        ...this._miRuta.points,
        event.ubicacion
      ]; //aquí se extrae los puntos
      this._miRuta = this._miRuta.copyWith(pointsParam: points);
      final currentPolylines = state.polylines;
      currentPolylines['mi_ruta'] = this._miRuta;
      yield state.copyWith(polylines: currentPolylines);
    }
  }
}
