import 'package:filme_flix/common/styles/text/app_text_styles.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title:  Text(
          'Settings',
          style: AppTextStyles.h1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(200),
                  child: Image.network(
                    'https://avatars.githubusercontent.com/u/26827490?v=4',
                    width: 90,
                    height: 90,
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Zeta',
                        style: AppTextStyles.labelPrimary,
                      ),
                      Text(
                        'example@gmail.com',
                        style: AppTextStyles.captionSmall.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.manage_accounts),
              title: Text(
                'Account',
                style: AppTextStyles.labelPrimary,
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.lock_person),
              title: Text(
                'Privacy',
                style: AppTextStyles.labelPrimary,
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.play_circle),
              title: Text(
                'Appearance',
                style: AppTextStyles.labelPrimary,
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: Text(
                'Notifications',
                style: AppTextStyles.labelPrimary,
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.storage),
              title: Text(
                'Storage',
                style: AppTextStyles.labelPrimary,
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.accessibility),
              title: Text(
                'Accessibility',
                style: AppTextStyles.labelPrimary,
              ),
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: const Icon(Icons.help),
              title: Text(
                'Help',
                style: AppTextStyles.labelPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
