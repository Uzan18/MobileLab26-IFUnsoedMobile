// ignore_for_file: unused_import
import 'package:flutter/material.dart';

// Import seluruh halaman latihan dari Modul 2
import 'package:belajarflutter/hello_world.dart';
import 'package:belajarflutter/column_widget.dart';
import 'package:belajarflutter/row_widget.dart';
import 'package:belajarflutter/ui/produk_form.dart';
import 'package:belajarflutter/ui/produk_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Flutter Pertama",
      debugShowCheckedModeBanner: false,
      
      // Tema disesuaikan agar warna AppBar biru persis seperti screenshot modul
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),

      // ==============================================================
      // Pilihan halaman untuk diuji:
      // 1. HelloWorld()    -> Latihan Bagian 6 & 7 (Halaman 16-19)
      // 2. ColumnWidget()  -> Latihan Bagian 8 (Halaman 19-20)
      // 3. RowWidget()     -> Latihan Bagian 9 (Halaman 21)
      // 4. ProdukForm()    -> Latihan Bagian 10 Form & Navigasi (Halaman 21-24)
      // 5. ProdukPage()    -> Latihan Bagian 11 ListView (Halaman 25-26 - Hasil Akhir)
      // ==============================================================

      home: const ProdukPage(), // Default: Hasil akhir modul (ListView Produk)
    );
  }
}
