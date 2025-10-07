import 'package:flutter/material.dart';
import 'package:widgate_app_220472/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({super.key, required this.video});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: () {}, icon:Icon(Icons.favorite, color: Colors.red,)),
      ],
    );

  }

}