import 'package:flutter/material.dart';
import 'package:kulinerjogja/traditional.dart';


class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kuliner Jogja'),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),

            // Kategori makanan
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Kategori Kuliner',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
              ),
            ),
            SizedBox(height: 10),

            // Daftar kategori
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryCard(icon: Icons.rice_bowl, title: 'Traditional',nextscreen: TraditionalScreen()),
                  CategoryCard(icon: Icons.coffee, title: 'Kopi',nextscreen: TraditionalScreen()),
                  CategoryCard(icon: Icons.ramen_dining, title: 'Mie',nextscreen: TraditionalScreen()),
                  CategoryCard(icon: Icons.icecream, title: 'Dessert',nextscreen: TraditionalScreen()),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Rekomendasi restoran
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rekomendasi Tempat Makan',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('Lihat Semua'),
                  ),
                ],
              ),
            ),

            // Daftar rekomendasi restoran
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3, // Misalnya hanya 3 restoran yang direkomendasikan
              itemBuilder: (context, index) {
                return RestaurantCard(
                  imagePath: 'assets/restaurant$index.jpg', // Gambar restoran
                  title: 'Restoran Favorit $index',
                  location: 'Jalan Braga No.$index, Bandung',
                  priceRange: 'Rp50.000 - Rp100.000',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Widget untuk Banner Promo
class PromoBanner extends StatelessWidget {
  final String imagePath;
  final String title;

  PromoBanner({required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black54],
          ),
        ),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// Widget untuk Kategori Makanan
class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final nextscreen;

  CategoryCard({required this.icon, required this.title, required this.nextscreen});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextscreen),
        );
      },
      child: Container(
      width: 100,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.orange[100],
        borderRadius: BorderRadius.circular(10),
      ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.orange),
            SizedBox(height: 5),
            Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

// Widget untuk Kartu Restoran
class RestaurantCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;
  final String priceRange;

  RestaurantCard({
    required this.imagePath,
    required this.title,
    required this.location,
    required this.priceRange,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(location, style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 5),
                  Text(priceRange, style: TextStyle(color: Colors.orange)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}