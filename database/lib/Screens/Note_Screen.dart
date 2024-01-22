import 'package:flutter/material.dart';
import 'package:mydatabase/Model/Note_Model.dart';
import 'package:mydatabase/Services/Database_Helper.dart';

class NoteScreen extends StatelessWidget {
  final Note? note;
   NoteScreen({super.key,this.note});
  
  // ignore: override_on_non_overriding_member
 
     TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    if(note != null){
      titlecontroller.text = note!.title;
      descriptioncontroller.text = note!.description;
    }
    return  Scaffold(
      appBar: AppBar(
        title: Text(note == null ? "Add Note" : "Save Note"),
      ),
      body:Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8),
              child: Text("What you are thinking about ?",style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.bold
              ),),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  controller:  titlecontroller,
                  maxLines: 1,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 0.85
                      ),
                    )
                  ),
                ),
                ),
              Padding(
                padding: EdgeInsets.all(8),
                child: TextFormField(
                  controller:  descriptioncontroller,
                  maxLines: 10,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 0.85
                      ),
                    )
                  ),
                ),
                ),
                // Spacer(),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    
                    child: ElevatedButton(onPressed: ()  async {
                      final title = titlecontroller.value.text;
                      final description = descriptioncontroller.value.text;
                      if (title.isEmpty || description.isEmpty) {
                          return;                        
                      } 
                      final Note Model = Note(title: title, description: description);
                      if (note == null) {
                          await DatabaseHelper.addNote(Model);
                      }else{
                        await DatabaseHelper.updateNote(Model);
                      }
                      Navigator.pop(context);
                    },
                    
                    style: ButtonStyle(
                      alignment: Alignment.center,
                      backgroundColor: MaterialStateProperty.all(Colors.blue)
                    ) ,child: Text(note != null ? 'save' : 'edit')),
                     )
          ],
        ),
        ),
    );
  }
}