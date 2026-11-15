import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:belajarflutter/main.dart';
import 'package:belajarflutter/ui/registrasi_page.dart';
import 'package:belajarflutter/ui/login_page.dart';
import 'package:belajarflutter/ui/produk_form.dart';
import 'package:belajarflutter/ui/produk_detail.dart';

void main() {
  testWidgets('Test Modul 4: Halaman Registrasi validation test',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: RegistrasiPage()));

    expect(find.text('Registrasi'), findsWidgets);
    expect(find.byType(TextFormField), findsNWidgets(4));

    await tester.tap(find.widgetWithText(ElevatedButton, 'Registrasi'));
    await tester.pump();

    expect(find.text('Nama harus diisi minimal 3 karakter'), findsOneWidget);
    expect(find.text('Email harus diisi'), findsOneWidget);
    expect(find.text('Password harus diisi minimal 6 karakter'), findsOneWidget);
  });

  testWidgets('Test Modul 4: Halaman Login & navigasi ke Registrasi',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    expect(find.text('Login'), findsWidgets);
    expect(find.byType(TextFormField), findsNWidgets(2));

    await tester.tap(find.widgetWithText(ElevatedButton, 'Login'));
    await tester.pump();

    expect(find.text('Email harus diisi'), findsOneWidget);
    expect(find.text('Password harus diisi'), findsOneWidget);

    await tester.tap(find.text('Registrasi'));
    await tester.pumpAndSettle();

    expect(find.byType(RegistrasiPage), findsOneWidget);
  });

  testWidgets('Test Modul 4: Halaman List Produk, Tambah, dan Detail Produk',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('List Produk'), findsOneWidget);
    expect(find.text('Kamera'), findsOneWidget);
    expect(find.text('Kulkas'), findsOneWidget);
    expect(find.text('Mesin Cuci'), findsOneWidget);

    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    expect(find.byType(ProdukForm), findsOneWidget);
    expect(find.text('TAMBAH PRODUK'), findsOneWidget);
    expect(find.text('SIMPAN'), findsOneWidget);

    await tester.pageBack();
    await tester.pumpAndSettle();

    await tester.tap(find.text('Kamera'));
    await tester.pumpAndSettle();

    expect(find.byType(ProdukDetail), findsOneWidget);
    expect(find.text('Detail Produk'), findsOneWidget);
    expect(find.text('Kode : A001'), findsOneWidget);
    expect(find.text('Nama : Kamera'), findsOneWidget);
    expect(find.text('EDIT'), findsOneWidget);
    expect(find.text('DELETE'), findsOneWidget);

    await tester.tap(find.text('DELETE'));
    await tester.pumpAndSettle();

    expect(find.text('Yakin ingin menghapus data ini?'), findsOneWidget);
    await tester.tap(find.text('Batal'));
    await tester.pumpAndSettle();
  });
}
