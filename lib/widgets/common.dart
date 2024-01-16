import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSizeWidget commonAppBar({required String title}) {
  return AppBar(
    title: Center(
      child: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
    ),
    backgroundColor: Colors.black,
  );
}

class BlackOutLineButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const BlackOutLineButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(color: Colors.black, width: 2.0),
        ),
        minimumSize: Size(Get.width - 180, 40),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: Get.width - (Get.width - 15),
        ),
      ),
    );
  }
}
