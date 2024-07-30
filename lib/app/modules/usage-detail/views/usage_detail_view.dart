import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';
import '../../../shareds/widgets/app_icon.dart';
import '../../../shareds/widgets/text_bold.dart';
import '../../../theme/app_colors.dart';
import '../widgets/usage_content.dart';
import '../widgets/usage_related.dart';

class UsageDetailView extends StatefulWidget {
  const UsageDetailView({super.key});

  @override
  State<UsageDetailView> createState() => _UsageDetailViewState();
}

class _UsageDetailViewState extends State<UsageDetailView> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppIcon(width: 80),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 125,
            color: AppColors.lightGrey,
          ),
          TabBar(
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            labelColor: AppColors.accent,
            unselectedLabelColor: AppColors.accent.withOpacity(.7),
            indicatorColor: AppColors.accent,
            overlayColor: WidgetStatePropertyAll<Color>(AppColors.accent.withOpacity(.1)),
            indicatorWeight: 4,
            labelPadding: const EdgeInsets.all(Sizes.r),
            tabs: const [
              TextBold(
                text: "Kegunaan",
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              TextBold(
                text: "Pemakaian Lain",
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                UsageContent(),
                UsageRelated(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
