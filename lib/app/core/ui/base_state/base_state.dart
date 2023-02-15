import 'package:bloc/bloc.dart';
import 'package:dart_week_app/app/core/ui/Helpers/loader.dart';
import 'package:dart_week_app/app/core/ui/Helpers/menssages.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class BaseState<T extends StatefulWidget, C extends BlocBase>
    extends State<T> with Loader, Menssages {
  late final C controller;

  @override
  void initState() {
    super.initState();
    controller = context.read<C>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      onReady();
    });
  }

  void onReady() {}
}
