import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../shareds/widgets/app_icon.dart';
import '../controllers/videos_controller.dart';
import '../widget/video_card.dart';

class VideosView extends GetView<VideosController> {
  const VideosView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppIcon(width: 80),
        centerTitle: true,
      ),
      body: Obx(() {
        final listVideo = controller.videos.value?.listVideo;
        if (listVideo == null) {
          return const Center(child: SizedBox(width: 50, height: 50, child: CircularProgressIndicator()));
        }

        return AlignedGridView.extent(
          shrinkWrap: true,
          maxCrossAxisExtent: 200,
          itemCount: listVideo.length,
          mainAxisSpacing: Sizes.sr,
          crossAxisSpacing: Sizes.sr,
          padding: const EdgeInsets.all(Sizes.m),
          itemBuilder: (context, index) {
            final video = listVideo[index];
            return VideoCard(video: video);
          },
        );
      }),
    );
  }
}
