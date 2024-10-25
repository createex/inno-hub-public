import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImagePickerController extends GetxController{
  RxString imagePath="".obs;
  Future getImage()async{
    final ImagePicker picker=ImagePicker();
    final XFile? image=await picker.pickImage(source: ImageSource.gallery);
    if(image !=null){
      imagePath.value=image.path.toString();
    }
  }
}

//


class ImagePickerController1 extends GetxController {
  RxString backgroundImagePath = ''.obs; // Separate observable for background image
  RxString profileImagePath = ''.obs;    // Separate observable for profile image

  Future<void> pickBackgroundImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      backgroundImagePath.value = image.path;
      await _saveBackgroundImagePath(image.path);
    }
  }
  Future<void> _saveBackgroundImagePath(String path) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('backgroundImagePath', path); // Save path
  }

  Future<void> loadBackgroundImagePath() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    backgroundImagePath.value = prefs.getString('backgroundImagePath') ?? ''; // Load path
  }

  Future<void> pickProfileImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      profileImagePath.value = image.path;
    }
  }
}

//
