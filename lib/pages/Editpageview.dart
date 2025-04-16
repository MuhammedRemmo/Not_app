import 'package:flutter/material.dart';
import 'package:not_app/model/not_model.dart';
import 'package:not_app/pages/widgets/EditViewBody.dart';

class Editpageview extends StatefulWidget {
  const Editpageview({super.key, required this.notModel});

  final NotModel notModel;

  @override
  State<Editpageview> createState() => _EditpageviewState();
}

class _EditpageviewState extends State<Editpageview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      body: EditViewBody(
        notModel: widget.notModel,
      ),
    );
  }
}
