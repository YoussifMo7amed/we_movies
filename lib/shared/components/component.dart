import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  Color TextColor = Colors.white,
  bool isUpperCase = true,
  double radius = 3.0,
  bool is_image = false,
  String Image1 = "",
  required void Function() function,
  required String text,
}) =>
    Container(
        margin: EdgeInsets.symmetric(horizontal: 20.0),
        width: width,
        height: 50.0,
        decoration: BoxDecoration(
            color: background, borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (is_image)
              Image.asset(
                Image1,
                alignment: AlignmentDirectional.centerStart,
              ),
            Padding(
              padding: is_image
                  ? EdgeInsets.only(left: 30.0, right: 50)
                  : EdgeInsets.all(0),
              child: MaterialButton(
                onPressed: function,
                child: Text(
                  isUpperCase ? text.toUpperCase() : text,
                  style:
                      TextStyle(color: TextColor, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ));
Widget dfaultFormField(
        {required TextEditingController controller,
        required TextInputType type,
        void Function(String)? onChange,
        void Function(String)? onsubmit,
        String? Function(String?)? validator,
        required String label,
        required Widget? prefix,
        bool ispassword = false,
        IconData? sufix,
        void Function()? ontap,
        void Function()? sufixFunction}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: ispassword,
      onChanged: onChange,
      onFieldSubmitted: onsubmit,
      validator: validator,
      onTap: ontap,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: prefix,
          suffixIcon: sufix != null
              ? IconButton(
                  onPressed: sufixFunction,
                  icon: Icon(
                    sufix,
                    color: Colors.white,
                  ))
              : null,
          border: const OutlineInputBorder()),
    );
