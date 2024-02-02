import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int starCount;
  final bool clickable;
  final double rating;
  final Function(double) onRatingChanged;
  final Color fillcolor;
  final double size;

  StarRating({this.clickable=false,this.starCount = 5, this.rating = .0,  required this.onRatingChanged, required this.fillcolor,this.size=20});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: fillcolor,
        size: size,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        color: fillcolor,
        size: size,
      );
    } else {
      icon = new Icon(
        Icons.star,
        size: size,
        color: fillcolor
      );
    }
    return new InkWell(
      onTap: clickable?() => onRatingChanged(index + 1):null,
      // onDoubleTap: clickable?() => onRatingChanged(index + 1):null,
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: new List.generate(starCount, (index) => buildStar(context, index)));
  }
}