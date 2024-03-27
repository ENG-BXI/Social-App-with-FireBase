import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social_app/cubit/social_app_cubit.dart';

Widget defulttextFormField(
        {required FormFieldValidator validator,
        required TextInputType textInputType,
        bool ispassowrd = false,
        required IconData prefixIcon,
        required String label,
        required TextEditingController Controller,
        ValueChanged<String>? onSubmitted,
        required BuildContext context,
        bool isDownloadState = false}) =>
    TextFormField(
      onFieldSubmitted: onSubmitted,
      controller: Controller,
      validator: validator,
      obscureText: ispassowrd ? SocialAppCubit.get(context).isVisable : false,
      decoration: InputDecoration(
        floatingLabelStyle: TextStyle(color: Colors.deepOrange),
        suffixIcon: ispassowrd
            ? IconButton(
                onPressed: () {
                  if (!isDownloadState) {
                    SocialAppCubit.get(context).changeIspassword(
                      SocialAppCubit.get(context).isVisable,
                    );
                  }
                },
                icon: Icon(SocialAppCubit.get(context).isVisable
                    ? Icons.visibility
                    : Icons.visibility_off))
            : null,
        prefixIcon: Icon(
          prefixIcon,
        ),
        label: Text(label),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange),
        ),
      ),
    );

Widget defultBurrom(
        {double width = double.infinity,
        Color background = Colors.blue,
        double borderRadius = 5,
        required String text,
        bool isUpperCase = false,
        required GestureTapCallback function}) =>
    GestureDetector(
      onTap: function,
      child: Container(
        height: 50,
        width: width,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
            child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    );
    Widget defualtTextBottum(
        {required String text,
        required VoidCallback function,
        bool isUpperCase = false,
        Color color = defualtColor}) =>
    TextButton(
      onPressed: function,
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: TextStyle(color: color),
      ),
    );

const defualtColor = Colors.deepOrange ; 
String? uId  = '';
String? ProfileImageUrl;
String? CoverImageUrl;
toastMessage({
  required String message,
  required Color color,
}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}