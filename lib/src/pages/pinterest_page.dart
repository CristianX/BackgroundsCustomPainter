import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:disenios_app/src/widgets/pinterest_menu.dart';

class PinterestPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => new _MenuModel(),
      child: Scaffold(
        // body: PinterestGrid(),
        // body: PinterestMenu(),
        body: Stack(
          children: <Widget>[
            PinterestGrid(),
            _PinterestMenuLocation(),
          ],
        ),
       ),
    );
  }
}

class _PinterestMenuLocation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final widthPantalla = MediaQuery.of(context).size.width;
    final mostrar = Provider.of<_MenuModel>(context).mostrar;
    return Positioned(
      bottom: 30.0,
      child: Container(
        // color: Colors.red,
        width: widthPantalla,
        child: Align(
          // alignment: Alignment.centerRight,
          child: PinterestMenu(
            mostrar: mostrar,
            // backgroundColor: Colors.red,
            // activeColor: Colors.red,
            // inactiveColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}

class PinterestGrid extends StatefulWidget {

  @override
  _PinterestGridState createState() => _PinterestGridState();
}

class _PinterestGridState extends State<PinterestGrid> {
  final List<int> items = List.generate(200, (i) => i);
  ScrollController controller = new ScrollController();
  double scrollAnterior = 0;

  @override
  void initState() {

    controller.addListener(() {
      // Escuchando cuandoPinterest grid se mueva
      // print('ScrollListener ${ controller.offset }');

      if( controller.offset > scrollAnterior && controller.offset > 150 ) {
        // print('ocultar Menú');
        Provider.of<_MenuModel>(context, listen: false).mostrar = false;
      } else {
        // print('Mostrar Menú');
        Provider.of<_MenuModel>(context, listen: false).mostrar = true;
      }

      scrollAnterior = controller.offset;

    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new StaggeredGridView.countBuilder(
      controller: controller,
      crossAxisCount: 4,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) => _PinterestItem( index ),
      staggeredTileBuilder: (int index) =>
          new StaggeredTile.count(2, index.isEven ? 2 : 3),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
    );
  }
}

class _PinterestItem extends StatelessWidget {
  
  final int index;

  _PinterestItem( this.index );

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(30))

      ),
      child: new Center(
        child: new CircleAvatar(
          backgroundColor: Colors.white,
          child: new Text('$index'),
        ),
      ));
  }
}

class _MenuModel with ChangeNotifier {
  bool _mostrar = true;

  bool get mostrar => this._mostrar;

  set mostrar( bool valor ) {
    this._mostrar = valor;
    notifyListeners();
  }
}