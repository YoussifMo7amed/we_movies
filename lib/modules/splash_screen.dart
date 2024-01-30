// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:we_movies/shared/components/component.dart';
import 'package:we_movies/shared/styles/colors.dart';

class BoardingModel {
  String? image;
  String? Title;
  String? Body;
  BoardingModel({required this.image, required this.Title, required this.Body});
}

List<BoardingModel> boarding = [
  BoardingModel(
      image: 'assets/illustration.png',
      Title: 'Dive into Cinematic Bliss',
      Body:
          'Immerse yourself in the world of movies with our curated collection. From classics to the latest releases, experience entertainment like never before.'),
  BoardingModel(
      image: 'assets/illustration.png',
      Title: 'Elevate Your Movie Experience',
      Body:
          'Discover a universe of storytelling. Enjoy stunning visuals and captivating narratives, all in the palm of your hand. Your journey to cinematic excellence starts here.'),
];

class onBoardingSCreen extends StatefulWidget {
  const onBoardingSCreen({super.key});

  @override
  State<onBoardingSCreen> createState() => _onBoardingSCreenState();
}

class _onBoardingSCreenState extends State<onBoardingSCreen> {
  @override
  Widget build(BuildContext context) {
    var controler = PageController();
    bool isLast = false;

    return Scaffold(
        body: Container(
      color: defaultcolor2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                  height: 50,
                  child: Image.asset(
                    "assets/app logo.png",
                  )),
              SizedBox(
                width: 20,
              ),
              Text(
                "Cine World",
                style: TextStyle(
                    fontFamily: AutofillHints.streetAddressLevel3,
                    color: defaultcolor,
                    fontStyle: FontStyle.italic,
                    fontSize: 32.0),
              )
            ],
          ),
          Container(
            height: 500,
            width: 600,
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (int value) {
                if (value == boarding.length - 1) {
                  isLast = true;
                } else {
                  isLast = false;
                }
              },
              controller: controler,
              itemBuilder: (context, index) =>
                  OnBoardingSCreens(boarding[index]),
              itemCount: boarding.length,
            ),
          ),
          const SizedBox(
            height: 40.0,
          ),
          SmoothPageIndicator(
            controller: controler,
            count: boarding.length,
            effect: const ExpandingDotsEffect(
                expansionFactor: 3.0,
                spacing: 5.0,
                offset: 15,
                dotWidth: 10.0,
                dotHeight: 10.0,
                strokeWidth: 1.5,
                dotColor: Colors.grey,
                activeDotColor: Colors.grey),
          ),
          SizedBox(
            height: 30.0,
          ),
          defaultButton(
              function: () {
                if (isLast) {
                  Navigator.pushNamedAndRemoveUntil(context, "LoginPage", (route) => false);
                } else {
                  controler.nextPage(
                      duration: const Duration(milliseconds: 750),
                      curve: Curves.fastLinearToSlowEaseIn);
                }
              },
              text: "Next",
              isUpperCase: true,
              background:Colors.blue,
              radius: 30.0),
        ],
      ),
    ));
  }
}

Widget OnBoardingSCreens(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 327,
            child: Image.asset(
              '${model.image}',
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Text(
            '${model.Title}',
            style: const TextStyle(
                fontSize: 35, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 15.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
              '${model.Body}',
              style: const TextStyle(fontSize: 15, color: Colors.grey),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ]);
