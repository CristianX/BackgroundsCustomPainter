import 'package:flutter/material.dart';

import 'package:disenios_app/src/widgets/slideshow.dart';

import 'package:flutter_svg/svg.dart';

class SlideshowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.purple,
      body: Column(
        children: <Widget>[
          Expanded(child: _MiSlideshow()),
          Expanded(child: _MiSlideshow())
        ],
      )
      
    );
  }
}

class _MiSlideshow extends StatelessWidget {
  const _MiSlideshow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      bulletPrimario: 15,
      bulletSecundario: 12,
      // puntosArriba: true,
      colorPrimario: Color(0xffff5a7e),
      // colorSecundario: Colors.red,
      slides: <Widget>[
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg')
      ],
    );
  }
}

