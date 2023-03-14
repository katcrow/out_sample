// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../domain/model/photo.dart';

class PhotoWidget extends StatelessWidget {
  final Photo photo;

  PhotoWidget({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(2.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: Image.network(photo.previewURL, fit: BoxFit.cover)),
          );
        // Container(
        //     decoration: BoxDecoration(
        //       borderRadius: const BorderRadius.all(Radius.circular(16)),
        //       image: DecorationImage(
        //         image: NetworkImage(photo.previewURL),
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   );
  }
}
