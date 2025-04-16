import 'package:flutter/material.dart';
import 'package:not_app/pages/widgets/SearchBotton.dart';

class Costumappbar extends StatelessWidget {
  const Costumappbar({
    super.key,
    required this.text,
    this.icone = Icons.search,
    this.onTap,
  });

  final void Function()? onTap ; 
  final String text;
  final IconData icone;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 30),
          ),
          Searchbotton(
            icon: icone,
         onTap: onTap,
          )
          ,
        ],
      ),
    );
  }
}
