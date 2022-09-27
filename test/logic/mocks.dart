import 'package:app/logic/logic.dart';
import 'package:mocktail/mocktail.dart';

class MockCurrentDateService extends Mock implements CurrentDateService {}

class MockUserRepository extends Mock implements UserRepository {}

class MockTimeOfDayProvider extends Mock implements TimeOfDayProvider {}

class MockUserGreetingProvider extends Mock implements UserGreetingProvider {}
