import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviedbapp/app/controller/movies/movies.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final moviesController moviesCtrl = Get.put(moviesController());
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
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.371,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state!.data!.movies!.length,
              itemBuilder: (BuildContext context, index) {
                List<Widget> genres = state.data!.movies![index].genres!
                    .map(
                      (e) => Text(
                        "$e ",
                        style: const TextStyle(
                          color: Color.fromARGB(255, 188, 188, 188),
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                    .toList();
                return SizedBox(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: Card(
                    color: Color.fromARGB(255, 15, 15, 15),
                    shadowColor: const Color.fromARGB(255, 193, 193, 193),
                    elevation: 2,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.network(
                            state.data!.movies![index].mediumCoverImage!,
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 8.0, vertical: 3),
                        //   child: Align(
                        //     alignment: Alignment.centerLeft,
                        //     child: Text(
                        //       state.data!.movies![index].title!,
                        //       maxLines: 2,
                        //       overflow: TextOverflow.ellipsis,
                        //       style: const TextStyle(
                        //         color: Color.fromARGB(255, 188, 188, 188),
                        //         fontSize: 16,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 8.0, vertical: 3),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text(
                        //         state.data!.movies![index].rating.toString()!,
                        //         style: const TextStyle(
                        //           color: Color.fromARGB(255, 188, 188, 188),
                        //           fontSize: 12,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //       Text(
                        //         state.data!.movies![index].year!.toString(),
                        //         style: const TextStyle(
                        //           color: Color.fromARGB(255, 188, 188, 188),
                        //           fontSize: 12,
                        //           fontWeight: FontWeight.bold,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 8.0, vertical: 3),
                        //   child: Wrap(
                        //     children: genres,
                        //   ),
                        // ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 8.0, vertical: 3),
                        //   child: Text(
                        //     state.data!.movies![index].summary!,
                        //     maxLines: 4,
                        //     overflow: TextOverflow.ellipsis,
                        //     textAlign: TextAlign.justify,
                        //     style: const TextStyle(
                        //       color: Color.fromARGB(255, 188, 188, 188),
                        //       fontSize: 10,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        onLoading: const CircularProgressIndicator(),
        onEmpty: const Text('No data found'),
        onError: (error) => Text(error!),
      ),
    );
  }
}
