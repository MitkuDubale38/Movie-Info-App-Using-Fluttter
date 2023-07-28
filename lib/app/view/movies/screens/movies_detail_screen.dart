import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:moviedbapp/app/controller/movies/movie.dart';
import 'package:moviedbapp/app/controller/movies/video_player.dart';
import 'package:moviedbapp/utils/hour_convertor.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// ignore: must_be_immutable
class Detail extends StatelessWidget {
  Detail({
    super.key,
  });

  final movieController movieCtrl = Get.find();
  final VideoPlayerController videoCtrl = Get.put(VideoPlayerController());
  List<Widget> genres = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B0B),
      body: movieCtrl.obx(
        (state) {
          videoCtrl.playVideo(movieCtrl.movie!.data!.movie!.ytTrailerCode!);
          genres = movieCtrl.movie!.data!.movie!.genres!
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "$e ",
                    style: const TextStyle(
                      color: Color.fromARGB(255, 200, 128, 2),
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      fontFamily: 'Times New Roman',
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              )
              .toList();

          final String humanReadableMovieLength =
              HourConverter.convertToHumanForm(
                  movieCtrl.movie!.data!.movie!.runtime!);
          var format = DateFormat.yMMMEd();
          var releasedDate = format.format(
              DateTime.parse(movieCtrl.movie!.data!.movie!.dateUploaded!));
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Image.network(
                        movieCtrl.movie!.data!.movie!.largeCoverImage!,
                        fit: BoxFit.cover,
                        height: MediaQuery.sizeOf(context).height * 0.60,
                      ),
                    ),
                    Positioned(
                      top: 30,
                      right: 10,
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 200, 128, 2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            movieCtrl.movie!.data!.movie!.year.toString(),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 22, 22, 22),
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 30,
                        left: 10,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 87, 87, 87),
                            child: Icon(
                              Icons.chevron_left,
                              color: Colors.white,
                              size: 32,
                            ),
                          ),
                        )),
                    Positioned(
                      left: MediaQuery.sizeOf(context).width * 0.33,
                      bottom: 20,
                      child: DelayedDisplay(
                        delay: const Duration(seconds: 1),
                        child: Container(
                          height: 40,
                          width: 140,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 87, 87, 87),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              videoCtrl.controller!.play();
                            },
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Play",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movieCtrl.movie!.data!.movie!.title!,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Times New Roman',
                      ),
                    ),
                  ),
                ),
                DelayedDisplay(
                  delay: const Duration(seconds: 1),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text(
                          "Genres: ",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Times New Roman',
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: genres,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Description",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Times New Roman',
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: movieCtrl.movie!.data!.movie!.runtime! > 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          humanReadableMovieLength,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 179, 179, 179),
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            fontFamily: 'Times New Roman',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                DelayedDisplay(
                  delay: const Duration(seconds: 1),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      movieCtrl.movie!.data!.movie!.descriptionFull.toString(),
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 179, 179, 179),
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Times New Roman',
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Downloads: ",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Times New Roman',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            movieCtrl.movie!.data!.movie!.downloadCount
                                .toString(),
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 179, 179, 179),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Times New Roman',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Released on:  ",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Times New Roman',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            releasedDate,
                            textAlign: TextAlign.justify,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 200, 128, 2),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Times New Roman',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                DelayedDisplay(
                  delay: const Duration(seconds: 1),
                  child: YoutubePlayer(
                    controller: videoCtrl.controller!,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.amber,
                    onReady: () {
                      videoCtrl.playVideo(movieCtrl.movie!.data!.movie!.url!);
                    },
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          );
        },
        onLoading: const Center(child: CircularProgressIndicator()),
        onEmpty: const Text('No data found'),
        onError: (error) => Text(error!),
      ),
    );
  }
}
