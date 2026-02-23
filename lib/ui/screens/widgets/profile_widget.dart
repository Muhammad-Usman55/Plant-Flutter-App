import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  const ProfileWidget({
    Key? key,
    required this.icon,
    required this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;
    return GestureDetector(
      onTap: onTap,
      child: Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: textColor?.withOpacity(.5),
                size: 24,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: textColor?.withOpacity(.4),
            size: 16,
          )
        ],
      ),
    ),
    );
  }
}