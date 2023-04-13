import 'package:flutter/material.dart';
import 'package:shtushnyi/widgets/star_rating.dart';

class ShtushnyiAddForm extends StatefulWidget {
  final void Function(
      {required String title,
      required String comment,
      required double rating}) action;

  const ShtushnyiAddForm({required this.action, super.key});

  @override
  State<ShtushnyiAddForm> createState() => _ShtushnyiAddFormState();
}

class _ShtushnyiAddFormState extends State<ShtushnyiAddForm> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _commentController = TextEditingController();
  final _ratingController = RatingController();

  void onSubmit() {
    if (_formKey.currentState!.validate()) {
      widget.action(
          title: _titleController.value.text,
          comment: _commentController.value.text,
          rating: _ratingController.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
            ),
            TextFormField(
              controller: _commentController,
            ),
            StarRating(
              controller: _ratingController,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: onSubmit, child: const Text('Штушный бар жб')),
            )
          ],
        ));
  }
}
