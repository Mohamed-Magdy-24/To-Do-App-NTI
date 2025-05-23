import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:to_do_app/core/cache/cache_helper.dart';
import 'package:to_do_app/core/cache/shared_preferenece_key.dart';
import 'package:to_do_app/core/theme/app_light_color.dart';
import 'package:to_do_app/core/theme/app_text_style.dart';
import 'package:to_do_app/core/utils/app_image.dart';
import 'package:to_do_app/core/utils/app_string.dart';
import 'package:to_do_app/core/widget/custom_circle_progress_inicator.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key, this.trailing, this.onTapImage});

  final Widget? trailing;
  final void Function()? onTapImage;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  CacheHelper cacheHelper = CacheHelper();

  String? image;
  String name = '';

  @override
  void initState() {
    log("Initial Custom App Bar");
    image = cacheHelper.getDataString(key: SharedPrefereneceKey.imagepath);
    name = cacheHelper.getDataString(key: SharedPrefereneceKey.username) ??
        "No Name";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: InkWell(
        onTap: widget.onTapImage,
        child: Container(
          height: 60,
          width: 60,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: image == null
              ? Image.asset(
                  AppImage.kAuthLogoPng,
                  fit: BoxFit.fill,
                )
              : Image.network(
                  image!,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return CustomCircleProgressInicator();
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Center(
                        child: Text(
                      "!",
                      style: AppTextStyle.light19(color: AppLightColor.red),
                    ));
                  },
                ),
        ),
      ),
      title: Text(
        AppString.helloHomeScreen,
        style: AppTextStyle.light12(),
      ),
      subtitle: Text(
        name,
        style: AppTextStyle.light16,
      ),
      trailing: widget.trailing,
    );
  }
}
