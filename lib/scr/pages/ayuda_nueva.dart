import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:piproy/scr/models/api_tipos.dart';
import 'package:piproy/scr/pages/api_grupos.dart';
import 'package:piproy/scr/pages/ayuda.dart';
import 'package:piproy/scr/pages/conta_grupos.dart';
import 'package:piproy/scr/pages/contacts_por_grupo.dart';
import 'package:piproy/scr/pages/desbloqueo.dart';
import 'package:piproy/scr/pages/mensaje_emergencia.dart';

import 'package:piproy/scr/pages/opciones_page.dart';
import 'package:piproy/scr/pages/paletta_colores.dart';

import 'package:piproy/scr/pages/select_ayuda.dart';
import 'package:piproy/scr/providers/aplicaciones_provider.dart';

import 'package:piproy/scr/widgets/header_app.dart';
import 'package:provider/provider.dart';

import '../ayuda_widget/ayuda_configurar.dart';
import '../providers/usuario_pref.dart';

class AyudaNuevaPage extends StatelessWidget {
  final apiProvider = new AplicacionesProvider();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: headerApp(context, 'Ayuda', Text(''), 0.0, true, ''),

        // title: Text('Configuración'),

        body: ListView(children: [
          SizedBox(
            height: 20,
          ),
          Divider(
            height: 10,
            color: Theme.of(context).primaryColor,
          ),
          ItemConfig(
            icon: Icons.text_snippet_outlined,
            texto: 'Introducción',
            onPress: Ayuda(pagina: 'Introducción'),
          ),
          Divider(
            height: 10,
            color: Theme.of(context).primaryColor,
          ),
          ItemConfig(
              icon: Icons.build,
              texto: 'Configuración',
              onPress: Ayuda(pagina: 'Configuración')),
          Divider(
            height: 10,
            color: Theme.of(context).primaryColor,
          ),
          ItemConfig(
            icon: Icons.message,
            texto: 'Redactar mensaje de emergencia',
            onPress: EmergenciaMensaje(),
          ),
          Divider(
            height: 10,
            color: Theme.of(context).primaryColor,
          ),
          ItemConfig(
            icon: Icons.contact_phone,
            texto: 'Contactos envío mensaje de emergencia',
            onPress: EmergenciaMensaje(),
          ),
          Divider(
            height: 10,
            color: Theme.of(context).primaryColor,
          ),
          ItemConfig(
            icon: Icons.phone_forwarded,
            texto: 'Contacto llamada de emergencia',
            onPress: (EmergenciaMensaje()),
          ),
          Divider(
            height: 10,
            color: Theme.of(context).primaryColor,
          ),
          ItemConfig(
            icon: Icons.groups,
            texto: 'Contactos',
            onPress: ContactsGruposPage(),
          ),
          Divider(
            height: 10,
            color: Theme.of(context).primaryColor,
          ),
          ItemConfig(
            icon: Icons.app_registration,
            texto: 'Aplicaciones',
            onPress: ApiGruposPage(),
          ),
          Divider(
            height: 10,
            color: Theme.of(context).primaryColor,
          ),
          ItemConfig(
            icon: Icons.engineering,
            texto: 'Habilitar o Deshabilitar Elementos',
            onPress: OpcionesPage(),
          ),
          Divider(
            height: 10,
            color: Theme.of(context).primaryColor,
          ),
          ItemConfig(
            icon: Icons.palette,
            texto: 'Color de vitalfon',
            onPress: PaletaPage(),
          ),
          Divider(
            height: 10,
            color: Theme.of(context).primaryColor,
          ),
          ItemConfig(
            icon: Icons.email,
            texto: 'Contactanos',
            onPress: PaletaPage(),
          ),
          Divider(
            height: 10,
            color: Theme.of(context).primaryColor,
          ),
          ItemConfig(
            icon: Icons.lock_open,
            texto: 'Bloquear / Desbloquear Configuración',
            onPress: PaletaPage(),
          ),
          Divider(
            height: 10,
            color: Theme.of(context).primaryColor,
          ),
          ItemConfig(
            icon: Icons.logout,
            texto: 'Salir de vitalfon',
            onPress: PaletaPage(),
          ),
        ]),
      ),
    );
  }
}

class ItemConfig extends StatelessWidget {
  final IconData icon;
  final String texto;
  final Widget onPress;
  const ItemConfig({Key key, this.icon, this.texto, this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pref = Provider.of<Preferencias>(context);

    return ListTile(
      leading: Icon(
        icon,
        size: 40.0,
        color: Theme.of(context).primaryColor,
      ),
      title: Text(texto,
          style: TextStyle(
              fontSize: 25,
              fontStyle: FontStyle.italic,
              color: Theme.of(context).primaryColor)),
      onTap: () {
        if (pref.modoConfig) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => onPress));
          // onPress();
        }
      },
    );
  }
}

salida(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) => AlertDialog(
            //backgroundColor: Colors.red[900],
            title: Container(
              width: 100,
              height: 100,
              child: Center(
                child: Text('¿ Desea salir de vitalfon ?',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, color: Colors.red)),
              ),
            ),

            //shape: CircleBorder(),
            elevation: 14.0,
            //actionsPadding: EdgeInsets.symmetric(horizontal: 15.0),
            actionsAlignment: MainAxisAlignment.spaceAround,
            actions: [
              ElevatedButton(
                onPressed: () {
                  // se sale con flecha menu inferior
                  SystemNavigator.pop();

                  exit(0);
                  //Navigator.pop(context);
                },
                child: Text('Si',
                    style: TextStyle(fontSize: 25.0, color: Colors.white)),
              ),
              ElevatedButton(
                  autofocus: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('No',
                      style: TextStyle(fontSize: 25.0, color: Colors.white)))
            ],
          ));
}
