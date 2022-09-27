import 'package:app/logic/logic.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../mocks.dart';

void main() {
  final CurrentDateService currentDate = MockCurrentDateService();
  final timeOfDay = TimeOfDayProvider(currentDate);

  setUp(() {});

  tearDown(resetMocktailState);

  void setTime(TimeOfDay time) {
    when(currentDate.now).thenAnswer((_) => DateTime(2022, 1, 1, time.hour, time.minute));
  }

  group('TimeOfDayProvider', () {
    test('should return morning between 06-10: start', () async {
      setTime(const TimeOfDay(hour: 6, minute: 0));
      expect(timeOfDay.now(), TimeOfDayName.morning);
    });
    test('should return morning between 06-10: end', () async {
      setTime(const TimeOfDay(hour: 9, minute: 59));
      expect(timeOfDay.now(), TimeOfDayName.morning);
    });

    test('should return day between 10-18: start', () async {
      setTime(const TimeOfDay(hour: 10, minute: 0));
      expect(timeOfDay.now(), TimeOfDayName.day);
    });
    test('should return day between 06-10: end', () async {
      setTime(const TimeOfDay(hour: 17, minute: 59));
      expect(timeOfDay.now(), TimeOfDayName.day);
    });

    test('should return evening between 18-23: start', () async {
      setTime(const TimeOfDay(hour: 18, minute: 0));
      expect(timeOfDay.now(), TimeOfDayName.evening);
    });
    test('should return evening between 18-23: end', () async {
      setTime(const TimeOfDay(hour: 22, minute: 59));
      expect(timeOfDay.now(), TimeOfDayName.evening);
    });

    test('should return night between 23-06: start', () async {
      setTime(const TimeOfDay(hour: 23, minute: 0));
      expect(timeOfDay.now(), TimeOfDayName.night);
    });
    test('should return night between 18-23: end', () async {
      setTime(const TimeOfDay(hour: 5, minute: 59));
      expect(timeOfDay.now(), TimeOfDayName.night);
    });
  });
}
