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
      final isFieldLoading = controller.isFieldLoading.value;
      final distributors = tokoKota?.listToko?.where((toko) => toko.tipe == "distributor").toList();
      final retailers = tokoKota?.listToko?.where((toko) => toko.tipe == "retailer").toList();
      final selectedProvinsi = controller.selectedProvinsi.value;
      final selectedKota = controller.selectedKota.value;
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
                  hintText: selectedProvinsi == null ? "Provinsi" : null,
                  label: "Provinsi",
                  values: (wilayahProvinsi?.payload ?? []).map((tokoProvinsi) => tokoProvinsi.nama).toList(),
                  onChanged: (text) => controller.onProvinsiChanged(text),
                  selectedValue: selectedProvinsi,
                ),
                Gaps.vertical.r,
                AppDropdownTextField(
                  hintText: selectedKota == null ? "Kota" : null,
                  label: "Kota",
                  values: (wilayahKota?.payload ?? [])
                      .where((wilayah) => (wilayah.totalToko ?? 0) > 0)
                      .map(
                        (wilayah) => "${wilayah.tipe ?? ""} ${wilayah.nama ?? ""}",
                      )
                      .toList(),
                  onChanged: controller.onKotaChanged,
                  selectedValue: selectedKota,
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
                  if (isFieldLoading) ...[
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ] else ...[
                    if ((distributors ?? []).isEmpty && (retailers ?? []).isEmpty) ...[
                      const Text("Data Kosong"),
                    ],
                    if (distributors?.isNotEmpty ?? false) ...[
                      const TextBold(
                        text: "Distributor",
                        fontWeight: FontWeight.w500,
                        fontSize: Sizes.m,
                      ),
                      Gaps.vertical.r,
                      for (Toko distributor in distributors ?? []) ...[
                        TokoCard(toko: distributor),
                        Gaps.vertical.sr,
                      ],
                      Gaps.vertical.l,
                    ],
                    if (retailers?.isNotEmpty ?? false) ...[
                      const TextBold(
                        text: "Retailer",
                        fontWeight: FontWeight.w500,
                        fontSize: Sizes.m,
                      ),
                      Gaps.vertical.r,
                      for (Toko retailer in retailers ?? []) ...[
                        TokoCard(toko: retailer),
                        Gaps.vertical.sr,
                      ],
                    ],
                  ],
                  Gaps.vertical.xh,
                  Gaps.vertical.xh,
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
