import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamy/common/app_colors.dart';
import 'package:islamy/common/widgets/bg_layout_widget.dart';
import 'package:islamy/common/widgets/header_widget.dart';
import 'package:islamy/gen/assets.gen.dart';
import 'package:islamy/tabs/quran_tab/widgets/custom_text_field.dart';
import 'package:islamy/tabs/quran_tab/widgets/most_recent_section.dart';
import 'package:islamy/tabs/quran_tab/widgets/suras_list_section.dart';

class QuranTabPage extends StatelessWidget {
  const QuranTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BgLayoutWidget(imagePAth: Assets.quranTabBg.path),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(),
                SizedBox(height: 20),
                CustomTextField(
                  hintText: "Sura Name",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: SvgPicture.asset(
                      Assets.quranTabIcon,
                      colorFilter: ColorFilter.mode(
                        AppColors.goldColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                MostRecentSection(),
                SurasListSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
//listview OR singlechildescrollview
//customsroll