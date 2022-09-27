import 'package:app/logic/logic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeOfDayProvider = Provider<TimeOfDayProvider>((ref) {
  return TimeOfDayProvider(
    ref.watch(currentDateServiceProvider),
  );
});

class TimeOfDayProvider {
  final CurrentDateService _currenDate;

  TimeOfDayProvider(this._currenDate);
  TimeOfDayName now() {
    final hour = _currenDate.now().hour;
    if (hour >= 6 && hour < 10) return TimeOfDayName.morning;
    if (hour >= 10 && hour < 18) return TimeOfDayName.day;
    if (hour >= 18 && hour < 23) return TimeOfDayName.evening;
    return TimeOfDayName.night;
  }
}
