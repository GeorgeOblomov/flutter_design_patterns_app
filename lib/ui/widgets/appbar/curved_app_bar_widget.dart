import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../logic/navigation/app_router.dart';
import '../../../logic/provider/theme_model.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/utils.dart';
import '../../items/app_bar_item.dart';
import '../heart_animated_widget.dart';
import '../horizontal_space.dart';
import '../vertical_space.dart';

class CurvedAppBarWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color color;

  const CurvedAppBarWidget({
    required this.title,
    required this.color,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final themeModel = context.watch<ThemeModel>();

    return Material(
      child: Container(
        color: backgroundColor,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(90.0),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 64,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(color: textColor, fontSize: 32, fontWeight: FontWeight.bold),
                ),
                VerticalSpace(32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppBarItem(
                      DayNightSwitcher(
                        isDarkModeEnabled: !themeModel.isLight,
                        onStateChanged: (isDarkModeEnabled) =>
                            themeModel.setIsLight(!isDarkModeEnabled),
                      ),
                      'Theme',
                      () => themeModel.setIsLight(!themeModel.isLight),
                    ),
                    HorizontalSpace(32),
                    AppBarItem(
                      HeartAnimatedWidget(),
                      'Favorite',
                      () {
                        navigate(
                          Navigation.favoriteRoute,
                          argument: {'color': mainBackgroundColor},
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
