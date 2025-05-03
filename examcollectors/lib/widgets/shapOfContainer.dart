import 'package:flutter/material.dart';

class ShapeOfContainer extends StatelessWidget {
  const ShapeOfContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      alignment: Alignment.bottomCenter,
      height: 300,
      color: Colors.blue,
      child: CustomPaint(
        // foregroundPainter: Colors.black87,
        painter: SkewCut(),
        child: Container(
          alignment: Alignment.bottomCenter,
          color: Colors.black87,
          height: 300,
        ),
      ),
    );
  }
}

class SkewCut extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.white;
    paint.style = PaintingStyle.fill;

    var pathUp = Path();
    pathUp.moveTo(0, size.height * 0.1033);
    pathUp.quadraticBezierTo(size.width * 0.25, size.height * 0.145,
        size.width * 0.5, size.height * 0.1033);
    pathUp.quadraticBezierTo(size.width * 0.75, size.height * 0.0750,
        size.width * 1.0, size.height * 0.1033);
    pathUp.lineTo(size.width, 0);
    pathUp.lineTo(0, 0);

    canvas.drawPath(pathUp, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// class WaveClipper extends CustomPainter {
//   @override
//   Path getClip(Size size) {
//     debugPrint(size.width.toString());
//     var path = new Path();
//     path.lineTo(0, size.height);
//     var firstStart = Offset(size.width / 5, size.height);
//     var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
//     path.quadraticBezierTo(
//         firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);
//     var secondStart =
//         Offset(size.width - (size.width / 3.24), size.height - 105);
//     var secondEnd = Offset(size.width, size.height - 10);
//     path.quadraticBezierTo(
//         secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
//     path.lineTo(size.width, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
//     // TODO: implement shouldReclip
//     throw UnimplementedError();
//   }
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     // TODO: implement paint
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     // TODO: implement shouldRepaint
//     throw UnimplementedError();
//   }
// }
