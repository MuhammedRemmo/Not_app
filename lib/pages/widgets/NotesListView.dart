import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_app/cubits/cubit/lits_notes_cubit.dart';
import 'package:not_app/model/not_model.dart';
import 'package:not_app/pages/widgets/Not_Item.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LitsNotesCubit, LitsNotesState>(
        builder: (context, state) {
      List<NotModel> notes = BlocProvider.of<LitsNotesCubit>(context).notes!;
      return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            return NoteItem(
              notModel: notes[index],
            );
          });
    });
  }
}
