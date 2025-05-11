import 'package:flutter/material.dart';
import 'package:to_do_app/core/function/app_route.dart';
import 'package:to_do_app/core/theme/app_light_color.dart';
import 'package:to_do_app/core/theme/app_text_style.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widget/custom_arrow_back.dart';
import 'package:to_do_app/features/profile/presentation/profile_screen.dart';
import 'package:to_do_app/features/settings/presentation/widget/setting_screen_body.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SettingScreenBody(),
      appBar: AppBar(
        backgroundColor: AppLightColor.scaffoldBackground,
        centerTitle: true,
        title: Text(
          AppString.settings,
          style: AppTextStyle.light19(
            color: AppLightColor.kTextblack,
          ),
        ),
        leading: CustomArrowBack(
          onTap: () {
            AppRoute.navigateTo(
              ProfileScreen(),
            );
          },
        ),
      ),
    );
  }
}
