import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerController extends GetxController {
  YoutubePlayerController? controller;

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
