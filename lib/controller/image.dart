 
 import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class picimagecontroller extends GetxController{
 
  var selectedimagepath =''.obs;
  // var selectedimagesize =''.obs;
  void getimage(ImageSource imageSource)async{
    final picimage =ImagePicker();
final pickedFile=await picimage.pickImage(source: imageSource);
if(pickedFile!=null){
selectedimagepath.value=pickedFile.path;
// selectedimagesize.value=((File(selectedimagepath.value)).lengthSync()/512/512).toStringAsFixed(2)+'kb';
}else{
  // Get.snackbar('Error', 'No Image Selected');
}
  }
}