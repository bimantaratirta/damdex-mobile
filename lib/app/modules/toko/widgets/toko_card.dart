import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';
import '../../../shareds/widgets/text_bold.dart';

class TokoCard extends StatelessWidget {
  const TokoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextBold(
          text: "Nama Toko",
          fontWeight: FontWeight.w500,
          fontSize: Sizes.r,
        ),
        Text("Tri Hartanto (Area Sales Manager DAMDEX) Hp : 0878 3944 4323")
      ],
    );
  }
}
