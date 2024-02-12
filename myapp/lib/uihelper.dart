import 'package:flutter/material.dart';

class UiHelper {
  // ignore: non_constant_identifier_names
  static CustomTextField(TextEditingController controller, String text,
      IconData iconData, bool toHide) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: TextField(
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
            hintText: text,
            suffixIcon: Icon(iconData),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(25))),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  static CustomButton(VoidCallback voidCallback, String text) {
    return SizedBox(
      height: 50.0,
      width: 300.0,
      child: ElevatedButton(
          onPressed: () {
            voidCallback();
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.deepPurple),
          ),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 20.0),
          )),
    );
  }

  // ignore: non_constant_identifier_names
  static CustomAlertBox(BuildContext context, String text) {
    // ignore: non_constant_identifier_names
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(text),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("ok"))
            ],
          );
        });
  }
}
