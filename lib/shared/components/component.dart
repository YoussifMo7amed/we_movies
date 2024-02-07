// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        width: width,
        height: 50.0,
        decoration: BoxDecoration(
            color: background, borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            if (is_image)
              Image.asset(
                Image1,
                alignment: AlignmentDirectional.centerStart,
              ),
            Padding(
              padding: is_image
                  ? const EdgeInsets.only(left: 30.0, right: 50)
                  : const EdgeInsets.all(0),
              child: MaterialButton(
                height: 50.0,
                minWidth: 40,
                onPressed: function,
                child: SizedBox(
                  width: !is_image?320:null,

                  child: Text(
                    textAlign: TextAlign.center,
                    isUpperCase ? text.toUpperCase() : text,
                    style:
                        TextStyle(color: TextColor, fontWeight: FontWeight.bold),
                  ),
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
        TextStyle? textStyle,
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
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          labelText: label,
          labelStyle: textStyle,
          prefixIcon: prefix,
          suffixIcon: sufix != null
              ? IconButton(
                  onPressed: sufixFunction,
                  icon: Icon(
                    sufix,
                    color: Colors.white,
                  ))
              : null,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))
          )),
    );

Future<bool?> showToast({String? msg, ToastState? state}) =>
    Fluttertoast.showToast(
        msg: msg!,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: changeColor(state!),
        textColor: Colors.white,
        fontSize: 16.0);

enum ToastState { Success, Error, Warning }

Color? changeColor(ToastState state) {
  Color color;
  switch (state) {
    case ToastState.Success:
      color = Colors.green;
      break;
    case ToastState.Error:
      color = Colors.red;
      break;
      case ToastState.Warning:
      color =Colors.amber;
      break;
      }
      return color;
}
