import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BotonGordo extends StatelessWidget {

  final IconData icon;
  final String texto;
  final Color color1;
  final Color color2;
  final Function onPress;

  const BotonGordo({
    this.icon = FontAwesomeIcons.chevronRight, 
    @required this.texto, 
    this.color1 = Colors.blueGrey, 
    this.color2 = Colors.blueGrey, 
    @required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Stack(
        children: <Widget>[
          _BotonGordoBackground( icon: this.icon, color1: color1, color2: color2 ),
    
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox( height: 140, width: 40.0 ),
              FaIcon( this.icon, color: Colors.white, size: 40.0 ),
              SizedBox( width: 20.0 ),
              Expanded(child: Text(this.texto, style: TextStyle( color: Colors.white, fontSize: 18.0 ))),
              FaIcon( FontAwesomeIcons.chevronRight, color: Colors.white ),
              SizedBox( width: 40 )
            ],
          )
        ],
      ),
    );
  }
}

class _BotonGordoBackground extends StatelessWidget {

  final IconData icon;
  final Color color1;
  final Color color2;

  const _BotonGordoBackground({
    @required this.icon,
    @required this.color1, 
    @required this.color2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      // ClipRRect sirve para cortar los bordes de lo que está contenido
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: <Widget>[
            Positioned(
              right: -20.0,
              top: -20.0,
              child: FaIcon( this.icon, size: 150.0, color: Colors.white.withOpacity(0.2)),
            )
          ],
        ),
      ),

      width: double.infinity,
      height: 100,
      margin: EdgeInsets.all( 20.0 ),
      decoration: BoxDecoration(
        color: Colors.red,
        boxShadow: <BoxShadow>[
          BoxShadow( color: Colors.black.withOpacity(0.2), offset: Offset(4,6), blurRadius: 10.0 )
        ],
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: <Color>[
            this.color1,
            this.color2,
          ]
        )
      ),
    );
  }
}