import 'package:flutter/material.dart';
import 'package:not_app/contsvariable.dart';

class CustomButtonAdd extends StatelessWidget {
  const CustomButtonAdd({
    super.key,
    this.onTap,
    this.isLoadng = true,
  });

  final bool isLoadng;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(3),
        ),
        height: 50,
        width: double.infinity,
        child: Center(
          child: isLoadng
              ? Text(
                  "Add Note",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        ),
      ),
    );
  }
}
