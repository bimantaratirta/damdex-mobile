import 'package:get/get.dart';

import '../../../data/api/logs/data/post_user_log.dart';
import '../../../data/api/toko/data/get_toko_kota.dart';
import '../../../data/api/toko/data/get_toko_wilayah.dart';
import '../../../data/api/toko/model/model_toko_kota.dart';
import '../../../data/api/toko/model/model_toko_wilayah.dart';
import '../../../utils/get_device_info.dart';
import '../../../utils/location_service.dart';

class TokoController extends GetxController {
  Rx<ModelTokoWilayah?> wilayahProvinsi = Rx<ModelTokoWilayah?>(null);
  Rx<ModelTokoWilayah?> wilayahKota = Rx<ModelTokoWilayah?>(null);
  Rx<ModelTokoKota?> tokoKota = Rx<ModelTokoKota?>(null);

  Rx<String?> selectedProvinsi = Rx<String?>(null);
  Rx<String?> selectedKota = Rx<String?>(null);
  RxBool isLoading = true.obs;
  RxBool isError = true.obs;
  Map<String, dynamic> location = {};
  String deviceName = "";

  @override
  Future<void> onInit() async {
    isLoading.value = true;
    isError.value = false;
    await getTokoWilayah({"tipe": "provinsi"}).then((res) {
      if (res.data != null) {
        wilayahProvinsi.value = res.data;
        onProvinsiChanged(res.data?.payload?[0].nama ?? "");
      } else {
        isError.value = true;
      }
    });
    isLoading.value = false;
    super.onInit();
  }

  void onProvinsiChanged(String? text) {
    selectedProvinsi.value = text;
    final idProvinsi = wilayahProvinsi.value?.payload?.firstWhereOrNull((provinsi) {
      return (provinsi.nama ?? "").contains(text ?? "");
    })?.id;
    getTokoWilayah({"tipe": "kota", "idProvinsi": idProvinsi}).then((res) {
      if (res.data != null) {
        wilayahKota.value = res.data;
        selectedKota.value = "${res.data?.payload?[0].tipe ?? ""} ${res.data?.payload?[0].nama ?? ""}";
      } else {
        isError.value = true;
      }
    });
  }

  void onKotaChanged(String? text) async {
    selectedKota.value = text;
    final id = wilayahKota.value?.payload?.firstWhereOrNull((wilayah) {
      return (wilayah.nama ?? "").isCaseInsensitiveContainsAny(text ?? "") &&
          (wilayah.tipe ?? "").isCaseInsensitiveContainsAny(text ?? "");
    })?.id;

    location = await LocationService.getCurrentLocation();
    deviceName = await getDeviceInfo();
    await postUserLog({
      "device": deviceName,
      "lokasi": location,
      "tipeKonten": "toko",
      "idKonten": id,
    });

    getTokoKota(id.toString()).then((res) {
      if (res.data != null) {
        tokoKota.value = res.data;
        res.data?.listToko?.length;
      } else {
        isError.value = true;
      }
    });
  }
}
