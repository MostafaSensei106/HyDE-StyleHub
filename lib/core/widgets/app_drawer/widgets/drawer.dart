import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hyde_stylehub/core/config/const/hyde_const.dart';
import 'package:hyde_stylehub/core/config/theme/colors/logic/cubit/theme_cubit.dart';
import 'package:hyde_stylehub/core/config/theme/colors/logic/cubit/theme_state.dart';
import 'package:hyde_stylehub/core/config/theme/colors/logic/helper/theme_toggle_helper.dart';
import 'package:hyde_stylehub/core/services/url_services/url_services.dart';
import 'package:hyde_stylehub/core/widgets/drawer_component/drawer_component.dart';
import 'package:tadamon/core/config/const/sensei_const.dart';
import 'package:tadamon/core/config/theme/colors/logic/cubit/theme_cubit.dart';
import 'package:tadamon/core/config/theme/colors/logic/cubit/theme_state.dart';
import 'package:tadamon/core/helpers/about_helper.dart';
import 'package:tadamon/core/helpers/dev_helper.dart';
import 'package:tadamon/core/config/theme/colors/logic/helper/theme_toggle_helper.dart';

import 'package:tadamon/core/routing/routes.dart';
import 'package:tadamon/core/services/url_services/url_services.dart';
import 'package:tadamon/core/widgets/bottom_sheet/ui/model_bottom_sheet.dart';
import 'package:tadamon/core/widgets/button_component/button_compnent.dart';
import 'package:tadamon/core/widgets/dilog_components/dilog_waiting_component.dart';
import 'package:tadamon/core/widgets/app_toast/app_toast.dart';
import 'package:tadamon/core/widgets/drawer_component/drawer_component.dart';
import 'package:tadamon/core/widgets/app_drawer/widgets/drawer_header.dart';
import 'package:tadamon/features/pdf_export/logic/cubit/pdf_export_cubit.dart';
import 'package:tadamon/features/pdf_export/logic/cubit/pdf_export_state.dart';
import 'package:tadamon/features/products_scanner/data/repository/objectbox_repositories.dart';
import 'package:tadamon/features/products_scanner/logic/logic/hive_bloc/hive_cubit.dart';
import 'package:tadamon/features/report_products/widgets/report_products_seet_content/report_product_sheet_content.dart';
import 'package:tadamon/generated/l10n.dart';

class SenseiDrawer extends StatelessWidget {
  const SenseiDrawer({super.key});

