import 'package:app/logic/logic.dart';
import 'package:app/ui/greeting_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../logic/mocks.dart';

void main() {
  final UserGreetingProvider mockGreetingProvider = MockUserGreetingProvider();

  tearDown(resetMocktailState);

  group('GreetingWidget', () {
    testWidgets('should display loader followed by username', (tester) async {
      when(mockGreetingProvider.getUserGreeting).thenAnswer(
        (_) => Future.delayed(const Duration(seconds: 1)).then(
          (value) => 'Hi',
        ),
      );
      await tester.pumpWidget(
        Directionality(
          textDirection: TextDirection.ltr,
          child: ProviderScope(
            overrides: [
              userGreetingProvider.overrideWithValue(mockGreetingProvider),
            ],
            child: const GreetingWidget(),
          ),
        ),
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.text('Hi'), findsOneWidget);
    });
  });
}
