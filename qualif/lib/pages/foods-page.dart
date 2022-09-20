import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:qualif/models/food.dart';
import 'package:qualif/pages/detail-page.dart';
import 'package:qualif/pages/main-page.dart';
import 'package:qualif/pages/sign-in-page.dart';
import 'package:qualif/provider/theme.dart';

class FoodsPage extends StatelessWidget {
  String email;
  FoodsPage({super.key, required this.email});

  var breakfast = [
    Food(
        image: 'assets/breakfast/sm.png',
        name: 'Sausage McMuffin',
        desc:
            'English muffin disajikan dengan sosis ayam yang gurih dan selembar keju bernutrisi. Tersedia dari jam 5-11 pagi.',
        price: '22.500'),
    Food(
        image: 'assets/breakfast/ecm.png',
        name: 'Egg and Cheese Muffin',
        desc:
            'Perpaduan scrambled egg dan keju gurih dalam setangkup English Muffin hangat. Tersedia dari jam 5-11 pagi.',
        price: '13.000'),
    Food(
        image: 'assets/breakfast/cm.png',
        name: 'Chicken Muffin',
        desc:
            'Setangkup English muffin hangat dilapis saus mayonais dengan daging ayam olahan yang digoreng dengan sempurna. Tersedia dari jam 5-11 pagi.',
        price: '20.000'),
    Food(
        image: 'assets/breakfast/bb.png',
        name: 'Sausage McMuffin',
        desc:
            'Perpaduan English Muffin panggang yang disajikan dengan sosis ayam gurih, renyahnya Hashbrown serta lembutnya scrambled egg. Tersedia dari jam 5-11 pagi.',
        price: '33.000')
  ];

  var burger = [
    Food(
        image: 'assets/burger/bm.png',
        name: 'Big Mac',
        desc:
            'Burger Ikonik McDonald\'s. Dua lapis daging sapi gurih disajikan dengan saus spesial, selada segar, keju, acar timun, bawang, diapit roti bertabur wijen',
        price: '34.500'),
    Food(
        image: 'assets/burger/cd.png',
        name: 'Chesseburger Deluxe',
        desc:
            'Perpaduan roti burger dengan daging sapi gurih, selada segar, keju, saus tomat, acar, potongan bawang dan mustard.',
        price: '26.500'),
    Food(
        image: 'assets/burger/tbc.png',
        name: 'Triple Burger with Cheese',
        desc:
            'Perpaduan roti burger dengan 3 Lapisan daging gurih dan 2 lapisan keju, saus tomat, acar, potongan bawang dan mustard.',
        price: '34.500'),
    Food(
        image: 'assets/burger/dbm.png',
        name: 'Double Big Mac',
        desc:
            'Burger Big Mac® ukuran lebih besar tambahan 2 patty (100% daging sapi)',
        price: '34.500'),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context, listen: false);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: themeProvider.getTheme.primaryColor,
          title: const Text("Foods"),
          actions: [
            IconButton(
              icon: const Icon(Icons.brightness_6),
              onPressed: () {
                themeProvider.changeTheme();
              },
            )
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
        body: Column(
          children: [
            Expanded(
              child: Container(
                  color: themeProvider.getTheme.secondaryHeaderColor,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text("Breakfast",
                          style: TextStyle(
                            color: themeProvider.getTheme.accentColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                      Expanded(
                          child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: breakfast.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Image.asset(breakfast[index].image,
                                    width: 100, height: 100),
                                Text(breakfast[index].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        height: 2,
                                        fontSize: 15,
                                        color: themeProvider
                                            .getTheme.accentColor)),
                                Text(breakfast[index].price,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        height: 1.5,
                                        fontSize: 15,
                                        color: themeProvider
                                            .getTheme.accentColor)),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: themeProvider
                                              .getTheme.primaryColor),
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return DetailPage(
                                                food: breakfast[index],
                                                email: email);
                                          },
                                        ));
                                      },
                                      child: Text("View Detail",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              height: 1.5,
                                              fontSize: 15,
                                              color: themeProvider
                                                  .getTheme.accentColor))),
                                )
                              ],
                            ),
                          );
                        },
                      ))
                    ],
                  )),
            ),
            Expanded(
              child: Container(
                  color: themeProvider.getTheme.secondaryHeaderColor,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text("Burger",
                          style: TextStyle(
                            color: themeProvider.getTheme.accentColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                      Expanded(
                          child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: burger.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Image.asset(burger[index].image,
                                    width: 100, height: 100),
                                Text(burger[index].name,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        height: 2,
                                        fontSize: 15,
                                        color: themeProvider
                                            .getTheme.accentColor)),
                                Text(burger[index].price,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        height: 1.5,
                                        fontSize: 15,
                                        color: themeProvider
                                            .getTheme.accentColor)),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 20),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: themeProvider
                                              .getTheme.primaryColor),
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return DetailPage(
                                                food: burger[index],
                                                email: email);
                                          },
                                        ));
                                      },
                                      child: Text("View Detail",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              height: 1.5,
                                              fontSize: 15,
                                              color: themeProvider
                                                  .getTheme.accentColor))),
                                )
                              ],
                            ),
                          );
                        },
                      ))
                    ],
                  )),
            ),
          ],
        ));
  }
}
