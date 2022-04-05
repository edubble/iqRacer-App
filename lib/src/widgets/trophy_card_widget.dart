import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrophyCard extends StatelessWidget {
  const TrophyCard({Key? key, required this.title, required this.image, required this.achieved})
      : super(key: key);

  final String title;
  final String image;
  final int achieved;

  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(achieved == 0 ? Colors.black.withOpacity(0.2) : Colors.black.withOpacity(1), BlendMode.dstATop)
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            margin: const EdgeInsets.fromLTRB(10, 15, 15, 5),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
        ),
    );
  }
}
