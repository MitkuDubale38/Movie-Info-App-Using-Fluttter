// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedbapp/app/controller/movies/movie.dart';
import 'package:moviedbapp/app/models/movies/movies.dart';
import 'package:moviedbapp/app/view/movies/screens/movies_detail_screen.dart';

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
                  fontFamily: 'Helvetica',
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
              itemCount: state.data!.movies!.length,
              itemBuilder: (BuildContext context, index) {
                return GestureDetector(
                  onTap: () {
                    movieCtrl.loadMoviesById(state.data!.movies![index].id!);
                    print(state.data!.movies![index].id!);
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
                                child: state.data!.movies![index]
                                            .mediumCoverImage !=
                                        null
                                    ? Image.network(
                                        state.data!.movies![index]
                                            .mediumCoverImage!,
                                        fit: BoxFit.fitHeight,
                                      )
                                    : const SizedBox()),
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
                                    fontFamily: 'Helvetica',
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
