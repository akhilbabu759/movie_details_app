import 'package:cinephile/screen/home/controller/home_controller.dart';
import 'package:cinephile/screen/movie_details/controller/movie_details_controller.dart';

import 'package:cinephile/screen/movie_details/view/movie_details.dart';
import 'package:cinephile/screen/search/view/search.dart';
import 'package:cinephile/screen/splash/view/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'widget/cardView/home_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homecontrol = Get.put(HomeControll());
    homecontrol.getMovieList();
    return GetBuilder<HomeControll>(builder: (controller) {
      return homecontrol.isLoding == true
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
                backgroundColor: Colors.cyan,
              ),
            )
          : Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text('Cinephile'),
                actions: [
                  IconButton(
                      onPressed: () {
                        Get.to(const SearchPage());
                      },
                      icon: const Icon(Icons.search))
                ],
                backgroundColor: const Color.fromARGB(255, 25, 81, 105),
              ),
              body: SafeArea(
                  child: Column(
                children: [
                  Expanded(
                      child: GridView.builder(
                    itemCount: homecontrol.movieList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 1 / 1.5),
                    itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          // final model=SingleMovieDetails(cast: homecontrol.movieList[index].genreIds, title: homecontrol.movieList[index].title, description: homecontrol.movieList[index].overview, genre: homecontrol.movieList[index]., release_date: homecontrol.movieList[index].releaseDate, img: homecontrol.movieList[index].backdropPath);
                          final movieDetailsC =
                              Get.put(MovieDetailsController());
                          movieDetailsC.getMovieDetails(
                              homecontrol.movieList[index].id.toString());
                          Get.to(MovieDetails(
                            id: homecontrol.movieList[index].id.toString(),
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left:2.0,top: 1),
                          child: HomeCard(
                              imag: homecontrol.movieList[index].posterPath,
                              text: homecontrol.movieList[index].title),
                        )),
                  ))
                ],
              )),
              
              drawer: Drawer(
                child: ListView(
                  padding: const EdgeInsets.all(0),
                  children: [
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 32, 103, 133),
                      ), //BoxDecoration
                      child: UserAccountsDrawerHeader(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 32, 103, 133),
                        ),
                        accountName: Text(
                          "Akhil Babu",
                          style: TextStyle(fontSize: 18),
                        ),
                        accountEmail: Text("akhilbabu@gmail.com"),
                        currentAccountPictureSize: Size.square(50),
                        currentAccountPicture: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 32, 103, 133),
                          child: Text(
                            "A",
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.blue),
                          ), //Text
                        ), //circleAvatar
                      ), //UserAccountDrawerHeader
                    ), //DrawerHeader
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text(' My Profile '),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),

                    ListTile(
                      leading: const Icon(Icons.workspace_premium),
                      title: const Text(' Go Premium '),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.video_label),
                      title: const Text(' Saved Movies '),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.edit),
                      title: const Text(' Edit Profile '),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.logout),
                      title: const Text('LogOut'),
                      onTap: () {
                        Get.defaultDialog(title: 'LogOut',
                          middleText: 'are you sure???',textConfirm: 'yes',textCancel: 'no',
                          onConfirm: () {
                            FirebaseAuth.instance.signOut();
                            Get.to(const MySplash());
                          } ,
                          );
                        
                       
                      },
                    ),
                  ],
                ),
              ), //,
            );
    });
  }
}
