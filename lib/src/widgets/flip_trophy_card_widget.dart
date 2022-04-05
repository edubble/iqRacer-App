import 'package:flutter/material.dart';
import 'dart:math'; // it will allows us to get the pi constant

class FlipTrophyCard extends StatefulWidget {
  const FlipTrophyCard({Key? key, required this.angle, required this.isBack, required this.title, required this.image, required this.achieved}) : super(key: key);
  final double angle;
  final bool isBack;
  final String title;
  final String image;
  final int achieved;

  @override
  _FlipTrophyCardState createState() => _FlipTrophyCardState();
}

class _FlipTrophyCardState extends State<FlipTrophyCard> {
  //declare the isBack bool
  late bool isBack =  widget.isBack;
  late double angle = widget.angle;

  void _flip() {
    setState(() {
      angle = (angle + pi) % (2 * pi);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _flip,
      child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: angle),
          duration: const Duration(milliseconds: 400),
          builder: (BuildContext context, double val, __) {
            //here we will change the isBack val so we can change the content of the card
            if (val >= (pi / 2)) {
              isBack = false;
            } else {
              isBack = true;
            }
            return (Transform(
              //let's make the card flip by it's center
              alignment: Alignment.center,
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..rotateY(val),
              child: Container(
                  child: isBack
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/back.png"),
                            ),
                          ),
                        ) //if it's back we will display here
                      : Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..rotateY(
                                pi), // it will flip horizontally the container
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/face.png"),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "Surprise ! 🎊",
                                style: TextStyle(
                                  fontSize: 30.0,
                                ),
                              ),
                            ),
                          ),
                        ) //else we will display it here,
                  ),
            ));
          }),
    );
  }
}
