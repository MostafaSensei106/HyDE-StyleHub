import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyde_stylehub/core/config/const/hyde_const.dart';
import 'package:hyde_stylehub/core/widgets/textbutton_component/textbutton_component.dart';


void appAbout(BuildContext context) {
  Navigator.pop(context);
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(HyDEConst.outBorderRadius.r),
      ),
      title: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(HyDEConst.inBorderRadius.r),
          clipBehavior: Clip.antiAlias,
          child: Image.asset(
            width: 45.w,
            height: 45.w,
            HyDEConst.appImage,
          ),
        ),
        SizedBox(
          width: 10.w,
        ),
        Column(
          children: [
            Text(
              'About',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Text(
              'v${SenseiConst.appVersion}',
            ),
          ],
        )
      ]),
      content: Container(
        padding: EdgeInsets.all(HyDEConst.padding.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(HyDEConst.inBorderRadius.r),
          color: Theme.of(context).colorScheme.surfaceContainer,
        ),
        child: Text(
          'تم تطوير هذا التطبيق من اجل دعم القضية الفسطينيةو مقاطعة الشركات الداعمة لالاحتلا الصهيوني',
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 16.sp,
          ),
        ),
      ),
      actions: <Widget>[
        TextButtonComponent(
          icon: Icons.close,
          onTap: () => Navigator.pop(context),
          text: S.of(context).close,
          isClose: true,
        ),
        TextButtonComponent(
          icon: Icons.difference_outlined,
          onTap: () {
            showLicensePage(
              context: context,
              applicationName: SenseiConst.appName,
              applicationLegalese:
                  'Copyright 2024 - ${DateTime.now().year} Mostafa Mahmoud. Licensed under GPL-3.0.',
              applicationIcon: Container(
                padding: EdgeInsets.all(HyDEConst.padding.w),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius:
                        BorderRadius.circular(HyDEConst.outBorderRadius.r),
                    border: Border.all(
                      color:
                          Theme.of(context).colorScheme.outline.withAlpha(0x80),
                    )),
                child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(HyDEConst.inBorderRadius.r),
                    child: Image.asset(
                        width: 100, height: 100, HyDEConst.appImage)),
              ),
              applicationVersion: 'v${HyDEConst.appVersion}',
              useRootNavigator: true,
            );
          },
          text: 'الترخيص',
        ),
      ],
    ),
  );
}
