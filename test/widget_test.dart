import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:belajarflutter/main.dart';

void main() {
  setUp(() {
    SharedPreferences.setMockInitialValues({});
  });

  testWidgets('Login gagal dengan username dan password salah',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Login'), findsWidgets);
    expect(find.text('Masukkan Username'), findsOneWidget);
    expect(find.text('Masukkan Password'), findsOneWidget);

    await tester.enterText(
        find.widgetWithText(TextField, 'Masukkan Username'), 'user');
    await tester.enterText(
        find.widgetWithText(TextField, 'Masukkan Password'), '1234');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pumpAndSettle();

    expect(find.text('Username dan Password Salah'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget);

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();
  });

  testWidgets('Login berhasil, HomePage, Drawer, dan AboutPage',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    await tester.enterText(
        find.widgetWithText(TextField, 'Masukkan Username'), 'admin');
    await tester.enterText(
        find.widgetWithText(TextField, 'Masukkan Password'), 'admin');
    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pumpAndSettle();

    expect(find.text('Anda Berhasil Login'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget);

    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    expect(find.text('Home Page'), findsOneWidget);
    expect(find.text('Ini adalah halaman User admin'), findsOneWidget);

    final scaffoldFinder = find.byType(Scaffold);
    final ScaffoldState scaffoldState = tester.state(scaffoldFinder.last);
    scaffoldState.openDrawer();
    await tester.pumpAndSettle();

    expect(find.text('Sidemenu'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('About'), findsOneWidget);

    await tester.tap(find.text('About'));
    await tester.pumpAndSettle();

    expect(find.text('About Page'), findsOneWidget);
    expect(find.text('Ini adalah halaman About'), findsOneWidget);

    final ScaffoldState aboutScaffoldState =
        tester.state(find.byType(Scaffold).last);
    aboutScaffoldState.openDrawer();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Home'));
    await tester.pumpAndSettle();

    expect(find.text('Home Page'), findsOneWidget);
    expect(find.text('Ini adalah halaman User admin'), findsOneWidget);
  });
}
