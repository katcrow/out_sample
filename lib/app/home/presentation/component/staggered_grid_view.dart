import 'package:clean_tutorial1/app/home/presentation/component/photo_widget.dart';
import 'package:clean_tutorial1/app/home/presentation/vm/vm_util/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../domain/model/photo.dart';

class StaggeredGridView extends StatelessWidget {
  final List<Photo> photos;

  const StaggeredGridView({
    Key? key,
    required this.photos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: photos.length,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: PhotoWidget(
            photo: photos[index],
          ),
        );
      },
    );
  }
}
