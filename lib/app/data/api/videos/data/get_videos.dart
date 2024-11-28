import 'dart:developer';

import '../../api_client.dart';
import '../../api_path.dart';
import '../model/model_videos.dart';

Future<APIResponse<Videos>> getVideos({Map<String, dynamic>? qp}) async {
  final param = APIParam<Videos>(
    path: APIPath.video,
    fromJson: (e) {
      log(e.toString());
      return Videos.fromJson(e);
    },
    queryParameters: qp,
  );
  final response = await apiClient.get<Videos>(param);
  return response;
}
