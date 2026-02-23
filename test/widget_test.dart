import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_onboarding/main.dart';

void main() {
  testWidgets('App starts successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Skip'), findsOneWidget);
  });
}
