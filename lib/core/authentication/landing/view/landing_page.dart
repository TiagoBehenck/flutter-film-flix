import 'package:filme_flix/common/styles/text/app_text_styles.dart';
import 'package:filme_flix/common/extensions/build_context_extension.dart';
import 'package:filme_flix/core/navigation/routes_constants.dart';
import 'package:filme_flix/widgets/buttons/primary_button.dart';
import 'package:filme_flix/widgets/buttons/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/the_last_jedi.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: context.height * .33,
            width: context.width,
            padding: const EdgeInsets.symmetric(vertical: 29, horizontal: 19),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(.9),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "What movies anytime anywhere",
                  style: AppTextStyles.h3,
                ),
                SizedBox(height: context.height * .01),
                Text(
                  "Explore a vast collection of blockbuster movies, timeless classics and the latest releases.",
                  textAlign: TextAlign.center,
                  style:  AppTextStyles.captionMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: context.height * .01),
                PrimaryButton(
                  onPressed: () => context.push(RoutesConstants.login),
                  text: "Login",
                ),
                SecondaryButton(
                  onPressed: () => context.push(RoutesConstants.signup),
                  text: "Sign Up",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
