import 'package:flutter/material.dart';
import 'package:belajarflutter/ui/produk_detail.dart';

class ProdukForm extends StatefulWidget {
  const ProdukForm({super.key});

  @override
  State<ProdukForm> createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _kodeProdukController = TextEditingController();
  final _namaProdukController = TextEditingController();
  final _hargaProdukController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Produk'),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            _textboxKodeProduk(),
            _textboxNamaProduk(),
            _textboxHarga(),
            _tombolSimpan(),
          ],
        ),
      ),
    );
  }

  Widget _textboxKodeProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: "Kode Produk"),
      controller: _kodeProdukController,
    );
  }

  Widget _textboxNamaProduk() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Produk"),
      controller: _namaProdukController,
    );
  }

  Widget _textboxHarga() {
    return TextField(
      decoration: const InputDecoration(labelText: "Harga"),
      controller: _hargaProdukController,
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        String kodeProduk = _kodeProdukController.text;
        String namaProduk = _namaProdukController.text;
        int harga = int.tryParse(_hargaProdukController.text) ?? 0;
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProdukDetail(
            kodeProduk: kodeProduk,
            namaProduk: namaProduk,
            harga: harga,
          ),
        ));
      },
      child: const Text('Simpan'),
    );
  }
}
