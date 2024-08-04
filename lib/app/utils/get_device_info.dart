import 'package:device_info_plus/device_info_plus.dart';

Future<Map<String, dynamic>> getDeviceInfo() async {
  Map<String, dynamic> deviceInfo = (await DeviceInfoPlugin().deviceInfo).data;
  return deviceInfo;
}
