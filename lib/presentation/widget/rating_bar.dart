import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRating extends StatelessWidget {
  double initalRating;
  bool isConst ;
  CustomRating({super.key, required this.initalRating,required this.isConst});

  @override
  Widget build(BuildContext context) {
    log(initalRating.toString());
    log("message");
    return RatingBar.builder(
        initialRating: initalRating,
        itemSize: 20,
        unratedColor: Colors.grey,
        ignoreGestures: isConst,
        itemBuilder: (context, index) => const Icon(
              Icons.star,
              color: Colors.amber,
              // size: 20,
            ),
        onRatingUpdate: (index) {});
  }
}
