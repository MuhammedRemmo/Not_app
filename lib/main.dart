import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:not_app/bloc_observer.dart';
import 'package:not_app/contsvariable.dart';
import 'package:not_app/cubits/cubit/lits_notes_cubit.dart';
import 'package:not_app/model/not_model.dart';
import 'package:not_app/pages/HomePage.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBloc();
  Hive.registerAdapter(NotModelAdapter());
  await Hive.openBox<NotModel>(kNotesBox);
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget { 
  const MyApp({super.key});

  // This widget is the root of your application. 
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LitsNotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.dark(),
        home: HomePage(),
      ),
    );
  }
}
      