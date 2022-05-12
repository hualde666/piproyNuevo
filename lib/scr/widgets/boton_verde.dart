import 'package:flutter/material.dart';
import 'package:piproy/scr/pages/home2_page.dart';

Widget botonBackHeader(BuildContext context, String pagina) {
  double width = MediaQuery.of(context).size.width;
  //double height = MediaQuery.of(context).size.height;
  double ancho = 100;
  double alto = 100;
  double font = 20;
  double icon = 40;
  if (width <= 320) {
    ancho = 80;
    alto = 65;
    font = 15;
    icon = 40;
  }
  return GestureDetector(
    onTap: () {
      if (pagina == 'Configurar') {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home2Page()));
      } else {
        Navigator.pop(context);
      }
    },
    child: Container(
      // child: Image(
      //     image: AssetImage('assets/boton_verde.png'), fit: BoxFit.contain),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.arrow_back_outlined, size: icon),
          Text(
            'ATRAS',
            style: TextStyle(fontSize: font, color: Colors.red),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: //pref.paleta == '4'
              Theme.of(context).backgroundColor,
          boxShadow: [
            BoxShadow(
              //  color: Colors.black,
              blurRadius: 1,
              spreadRadius: 0.5,
              offset: Offset(0, 3),
            ),
          ],

          //  : Colors.green[900],
          borderRadius: BorderRadius.all(Radius.circular(100))),
      //     border:
      //         Border.all(color: Theme.of(context).primaryColor, width: 0.5)),
      height: alto,
      width: ancho,
      //color: Colors.red),
    ),
  );
}
