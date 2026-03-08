import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/common/app_colors.dart';
import 'package:islamy/data/models/sura_model.dart';
import 'package:islamy/gen/assets.gen.dart';

class SuraDetailsPage extends StatefulWidget {
  const SuraDetailsPage({super.key});
  static const String routeName = "/suraDetails";

  @override
  State<SuraDetailsPage> createState() => _SuraDetailsPageState();
}

class _SuraDetailsPageState extends State<SuraDetailsPage> {
  List<String> suraAyat = [];
  bool isFiresBuild = true;
  @override
  Widget build(BuildContext context) {
    SuraModel suraDate =
        ModalRoute.of(context)?.settings.arguments as SuraModel;

    if (isFiresBuild) {
      loadSura(suraDate.number);
      isFiresBuild = false;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(suraDate.enName),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(Assets.suraDetailsBg.path))),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 20),
                child: Text(
                  suraDate.arName,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.goldColor),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(20),
                  child: RichText(
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                          style: TextStyle(
                              color: AppColors.goldColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          children: List.generate(
                            suraAyat.length,
                            (index) => TextSpan(
                                text: suraAyat[index] + '(${index + 1}) '),
                          ))),
                ),
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loadSura(int id) async {
    String suraContent = await rootBundle.loadString("assets/Suras/$id.txt");
    List<String> ayat = suraContent.trim().split('\n');
    print('-->${ayat.length}');
    suraAyat = ayat;
    setState(() {});
  }
}
