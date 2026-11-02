import 'package:flutter/material.dart';

class ProdukDetail extends StatelessWidget {
  final String? kodeProduk;
  final String? namaProduk;
  final int? harga;

  const ProdukDetail({
    super.key,
    this.kodeProduk,
    this.namaProduk,
    this.harga,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Kode Produk : $kodeProduk"),
            Text("Nama Produk : $namaProduk"),
            Text("Harga Produk : $harga"),
          ],
        ),
      ),
    );
  }
}
