import 'package:dart_week_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import '../styles/app_styles.dart';
import '../styles/colors_app.dart';

class ThemeConfig {
  ThemeConfig._();
  static final _defaultInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: BorderSide(color: Colors.grey[400]!));

  static final Theme = ThemeData(
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0, //elevação do appbar
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black)),
      primaryColor: ColorsApp.i.primary,
      colorScheme: ColorScheme.fromSeed(
        seedColor: ColorsApp.i.primary,
        primary: ColorsApp.i.primary,
        secondary: ColorsApp.i.secundary,
      ),
      elevatedButtonTheme:
          ElevatedButtonThemeData(style: AppStyles.i.primaryBotton),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: Colors.white,
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.all(13),
        border: _defaultInputBorder,
        enabledBorder: _defaultInputBorder,
        focusedBorder: _defaultInputBorder,
        labelStyle: TextStyles.i.textRebular.copyWith(color: Colors.black),
        errorStyle: TextStyles.i.textRebular.copyWith(color: Colors.redAccent),
      ));
}
