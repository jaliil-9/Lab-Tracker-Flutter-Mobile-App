import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_tracker_app/generated/l10n.dart';
import 'package:lab_tracker_app/home_page.dart';
import 'package:lab_tracker_app/utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/styles.dart';

class EmailVerifiedScreen extends StatelessWidget {
  const EmailVerifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                Get.to(() => const HomePage());
              },
              icon: const Icon(Icons.close),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(JBSizes.defaultSpace),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Image(
                  image: AssetImage("assets/illustrations/confirmed.png"),
                  height: 300,
                  width: 300),
              const SizedBox(height: JBSizes.spaceBtwSections),

              // Success messsage
              Center(
                child: Text(
                  S.of(context).verified_email,
                  style: JBStyles.h2Light,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: JBSizes.spaceBtwSections),

              // Continue Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const HomePage());
                    },
                    style: JBStyles.primaryButtonStyle(context),
                    child: Text(S.of(context).continu)),
              ),
            ]),
          ),
        ));
  }
}
