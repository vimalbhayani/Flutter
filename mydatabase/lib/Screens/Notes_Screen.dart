import 'package:flutter/material.dart';
import 'package:mydatabase/Model/Note_Model.dart';
import 'package:mydatabase/Screens/Note_Screen.dart';
import 'package:mydatabase/Services/Database_Helper.dart';
import 'package:mydatabase/Widget/Note_Widget.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Hello There"),
        centerTitle: true,
        elevation: 10,
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> NoteScreen()));
      },child: Icon(Icons.add),),
      body: FutureBuilder<List<Note>?>(
        future: DatabaseHelper.getAllNotes(),
        builder: (context ,AsyncSnapshot <List<Note>?> snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return CircularProgressIndicator();
          }else if(snapshot.hasError){
            return Center(child: Text(snapshot.error.toString()),);
          }else if(snapshot.hasData){
            if (snapshot.data != null) {
              return ListView.builder(itemBuilder: (context,index)=> NoteWidget(note: snapshot.data![index], onTap: () async {
                await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>NoteScreen(note: snapshot.data![index],) ));

              }, onLongPress: () async  {
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text("Are you Sure ? "),
                    actions: [
                      ElevatedButton(onPressed: () async {
                        await DatabaseHelper.deleteNote(snapshot.data![index]);
                        Navigator.pop(context);
                        setState(() {
                          
                        });
                      }, child: Text("Yes")),
                      ElevatedButton(onPressed: (){}, child: Text("No")),
                    ],
                  );
                });
              }),
              itemCount: snapshot.data!.length,
              );
            }
            return const Center(
              child: Text("There Is Not task yet"),
            );
          }
          return const SizedBox.shrink();
        }),
    );
  }
}