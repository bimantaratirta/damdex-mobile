import '../../api_client.dart';
import '../../api_path.dart';
import '../model/model_toko_wilayah.dart';

Future<APIResponse<ModelTokoWilayah>> getTokoWilayah(Map<String, dynamic> data) async {
  final param = APIParam<ModelTokoWilayah>(
    path: APIPath.tokoWilayah,
    fromJson: ModelTokoWilayah.fromJson,
    queryParameters: data,
  );
  final response = await apiClient.get<ModelTokoWilayah>(param);
  return response;
}
