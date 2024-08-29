import 'package:get/get.dart';

class PeopleFollowedYouController extends GetxController {
  var data = <Map<String, dynamic>>[
    {
      "leading": "assets/pngs/pngprofile.png",
      "title": "zeeshan",
      "subtitle": "hello world",
      "isFollowing": false,
    },
    {
      "leading": "assets/pngs/pngprofile.png",
      "title": "usman",
      "subtitle": "random click",
      "isFollowing": false,
    },
    {
      "leading": "assets/pngs/pngprofile.png",
      "title": "zarish",
      "subtitle": "love",
      "isFollowing": false,
    },
    {
      "leading": "assets/pngs/pngprofile.png",
      "title": "saba",
      "subtitle": "loving",
      "isFollowing": false,
    },
  ].obs; // Use .obs to make it observable

  void toggleFollowing(int index) {
    data[index]["isFollowing"] = !(data[index]["isFollowing"] as bool);
    data[index] = data[index]; // Notify GetX that the data has changed
  }
}
