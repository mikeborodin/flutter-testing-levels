import 'package:app/main.dart';
import 'package:app/ui/home_page.dart';
import 'package:app/ui/name_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('set name should change user greeting', (tester) async {
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(HomePage.setNameButton));

    await tester.pumpAndSettle();
    expect(find.byType(NamePage), findsOneWidget);

    await tester.enterText(find.byKey(NamePage.textField), 'Dash');

    await tester.tap(find.byKey(NamePage.confirmButton));
    await tester.pumpAndSettle();
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.text('Hey'), findsNothing);
  });
}
