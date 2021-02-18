part of 'mapa_bloc.dart';

@immutable
abstract class MapaEvent {}

class OnMapaListo extends MapaEvent {}

class OnMarcarRecorrido extends MapaEvent {}

class OnUNuevaUbicacion extends MapaEvent {
  final LatLng ubicacion;
  OnUNuevaUbicacion(this.ubicacion);
}
