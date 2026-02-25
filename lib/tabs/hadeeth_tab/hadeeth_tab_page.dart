import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islamy/common/widgets/bg_layout_widget.dart';
import 'package:islamy/gen/assets.gen.dart';

class HadeethTabPage extends StatelessWidget {
  const HadeethTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [BgLayoutWidget(imagePAth: Assets.hadeethTabBg.path)],
    );
  }
}
