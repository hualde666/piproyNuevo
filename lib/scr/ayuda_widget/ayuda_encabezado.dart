import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/usuario_pref.dart';

List<Widget> ayudaEncabezado(BuildContext context, String titulo) {
  final pref = Provider.of<Preferencias>(context);
  List<Widget> listaAyudaEncabezado = [
    SizedBox(
      height: 10,
    ),
    Container(
      child: Center(
          child: Text(titulo,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 30, color: Theme.of(context).primaryColor))),
    ),
    SizedBox(
      height: 10,
    ),
    SizedBox(
      height: 10,
    ),
    Divider(
      height: 10,
      color: Theme.of(context).primaryColor,
    ),
    SizedBox(
      height: 10,
    ),
  ];
  return listaAyudaEncabezado;
}
