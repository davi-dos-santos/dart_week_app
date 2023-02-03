import 'package:dart_week_app/app/core/config/env/env.dart';
import 'package:dart_week_app/app/core/ui/Helpers/size_extensions.dart';
import 'package:dart_week_app/app/core/ui/styles/app_styles.dart';
import 'package:dart_week_app/app/core/ui/styles/colors_app.dart';
import 'package:dart_week_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Column(
        children: [
          Container(),
          DeliveryButton(
            width: 200,
            height: 50,
            label: Env.i['backend_base_url'] ?? '',
            onPressed: () {},
          ),
          Text(context.screenWidth.toString()),
          Row(
            children: [
              Container(
                color: Colors.blue,
                width: context.percentWith(.6),
                height: 50,
              ),
              Container(
                color: Colors.black,
                width: context.percentWith(.4),
                height: 50,
              ),
            ],
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Text'),
          )
        ],
      ),
    );
  }
}
