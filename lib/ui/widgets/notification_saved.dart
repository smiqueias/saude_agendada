import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scheduled_health/ui/screens/add_medicine/add_medicine_view_model.dart';
import 'package:scheduled_health/ui/theme/app_spacings.dart';
import 'package:scheduled_health/utils/extensions/theme_extension.dart';

class NotificationSaved extends StatelessWidget {
  final TimeOfDay notificationTime;
  final AddMedicineViewModel addMedicineViewModel;
  final int index;

  const NotificationSaved({
    super.key,
    required this.notificationTime,
    required this.addMedicineViewModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacings.xxs_8),
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              leading:
                  Icon(Icons.notifications, color: context.colors.greenSplash),
              title: Text(
                '${notificationTime.hour}:${notificationTime.minute} ',
                style: TextStyle(color: context.colors.black),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.delete_forever,
              color: context.colors.gray700,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return BackdropFilter(
                    // widget para deixar o fundo do alertDialog com blur
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: AlertDialog(
                      content: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Text(
                              'Você quer excluir o alarme ?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(
                              height: AppSpacings.xs_16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    addMedicineViewModel
                                        .removeNotification(index);
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.check,
                                    color: context.colors.greenSplash,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.close,
                                    color: context.colors.danger,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
    );
  }
}
