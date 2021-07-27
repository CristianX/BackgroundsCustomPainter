import 'package:disenios_app/src/widgets/headers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EmergencyPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Iconheader(
        icon: FontAwesomeIcons.plus,
        subtitulo: 'Asistencia Médica',
        titulo: 'Haz Solicitado',
        color1: Color(0xff526bf6),
        color2: Color(0xff67acf2),
      ),
    );
  }
}