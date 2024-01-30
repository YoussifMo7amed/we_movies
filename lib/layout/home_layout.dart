import 'package:flutter/material.dart';
import 'package:we_movies/shared/styles/colors.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultcolor2,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Expanded(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: SizedBox(
               height:  800,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Top Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hello,",
                              style: TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Youssef Mohammed",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            ),
                          ],
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/shape.png"), // Placeholder image
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                      "Best Upcoming Movies",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      height: 345,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5, // Placeholder for the number of movies
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(right: 26),
                            width: 250,
                            height: 400,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/movie 1.png"), // Placeholder image
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Trending Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                      ],
                    ),
                
                    SizedBox(height: 10),
                    Container(
                      height: 250,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5, // Placeholder for the number of trending movies
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Card(
                              elevation: 0,
                              color: defaultcolor2,
                              child: Column(
                                children: [
                                  Image.asset(
                                    "assets/base.png", // Placeholder image
                                    width: 125,
                                    height: 172,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    "Movie Name",
                                    maxLines: 1,
                                    style:
                                        TextStyle(color: Colors.white, fontSize: 20.0,overflow: TextOverflow.ellipsis),
                                  ),
                                  Text(
                                    "Horror",
                                    maxLines: 1,
                                    style:
                                        TextStyle(color: Colors.grey, fontSize: 16.0,overflow: TextOverflow.ellipsis,),
                                  ),  // Placeholder for movie name
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius:
            BorderRadiusDirectional.vertical(top: Radius.circular(20.0)),
        child: BottomNavigationBar(
          backgroundColor: Color(0xff2E3350),
          elevation: 1.0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
