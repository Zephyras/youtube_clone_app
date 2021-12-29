import 'package:get/get.dart';
import 'package:youtube_clone_app/src/models/statistics.dart';
import 'package:youtube_clone_app/src/models/video.dart';
import 'package:youtube_clone_app/src/models/youtuber.dart';
import 'package:youtube_clone_app/src/repository/youtube_repository.dart';

class VideoController extends GetxController {
  Video video;
  VideoController({this.video});
  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;
  @override
  void onInit() async {
    Statistics loadStatistics =
        await YoutubeRepository.to.getVideoInfoById(video.id.videoId);
    statistics(loadStatistics);
    Youtuber loadyoutuber =
        await YoutubeRepository.to.getYoutuberInfoById(video.snippet.channelId);
    youtuber(loadyoutuber);
    super.onInit();
  }

  String get viewCountString => statistics.value.viewCount;
  String get likeCountString => statistics.value.likeCount;
  String get dislikeCountString => statistics.value.dislikeCount;
  String get favoriteCountString => statistics.value.favoriteCount;
  String get commentCountString => statistics.value.commentCount;
  String get subscriberCountString => youtuber.value.statistics.subscriberCount;
  String get youtuberThumbnailUrl {
    if (youtuber.value.snippet == null)
      return "https://media.istockphoto.com/vectors/default-profile-picture-avatar-photo-placeholder-vector-illustration-vector-id1223671392?k=6&m=1223671392&s=612x612&w=0&h=NGxdexflb9EyQchqjQP0m6wYucJBYLfu46KCLNMHZYM=";
    return youtuber.value.snippet.thumbnails.medium.url;
  }
}
