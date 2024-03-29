// ignore_for_file: must_be_immutable, file_names, non_constant_identifier_names

import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:we_movies/layout/home_layout.dart';
import 'package:we_movies/modules/bloc/cubit.dart';
import 'package:we_movies/modules/bloc/states.dart';
import 'package:we_movies/shared/components/component.dart';
import 'package:we_movies/shared/styles/colors.dart';

class ProfileData extends StatelessWidget {
  ProfileData({super.key});
  final TextEditingController Namecontroller = TextEditingController();
  final TextEditingController Phonecontroller = TextEditingController();
  final TextEditingController Datecontroller = TextEditingController();
  final TextEditingController Countrycontroller = TextEditingController();
  final GlobalKey<FormState> Formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> Scaffoldkey = GlobalKey<ScaffoldState>();
  String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(listener: (context, state) {
      if (state is MovieAddUserSuccesState) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);
      }
    }, builder: (context, state) {
      var cubit = MovieCubit.get(context);
      return Scaffold(
        key: Scaffoldkey,
        backgroundColor: defaultcolor2,
        body: Form(
          key: Formkey,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
              height: 1000,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                          height: 50,
                          child: Image.asset(
                            "assets/app logo.png",
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Cine World",
                        style: TextStyle(
                            fontFamily: AutofillHints.streetAddressLevel3,
                            color: defaultcolor,
                            fontSize: 32.0),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        "Personal Informations",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () async {
                      ImagePicker imagePicker = ImagePicker();
                      XFile? file = await imagePicker.pickImage(
                          source: ImageSource.gallery);
                      if (file == null) return;
                      //Import dart:core
                      String uniqueFileName =
                          DateTime.now().millisecondsSinceEpoch.toString();

                      /*Step 2: Upload to Firebase storage*/
                      //Install firebase_storage
                      //Import the library

                      //Get a reference to storage root
                      Reference referenceRoot = FirebaseStorage.instance.ref();
                      Reference referenceDirImages =
                          referenceRoot.child('images');

                      //Create a reference for the image to be stored
                      Reference referenceImageToUpload =
                          referenceDirImages.child(uniqueFileName);

                      //Handle errors/success
                      try {
                        //Store the file
                        await referenceImageToUpload.putFile(File(file.path));
                        //Success: get the download URL
                        imageUrl =
                            await referenceImageToUpload.getDownloadURL();
                      } catch (error) {
                        //Some error occurred
                      }
                    },
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 10.0),
                          height: 73.0,
                          width: 74.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: const Color(0xff2E3350),
                          ),
                          child: const Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                            size: 38,
                          ),
                        ),
                        const SizedBox(
                          width: 10.0,
                        ),
                        const Text(
                          "Upload your Profile Picture",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              fontStyle: FontStyle.italic),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: dfaultFormField(
                      controller: Namecontroller,
                      type: TextInputType.name,
                      label: "Name",
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Name must not be empty';
                        }
                        return null;
                      },
                      prefix: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: const Color(0xff2E3350),
                            ),
                            child: const Icon(
                              Icons.person_2_outlined,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                            child: VerticalDivider(
                              width: 30.0,
                              thickness: 1.0,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: dfaultFormField(
                      controller: Phonecontroller,
                      type: TextInputType.phone,
                      label: "Phone Number",
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Phone Numper must not be empty';
                        }
                        return null;
                      },
                      prefix: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: const Color(0xff2E3350),
                            ),
                            child: const Icon(
                              Icons.phone_outlined,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                            child: VerticalDivider(
                              width: 30.0,
                              thickness: 1.0,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: dfaultFormField(
                      controller: Datecontroller,
                      type: TextInputType.datetime,
                      label: "Date Of Birth ",
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Date must not be empty';
                        }
                        return null;
                      },
                      ontap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2024-05-30'))
                            .then((value) {
                          if (value != null) {
                            Datecontroller.text =
                                DateFormat.yMMMd().format(value);
                          }
                        });
                      },
                      prefix: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: const Color(0xff2E3350),
                            ),
                            child: const Icon(
                              Icons.date_range,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                            child: VerticalDivider(
                              width: 30.0,
                              thickness: 1.0,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: dfaultFormField(
                      controller: Countrycontroller,
                      type: TextInputType.text,
                      label: "Country ",
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return 'Country must not be empty';
                        }
                        return null;
                      },
                      prefix: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: const Color(0xff2E3350),
                            ),
                            child: const Icon(
                              Icons.flag_outlined,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                            child: VerticalDivider(
                              width: 30.0,
                              thickness: 1.0,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ConditionalBuilder(
                    condition: state is! MovieAddUserLoadingState,
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    builder: (context) => defaultButton(
                        function: () {
                          if (Formkey.currentState!.validate()) {
                            String? name = Namecontroller.text;
                            String? phone = Phonecontroller.text;
                            String? date = Datecontroller.text;
                            String? country = Countrycontroller.text;

                            cubit
                                .addUser(
                                    name: name,
                                    phoneNumber: phone,
                                    dateOfBirth: date,
                                    country: country,
                                    imageUrl: imageUrl)
                                .then((value) {});
                          }
                        },
                        text: "Save & Next     >>",
                        isUpperCase: true,
                        background: Colors.blue,
                        radius: 30.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
