import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/api_path.dart';
import '../../../data/api/videos/model/model_video.dart';
import '../../../data/api/videos/model/model_videos.dart';
import '../../../routes/app_pages.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../../../theme/app_colors.dart';

class VideosCard extends StatelessWidget {
  const VideosCard({
    super.key,
    required this.videos,
  });

  final Videos videos;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () => Get.toNamed(Routes.VIDEOS),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: Sizes.m),
        width: 300,
        height: 180,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Builder(builder: (context) {
                double left = 0;
                double top = 0;
                return Stack(
                  alignment: Alignment.center,
                  fit: StackFit.loose,
                  children: [
                    for (Video vid in videos.listVideo ?? []) ...[
                      Builder(builder: (context) {
                        left += 5;
                        top += 10;
                        return Positioned(
                          top: 0 + top,
                          left: 15 + left,
                          child: Container(
                            width: 175,
                            height: 100,
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColors.white),
                              image: DecorationImage(
                                image: NetworkImage(APIPath.assetId(vid.idAsset ?? "")),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(Sizes.sr),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.black.withOpacity(.3),
                                  spreadRadius: 2,
                                  offset: const Offset(1, 2),
                                  blurRadius: 2,
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ],
                );
              }),
            ),
            SizedBox(
              width: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Flexible(
                    child: TextBold(
                      text: "VIDEO DAMDEX",
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      softWrap: true,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.black,
                      size: 16,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
