import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/toko/model/model_toko_kota.dart';
import '../../../shareds/widgets/app_button.dart';
import '../../../shareds/widgets/app_dropdown_textfield.dart';
import '../../../shareds/widgets/app_gaps.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../controllers/toko_controller.dart';
import '../widgets/toko_card.dart';

class TokoView extends GetView<TokoController> {
  const TokoView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final wilayahProvinsi = controller.wilayahProvinsi.value;
      final wilayahKota = controller.wilayahKota.value;
      final tokoKota = controller.tokoKota.value;
      final isError = controller.isError.value;
      final isLoading = controller.isLoading.value;
      if (isLoading) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              Gaps.vertical.m,
              if (isError)
                AppButton(
                  type: ButtonType.elevated,
                  onPressed: controller.onInit,
                  child: const Text("Refresh"),
                ),
            ],
          ),
        );
      }
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Sizes.r),
            child: Column(
              children: [
                AppDropdownTextField(
                  label: "Provinsi",
                  values: (wilayahProvinsi?.payload ?? []).map((tokoProvinsi) => tokoProvinsi.nama).toList(),
                  onChanged: (text) => controller.onProvinsiChanged(text),
                  selectedValue: controller.selectedProvinsi.value,
                ),
                Gaps.vertical.r,
                AppDropdownTextField(
                  label: "Kota",
                  values: (wilayahKota?.payload ?? [])
                      .map(
                        (wilayah) => "${wilayah.tipe ?? ""} ${wilayah.nama ?? ""}",
                      )
                      .toList(),
                  onChanged: controller.onKotaChanged,
                  selectedValue: controller.selectedKota.value,
                ),
                Gaps.vertical.r,
                const Divider(
                  height: 0,
                ),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: controller.onInit,
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.m),
                children: [
                  const TextBold(
                    text: "Distributor",
                    fontWeight: FontWeight.w500,
                    fontSize: Sizes.m,
                  ),
                  Gaps.vertical.r,
                  for (Toko distributor
                      in tokoKota?.listToko?.where((toko) => toko.tipe == "distributor").toList() ?? []) ...[
                    TokoCard(toko: distributor),
                    Gaps.vertical.sr,
                  ],
                  Gaps.vertical.l,
                  const TextBold(
                    text: "Retailer",
                    fontWeight: FontWeight.w500,
                    fontSize: Sizes.m,
                  ),
                  Gaps.vertical.r,
                  for (Toko retailer in tokoKota?.listToko?.where((toko) => toko.tipe == "retailer").toList() ?? []) ...[
                    TokoCard(toko: retailer),
                    Gaps.vertical.sr,
                  ],
                  Gaps.vertical.xh,
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
