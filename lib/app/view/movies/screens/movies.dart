import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedbapp/app/controller/movies/movie.dart';
import 'package:moviedbapp/app/controller/movies/movies.dart';
import 'package:moviedbapp/app/view/movies/screens/movies_detail_screen.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final moviesController moviesCtrl = Get.put(moviesController());
  final movieController movieCtrl = Get.put(movieController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B0B),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0B0B),
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
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ),
        ],
      ),
      body: moviesCtrl.obx(
        (state) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Upcoming",
                    style: TextStyle(
                      color: Color.fromARGB(255, 188, 188, 188),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                      color: Color.fromARGB(255, 188, 188, 188),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.371,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: state!.data!.movies!.length,
                  itemBuilder: (BuildContext context, index) {
                    return GestureDetector(
                      onTap: () {
                        movieCtrl
                            .loadMoviesById(state.data!.movies![index].id!);
                        Get.to(
                          () => Detail(),
                        );
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.50,
                        child: GestureDetector(
                          child: Card(
                            color: const Color.fromARGB(255, 15, 15, 15),
                            shadowColor:
                                const Color.fromARGB(255, 193, 193, 193),
                            elevation: 2,
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network(
                                    state
                                        .data!.movies![index].mediumCoverImage!,
                                  ),
                                ),
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
        ),
        onLoading: const CircularProgressIndicator(),
        onEmpty: const Text('No data found'),
        onError: (error) => Text(error!),
      ),
    );
  }
}
