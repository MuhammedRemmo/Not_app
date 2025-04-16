import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_app/contsvariable.dart';
import 'package:not_app/cubits/cubit/notecubit_cubit.dart';
import 'package:not_app/pages/widgets/colorsItem.dart';

class Listviewcolors extends StatefulWidget {
  const Listviewcolors({super.key});

  @override
  State<Listviewcolors> createState() => _ListviewcolorsState();
}

class _ListviewcolorsState extends State<Listviewcolors> {
  int currentindex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
      
              currentindex = index;
              BlocProvider.of<NotecubitCubit>(context).color = colors[index];
              setState(() {});
            },
            child: ColorsItem(
              isActiv: currentindex == index ? true : false,
              index: index,
            ),
          );
        },
      ),
    );
  }
}
