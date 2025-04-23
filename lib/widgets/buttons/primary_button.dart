import 'package:filme_flix/common/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.text
  });

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
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            backgroundColor:Theme.of(context).colorScheme.primary,
          ),
          child: Text(
            text,
            style: TextStyle(
              color:Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          ),
      ),
    );
  }
}