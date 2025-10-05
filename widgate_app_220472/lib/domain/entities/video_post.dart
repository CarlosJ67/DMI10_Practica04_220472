class VideoPost {
  final String caption; // titulo del video
  final String videURL; // Referencia al video corto

  final int likes;
  final int views;

  VideoPost({
    required this.caption,
    required this.videURL,
    this.likes=0,
    this.views=0
});





}