
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_student_app/controller/controller.dart';
import 'package:hive_student_app/controller/image.dart';


import 'package:hive_student_app/view/Add_user/widget.dart';
import 'package:image_picker/image_picker.dart';


class AddUser extends StatefulWidget {
  AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final rollnumberController = TextEditingController();

  final nameController = TextEditingController();

  final ageController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  final courseController = TextEditingController();

  final _key = GlobalKey<FormState>();
final picimage=Get.put(picimagecontroller());
final controller=Get.put(StudentModelController());





void buttonPress() async {
  final name = nameController.text;
  final age = ageController.text;
  final email = emailController.text;
  final phone = phoneController.text;
  final course = courseController.text;
  
  String filePath = picimage.selectedimagepath.value;

  
  Uint8List imageBytes = await File(filePath).readAsBytes();

controller.addNotes(name, age, email, phone, course, imageBytes);

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
                            ? Text('Select Image')
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
                        controller: nameController,
                        labelText: 'First Name',
                        hintText: 'First Name',
                        validator: nameValidate,
                        icons: Icon(Icons.person),
                      ),
                      SizedBox(
                        height: 21.0,
                      ),
                      CustomTextFormField(
                        controller: ageController,
                        labelText: 'Age',
                        hintText: 'Age',
                        validator: ageValidate,
                        icons: Icon(Icons.person),
                      ),
                      SizedBox(
                        height: 21.0,
                      ),
                      CustomTextFormField(
                        controller: emailController,
                        labelText: 'Email',
                        hintText: 'Email',
                        validator: emailValidate,
                        icons: Icon(Icons.email),
                      ),
                      SizedBox(
                        height: 21.0,
                      ),
                      CustomTextFormField(
                        controller: phoneController,
                        labelText: 'Phone',
                        hintText: 'Phone',
                        validator: phoneValidate,
                        icons: Icon(Icons.phone),
                      ),
                      SizedBox(
                        height: 21.0,
                      ),
                      CustomTextFormField(
                        controller: courseController,
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
                          child: Text("Add Image"),
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
                          child: Text('Submit'),
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
