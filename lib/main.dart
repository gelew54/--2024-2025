import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.grey[100],
        textTheme: TextTheme(
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 14, color: Colors.grey[800]),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.blueAccent,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String indexNumber = '203217';
  final List<Map<String, dynamic>> clothes = [
    {
      'name': 'Тексас јакна',
      'image': 'https://static.zara.net/assets/public/d2f2/8ad7/052a47cf8791/64bbb5db043d/09942400401-p/09942400401-p.jpg?ts=1731669418692&w=850',
      'description': 'Класична тексас јакна со стилски изглед.',
      'price': '3500 ден',
      'sizes': ['S', 'M', 'L', 'XL']
    },
    {
      'name': 'Маица',
      'image': 'https://www.sportreality.mk/files/watermark/files/images/slike_proizvoda/media/LNA/LNA243M801-01/images/thumbs_w/LNA243M801-01_w_800_800px.jpg',
      'description': 'Памучна маица со кратки ракави.',
      'price': '800 ден',
      'sizes': ['S', 'M', 'L', 'XL', 'XXL']
    },
    {
      'name': 'Чевли',
      'image': 'https://mk.beosport.com/media/catalog/product/cache/86df549d5c9ea0596babe4633cdc90f6/N/F/NF0A83NJ_KX7-01_1.jpg',
      'description': 'Удобни  чевли за секојдневна употреба.',
      'price': '4500 ден',
      'sizes': ['40', '41', '42', '43', '44']
    },
    {
      'name': 'Фармерки',
      'image': 'https://www.fashiongroup.com.mk/files/watermark/files/images/slike-proizvoda/media/LV0/LV04511-5815/images/thumbs_w/LV04511-5815_w_800_1120px.jpg.webp',
      'description': 'Трендовски фармерки со тесен крој.',
      'price': '2500 ден',
      'sizes': ['S', 'M', 'L', 'XL', 'XXL']
    },
    {
      'name': 'Зимска јакна',
      'image': 'https://www.sportvision.mk/files/watermark/files/images/slike_proizvoda/media/NF0/NF0A899290I1/images/thumbs_w/NF0A899290I1_w_1200_1200px.jpg',
      'description': 'Топла зимска јакна за ладните денови.',
      'price': '5000 ден',
      'sizes': ['M', 'L', 'XL', 'XXL']
    },
    {
      'name': 'Шал',
      'image': 'https://www.fashiongroupoutlet.mk/files/watermark/files/images/slike-proizvoda/media/TA1/TA1EVT-433/images/thumbs_w/TA1EVT-433_w_800_1120px.jpg',
      'description': 'Стилски шал изработен од висококвалитетни материјали.',
      'price': '1200 ден',
      'sizes': ['Стандард']
    },
    {
      'name': 'Капа',
      'image': 'https://www.sportvision.mk/files/watermark/files/images/slike_proizvoda/media/HF5/HF5498-386/images/thumbs_w/HF5498-386_w_1200_1200px.jpg',
      'description': 'Капа со модерен дизајн, идеална за студените денови.',
      'price': '600 ден',
      'sizes': ['Стандард']
    },
    {
      'name': 'Ранец',
      'image': 'https://www.sportvision.mk/files/watermark/files/images/slike_proizvoda/media/9B0/9B0503-KR5/images/thumbs_w/9B0503-KR5_w_1200_1200px.jpg',
      'description': 'Практичен и издржлив ранец за патување или училиште.',
      'price': '3200 ден',
      'sizes': ['Стандард']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            indexNumber,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: clothes.length,
        itemBuilder: (context, index) {
          final item = clothes[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    name: item['name']!,
                    image: item['image']!,
                    description: item['description']!,
                    price: item['price']!,
                    sizes: item['sizes']!,
                  ),
                ),
              );
            },
            child: Card(
              color: Colors.white,
              elevation: 3,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item['image']!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  item['name']!,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  'Цена: ${item['price']}',
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: Icon(Icons.arrow_forward, color: Colors.blueAccent),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String name;
  final String image;
  final String description;
  final String price;
  final List<String> sizes;

  DetailScreen({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.sizes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          name,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  image,
                  height: 220,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              name,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Цена: $price',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Достапни величини:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              children: sizes
                  .map((size) => Chip(
                label: Text(size),
                backgroundColor: Colors.green[100],
                labelStyle: TextStyle(
                  color: Colors.green[800],
                  fontWeight: FontWeight.bold,
                ),
              ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
