import 'package:flutter/material.dart';

class AnimatedHeart extends StatefulWidget {

  final Widget child;
  final bool isAnimating;
  final Duration duration;
  final VoidCallback onAnimationEnd;

  const AnimatedHeart({
    Key key,
    @required this.isAnimating,
    @required this.duration,
    @required this.child,
    @required this.onAnimationEnd,
  }) : super(key: key);

  @override
  _AnimatedHeartState createState() => _AnimatedHeartState();
}

class _AnimatedHeartState extends State<AnimatedHeart> with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> scale;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration.inMilliseconds ~/ 2)
    );

    scale = Tween<double>(begin: 1.0, end: 1.3).animate(controller);

  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scale,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(covariant AnimatedHeart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(!widget.isAnimating == oldWidget.isAnimating ) {
      runAnimation();
    }
  }

  Future<void> runAnimation() async {
    await controller.forward();
    await controller.reverse();
    await Future.delayed(Duration(milliseconds: 500));

    if(widget.onAnimationEnd != null) {
      widget.onAnimationEnd();
    }

  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}