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
import 'package:shared_preferences/shared_preferences.dart';

class QuranTabPage extends StatefulWidget {
  const QuranTabPage({super.key});

  @override
  State<QuranTabPage> createState() => _QuranTabPageState();
}

class _QuranTabPageState extends State<QuranTabPage> {
  final TextEditingController controller = TextEditingController();
  List<SuraModel> _filteredSuras = QuranData.suras;
  List<SuraModel> _mostRecentSuras = [];
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
  void initState() {
    // TODO: implement initState
    super.initState();

    _getMosRecentSuras();
  }

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
                    onChanged: _onSearchChanged,
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
                SliverToBoxAdapter(
                    child: MostRecentSection(
                  mostRecent: _mostRecentSuras,
                )),
                SurasListSection(
                  suras: _filteredSuras,
                  onTap: _updateMostRecent,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _getMosRecentSuras() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    List<String> mostRecent =
        sharedPreferences.getStringList("mostRecent") ?? [];
    print('-->${mostRecent}');
    List<SuraModel> mostRecentSuras = [];
    for (var i = 0; i < mostRecent.length; i++) {
      int surasNumber = int.parse(mostRecent[i]);
      SuraModel suraModel = QuranData.suras.firstWhere(
        (sura) => sura.number == surasNumber,
      );

      mostRecentSuras.add(suraModel);
    }
    print('mostRecentSuras-->${mostRecentSuras.length}');

    _mostRecentSuras = mostRecentSuras;
    setState(() {});
  }

  Future<void> _updateMostRecent(SuraModel sura) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    List<String> mostRecent =
        sharedPreferences.getStringList("mostRecent") ?? [];
    mostRecent.insert(0, sura.number.toString());
    Set<String> mostRecentSet = mostRecent.toSet();
    mostRecent = mostRecentSet.toList();
    await sharedPreferences.setStringList("mostRecent", mostRecent);
    await _getMosRecentSuras();
  }
}
//listview OR singlechildescrollview
//customsroll
