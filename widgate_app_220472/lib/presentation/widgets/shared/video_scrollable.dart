import 'package:flutter/material.dart';
import 'package:widgate_app_220472/domain/entities/video_post.dart';
import 'package:widgate_app_220472/presentation/widgets/shared/video_butons.dart';
import 'package:widgate_app_220472/presentation/widgets/video/video_player.dart';

class VideoScrollable extends StatelessWidget {
  final List<VideoPost> videos;

  const VideoScrollable({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemCount: videos.length,
      itemBuilder: (context,index){

        final VideoPost videoPost = videos[index];
        final GlobalKey<CustomVideoPlayerState> videoPlayerKey = GlobalKey(); // Crear la key

        return Stack(
          children: [
            // video player + gradient
            SizedBox.expand(
              child: CustomVideoPlayer(
                key: videoPlayerKey, // Asignar la key al video player
                videoUrl: videoPost.videoURL,
                caption: videoPost.caption
              )
            ),
            // gradiente
            const SizedBox.expand(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.transparent,
                    Colors.black26
                  ],
                  stops: [0.8, 1.0],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                  ),
                ),
              ),
            ),
            // Botones 
            Positioned(
              bottom: 40,
              right: 20,
              child: VideoButtons(
                video: videoPost,
                videoPlayerKey: videoPlayerKey,
              )
            ),
            
          ],
        );
      },
    );
  }
}