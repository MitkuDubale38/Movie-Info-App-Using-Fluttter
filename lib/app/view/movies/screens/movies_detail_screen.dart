import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedbapp/app/controller/movies/movie.dart';
import 'package:moviedbapp/app/controller/movies/movies.dart';

class Detail extends StatelessWidget {
  Detail({
    super.key,
  });
  final movieController movieCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B0B),
      body: movieCtrl.obx(
        (state) => Stack(
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
              right: 20,
              child: Text(
                movieCtrl.movie!.data!.movie!.year.toString(),
                style: const TextStyle(
                  color: Color.fromARGB(255, 30, 30, 30),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.sizeOf(context).width * 0.38,
              bottom: 20,
              child: Container(
                height: 30,
                width: 120,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 87, 87, 87),
                  borderRadius: BorderRadius.circular(20),
                ),
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
          ],
        ),
        onLoading: const CircularProgressIndicator(),
        onEmpty: const Text('No data found'),
        onError: (error) => Text(error!),
      ),
    );
  }
}
