import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  @override
  Widget build(BuildContext context) {
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
                Row(
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
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "Upload your Profile Picture",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic),
                    )
                  ],
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
                defaultButton(
                    function: () {
                      if (Formkey.currentState!.validate()) {}
                    },
                    text: "Save & Next     >>",
                    isUpperCase: true,
                    background: Colors.blue,
                    radius: 30.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
