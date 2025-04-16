import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:not_app/contsvariable.dart';
import 'package:not_app/model/not_model.dart';

part 'notecubit_state.dart';

class NotecubitCubit extends Cubit<NotecubitState> {
  NotecubitCubit() : super(NotecubitInitial());
 

 Color  color = const Color(0xffA3A3A3);  
  addNote(NotModel note) async {
  
  note.color = color.value ;   

      emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NotModel>(kNotesBox);
      await notesBox.add(note);       
      emit(AddNoteSuccess());
    } catch (e) { 
      emit(AddNoteFailure(e.toString()));
    }
  }
}     
