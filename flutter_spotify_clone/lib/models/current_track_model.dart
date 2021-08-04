import 'package:flutter/material.dart';
import 'package:flutter_spotify_clone/models/song_model.dart';

class CurrentTrack extends ChangeNotifier {
  Song? selected;

  void selectTrack(Song track) {
    selected = track;
    notifyListeners();
  }
}
