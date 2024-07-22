import 'package:flutter/material.dart';
import 'package:scheduled_health/ui/theme/app_spacings.dart';
import 'package:scheduled_health/utils/extensions/theme_extension.dart';

class NotificationSaved extends StatefulWidget {
  final TimeOfDay notificationTime;
  const NotificationSaved({super.key, required this.notificationTime});

  @override
  State<NotificationSaved> createState() => _NotificationSavedState();
}

class _NotificationSavedState extends State<NotificationSaved> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacings.xxs_8),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  backgroundColor: context.colors.gray200,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.notifications, color: context.colors.greenSplash),
                  Text(
                    '${widget.notificationTime.hour}:${widget.notificationTime.minute} ',
                    style: TextStyle(color: context.colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
