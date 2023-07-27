import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedbapp/app/controller/movies/movie.dart';
import 'package:moviedbapp/app/controller/movies/movies.dart';
import 'package:moviedbapp/app/models/movies/movies.dart';
import 'package:moviedbapp/app/view/movies/screens/movies_detail_screen.dart';
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

// ignore: must_be_immutable
class CardWithTitle extends StatelessWidget {
  AllMovie state;
  String title;

  CardWithTitle({
    super.key,
    required this.movieCtrl,
    required this.state,
    required this.title,
  });

  final movieController movieCtrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Times New Roman',
                ),
              ),
              const Text(
                "See all",
                style: TextStyle(
                  color: Color.fromARGB(255, 188, 188, 188),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.360,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state!.data!.movies!.length,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {
                    movieCtrl.loadMoviesById(state.data!.movies![index].id!);
                    Get.to(
                      () => Detail(),
                    );
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.50,
                    child: GestureDetector(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: const Color.fromARGB(255, 15, 15, 15),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.network(
                                state.data!.movies![index].mediumCoverImage!,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            Positioned(
                                child: Container(
                              width: 40,
                              height: 40,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(20),
                                ),
                                color: Color.fromARGB(255, 200, 128, 2),
                              ),
                              child: Center(
                                child: Text(
                                  state.data!.movies![index].rating!.toString(),
                                  style: const TextStyle(
                                    color: Color.fromARGB(255, 21, 21, 21),
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Times New Roman',
                                  ),
                                ),
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
