import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {

  // Para animar cualquier cosa

  //   AnimationController Sirve para manejar la animación
  AnimationController controller ; //Barra que muestra la animación de avance como videos de youtube

  // Animación (Que tipo de cosa yo quiero animar?)
  Animation<double> rotacion;
  Animation<double> opacidad;
  Animation<double> opacidadOut;
  Animation<double> moverDerecha;
  Animation<double> agrandar;

  // Inicializar los dos objetos de Animation
  @override
  // initState solo se ejecuta cuando se inicia el widget
  void initState() {

    // El state debe tener SingleTickerProviderStateMixin para controlar el vsync, la animación dura 4 segundos
    controller = new AnimationController(
      vsync: this, duration: Duration(milliseconds: 4000)
    );

    // Configurando rotación (de 0 a 2)
    rotacion = Tween( begin: 0.0, end: 2 * Math.pi ).animate( 
      CurvedAnimation( parent:  controller, curve: Curves.easeOut )
    );

    opacidad = Tween( begin: 0.1, end: 1.0 ).animate(
      // Interval sirve para animar en el tiempo de la animación (0.25 es para animar en un cuarto de la animación principal)
      CurvedAnimation( parent:  controller, curve: Interval(0, 0.25, curve: Curves.easeOut ) )
    );

    opacidadOut = Tween( begin: 0.0, end: 1.0 ).animate(
      // Interval sirve para animar en el tiempo de la animación (0.25 es para animar en un cuarto de la animación principal)
      CurvedAnimation( parent:  controller, curve: Interval(0.75, 1.0, curve: Curves.easeOut ) )
    );

    // end es el número de pixeles que se moverá el cuadro
    moverDerecha = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation( parent:  controller, curve: Curves.easeOut )
    );

    // end en 1 es su tamaño original y en 2, el doble de su tamaño
    agrandar = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation( parent:  controller, curve: Curves.easeOut )
    );

    // Ver estado de la animación con listener
    controller.addListener(() {

      // Eliminar la info de estado de la animación cuando se mande a producción por motivo del consumo de memoria
      // print('Status: ' + controller.status.toString());

      if(controller.status == AnimationStatus.completed){
        
        // controller.repeat();
        // controller.reverse();
        controller.reset();
      }

    });


    super.initState();
  }

  @override
  void dispose() {
    // Siempre se debe eliminar el controller en el dispose ya que es como un observable (siempre escuchará los cambios)
    // Se lo detiene para que no exista una fuga de memoria
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // Play o reproducción
    controller.forward();
    
    return AnimatedBuilder(
      animation: controller,
      child: _Rectangulo(), //(opcional)
      builder: (BuildContext context, Widget childRectangulo) {

        // Obteniendo información del estado del widget por medio de value
        // print('Opacidad: ' + opacidad.value.toString());
        // print('Rotación: ' + rotacion.value.toString());
        
        // Ejecución de la animación
        return Transform.translate(
            offset: Offset( moverDerecha.value , 0),
            child: Transform.rotate(
              angle: rotacion.value,
              //child: child //Tambien se puede poner el child (child:child) para cuando son widgets pesados
              child: Opacity(
                opacity: opacidad.value - opacidadOut.value,
                child: Transform.scale(
                  scale: agrandar.value,
                  child: childRectangulo
                ),
              ),
            ),
        );
      },
    );

  }
}

class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}