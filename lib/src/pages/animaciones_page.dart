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

  // Inicializar los dos objetos de Animation
  @override
  // initState solo se ejecuta cuando se inicia el widget
  void initState() {

    // El state debe tener SingleTickerProviderStateMixin para controlar el vsync
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 4000));

    // Configurando rotación (de 0 a 2)
    rotacion = Tween( begin: 0.0, end: 2 * Math.pi ).animate( 

      CurvedAnimation( parent:  controller, curve: Curves.easeOut )

    );

    // Ver estado de la animación con listener
    controller.addListener(() {

      print('Status: ' + controller.status.toString());

      if(controller.status == AnimationStatus.completed){
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
      // child: _Rectangulo(), (opcional)
      builder: (BuildContext context, Widget child) {

        
        // Ejecución de la animación
        return Transform.rotate(
            angle: rotacion.value,
            child: _Rectangulo() //Tambien se puede poner el child (child:child)
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