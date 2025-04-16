import 'package:flutter/material.dart';

class Searchbotton extends StatefulWidget {
  const Searchbotton({
    super.key,
    required this.icon,
     this.onTap,
  });

  final void Function()? onTap;
  final IconData icon;
  @override
  State<Searchbotton> createState() => _SearchbottonState();
}

class _SearchbottonState extends State<Searchbotton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 50,
        width: 50,
        child: Icon(
          widget.icon,
          color: Colors.white,
        ),
        decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
