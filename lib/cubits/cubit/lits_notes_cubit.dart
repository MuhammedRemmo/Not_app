import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:not_app/contsvariable.dart';
import 'package:not_app/model/not_model.dart';
import 'package:hive_flutter/adapters.dart';
part 'lits_notes_state.dart';

class LitsNotesCubit extends Cubit<LitsNotesState> {
  LitsNotesCubit() : super(LitsNotesInitial());

  List<NotModel>? notes;
  
  fatchAllNotes() {
    var notesBox = Hive.box<NotModel>(kNotesBox);

    notes = notesBox.values.toList();
    
    emit(SuccessListNotes());
  }
}
