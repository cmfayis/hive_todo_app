
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_student_app/view/Add_user/Add_user.dart';
import 'package:hive_student_app/view/list_page/list.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
     
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.to(AddUser());
            },
            child: const Icon(Icons.add),
            backgroundColor: Color.fromARGB(255, 220, 60, 60),
          ),
          backgroundColor: Color.fromARGB(255, 204, 217, 174),
          body: Column(
            children: [
              const SizedBox(
                height: 175.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                      image: AssetImage(
                          "assets/images/images-removebg-preview.png")),
                ],
              ),
              const SizedBox(
                height: 70,
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(70.0),
                        topRight: Radius.circular(70.0),
                      ),
                      color: Color.fromARGB(255, 214, 102, 102)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 35.0,
                      ),
                      Text(
                        'Student',
                        style: GoogleFonts.pacifico(
                          fontSize: 45,color: Colors.white
                        ),
                      ),
                      Text(
                        'APP',
                        style: GoogleFonts.pacifico(
                          fontSize: 45,color: Colors.white
                        ),
                        
                      ),
                      ElevatedButton(onPressed: (){
                        Get.to(listpage());
                      }, child:Text('list'))
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    
  }
