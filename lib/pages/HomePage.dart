import 'package:flutter/material.dart';
import 'package:not_app/pages/widgets/AddBottomSheet.dart';
import 'package:not_app/pages/widgets/HomePageBody.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
        resizeToAvoidBottomInset: false,  
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 150, 165, 161),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) => AddNoteBottomSheet(),
            );
          },
          child: Icon(Icons.add),
        ),
        body: NotesHomeBody(),
      
    );
  }
}
