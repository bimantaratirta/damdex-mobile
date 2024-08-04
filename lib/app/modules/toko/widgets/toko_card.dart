import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/toko/model/model_toko_kota.dart';
import '../../../shareds/widgets/text_bold.dart';

class TokoCard extends StatelessWidget {
  const TokoCard({super.key, required this.toko});

  final Toko toko;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextBold(
          text: toko.nama ?? "",
          fontWeight: FontWeight.w500,
          fontSize: Sizes.r,
        ),
        Text("${toko.detail} Hp : ${toko.noHp}")
      ],
    );
  }
}
