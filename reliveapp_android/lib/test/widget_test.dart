import 'package:flutter_test/flutter_test.dart';
import 'package:relive_app/main.dart';

void main() {
  testWidgets('App starts correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const ReliveApp()); // Removed 'const'
    expect(find.text('Welcome to Relive App!'), findsOneWidget);
  });
}
