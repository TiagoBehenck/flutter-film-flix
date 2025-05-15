// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:filme_flix/app/common/extensions/build_context_extension.dart';
import 'package:filme_flix/app/common/styles/text/app_text_styles.dart';

class SecondaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const SecondaryButton(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: context.width,
        height: 52,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).colorScheme.primary),
              borderRadius: const BorderRadius.all(Radius.circular(4)),
            ),
            backgroundColor: Colors.transparent,
          ),
          child: Text(
            text,
            style: AppTextStyles.buttonMedium.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
