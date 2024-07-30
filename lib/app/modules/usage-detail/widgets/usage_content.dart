import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../constants/sizes.dart';
import '../controllers/usage_detail_controller.dart';
import 'usage_type_card.dart';

class UsageContent extends GetView<UsageDetailController> {
  const UsageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(Sizes.m),
          child: HtmlWidget(
            '''<article>
                    <p>DAMDEX adalah bahan pencampur semen (additive) yang menghasilkan pelapis, perekat, dan penambal tahan air dengan sifat-sifat unggul sehingga mampu melindungi bangunan dengan efisien dan efektif.</p>
              <p>DAMDEX tersedia dalam 4 ukuran:</p>
                  </article>''',
            renderMode: RenderMode.column,
            textStyle: TextStyle(fontSize: 14),
          ),
        ),
        ...controller.types.map((i) => UsageTypeCard(i: i))
      ],
    );
  }
}
