import 'package:flutter/material.dart';
import 'package:scheduled_health/utils/enum/view_model_state_enum.dart';

base class BaseViewModel extends ChangeNotifier {
  ViewModelStateEnum state = ViewModelStateEnum.idle;

  bool isDisposed = false;

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }

  void notify() {
    if (!isDisposed) {
      notifyListeners();
    }
  }
}
