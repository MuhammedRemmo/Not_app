import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:not_app/cubits/cubit/lits_notes_cubit.dart';
import 'package:not_app/model/not_model.dart';
import 'package:not_app/pages/Editpageview.dart';

class NoteItem extends StatefulWidget {
  const NoteItem({super.key, required this.notModel});

  @override
  State<NoteItem> createState() => _NotItemState();

  final NotModel notModel;
}

class _NotItemState extends State<NoteItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Editpageview(
              notModel: widget.notModel,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 10, right: 5, left: 5),
        height: 200,
        decoration: BoxDecoration(
          color: Color(widget.notModel.color),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                "${widget.notModel.title}",
                style: const TextStyle(color: Colors.black, fontSize: 40),
              ),
              subtitle: Text(
                "${widget.notModel.supTitle}",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.black26, fontSize: 20),
              ),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Delete Note'),
                        content:
                            Text('Are you sure you want to delete this note?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              setState(() {
                                widget.notModel.delete();
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Note deleted'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                              BlocProvider.of<LitsNotesCubit>(context)
                                  .fatchAllNotes();
                            },
                            child: Text('Delete'),
                          ),
                        ],
                      );
                    },
                  );
                  BlocProvider.of<LitsNotesCubit>(context).fatchAllNotes();
                },
                icon: Icon(Icons.delete),
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "${widget.notModel.date}",
                style: const TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
