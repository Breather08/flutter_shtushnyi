import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingController with ChangeNotifier {
  double _rating = 0;

  double get value => _rating;

  void setRating(double value) {
    _rating = value;
    notifyListeners();
  }
}

class StarRating extends StatefulWidget {
  final RatingController controller;

  const StarRating({required this.controller, super.key});

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  void _onRatingUpdate(value) {
    widget.controller.setRating(value);
  }

  @override
  Widget build(BuildContext context) {
    return RatingBar(
        minRating: 1,
        initialRating: widget.controller.value,
        direction: Axis.horizontal,
        allowHalfRating: true,
        ratingWidget: RatingWidget(
            full: const Icon(Icons.star, color: Colors.orange),
            half: const Icon(
              Icons.star_half,
              color: Colors.orange,
            ),
            empty: const Icon(
              Icons.star_outline,
              color: Colors.orange,
            )),
        onRatingUpdate: _onRatingUpdate);
  }
}
