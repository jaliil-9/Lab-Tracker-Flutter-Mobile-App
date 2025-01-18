import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/data/repositories/authentication/authentication_repository.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import 'package:lab_tracker_app/features/personalization/screens/general/about_page.dart';
import 'package:lab_tracker_app/features/personalization/screens/account/account_set_page.dart';
import 'package:lab_tracker_app/features/personalization/screens/general/help.page.dart';
import 'package:lab_tracker_app/features/personalization/screens/general/gen_set_page.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthenticationRepository());

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
            child: Text(
              S.of(context).settings_title,
              style: const TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(JBSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: JBSizes.spaceBtwSections),
            SettingItem(
                icon: Icons.settings,
                text: S.of(context).general,
                iconColor: Colors.grey,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => GeneralSettingsPage(),
                    ),
                  );
                }),
            const Divider(),
            SettingItem(
                icon: Icons.account_circle,
                text: S.of(context).account,
                iconColor: Colors.green,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const AccountSettingsPage(),
                    ),
                  );
                }),
            const Divider(),
            SettingItem(
                icon: Icons.help,
                text: S.of(context).help,
                iconColor: Colors.orange,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const HelpPage(),
                    ),
                  );
                }),
            const Divider(),
            SettingItem(
                icon: Icons.info,
                text: S.of(context).about,
                iconColor: Colors.purple,
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const AboutPage()));
                }),
            const Divider(),
            const SizedBox(height: 150),
            const Divider(),
            SettingItem(
                icon: Icons.logout,
                text: S.of(context).logout,
                iconColor: Colors.red,
                onTap: () {
                  controller.logout();
                }),
          ],
        ),
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
    required this.onTap,
  });

  final IconData icon;
  final String text;
  final Color iconColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          icon,
          color: iconColor,
          size: 30,
        ),
        title: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
