import 'package:flutter/material.dart';

class AnimatedTodo extends StatefulWidget {
  const AnimatedTodo({Key? key}) : super(key: key);

  @override
  _AnimatedTodoState createState() => _AnimatedTodoState();
}

class _AnimatedTodoState extends State<AnimatedTodo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation containerHeightAnimation;
  late Animation textSizeAnimation;
  late Animation opacityAnimation;
  late Animation floatingAnimation;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    containerHeightAnimation = Tween<double>(begin: 0, end: 50).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0, 0.25),
      ),
    );
    textSizeAnimation = Tween<double>(begin: 1, end: 23).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.25, 0.5),
      ),
    );
    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.5, .75),
      ),
    );
    floatingAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(0.75, 1),
      ),
    );

    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: containerHeightAnimation.value,
                          height: containerHeightAnimation.value,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                        )
                      ],
                    );
                  }),
              AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Text(
                      "Good Morning,",
                      style: TextStyle(
                        fontSize: textSizeAnimation.value,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }),
              Text("Here are your plans for today"),
              Expanded(
                child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Opacity(
                        opacity: opacityAnimation.value,
                        child: ListView(
                          children: [
                            for (var i = 0; i < 15; i++)
                              CheckboxListTile(
                                value: true,
                                onChanged: (value) {},
                                title: Text(
                                  "Task $i",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              )
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
        floatingActionButton: AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.scale(
                scale: floatingAnimation.value,
                child: FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: null,
                ),
              );
            }),
      ),
    );
  }
}
