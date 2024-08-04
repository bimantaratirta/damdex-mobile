import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';
import '../../../data/api/article/model/model_articles.dart';
import '../../../data/api/usage/model/model_usage.dart';
import '../../article/widgets/article_card.dart';

class UsageRelated extends StatelessWidget {
  const UsageRelated({super.key, required this.usage});

  final ModelUsage? usage;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: Sizes.m),
      children: (usage?.listArtikel ?? [])
          .map((article) => ArticleCard(
                article: Artikel.fromJson(article.toJson()),
              ))
          .toList(),
    );
  }
}
