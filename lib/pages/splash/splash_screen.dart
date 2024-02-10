import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:whatsapp_clone/const/Const.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Center(
                child: SvgPicture.asset(
                  Const.whatsappLogo,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
