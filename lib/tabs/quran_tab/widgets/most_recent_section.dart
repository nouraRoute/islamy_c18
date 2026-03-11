import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islamy/common/app_colors.dart';
import 'package:islamy/data/models/sura_model.dart';
import 'package:islamy/gen/assets.gen.dart';

class MostRecentSection extends StatelessWidget {
  const MostRecentSection({super.key, required this.mostRecent});
  final List<SuraModel> mostRecent;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: mostRecent.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 10),
            child: Text(
              "Most recent",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mostRecent.length,
              itemBuilder: (context, index) {
                SuraModel suraModel = mostRecent[index];
                return Card(
                  color: AppColors.goldColor,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 12.0,
                          bottom: 20.0,
                          left: 17,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              suraModel.enName,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              suraModel.arName,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${suraModel.versesCount} verses",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Image.asset(Assets.suraImage.path),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
