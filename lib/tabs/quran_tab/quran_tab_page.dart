import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamy/common/app_colors.dart';
import 'package:islamy/common/widgets/bg_layout_widget.dart';
import 'package:islamy/common/widgets/header_widget.dart';
import 'package:islamy/data/models/sura_model.dart';
import 'package:islamy/data/quran_data.dart';
import 'package:islamy/gen/assets.gen.dart';
import 'package:islamy/tabs/quran_tab/widgets/custom_text_field.dart';
import 'package:islamy/tabs/quran_tab/widgets/most_recent_section.dart';
import 'package:islamy/tabs/quran_tab/widgets/suras_list_section.dart';

class QuranTabPage extends StatefulWidget {
  const QuranTabPage({super.key});

  @override
  State<QuranTabPage> createState() => _QuranTabPageState();
}

class _QuranTabPageState extends State<QuranTabPage> {
  final TextEditingController controller = TextEditingController();
  List<SuraModel> _filteredSuras = QuranData.suras;

  void _onSearchChanged(String searchText) {
    setState(() {
      if (searchText.isEmpty) {
        _filteredSuras = QuranData.suras;
      } else {
        final query = searchText.toLowerCase().trim(); // trim whitespace too
        _filteredSuras = QuranData.suras.where((sura) {
          return sura.enName.toLowerCase().contains(query) ||
              sura.arName.toLowerCase().contains(query) ||
              sura.number.toString() == query;
        }).toList();
      }
    });
  }
  // a
  //A

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BgLayoutWidget(imagePAth: Assets.quranTabBg.path),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: HeaderWidget()),
                SliverToBoxAdapter(child: SizedBox(height: 20)),
                SliverToBoxAdapter(
                  child: CustomTextField(
                    onChanged:  _onSearchChanged ,
                    // onSubmitted: _onSearchChanged,
                    controller: controller,
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
                ),
                SliverToBoxAdapter(child: MostRecentSection()),
                SurasListSection(suras: _filteredSuras,),
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
