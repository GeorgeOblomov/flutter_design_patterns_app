import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_text_styles.dart';
import '../widgets/vertical_space.dart';

class CurvedListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final Color nextColor;
  final Color color;
  final VoidCallback onTap;

  const CurvedListItem({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.color,
    required this.nextColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: nextColor,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(90.0),
            ),
          ),
          padding: const EdgeInsets.only(
            left: 32,
            right: 32,
            top: 32,
            bottom: 52,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                subtitle,
                style: listTileSubtitleTextStyle.copyWith(color: textColor),
              ),
              VerticalSpace(2),
              Text(
                title,
                style: listTileTitleTextStyle.copyWith(color: textColor),
              ),
              VerticalSpace(15),
              Text(
                description,
                style: listTileSubtitleTextStyle.copyWith(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
