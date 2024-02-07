// ignore_for_file: must_be_immutable, file_names, non_constant_identifier_names

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:we_movies/modules/bloc/cubit.dart';
import 'package:we_movies/modules/bloc/states.dart';
import 'package:we_movies/shared/components/component.dart';
import 'package:we_movies/shared/network/local/cache.dart';
import 'package:we_movies/shared/styles/colors.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController re_passwordcontroller = TextEditingController();
  final GlobalKey<ScaffoldState> Scaffoldkey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> Formkey = GlobalKey<FormState>();
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieCubit, MovieStates>(
      listener: (context, state) {
        if(state is MovieRegisterSuccesState){

          casheHealper.saveData(key: "email", value: email);
        }
      },
      builder: (context, state) {
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
                          "Create My Account",
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: dfaultFormField(
                          controller: emailcontroller,
                          type: TextInputType.emailAddress,
                          label: "E-mail",
                          onChange: (data) {
                            email = data;
                          },
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Email must not be empty';
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
                                  Icons.email_outlined,
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
                          sufix: Icons.check),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: dfaultFormField(
                        controller: passwordcontroller,
                        type: TextInputType.visiblePassword,
                        label: "Password",
                        onChange: (data) {
                          password = data;
                        },
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Password is too short';
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
                                Icons.lock_outline_rounded,
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
                        ispassword: cubit.ispassword2,
                        sufix: cubit.suffix,
                        sufixFunction: () {
                          cubit.changepassword1();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: dfaultFormField(
                        controller: re_passwordcontroller,
                        type: TextInputType.visiblePassword,
                        label: "Re-Password",
                        validator: (String? value) {
                          if (value != passwordcontroller.text) {
                            return 'Password is Wrong';
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
                                Icons.lock_outline_rounded,
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
                        ispassword: cubit.ispassword1,
                        sufix: cubit.suffix1,
                        sufixFunction: () {
                          cubit.changepassword();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    ConditionalBuilder(
                      condition: state is! MovieRegisterLoadingState,
                      fallback: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      builder: (context) => defaultButton(
                          function: () {
                            if (Formkey.currentState!.validate()) {
                              if (passwordcontroller.text ==
                                  re_passwordcontroller.text) {
                                cubit
                                    .createUserWithEmailAndPassword(
                                        emailAddress: email!,
                                        password: password!)
                                    .then((value) => {
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              "ProfileData",
                                              (route) => false)
                                        });
                              }
                            }
                          },
                          text: "Create My Account",
                          isUpperCase: true,
                          background: Colors.blue,
                          radius: 30.0),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      "-Or you can also-",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    defaultButton(
                        function: () {
                          cubit.signInWithGoogle();
                        },
                        is_image: true,
                        Image1: "assets/Google.png",
                        text: "Create with Google",
                        isUpperCase: true,
                        background: Colors.white,
                        TextColor: Colors.blue,
                        radius: 30.0),
                    const SizedBox(
                      height: 30.0,
                    ),
                    defaultButton(
                        function: () {
                          cubit.signInWithFacebook();
                        },
                        text: "Create with Facebook",
                        is_image: true,
                        Image1: "assets/Facebook.png",
                        isUpperCase: true,
                        background: Colors.white,
                        TextColor: Colors.blue,
                        radius: 30.0),
                    const SizedBox(
                      height: 30.0,
                    ),
                    const Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Log In your Account",
                        style: TextStyle(color: Colors.blue),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
