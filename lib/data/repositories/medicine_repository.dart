import 'package:scheduled_health/data/db/sembast.dart';
import 'package:scheduled_health/data/serializers/medicine_serializer.dart';
import 'package:scheduled_health/domain/entities/medicine.dart';
import 'package:sembast/sembast.dart';

abstract interface class MedicineRepository {
  Future<void> registerMedicine({required Medicine medicine});
  Future<List<Medicine>> fetchMedicines({required String medicineId});
}

final class MedicineRepositoryImpl implements MedicineRepository {
  final SembastDatabase _db;

  MedicineRepositoryImpl({required SembastDatabase db}) : _db = db;

  final _medicineStore = 'medicine_store';

  @override
  Future<List<Medicine>> fetchMedicines({required String medicineId}) async {
    try {
      final medicines = await _db.getAll(
        store: _medicineStore,
        finder: Finder(
          filter: Filter.equals(MedicineKeys.uuid, medicineId),
        ),
      );
      return medicines.map(MedicineSerializer.shared.from).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> registerMedicine({required Medicine medicine}) async {
    try {
      await _db.put(
        id: medicine.uuid,
        object: MedicineSerializer.shared.to(medicine),
        store: _medicineStore,
      );
    } catch (e) {
      rethrow;
    }
  }
}
