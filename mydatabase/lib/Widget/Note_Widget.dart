import 'package:flutter/material.dart';
import 'package:mydatabase/Model/Note_Model.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  const NoteWidget({super.key,required this.note,required this.onTap,required this.onLongPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: onLongPress,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.redAccent,
            borderRadius: BorderRadius.circular(12)
          ),
          
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(note.title,style: TextStyle(
                    fontSize: 32,fontWeight: FontWeight.bold
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Divider(
                    thickness: 5,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12),
                    child: Text(note.description,style: TextStyle(
                      fontSize: 24,fontWeight: FontWeight.w400
                    ),),
                  )
              ],
            ),
            ),
        ),
      ),
    );
  }
}