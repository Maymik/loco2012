import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = Colors.red,
    this.titleColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: TextStyle(
          color: titleColor,
          fontSize: 40,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: [
        PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'Instagram') {
              launchUrl(Uri.parse('https://www.instagram.com/lokomotyv.ua/'));
            } else if (value == 'Facebook') {
              launchUrl(Uri.parse('https://www.facebook.com/lokomotyv2012/'));
            }
          },
          itemBuilder: (context) => [
            const PopupMenuItem(
              value: 'Instagram',
              child: Text('Ми в Instagram'),
            ),
            const PopupMenuItem(
              value: 'Facebook',
              child: Text('Ми в Facebook'),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
