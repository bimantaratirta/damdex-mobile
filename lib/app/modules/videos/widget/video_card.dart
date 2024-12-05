import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/api_path.dart';
import '../../../data/api/videos/model/model_video.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/app_icon.dart';
import '../../../shareds/widgets/damdex_divider.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/convert_url_to_id.dart';
import '../controllers/videos_controller.dart';

class VideoCard extends GetView<VideosController> {
  const VideoCard({super.key, required this.video});

  final Video video;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      onTap: () {
        Get.isDialogOpen ?? true ? Navigator.of(Get.overlayContext ?? context).pop() : null;
        Get.dialog(
          Scaffold(
            appBar: AppBar(
              title: Text(video.judul ?? ""),
            ),
            body: ListView(
              controller: controller.scrollController,
              children: [
                HtmlWidget(
                  '<iframe width="560" height="315" src="https://www.youtube.com/embed/${convertUrlToId(video.url ?? "")}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>',
                  renderMode: RenderMode.column,
                  textStyle: const TextStyle(fontSize: 14),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: Sizes.m, right: Sizes.m, left: Sizes.m),
                  child: TextBold(
                    text: "Video Lainnya",
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                AlignedGridView.extent(
                  controller: controller.scrollController,
                  shrinkWrap: true,
                  maxCrossAxisExtent: 200,
                  itemCount: controller.videos.value!.listVideo!.where((vid) => vid != video).length,
                  mainAxisSpacing: Sizes.sr,
                  crossAxisSpacing: Sizes.sr,
                  padding: const EdgeInsets.all(Sizes.m),
                  itemBuilder: (context, index) {
                    final vid = controller.videos.value!.listVideo!.where((vid) => vid != video).toList()[index];
                    return VideoCard(video: vid);
                  },
                )
              ],
            ),
          ),
          transitionDuration: Duration.zero,
        );
      },
      child: GestureDetector(
        onTap: () {
          Get.isDialogOpen ?? true ? Navigator.of(Get.overlayContext ?? context).pop() : null;
          Get.dialog(
            Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const AppIcon(width: 80),
              ),
              body: ListView(
                controller: controller.scrollController,
                children: [
                  HtmlWidget(
                    '<iframe width="560" height="315" src="https://www.youtube.com/embed/${convertUrlToId(video.url ?? "")}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>',
                    renderMode: RenderMode.column,
                    textStyle: const TextStyle(fontSize: 14),
                  ),
                  Gaps.vertical.s,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: Sizes.m, vertical: Sizes.s),
                    child: TextBold(
                      text: video.judul ?? "",
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  Gaps.vertical.r,
                  const DamdexDivider(),
                  Gaps.vertical.r,
                  const Padding(
                    padding: EdgeInsets.only(top: Sizes.m, right: Sizes.m, left: Sizes.m),
                    child: TextBold(
                      text: "Video Lainnya",
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  for (Video vid in controller.videos.value!.listVideo!.where((vid) => vid != video)) ...[
                    VideoCard(video: vid),
                  ]
                ],
              ),
            ),
            transitionDuration: Duration.zero,
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: Sizes.s, horizontal: Sizes.r),
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.s,
            vertical: Sizes.s,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.lightGrey.withOpacity(.5)),
            borderRadius: const BorderRadius.all(
              Radius.circular(Sizes.s),
            ),
          ),
          child: Column(
            children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(APIPath.assetId(video.idAsset ?? "")),
                    fit: BoxFit.cover,
                  ),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: const Icon(
                  Icons.play_arrow_rounded,
                  size: 48,
                  color: Colors.white,
                ),
              ),
              Gaps.vertical.s,
              TextBold(
                text: video.judul ?? "-",
                fontWeight: FontWeight.w500,
                fontSize: 16,
              )
            ],
          ),
        ),
      ),
    );
  }
}
