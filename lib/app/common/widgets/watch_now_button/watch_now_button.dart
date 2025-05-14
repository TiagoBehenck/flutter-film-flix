// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:filme_flix/app/common/styles/text/app_text_styles.dart';
import 'package:filme_flix/app/common/utils/launch_url.dart';

class WatchNowButton extends StatelessWidget {
  const WatchNowButton({
    required this.homepageUrl,
    super.key,
  });

  final String homepageUrl;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (homepageUrl.isNotEmpty) {
          UrlLauncherService().launch(homepageUrl);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No homepage available'),
            ),
          );
        }
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          const EdgeInsets.all(0.0),
        ),
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      ),
      child: Ink(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff065f37),
              Color(0xff32A873),
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 88.0,
            minHeight: 45.0,
          ),
          alignment: Alignment.center,
          child:  Text(
            'Watch now',
            textAlign: TextAlign.center,
            style: AppTextStyles.buttonLarge,
          ),
        ),
      ),
    );
  }
}
