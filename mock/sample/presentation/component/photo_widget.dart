import 'package:flutter/material.dart';
import '../../domain/model/sample_photo.dart';

class SamplePhotoWidget extends StatelessWidget {
  final SamplePhoto photo;

  const SamplePhotoWidget({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        image: DecorationImage(
          image: NetworkImage(photo.previewURL),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
