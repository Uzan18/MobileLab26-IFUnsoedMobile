import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:belajarflutter/main.dart';
import 'package:belajarflutter/model/produk.dart';
import 'package:belajarflutter/ui/registrasi_page.dart';
import 'package:belajarflutter/ui/login_page.dart';
import 'package:belajarflutter/ui/produk_form.dart';
import 'package:belajarflutter/ui/produk_detail.dart';

void main() {
  testWidgets('Test Modul 5: Halaman Registrasi validation test',
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

  testWidgets('Test Modul 5: Halaman Login & navigasi ke Registrasi',
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

  testWidgets('Test Modul 5: Initial App Launch shows LoginPage when unauthenticated',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    await tester.pumpWidget(const MyApp());
    await tester.pump();
    await tester.pumpAndSettle();

    expect(find.byType(LoginPage), findsOneWidget);
    expect(find.text('Login'), findsWidgets);
  });

  testWidgets('Test Modul 5: Halaman Tambah Produk (ProdukForm)',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ProdukForm()));
    expect(find.text('TAMBAH PRODUK'), findsOneWidget);
    expect(find.text('SIMPAN'), findsOneWidget);
  });

  testWidgets('Test Modul 5: Halaman Ubah Produk (ProdukForm)',
      (WidgetTester tester) async {
    Produk dummy = Produk(id: 1, kodeProduk: 'A001', namaProduk: 'Kamera', hargaProduk: 5000000);
    await tester.pumpWidget(MaterialApp(home: ProdukForm(produk: dummy)));
    expect(find.text('UBAH PRODUK'), findsOneWidget);
    expect(find.text('UBAH'), findsOneWidget);
  });

  testWidgets('Test Modul 5: Halaman Detail Produk & Dialog Konfirmasi Hapus',
      (WidgetTester tester) async {
    Produk dummy = Produk(id: 1, kodeProduk: 'A001', namaProduk: 'Kamera', hargaProduk: 5000000);
    await tester.pumpWidget(MaterialApp(home: ProdukDetail(produk: dummy)));

    expect(find.text('Detail Produk'), findsOneWidget);
    expect(find.text('Kode : A001'), findsOneWidget);
    expect(find.text('Nama : Kamera'), findsOneWidget);
    expect(find.text('Harga : Rp. 5000000'), findsOneWidget);
    expect(find.text('EDIT'), findsOneWidget);
    expect(find.text('DELETE'), findsOneWidget);

    await tester.tap(find.text('DELETE'));
    await tester.pumpAndSettle();

    expect(find.text('Yakin ingin menghapus data ini?'), findsOneWidget);
    await tester.tap(find.text('Batal'));
    await tester.pumpAndSettle();
  });
}
