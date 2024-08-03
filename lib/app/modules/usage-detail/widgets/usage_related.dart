import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';
import '../../article/widgets/article_card.dart';

class UsageRelated extends StatelessWidget {
  const UsageRelated({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: Sizes.m),
      // children: [1, 2, 3, 4, 5].map((i) => ArticleCard(i: i)).toList(),
    );
  }
}
