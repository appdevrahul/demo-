import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'item_dashboard.dart';
import 'nav.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({Key? key}) : super(key: key);

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      appBar: AppBar(
        title: const Center(
          child: Text(
            'My Dashboard',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet),
            label: 'Balance',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_sharp),
            label: 'Pay',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send),
            label: 'Send',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz_sharp),
            label: 'More',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: [
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/ssss.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/cash-back-sale-post-promotion-vector-design-template-2PJTT1D.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/rrrr.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage('assets/images/tttttt.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 120,
                autoPlay: true,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                children: const [
                  ItemDashboard(title: 'Mobile', image: '1.jpg'),
                  ItemDashboard(title: 'Landline', image: '2.jpg'),
                  ItemDashboard(title: 'Data Card', image: '3.png'),
                  ItemDashboard(title: 'Internet', image: '4.png'),
                  ItemDashboard(title: 'Cable Tv', image: '5.jpg'),
                  ItemDashboard(title: 'Entertainment', image: '6.jpg'),
                  ItemDashboard(title: 'Electric', image: '7.jpg'),
                  ItemDashboard(title: 'School', image: '8.jpg'),
                  ItemDashboard(title: 'Church', image: '9.jpg'),
                  ItemDashboard(title: 'Donation', image: '10.jpg'),
                  ItemDashboard(title: 'Merchants', image: '11.jpg'),
                  ItemDashboard(title: 'utility', image: '12.jpg'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
