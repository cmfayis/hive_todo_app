

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:hive_student_app/controller/controller.dart';
import 'package:hive_student_app/controller/image.dart';
import 'package:hive_student_app/view/Add_user/widget.dart';

class Update_user extends StatefulWidget {
  int index;
  String name;
  String age;
  String email;
  String phone;
  String coures;
  Uint8List image;
  Update_user({
    Key? key,
    required this. index,
    required this.name,
    required this.age,
    required this.email,
    required this.phone,
    required this.coures,
    required this.image,
  }) : super(key: key);



  @override
  State<Update_user> createState() => _Update_userState();
}

class _Update_userState extends State<Update_user> {
 

  final updatenameController = TextEditingController();

  final updateageController = TextEditingController();

  final updateemailController = TextEditingController();

  final updatephoneController = TextEditingController();

  final updatecourseController = TextEditingController();

  final _key = GlobalKey<FormState>();
final picimage=Get.put(picimagecontroller());
final controller=Get.put(StudentModelController());


  @override
  void initState() {
    super.initState();
    updatenameController.text = widget.name;
    updateageController.text=widget.age;
    updateemailController.text=widget.email;
    updatecourseController.text=widget.coures;
    updatephoneController.text=widget.phone; 
  
  }


void buttonPress() async {
   final name = updatenameController.text;
  final age = updateageController.text;
  final email = updateemailController.text;
  final phone = updatephoneController.text;
  final course = updatecourseController.text;
 
  String filePath = picimage.selectedimagepath.value;  
  Uint8List imageBytes = await File(filePath).readAsBytes();

  controller.updateNotes(widget.index, name, age, email, phone, course, imageBytes);


Get.back();
  

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color.fromARGB(255, 237, 137, 137),
      ),
      backgroundColor: Color.fromARGB(255, 237, 137, 137),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Column(
                    children: [
                          Obx(
                        () => picimage.selectedimagepath.value.isEmpty
                            ? CircleAvatar(                           
                                radius: 50.0,
                                backgroundImage: MemoryImage(widget.image),
                              )
                            : CircleAvatar(                             
                                radius: 50.0,
                                backgroundImage: FileImage(File(
                                    picimage.selectedimagepath.value)),
                              ),
                      ),
                     
                     
                      SizedBox(
                        height: 21.0,
                      ),
                      CustomTextFormField(
                        controller:updatenameController ,
                        labelText: 'First Name',
                        hintText: 'First Name',
                        validator: nameValidate,
                        icons: Icon(Icons.person),
                      ),
                      SizedBox(
                        height: 21.0,
                      ),
                      CustomTextFormField(
                        controller: updateageController,
                        labelText: 'Age',
                        hintText: 'Age',
                        validator: ageValidate,
                        icons: Icon(Icons.person),
                      ),
                      SizedBox(
                        height: 21.0,
                      ),
                      CustomTextFormField(
                        controller: updateemailController,
                        labelText: 'Email',
                        hintText: 'Email',
                        validator: emailValidate,
                        icons: Icon(Icons.email),
                      ),
                      SizedBox(
                        height: 21.0,
                      ),
                      CustomTextFormField(
                        controller: updatephoneController,
                        labelText: 'Phone',
                        hintText: 'Phone',
                        validator: phoneValidate,
                        icons: Icon(Icons.phone),
                      ),
                      SizedBox(
                        height: 21.0,
                      ),
                      CustomTextFormField(
                        controller: updatecourseController,
                        labelText: 'Course',
                        hintText: 'Course',
                        validator: nameValidate,
                        icons: Icon(Icons.person),
                      ),
                      SizedBox(
                        height: 21.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 10, 35, 57),
                          ),
                          onPressed: () async {
                           picimage.getimage(ImageSource.camera);
                          },
                          child: Text("Update Image"),
                        ),
                      ),
                      SizedBox(height: 21.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 10, 35, 57),
                          ),
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              buttonPress();
                            }
                          },
                          child: Text('Update'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
