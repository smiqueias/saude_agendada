import 'package:flutter/material.dart';
import 'package:scheduled_health/utils/extensions/theme_extension.dart';

class NotificationSaved extends StatefulWidget {
  const NotificationSaved({super.key});

  @override
  State<NotificationSaved> createState() => _NotificationSavedState();
}

class _NotificationSavedState extends State<NotificationSaved> {
  TimeOfDay selectedTimeNow = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Row(
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
                  '${selectedTimeNow.hour}:${selectedTimeNow.minute} ',
                  style: TextStyle(color: context.colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
