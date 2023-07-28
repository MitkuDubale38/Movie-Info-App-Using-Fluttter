import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
            radius: 30,
            backgroundColor: Colors.grey,
            child: Image.network(
              "https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745",
              errorBuilder: (context, error, stackTrace) {
                return const Text('Image not available');
              },
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
                radius: 25,
                backgroundColor:
                    const Color.fromARGB(255, 59, 59, 59).withOpacity(0.5),
                child: const Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 255, 255, 255),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GNav(
          rippleColor: const Color.fromARGB(255, 41, 41, 41),
          hoverColor: const Color.fromARGB(255, 81, 81, 81),
          haptic: true,
          curve: Curves.easeOutExpo,
          duration: const Duration(milliseconds: 500),
          gap: 8,
          color: Colors.grey[800],
          activeColor: const Color.fromARGB(255, 200, 128, 2),
          iconSize: 24,
          tabBackgroundColor: const Color.fromARGB(255, 36, 36, 36),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          tabs: const [
            GButton(
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            GButton(
              icon: Icons.favorite_outline,
              text: 'Likes',
            ),
            GButton(
              icon: Icons.search_outlined,
              text: 'Search',
            ),
            GButton(
              icon: Icons.person_2_outlined,
              text: 'Profile',
            )
          ],
        ),
      ),
    );
  }
}