  /// Creates an [Icon] that is conditionally styled based on the presence of
  /// [WidgetState.selected] in the given [Set] of [WidgetState]s.
  ///
  /// If the set contains [WidgetState.selected], the icon is an [Icons.check]
  /// with the primary color of the current [Theme].  Otherwise, the icon is an
  /// [Icons.close].
  WidgetStateProperty<Icon> thumbIcon(BuildContext context) {
    return WidgetStateProperty.resolveWith<Icon>((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return Icon(Icons.check, color: Theme.of(context).colorScheme.primary);
      }
      return const Icon(Icons.close);
    });
  }

  @override
  /// Builds the main drawer widget for the application.
  ///
  /// This method returns a [SizedBox] containing a [Drawer] widget with a
  /// specified shape and border radius. The drawer contains a [ListView] that
  /// includes a fixed-size [DrawerHeaderWidget] and a padded [AnimatedSize]
  /// widget wrapping a [Column] of various drawer options including theme
  /// switch, mode switch, offline/online toggles, database actions, usage
  /// instructions, reporting, logging, and developer information.
  ///
  /// The width of the drawer scales with the screen size, utilizing 90% of
  /// the screen width. The padding and radius values are defined in the
  /// [SenseiConst] class to ensure consistency with the app's theme.

  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.90.sw,
      child: Drawer(
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(SenseiConst.outBorderRadius.r))),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 0.25.sh, child: const DrawerHeaderWidget()),
            Padding(
              padding: EdgeInsets.only(
                  left: SenseiConst.padding.w,
                  right: SenseiConst.padding.w,
                  bottom: SenseiConst.padding.h),
              child: AnimatedSize(
                duration: const Duration(milliseconds: 300),
                child: Column(
                  children: [
                    _buildThemeSwitch(context),
                    _buildModeSwitch(context),
                    // _buildAppOffline(context),
                    // _buildEnableOnline(context),
                    // _buildUpdateLocalHiveDataBase(context),
                    // _buildDeleteLocalHiveData(context),
                    _buildHowToUse(context),
                    // _buildReportProduct(context),
                    // _buildClearLogs(context),
                    // _buildExportLogs(context),
                    _buildReadMe(context),
                    _buildLetestUpdate(context),
                    _buildGithubToken(context),
                    _buildTelegramChannel(context),
                    _buildDeveloper(context),
                    _buildAbout(context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeSwitch(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      buildWhen: (previous, current) => previous.themeMode != current.themeMode,
      builder: (context, state) {
        return DrawerComponent(
          useMargin: false,
          useDivider: state.themeMode != ThemeMode.system,
          useGroupTop: state.themeMode != ThemeMode.system,
          leadingIcon: Icons.brightness_auto_outlined,
          title: S.of(context).systemTheme,
          subtitle: S.of(context).followSystemTheme,
          trailingWidget: Switch(
            thumbIcon: thumbIcon(context),
            value: state.themeMode == ThemeMode.system,
            onChanged: (bool value) {
              toggleTheme(value, context);
            },
          ),
          onTapped: () {
            HapticFeedback.vibrate();
            bool newValue = !(state.themeMode == ThemeMode.system);
            toggleTheme(newValue, context);
          },
        );
      },
    );
  }

  Widget _buildModeSwitch(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      buildWhen: (previous, current) =>
          previous.isDark != current.isDark ||
          previous.themeMode != current.themeMode,
      builder: (context, state) {
        return state.themeMode == ThemeMode.system
            ? const SizedBox.shrink()
            : DrawerComponent(
                key: ValueKey(state.isDark),
                useGroupBottom: true,
                leadingIcon: state.isDark
                    ? Icons.light_mode_outlined
                    : Icons.dark_mode_outlined,
                title: state.isDark
                    ? S.of(context).darkTheme
                    : S.of(context).lightTheme,
                subtitle: state.isDark
                    ? S.of(context).switchToLightTheme
                    : S.of(context).switchToDarkTheme,
                trailingWidget: Switch(
                  thumbIcon: thumbIcon(context),
                  value: state.isDark,
                  onChanged: (bool value) {
                    context.read<ThemeCubit>().toggleTheme(value);
                  },
                ),
                onTapped: () {
                  HapticFeedback.vibrate();
                  context.read<ThemeCubit>().toggleTheme(!state.isDark);
                },
                useMargin: false,
                useDivider: false,
              );
      },
    );
  }






}

Widget _buildHowToUse(BuildContext context) {
  return DrawerComponent(
      useMargin: true,
      useDivider: true,
      useGroupTop: true,
      leadingIcon: Icons.question_answer_outlined,
      title: S.of(context).howToUse,
      subtitle: S.of(context).howToUseMassage,
      onTapped: () {
        HapticFeedback.vibrate();
        Navigator.pop(context);
        Navigator.pushNamed(context, Routes.userHelp);
      });
}


Widget _buildReadMe(BuildContext context) {
  return DrawerComponent(
    useMargin: true,
    useDivider: true,
    useGroupTop: true,
    leadingIcon: Icons.description_outlined,
    title: S.of(context).readMe,
    subtitle: S.of(context).readMeMassage,
    onTapped: () {
      HapticFeedback.vibrate();
      UrlRunServices.launchURL(
        HyDEConst.devReadMeLink);
    },
  );
}

Widget _buildLetestUpdate(BuildContext context) {
  return DrawerComponent(
    useMargin: false,
    useDivider: true,
    useGroupMiddle: true,
    leadingIcon: Icons.update_outlined,
    title: S.of(context).letastUpdate,
    subtitle: S.of(context).letestUpdateMassage,
    onTapped: () {
      HapticFeedback.vibrate();
      UrlRunServices.launchURL(HyDEConst.devReleaseAppLink);
    },
  );
}

Widget _buildGithubToken(BuildContext context) {
  return DrawerComponent(
    useMargin: false,
    useDivider: true,
    useGroupMiddle: true,
    leadingIcon: Icons.live_help_outlined,
    title: S.of(context).githubTiket,
    subtitle: S.of(context).githubTiketMassage,
    onTapped: () {
      HapticFeedback.vibrate();
      UrlRunServices.launchURL(HyDEConst.devGitHubTokenLink);
    },
  );
}

Widget _buildTelegramChannel(BuildContext context) {
  return DrawerComponent(
      useMargin: false,
      useDivider: false,
      useGroupBottom: true,
      leadingIcon: Icons.discord_outlined,
      title: S.of(context).telegramChannel,
      subtitle: S.of(context).telegramChannelMassage,
      onTapped: () {
        HapticFeedback.vibrate();
        UrlRunServices.launchURL(HyDEConst.devLinkedInLink);
      });
}

Widget _buildDeveloper(BuildContext context) {
  return DrawerComponent(
    useMargin: true,
    useDivider: true,
    useGroupTop: true,
    leadingIcon: Icons.verified_outlined,
    title: S.of(context).developer,
    subtitle: S.of(context).mostafaMahmoud,
    trailingWidget: const ContactSenseiDev().buildAvatar(context),
    onTapped: () => const ContactSenseiDev().showDevDialog(context),
  );
}


Widget _buildAbout(BuildContext context) {
  return DrawerComponent(
    useMargin: false,
    useDivider: false,
    useGroupBottom: true,
    leadingIcon: Icons.info_outline,
    title: S.of(context).about,
    subtitle: S.of(context).about,
    onTapped: () => appAbout(context),
  );
}
