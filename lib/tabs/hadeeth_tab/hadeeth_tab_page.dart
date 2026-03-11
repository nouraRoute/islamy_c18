import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:islamy/common/app_colors.dart';
import 'package:islamy/common/widgets/bg_layout_widget.dart';
import 'package:islamy/common/widgets/header_widget.dart';
import 'package:islamy/data/models/hadeeth_model.dart';
import 'package:islamy/gen/assets.gen.dart';

class HadeethTabPage extends StatefulWidget {
  const HadeethTabPage({super.key});

  @override
  State<HadeethTabPage> createState() => _HadeethTabPageState();
}

class _HadeethTabPageState extends State<HadeethTabPage> {
  PageController _controller = PageController(
    viewportFraction: .7,
    initialPage: 0,
  );
  int currantPAge = 0;

  List<HadeethModel> hadeethModelLis = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAhadeeth();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BgLayoutWidget(imagePAth: Assets.hadeethTabBg.path),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
            child: Column(
              children: [
                HeaderWidget(),
                SizedBox(height: 55),
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (value) {
                      currantPAge = value;
                      print('currant page->$value');
                      setState(() {});
                    },
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    itemCount: hadeethModelLis.length,
                    itemBuilder: (context, index) {
                      bool isActive = index == currantPAge;

                      return Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: isActive ? 0 : 20.0,
                          horizontal: 4,
                        ),
                        child: Card(
                          color: AppColors.goldColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(24),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Stack(
                              alignment: Alignment(0, 0),
                              children: [
                                Image.asset(
                                  Assets.hadeethCardBg.path,
                                  fit: BoxFit.fill,
                                  width: 312,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 43.0,
                                    horizontal: 22,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        hadeethModelLis[index].title,
                                        style: TextStyle(
                                          color: AppColors.blackColor,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                          child: Text(
                                            textDirection: TextDirection.rtl,
                                            textAlign: TextAlign.justify,
                                            hadeethModelLis[index].content,
                                            style: TextStyle(
                                              color: AppColors.blackColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  loadAhadeeth() async {
    String ahadeeth = await rootBundle.loadString("assets/Hadeeth/ahadeth.txt");
    List<String> ahadeethLis = ahadeeth.trim().split("#");
    List<HadeethModel> ahadeethFinalList = [];
    for (var i = 0; i < ahadeethLis.length; i++) {
      String hadeeth = ahadeethLis[i].trim();
      String title = hadeeth.split('\n').first;
      int titleLength = title.length;
      String hadeethContet = hadeeth.substring(titleLength);
      ahadeethFinalList.add(
          HadeethModel(content: hadeethContet, title: title, number: i + 1));
    }
    print('-->${ahadeethFinalList.length}');
    hadeethModelLis = ahadeethFinalList;
    setState(() {});
  }
}
