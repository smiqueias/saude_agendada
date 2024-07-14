import 'package:scheduled_health/core/app_manager.dart';
import 'package:scheduled_health/utils/base_view_model.dart';

final class HomeViewModel extends BaseViewModel {
  final AppManager _appManager;

  AppManager get manager => _appManager;

  HomeViewModel({
    required AppManager appManager,
  }) : _appManager = appManager;
}
