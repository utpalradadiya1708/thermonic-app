import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/custom_transition.dart';

class NoSwipeTransition extends CustomTransition {
  @override
  Widget buildTransition(
    BuildContext context,
    Curve? curve,
    Alignment? alignment,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return NoSwipeCupertinoPageRoute(
      builder: (_) => child,
    ).buildPage(context, animation, secondaryAnimation);
  }
}

class NoSwipeCupertinoPageRoute<T> extends CupertinoPageRoute<T> {
  NoSwipeCupertinoPageRoute({required super.builder});

  @override
  bool get popGestureEnabled => false; // 🔒 disables iOS swipe
}
