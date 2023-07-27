import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedbapp/app/controller/movies/movie.dart';
import 'package:moviedbapp/app/controller/movies/movies.dart';
import 'package:moviedbapp/app/view/movies/widgets/card_with_title.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final moviesController moviesCtrl = Get.put(moviesController());
  final movieController movieCtrl = Get.put(movieController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 24, 24),
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 100.0,
        backgroundColor: const Color.fromARGB(255, 24, 24, 24),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.grey,
            child: Image.network(
                "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745"),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
                radius: 20,
                backgroundColor: Color.fromARGB(255, 174, 174, 174),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            moviesCtrl.obx(
              (state) => CardWithTitle(
                movieCtrl: movieCtrl,
                state: state!,
                title: "Trending Now",
              ),
              onLoading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.360,
                  width: double.infinity,
                  child: Shimmer.fromColors(
                    baseColor: const Color.fromARGB(255, 132, 132, 132),
                    highlightColor: const Color.fromARGB(255, 115, 115, 115),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 38, 38, 38),
                          borderRadius: BorderRadius.circular(10)),
                      height: MediaQuery.of(context).size.height * 0.360,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              onEmpty: const Text('No data found'),
              onError: (error) => Text(error!),
            ),
            moviesCtrl.obx(
              (state) => CardWithTitle(
                movieCtrl: movieCtrl,
                state: state!,
                title: "Series",
              ),
              onLoading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.360,
                  width: double.infinity,
                  child: Shimmer.fromColors(
                    baseColor: const Color.fromARGB(255, 132, 132, 132),
                    highlightColor: const Color.fromARGB(255, 115, 115, 115),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 38, 38, 38),
                          borderRadius: BorderRadius.circular(10)),
                      height: MediaQuery.of(context).size.height * 0.360,
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
              onEmpty: const Text('No data found'),
              onError: (error) => Text(error!),
            ),
          ],
        ),
      ),
    );
  }
}
