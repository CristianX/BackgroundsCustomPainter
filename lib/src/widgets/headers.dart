import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      // 0xff para especificar un color hexadecimal
      color: Color(0xff615AAB)
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      // 0xff para especificar un color hexadecimal
      decoration: BoxDecoration(
        color: Color(0xff615AAB),
        borderRadius: BorderRadius.only( 
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        )
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // 0xff para especificar un color hexadecimal
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter(),
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    // lapiz que se utilizará para pintar
    final lapiz = Paint();

    // Propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.strokeWidth = 2;

    lapiz.style = PaintingStyle.fill; // .fill rellenar  .stroke solo bordes
    // Forma en la qu va a dibujar
    final path = new Path();

    // Dibujar con el path y el lapiz
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.5);



    // Diciendole a canvas que dibuje
    canvas.drawPath(path, lapiz);


  }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
      return true;
  }

}

class HeaderTriangular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // 0xff para especificar un color hexadecimal
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderTriangularPainter(),
      ),
    );
  }
}

class _HeaderTriangularPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    // lapiz que se utilizará para pintar
    final lapiz = Paint();

    // Propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.strokeWidth = 2;

    lapiz.style = PaintingStyle.fill; // .fill rellenar  .stroke solo bordes
    // Forma en la qu va a dibujar
    final path = new Path();

    // Dibujar con el path y el lapiz
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    // path.lineTo(0, 0);
    // path.lineTo(0, size.height * 0.5);



    // Diciendole a canvas que dibuje
    canvas.drawPath(path, lapiz);


  }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
      return true;
  }

}

class HeaderPico extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // 0xff para especificar un color hexadecimal
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderPicoPainter(),
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    // lapiz que se utilizará para pintar
    final lapiz = Paint();

    // Propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.strokeWidth = 2;

    lapiz.style = PaintingStyle.fill; // .fill rellenar  .stroke solo bordes
    // Forma en la qu va a dibujar
    final path = new Path();

    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.20);
    path.lineTo(size.width * 0.5, size.height * 0.30);
    path.lineTo(size.width, size.height * 0.20);
    path.lineTo(size.width, 0);
    



    // Diciendole a canvas que dibuje
    canvas.drawPath(path, lapiz);


  }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
      return true;
  }

}

class HeaderCurvo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // 0xff para especificar un color hexadecimal
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderCurvoPainter(),
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    // lapiz que se utilizará para pintar
    final lapiz = Paint();

    // Propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.strokeWidth = 20;

    lapiz.style = PaintingStyle.fill; // .fill rellenar  .stroke solo bordes
    // Forma en la qu va a dibujar
    final path = new Path();

    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.40, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height * 0.25);

    



    // Diciendole a canvas que dibuje
    canvas.drawPath(path, lapiz);


  }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
      return true;
  }

}

class HeaderWaves extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // 0xff para especificar un color hexadecimal
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderWavesPainter(),
      ),
    );
  }
}

class _HeaderWavesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    // lapiz que se utilizará para pintar
    final lapiz = Paint();

    // Propiedades
    lapiz.color = Color(0xff615AAB);
    lapiz.strokeWidth = 20;

    lapiz.style = PaintingStyle.fill; // .fill rellenar  .stroke solo bordes
    // Forma en la qu va a dibujar
    final path = new Path();

    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height * 0.25);

    



    // Diciendole a canvas que dibuje
    canvas.drawPath(path, lapiz);


  }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
      return true;
  }

}

class HeaderWavesGradiente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // 0xff para especificar un color hexadecimal
      // color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderWavesPainterGradiente(),
      ),
    );
  }
}

class _HeaderWavesPainterGradiente extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    final Rect rect = new Rect.fromCircle(
      center: Offset(0, 55),
      radius: 180
    );

    final Gradient gradiente = new LinearGradient(
      // Definición vertical del gradiente
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: <Color>[
        Color(0xff6D05E8),
        Color(0xffC012FF),
        Color(0xff6D05FA),
      ],
      // Puntos donde trabajara el gradiente
      stops: [
        0.2,
        0.5,
        1.0,
      ]
    );

    // lapiz que se utilizará para pintar (..shader es para la definición del gradiente)
    final lapiz = Paint()..shader = gradiente.createShader(rect);

    // Propiedades
    // lapiz.color = Color(0xff615AAB);
    lapiz.strokeWidth = 20;
    lapiz.style = PaintingStyle.fill; // .fill rellenar  .stroke solo bordes
    // Forma en la qu va a dibujar
    final path = new Path();

    // Dibujar con el path y el lapiz
    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.30, size.width * 0.5, size.height * 0.25);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.20, size.width, size.height * 0.25);
    path.lineTo(size.width, 0);
    // path.lineTo(size.width, size.height * 0.25);

    



    // Diciendole a canvas que dibuje
    canvas.drawPath(path, lapiz);


  }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
      return true;
  }

}

