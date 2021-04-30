import 'package:flutter/material.dart';

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
  void initState() {

    // El state debe tener SingleTickerProviderStateMixin para controlar el vsync
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 4000));

    // Configurando rotación
    rotacion = Tween( begin: 0.0, end: 2.0 ).animate( controller );

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
    return _Rectangulo();
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