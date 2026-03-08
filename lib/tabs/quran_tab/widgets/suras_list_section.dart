import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy/data/models/sura_model.dart';
import 'package:islamy/data/quran_data.dart';
import 'package:islamy/gen/assets.gen.dart';
import 'package:islamy/tabs/quran_tab/sura_details_page.dart';

class SurasListSection extends StatelessWidget {
  const SurasListSection({super.key, required this.suras});

  final List<SuraModel> suras;
  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "suras list",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ),
        SliverList.builder(
          itemCount: suras.length,
          itemBuilder: (context, index) {
            var sura = suras[index];
            return ListTile(
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.all(0),
              onTap: () => Navigator.of(context)
                  .pushNamed(SuraDetailsPage.routeName, arguments: sura),
              title: Text(
                sura.enName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                sura.versesCount,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              trailing: Text(
                sura.arName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              leading: Stack(
                alignment: Alignment.center,
                children: [
                  SvgPicture.asset(Assets.verseIcon),
                  Text(
                    sura.number.toString(),
                    style: TextStyle(
                      fontSize: index > 99 ? 16 : 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
