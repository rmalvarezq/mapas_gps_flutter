part of 'helpers.dart';

void calculandoAlerta(BuildContext context) {
  if (!Platform.isAndroid) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Espere por favor'),
              content: Text('Calculando ruta'),
            ));
  } else {
    showCupertinoDialog(
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: Text('Espere por favor'),
              content: CupertinoActivityIndicator(),
            ),
        context: context);
  }
}
