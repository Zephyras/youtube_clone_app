import 'package:get/get.dart';
import 'package:youtube_clone_app/src/models/statistics.dart';
import 'package:youtube_clone_app/src/models/youtube_video_result.dart';
import 'package:youtube_clone_app/src/models/youtuber.dart';

class YoutubeRepository extends GetConnect {
  //GETCONNECT ==> Http 기능을 가지고 있는 GetConnet
  static YoutubeRepository get to => Get.find();

  // baseurl api 의 도메인주소
  @override
  void onInit() {
    httpClient.baseUrl = "https://www.googleapis.com";
    super.onInit();
  }

  saerch(String searchKeyword, String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyDaNXxR6b_Sx1j4zb1ouAa5eFl9-5IdOUs&pageToken=$nextPageToken&q=$searchKeyword";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
    return null;
  }

  loadVideos(String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&channelId=UCbMGBIayK26L4VaFrs5jyBw&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyDaNXxR6b_Sx1j4zb1ouAa5eFl9-5IdOUs&pageToken=$nextPageToken";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
    return null;
  }

  Future<Statistics> getVideoInfoById(String videoId) async {
    String url =
        "/youtube/v3/videos?part=statistics&key=AIzaSyD_M81-L7qn-TWAw8MoDyOFpuwSdg7hWOc&id=$videoId";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body['items'] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Statistics.fromJson(data["statistics"]);
      }
    }
  }

  Future<Youtuber> getYoutuberInfoById(String videoId) async {
    String url =
        "/youtube/v3/channels?part=statistics,snippet&key=AIzaSyD_M81-L7qn-TWAw8MoDyOFpuwSdg7hWOc&id=$videoId";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      if (response.body['items'] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Youtuber.fromJson(data);
      }
    }
  }
}
