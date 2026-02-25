import 'package:flutter/widgets.dart';
import 'package:islamy/common/app_colors.dart';

class BgLayoutWidget extends StatelessWidget {
  const BgLayoutWidget({super.key, required this.imagePAth});
  final String imagePAth;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          imagePAth,
          height: double.infinity,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.blackColor,
                AppColors.blackColor.withValues(alpha: .7),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
      ],
    );
  }
}
