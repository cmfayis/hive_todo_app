import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_student_app/controller/controller.dart';
import 'package:hive_student_app/model/Model.dart';

import 'package:hive_student_app/view/Add_user/Add_user.dart';
import 'package:hive_student_app/view/Add_user/Update/update.dart';

class listpage extends StatefulWidget {
  listpage({Key? key}) : super(key: key);

  @override
  State<listpage> createState() => _listpageState();
}

class _listpageState extends State<listpage> {
  final controller = Get.put(StudentModelController());
  Box<StudetModel> model = Hive.box<StudetModel>("todomodel");
  final updatetitle = TextEditingController();
  final updateDescription = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        centerTitle: true,
        title: Text("TODO APP"),
        backgroundColor: Color.fromARGB(255, 20, 14, 38),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 20, 14, 38),
        onPressed: () {
          Get.to(AddUser());
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ValueListenableBuilder(
            valueListenable: model.listenable(),
            builder: (context, Box<StudetModel> box, child) {
              return ListView.builder(
                itemCount: model.length,
                itemBuilder: (context, index) {
                  StudetModel todo = box.getAt(index) as StudetModel;
                  return Card(
                    color: Colors.blue.shade200,
                    child: ListTile(
                      onTap: () {
                        Get.to(Update_user(
                            index: index,
                            name: todo.name,
                            age: todo.age,
                            email: todo.email,
                            phone: todo.phone,
                            coures: todo.course,
                            image: todo.image));
                      },
                      leading: CircleAvatar(
                          backgroundImage: MemoryImage(todo.image)),
                      title: Text(todo.name),
                      subtitle: Text(todo.age),
                      trailing: IconButton(
                        onPressed: () {
                          controller.deleteNotes(index);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
} 
