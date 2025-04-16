import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_app/cubits/cubit/lits_notes_cubit.dart';
import 'package:not_app/cubits/cubit/notecubit_cubit.dart';
import 'package:not_app/pages/widgets/flromnoteadd.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotecubitCubit(),
      child: BlocConsumer<NotecubitCubit, NotecubitState>( 
        listener: (context, state) {
          if (state is AddNoteSuccess) {
               BlocProvider.of<LitsNotesCubit>(context).fatchAllNotes();
            Navigator.pop(context);
          } else if (state is AddNoteFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.eerMassage),
              ),
            );
          }
        },
        builder: (context, state) => AbsorbPointer(
          absorbing: state is AddNoteLoading ? true : false,
          child: Padding(
            padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                top: 16),
            child: const SingleChildScrollView(
              child: FormNoteaddState(),
            ),
          ),
        ),
      ),
    );
  }
}
