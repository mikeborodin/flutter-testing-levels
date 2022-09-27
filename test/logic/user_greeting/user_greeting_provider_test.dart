import 'package:app/logic/logic.dart';
import 'package:flutter/foundation.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../mocks.dart';

void main() {
  final UserRepository user = MockUserRepository();
  final TimeOfDayProvider timeOfDay = MockTimeOfDayProvider();
  late UserGreetingProvider userGreetingProvider;

  setUp(() {
    userGreetingProvider = UserGreetingProvider(
      timeOfDay,
      user,
    );
  });

  tearDown(resetMocktailState);

  group('UserGreetingProvider', () {
    test('should return "Hello {username}" during the day', () async {
      when(user.getName).thenAnswer((_) => SynchronousFuture('Dash'));
      when(timeOfDay.now).thenAnswer((_) => TimeOfDayName.day);

      final greeting = await userGreetingProvider.getUserGreeting();

      expect(greeting, 'Hello Dash');
    });

    test('should return "Good morning!" in morning hours', () async {
      when(user.getName).thenAnswer((_) => SynchronousFuture('Dash'));
      when(timeOfDay.now).thenAnswer((_) => TimeOfDayName.morning);

      final greeting = await userGreetingProvider.getUserGreeting();

      expect(greeting, 'Good morning!');
    });

    test('should return "Good evening {username}" in morning hours', () async {
      when(user.getName).thenAnswer((_) => SynchronousFuture('Dash'));
      when(timeOfDay.now).thenAnswer((_) => TimeOfDayName.evening);

      final greeting = await userGreetingProvider.getUserGreeting();

      expect(greeting, 'Good evening Dash');
    });

    test('should return "Sleep well, dear {username}" in morning hours', () async {
      when(user.getName).thenAnswer((_) => SynchronousFuture('Dash'));
      when(timeOfDay.now).thenAnswer((_) => TimeOfDayName.night);

      final greeting = await userGreetingProvider.getUserGreeting();

      expect(greeting, 'Sleep well, dear Dash');
    });

    test('should return "Hey!" in case username is empty', () async {
      when(user.getName).thenAnswer((_) => SynchronousFuture(''));
      when(timeOfDay.now).thenAnswer((_) => TimeOfDayName.night);

      final greeting = await userGreetingProvider.getUserGreeting();

      expect(greeting, 'Hey');
    });
    test('should return "Hey!" in case username is empty', () async {
      when(user.getName).thenAnswer((_) => SynchronousFuture(''));
      when(timeOfDay.now).thenAnswer((_) => TimeOfDayName.night);

      final greeting = await userGreetingProvider.getUserGreeting();

      expect(greeting, 'Hey');
    });
  });
}
