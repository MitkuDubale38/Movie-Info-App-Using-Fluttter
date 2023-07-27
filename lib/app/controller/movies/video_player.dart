import 'package:get/get.dart';
import 'package:moviedbapp/app/controller/movies/movie.dart';
import 'package:moviedbapp/app/controller/movies/movie.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerController extends GetxController {
  YoutubePlayerController? controller;
  movieController movieCtrl = Get.find();

  @override
  void onReady() {
    if (movieCtrl.loadingStatus.isSuccess) {
      playVideo(movieCtrl.movie!.data!.movie!.url!);
    }
    super.onReady();
  }

  void playVideo(String url) {
    controller = YoutubePlayerController(
      initialVideoId: url,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        captionLanguage: ThumbnailQuality.high,
        enableCaption: true,
      ),
    );
    controller!.addListener(_listener);
  }

  void _listener() {}
}
