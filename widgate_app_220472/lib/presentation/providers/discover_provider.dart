import 'package:flutter/material.dart';
import 'package:widgate_app_220472/domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier{// Nos permite cambiar el estado de la aplicacion
  bool initialLoding = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async{

    //TODO CARGAR VIDEOS
    notifyListeners();    
  }

}