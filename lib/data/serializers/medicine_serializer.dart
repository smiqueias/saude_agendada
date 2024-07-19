import 'package:scheduled_health/data/serializers/serializer.dart';
import 'package:scheduled_health/domain/entities/medicine.dart';

sealed class MedicineKeys {
  static const uuid = 'uuid';
  static const name = 'name';
  static const isCompleted = 'isCompleted';
  static const isRecurrent = 'isRecurrent';
  static const quantity = 'quantity';
  static const notificationDate = 'notificationDate';
  static const howLong = 'howLong';
}

final class MedicineSerializer
    implements Serializer<Medicine, Map<String, dynamic>> {
  MedicineSerializer._();

  static final MedicineSerializer _instance = MedicineSerializer._();
  static MedicineSerializer get shared => _instance;

  @override
  Medicine from(Map<String, dynamic> json) {
    return Medicine(
      isCompleted: json[MedicineKeys.isCompleted] as bool,
      name: json[MedicineKeys.name] as String,
      isRecurrent: json[MedicineKeys.isRecurrent] as bool,
      quantity: json[MedicineKeys.quantity] as int,
      notificationDate: json[MedicineKeys.notificationDate] as String,
      uuid: json[MedicineKeys.uuid] as String,
      howLong: json[MedicineKeys.howLong] as int,
    );
  }

  @override
  Map<String, dynamic> to(Medicine object) => <String, dynamic>{
        MedicineKeys.uuid: object.uuid,
        MedicineKeys.name: object.name,
        MedicineKeys.isCompleted: object.isCompleted,
        MedicineKeys.isRecurrent: object.isRecurrent,
        MedicineKeys.quantity: object.quantity,
        MedicineKeys.notificationDate: object.notificationDate,
        MedicineKeys.howLong: object.howLong,
      };
}
