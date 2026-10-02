import 'package:flutter/material.dart';
import 'package:kuis_mobile_124240063/models/data.dart';

class DetailScreen extends StatelessWidget {
  final Shoe shoeCatalog;
  DetailScreen({super.key, required this.shoeCatalog});

  int _quantity = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(shoeCatalog.shoeName)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                shoeCatalog.image,
                width: double.infinity,
                height: 220,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 220,
                  color: Colors.grey,
                  child: const Icon(Icons.broken_image, size: 48),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              shoeCatalog.shoeName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              shoeCatalog.category,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Text(
              // '${shoeCatalog.price}',
              shoeCatalog.price,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Jumlah produk',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove_circle_outline),
                      onPressed: () {
                        if (_quantity > 1) {
                          _quantity--;
                        }
                      },
                    ),
                    Text('$_quantity'),
                    IconButton(
                      icon: Icon(Icons.add_circle_outline),
                      onPressed: () {
                        if (_quantity < shoeCatalog.stock) {
                          _quantity++;
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('❤️ ${shoeCatalog.likes} Likes  Stok : ${shoeCatalog.stock}'),
            const SizedBox(height: 16),
            const Text(
              'Ukuran',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                

              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Deskripsi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(shoeCatalog.description, style: const TextStyle(fontSize: 15)),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali ke Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
