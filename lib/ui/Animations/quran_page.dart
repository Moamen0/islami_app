import 'package:flutter/material.dart';

class SlidePageRoute<T> extends PageRouteBuilder<T> {
  final Widget child;
  final AxisDirection direction;
  final int index;

  SlidePageRoute({
    required this.child,
    required this.index,
    this.direction = AxisDirection.left,
  }) : super(
          settings: RouteSettings(arguments: index),
          transitionDuration: Duration(milliseconds: 300),
          reverseTransitionDuration: Duration(milliseconds: 300),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    
    Offset begin;
    Offset end = Offset.zero;
    
    switch (direction) {
      case AxisDirection.right:
        begin = Offset(-1.0, 0.0);
        break;
      case AxisDirection.left:
        begin = Offset(1.0, 0.0);
        break;
      case AxisDirection.up:
        begin = Offset(0.0, 1.0);
        break;
      case AxisDirection.down:
        begin = Offset(0.0, -1.0);
        break;
    }

    var curve = Curves.easeInOutCubic;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);

    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }
}