import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:qualif/models/food.dart';
import 'package:qualif/models/item.dart';
import 'package:qualif/pages/foods-page.dart';
import 'package:qualif/pages/sign-in-page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:qualif/provider/theme.dart';

class MainPage extends StatelessWidget {
  String email;
  MainPage({super.key, required this.email});

  var images = [
    "assets/carousel1.jpg",
    "assets/carousel2.jpg",
    "assets/carousel3.jpg",
    "assets/carousel4.jpg",
    "assets/carousel5.jpg"
  ];
  var homedet = [
    Item(
        image: "assets/mainpage1.jpg",
        heading: "Visi",
        desc:
            "Visi McDonald’s adalah menjadi restoran cepat saji dengan pelayanan terbaik di dunia. Untuk mencapai visi ini, McDonald’s selalu menjamin mutu produk-produknya, memberikan pelayanan yang memuaskan, menawarkan kebersihan dan keamanan produk pangan serta nilai-nilai tambah lainnya. Senyum konsumen adalah hal penting untuk McDonald's."),
    Item(
        image: "assets/mainpage2.jpg",
        heading: "Misi",
        desc:
            "Menjadi perusahaan terbaik bagi semua karyawan kami di setiap komunitas di seluruh dunia. Menghadirkan pelayanan dengan sistem operasional yang unggul bagi setiap konsumen kami di setiap restoran cabang McDonald’s. Terus mengalami perkembangan ke arah yang menguntungkan sebagai sebuah brand, serta terus mengembangkan sistem operasional McDonald’s ke arah yang lebih baik lagi lewat inovasi dan teknologi."),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: themeProvider.getTheme.primaryColor,
          title: const Text("Home"),
          actions: [
            IconButton(
              icon: const Icon(Icons.brightness_6),
              onPressed: () {
                themeProvider.changeTheme();
              },
            )
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            //   child:
            // )
          ],
        ),
        drawer: Drawer(
          backgroundColor: themeProvider.getTheme.secondaryHeaderColor,
          child: ListView(
            children: [
              Container(
                color: themeProvider.getTheme.primaryColor,
                child: DrawerHeader(
                  child: Text(
                    email,
                    style: TextStyle(
                      color: themeProvider.getTheme.accentColor,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Home",
                  style: TextStyle(
                    color: themeProvider.getTheme.accentColor,
                  ),
                ),
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return MainPage(email: email);
                    },
                  ), (route) => false);
                },
              ),
              ListTile(
                title: Text(
                  "Foods",
                  style: TextStyle(
                    color: themeProvider.getTheme.accentColor,
                  ),
                ),
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return FoodsPage(email: email);
                    },
                  ), (route) => false);
                },
              ),
              ListTile(
                title: Text(
                  "Sign Out",
                  style: TextStyle(
                    color: themeProvider.getTheme.accentColor,
                  ),
                ),
                onTap: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return const SignIn();
                    },
                  ), (route) => false);
                },
              )
            ],
          ),
        ),
        body: Container(
          color: themeProvider.getTheme.secondaryHeaderColor,
          child: Column(
            children: [
              CarouselSlider(
                  items: images.map((e) => Image.asset(e)).toList(),
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3))),
              Expanded(
                  child: ListView.builder(
                itemCount: homedet.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Image.asset(homedet[index].image),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 10, 5, 2),
                        child: Text(
                          homedet[index].heading,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 1,
                            fontSize: 20,
                            color: themeProvider.getTheme.accentColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(5, 2, 5, 10),
                        child: Text("${homedet[index].desc} \n",
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              height: 1,
                              fontSize: 15,
                              color: themeProvider.getTheme.accentColor,
                            ),
                            textAlign: TextAlign.center),
                      )
                    ],
                  );
                },
              ))
            ],
          ),
        ));
  }
}
