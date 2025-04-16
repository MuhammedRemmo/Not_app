import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_app/cubits/cubit/lits_notes_cubit.dart';
import 'package:not_app/model/not_model.dart';
import 'package:not_app/pages/widgets/CostumAppBar.dart';
import 'package:not_app/pages/widgets/CustomTextField.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({
    super.key,
    required this.notModel,
  });

  final NotModel notModel;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Costumappbar(
          onTap: () {
            widget.notModel.title = title ?? widget.notModel.title;
            widget.notModel.supTitle = subtitle ?? widget.notModel.supTitle;
            widget.notModel.save();
            BlocProvider.of<LitsNotesCubit>(context).fatchAllNotes();
            Navigator.pop(context);
          },
          text: "Edit Note",
          icone: Icons.check,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextField(
          hint: widget.notModel.title,
          onChanged: (value) {
            title = value;
          },
        ),
        SizedBox(
          height: 10,
        ),
        CustomTextField(
          onChanged: (value) {
            subtitle = value;
          },
          hint: widget.notModel.supTitle,
          maxlins: 5,
        ),
      ],
    );
  }
}
