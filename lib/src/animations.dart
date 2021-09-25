import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation colorAnimation;
  late Animation sizeAnimation;

  double containerHeight = 100;
  double containerWidth = 100;
  Color containerColor = Colors.blue;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    // colorAnimation = ColorTween(begin: Colors.red, end: Colors.green).animate(
    //   CurvedAnimation(
    //     parent: _animationController,
    //     curve: Interval(
    //       0,
    //       .5,
    //       curve: Curves.linear,
    //     ),
    //   ),
    // );
    sizeAnimation = TweenSequence(
      [
        TweenSequenceItem(tween: Tween(begin: 0.0, end: 100.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 100.0, end: 50.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 50.0, end: 75.0), weight: 1),
        TweenSequenceItem(tween: Tween(begin: 75.0, end: 0.0), weight: 1),
      ],
    ).animate(_animationController);
    super.initState();

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            AnimatedBuilder(
                animation: _animationController,
                builder: (context, Widget? child) {
                  return Container(
                    height: sizeAnimation.value,
                    width: sizeAnimation.value,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  );
                })
            // AnimatedContainer(
            //   duration: Duration(seconds: 2),
            //   height: containerHeight,
            //   width: containerWidth,
            //   decoration: BoxDecoration(
            //     color: containerColor,
            //     //shape: BoxShape.circle,
            //   ),
            //   child: ElevatedButton(
            //       onPressed: () {
            //         containerHeight = MediaQuery.of(context).size.height;
            //         containerWidth = MediaQuery.of(context).size.width;
            //         containerColor = Colors.black;
            //         setState(() {});
            //       },
            //       child: Text("Press to animate")),
            // )
          ],
        ),
      ),
    );
  }
}
