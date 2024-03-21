import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gojek',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Favorites',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print('Edit button pressed');
                },
                style: ElevatedButton.styleFrom(
                  side: BorderSide(
                      color: const Color.fromARGB(255, 15, 117, 18), width: 1),
                  textStyle: TextStyle(
                    color: Color.fromARGB(255, 15, 117, 18),
                  ),
                ),
                child: Text(
                  'Edit',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 15, 117, 18),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(20.0),
          itemCount: 7,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 3.0,
            crossAxisSpacing: 3.0,
          ),
          itemBuilder: (context, index) {
            return GridTile(
              child: MenuTile(
                title: getTitleByIndex(index),
                imagePath: getImagePathByIndex(index),
              ),
            );
          },
        ),
      ),
    );
  }

  String getTitleByIndex(int index) {
    switch (index) {
      case 0:
        return 'GoRide';
      case 1:
        return 'GoCar';
      case 2:
        return 'GoFood';
      case 3:
        return 'GoSend';
      case 4:
        return 'GoMart';
      case 5:
        return 'GoPulsa';
      case 6:
        return 'Check-In';
      default:
        return '';
    }
  }

  String getImagePathByIndex(int index) {
    switch (index) {
      case 0:
        return 'assets/foto_goride.png';
      case 1:
        return 'assets/foto_gocar.png';
      case 2:
        return 'assets/foto_gofood.png';
      case 3:
        return 'assets/foto_gosend.png';
      case 4:
        return 'assets/foto_gomart.png';
      case 5:
        return 'assets/foto_gopulsa.png';
      case 6:
        return 'assets/foto_checkin.png';
      default:
        return '';
    }
  }
}

class MenuTile extends StatelessWidget {
  final String title;
  final String imagePath;

  const MenuTile({required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Menu $title di tap');
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              imagePath,
              width: 40,
              height: 40,
              errorBuilder: (context, error, stackTrace) {
                print('Failed to load image: $error');
                return Icon(Icons.error);
              },
            ),
            SizedBox(height: 2),
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
