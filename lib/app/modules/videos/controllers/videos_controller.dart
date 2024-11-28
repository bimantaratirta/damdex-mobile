import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/videos/data/get_videos.dart';
import '../../../data/api/videos/model/model_videos.dart';

class VideosController extends GetxController {
  final scrollController = ScrollController();
  Rx<Videos?> videos = Rx<Videos?>(null);

  RxBool isError = false.obs;

  @override
  void onInit() {
    getVideos().then((responseVideos) {
      if (responseVideos.data != null) {
        (responseVideos.data?.listVideo ?? []).sort((a, b) => (a.index ?? 0).compareTo(b.index ?? 0));
        videos.value = responseVideos.data;
      } else {
        isError.value = true;
      }
    });
    super.onInit();
  }
}
