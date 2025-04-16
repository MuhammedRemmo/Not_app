import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_app/cubits/cubit/notecubit_cubit.dart';
import 'package:not_app/model/not_model.dart';
import 'package:not_app/pages/widgets/CustomAddButton.dart';
import 'package:not_app/pages/widgets/CustomTextField.dart';
import 'package:not_app/pages/widgets/Listviewcolors.dart';

class FormNoteaddState extends StatefulWidget {
  const FormNoteaddState({super.key});

  @override
  State<FormNoteaddState> createState() => FormNoteaddStateState();
}

class FormNoteaddStateState extends State<FormNoteaddState> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subsTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            hint: "title",
            onSaved: (value){
              title = value;
              return null;
            },
          ),
          SizedBox(height: 10),
          CustomTextField(
            hint: "Content",
            onSaved: (value){
              subsTitle = value;
              return null;
            },
            maxlins: 5,
          ),
          SizedBox(
            height: 60,
          ),
          Container(
            height: 60,
            child: Listviewcolors(),
          ),
          BlocBuilder<NotecubitCubit, NotecubitState>(
            builder: (context, state) => CustomButtonAdd(
              isLoadng: state is AddNoteLoading ? false : true,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  var notmodel = NotModel(
                    title: title!,
                    supTitle: subsTitle!,
                    date: DateTime.now().toString(),
                    color: 0,
                  );
                  BlocProvider.of<NotecubitCubit>(context).addNote(notmodel);

                  print("==================$title==========================");
                  print("==================$subsTitle======================");
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

