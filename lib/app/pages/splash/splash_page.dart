import 'package:dart_week_app/app/core/ui/Helpers/size_extensions.dart';
import 'package:dart_week_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: const Color(0XFF140E0E),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: context.screenHeight,
                child: Image.asset(
                  'assets/images/lanche.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: context.percentHeight(.30),
                  ),
                  Image.asset('assets/images/logo.png'),
                  const SizedBox(
                    height: 80,
                  ),
                  DeliveryButton(
                      width: context.percentHeight(.6),
                      height: 35,
                      label: 'Acessar',
                      onPressed: () {
                        Navigator.of(context).popAndPushNamed('/home');
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
