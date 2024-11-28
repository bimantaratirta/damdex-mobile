import 'package:device_info_plus/device_info_plus.dart';

Future<String> getDeviceInfo() async {
  Map<String, dynamic> deviceInfo = (await DeviceInfoPlugin().deviceInfo).data;
  final result = deviceInfo["name"] ?? deviceInfo["device"] ?? "Unknown";
  return result;
}
