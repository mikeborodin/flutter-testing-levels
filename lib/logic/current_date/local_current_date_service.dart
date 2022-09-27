import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'current_date_service.dart';

final currentDateServiceProvider = Provider<CurrentDateService>((ref) {
  return LocalCurrentDateService();
});

class LocalCurrentDateService implements CurrentDateService {
  @override
  DateTime now() => DateTime.now();
}
