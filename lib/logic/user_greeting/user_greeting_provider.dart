import 'package:app/logic/time_of_day/time_of_day_name.dart';
import 'package:app/logic/time_of_day/time_of_day_provider.dart';
import 'package:app/logic/user/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userGreetingProvider = Provider<UserGreetingProvider>((ref) {
  return UserGreetingProvider(
    ref.watch(timeOfDayProvider),
    ref.watch(userRepositoryProvider),
  );
});

class UserGreetingProvider {
  final TimeOfDayProvider _timeOfDay;
  final UserRepository _user;

  UserGreetingProvider(
    this._timeOfDay,
    this._user,
  );

  Future<String> getUserGreeting() async {
    final username = await _user.getName();
    if (username.isEmpty) {
      return 'Hey';
    }
    final greetings = {
      TimeOfDayName.day: 'Hello $username',
      TimeOfDayName.morning: 'Good morning!',
      TimeOfDayName.evening: 'Good evening $username',
      TimeOfDayName.night: 'Sleep well, dear $username',
    };
    final timeOfDay = _timeOfDay.now();
    return greetings[timeOfDay]!;
  }
}
