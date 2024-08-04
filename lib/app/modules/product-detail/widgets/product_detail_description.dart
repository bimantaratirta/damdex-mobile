import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

import '../../../constants/sizes.dart';

class ProductDetailDescription extends StatelessWidget {
  const ProductDetailDescription({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(Sizes.m),
      child: HtmlWidget(
        description,
        renderMode: RenderMode.column,
        textStyle: const TextStyle(fontSize: 14),
      ),
    );
  }
}
