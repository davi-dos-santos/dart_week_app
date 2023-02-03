import 'package:dart_week_app/app/core/ui/styles/colors_app.dart';
import 'package:dart_week_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static AppStyles? _instance;

  AppStyles._();
  static AppStyles get i {
    _instance ??= AppStyles._();
    return _instance!;
  }

  ButtonStyle get primaryBotton => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        backgroundColor: ColorsApp.i.primary,
        textStyle: TextStyles.i.TextButtonLabel,
      );
}

extension AppStyleExtensions on BuildContext {
  AppStyles get appStyles => AppStyles.i;
}
