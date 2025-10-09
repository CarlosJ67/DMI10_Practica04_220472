import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:widgate_app_220472/config/helpers/human_formats.dart';
import 'package:widgate_app_220472/domain/entities/video_post.dart';
import 'package:widgate_app_220472/presentation/widgets/video/video_player.dart';

class VideoButtons extends StatefulWidget { 
  final VideoPost video;
  final GlobalKey<CustomVideoPlayerState>? videoPlayerKey;

  const VideoButtons({
    super.key, 
    required this.video,
    this.videoPlayerKey,
  });

  @override
  State<VideoButtons> createState() => _VideoButtonsState();
}

class _VideoButtonsState extends State<VideoButtons> {
  bool isPlaying = true; // Estado del play/pause

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CustomIconButton(value: widget.video.likes, iconColor: Colors.red, iconData: Icons.favorite),
        const SizedBox(height: 20,),
        _CustomIconButton(value: widget.video.views, iconData: Icons.remove_red_eye_outlined),
        const SizedBox(height: 20,),
        _CustomIconButton(value: widget.video.comments, iconData: Icons.comment_outlined),
        const SizedBox(height: 20,),
        
        // Tu lógica actual pero con estado
        GestureDetector(
          onTap: () {
            setState(() {
              isPlaying = !isPlaying; // Cambiar el estado visual
            });
            // Aquí controlas el video
            widget.videoPlayerKey?.currentState?.togglePlayPause();
          },
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: isPlaying 
              ? SpinPerfect(
                  key: const ValueKey('playing'),
                  infinite: true,
                  duration: const Duration(seconds: 5),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: const Icon(
                      Icons.play_circle_outline,
                      color: Colors.grey,
                      size: 30,
                    ),
                  ),
                )
              : Container(
                  key: const ValueKey('paused'),
                  padding: const EdgeInsets.all(8.0),
                  child: const Icon(
                    Icons.pause_circle_outline,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),
          ),
        ),
        
      const SizedBox(height: 20,),
      _SoundButton(videoPlayerKey: widget.videoPlayerKey),
      ],
    );
  }
}

class _SoundButton extends StatefulWidget {
  final GlobalKey<CustomVideoPlayerState>? videoPlayerKey; 

  const _SoundButton({this.videoPlayerKey}); 

  @override
  State<_SoundButton> createState() => _SoundButtonState();
}

class _SoundButtonState extends State<_SoundButton>{
  bool isMuted = false; // Inicia sin silenciar
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){
        setState(() {
          isMuted = !isMuted; // Cambiar estado visual
        });
        
        // Controlar el volumen del video
        widget.videoPlayerKey?.currentState?.toggleMute();
        
      }, 
      icon: Icon(
        isMuted ? Icons.volume_off : Icons.volume_up, 
        color: Colors.grey, 
        size: 30,
      )
    );
  }
}

class _CustomIconButton extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;
  
  const _CustomIconButton({
    required this.value,
    required this.iconData,
    Color? iconColor,
  }): color = iconColor ?? Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed:(){}, icon: Icon(iconData, color: color, size: 30,)),
        if(value > 0)
          Text(HumanFormats.humanReadbleNumber(value.toDouble())),
      ],
    );
  }
}