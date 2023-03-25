import 'package:cinephile/screen/home/controller/home_controller.dart';
import 'package:cinephile/screen/movie_details/model/movie_details_model.dart';
import 'package:cinephile/screen/movie_details/view/movie_details.dart';
import 'package:cinephile/screen/search/view/search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'widget/cardView/home_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homecontrol=Get.put(HomeControll());
    homecontrol.getMovieList();
    return GetBuilder<HomeControll>(
      builder: (controller) {
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
      body:SafeArea(child:Column(
        children: [ Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          decoration:  BoxDecoration(
                              color: Colors.white,
                              backgroundBlendMode: BlendMode.hardLight,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20))),
                          height: Get.height * 0.13,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            // child:
                            ))),
                    Expanded(child: GridView.builder(itemCount: homecontrol.movieList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1 / 1.5), itemBuilder:(context, index) => GestureDetector(onTap: () {
                    // final model=SingleMovieDetails(cast: homecontrol.movieList[index].genreIds, title: homecontrol.movieList[index].title, description: homecontrol.movieList[index].overview, genre: homecontrol.movieList[index]., release_date: homecontrol.movieList[index].releaseDate, img: homecontrol.movieList[index].backdropPath);
                    Get.to(MovieDetails(id: homecontrol.movieList[index].id.toString(),));
                  },
                    child: HomeCard(imag:homecontrol.movieList[index].posterPath ,text: homecontrol.movieList[index].title)), ))        

        ],
      ) ),
      //  Container(
      //   height: double.infinity,
      //   width: double.infinity,
      //   decoration: const BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.topRight,
      //       end: Alignment.bottomLeft,
      //       colors: [
      //         Color.fromARGB(255, 21, 21, 27),
      //         Color.fromARGB(255, 32, 103, 133),
      //       ],
      //     ),
      //   ),child: ,
      // ),
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
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
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
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ), //,
    );
  });
}
}