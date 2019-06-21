import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final int starCount;
  final double rating;
  final Color color;

  RatingBar({this.starCount = 5, this.rating = 0, this.color = Colors.black87});

  Widget buildStar(BuildContext context, int index) {
    IconData icName = Icons.star;
    Color icColor = color;

    if (index >= rating) {
      icName = Icons.star_border;
      icColor = color.withOpacity(.6);
    } else if (index > rating - 1 && index < rating) {
      // checks if the rating has a fraction (a half)
      icName = Icons.star_half;
    }

    return Icon(
      icName,
      size: 16,
      color: icColor,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        starCount,
        (i) {
          return buildStar(context, i);
        },
      ),
    );
  }
}
