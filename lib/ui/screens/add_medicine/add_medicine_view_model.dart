import 'package:flutter/material.dart';
import 'package:scheduled_health/utils/base_view_model.dart';

final class AddMedicineViewModel extends BaseViewModel {
  final List<TimeOfDay> listNotificationSaved = [];
  TimeOfDay selectedTimeNow = TimeOfDay.now();

  void addNotification(TimeOfDay? savedTime) {
    if (savedTime != null) {
      listNotificationSaved.add(savedTime);
      notify();
    }
  }

  void removeNotification(int index) {
    listNotificationSaved.removeAt(index);
    notify();
  }
}
