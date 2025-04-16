import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_app/cubits/cubit/lits_notes_cubit.dart';
import 'package:not_app/pages/widgets/CostumAppBar.dart';
import 'package:not_app/pages/widgets/NotesListView.dart';

class NotesHomeBody extends StatefulWidget {
  const NotesHomeBody({super.key});

  @override
  State<NotesHomeBody> createState() => _NotesHomeBodyState();
}

class _NotesHomeBodyState extends State<NotesHomeBody> {
  @override
  void initState() {
    BlocProvider.of<LitsNotesCubit>(context).fatchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Costumappbar(
            text: "Notes",
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: const NoteListView(),
          ),
        ],
      ),
    );
  }
}
