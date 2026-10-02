import 'package:flutter/material.dart';
import 'package:kuis_mobile_124240063/models/data.dart';
import 'package:kuis_mobile_124240063/screens/detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'Semua';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // daftar kategori diambil otomatis dari data menu
    final List<String> categories = [
      'Semua',
      ...shoeCatalog.map((m) => m.category).toSet(),
    ];

    // filter
    final filteredMenus = shoeCatalog.where((m) {
      final cocokKategori =
          _selectedCategory == 'Semua' || m.category == _selectedCategory;
      final cocokSearch = m.shoeName.toLowerCase().contains(
        _searchController.text.toLowerCase(),
      );
      return cocokKategori && cocokSearch;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: 'Telusuri menu',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButton<String>(
              value: _selectedCategory,
              isExpanded: true,
              items: categories
                  .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value!;
                });
              },
            ),
          ),
          Expanded(
            child: filteredMenus.isEmpty
                ? Center(child: Text('Menu tidak ditemukan'))
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      // childAspectRatio: 0.75,
                    ),
                    itemCount: filteredMenus.length,
                    itemBuilder: (context, index) {
                      final katalog = filteredMenus[index];
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailScreen(shoeCatalog: katalog),
                            ),
                          );
                        },

                        title: Text(katalog.shoeName),

                        subtitle: Text(
                          'Likes : ${katalog.likes}  ${katalog.price} Stok : ${katalog.stock}',
                        ),
                        trailing: Icon(
                          Icons.favorite,
                          color: Colors.pink,
                          size: 20.0,
                        ),
                        // leading: Image.network(katalog.image, width: 100),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            katalog.image,
                            width: 100,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // trailing: Icon(Icons.arrow_forward_ios),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
