import 'package:widgate_app_220472/domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;
  final int comments;


  LocalVideoModel({

    required this.name,
    required this.videoUrl,
    required this.comments,
    this.likes=0,
    this.views=0,
  }
  );


  factory LocalVideoModel.fromJs(Map<String,dynamic> json) => LocalVideoModel(
    name: json['name'] ?? 'none',
    videoUrl: json['video_url'] ?? 'not found url',
    likes: json['likes'] ?? 0,
    views: json['views'] ?? 0,
    comments: json['comments'] ?? 0
  );/// Mapper te permite recorrer datos 

  VideoPost toVideoPostEntity()=> VideoPost(caption: name, videoURL: videoUrl, likes: likes, views: views, comments: comments);
}



