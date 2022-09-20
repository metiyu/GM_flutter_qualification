import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qualif/models/food.dart';
import 'package:qualif/models/review.dart';
import 'package:qualif/provider/theme.dart';

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  Food food;
  String email;
  DetailPage({super.key, required this.food, required this.email});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController reviewController = TextEditingController();

  var reviews = [];

  void handleReview() {
    String rev = reviewController.text;
    if (rev == '') {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Review must not be empty.")));
      return;
    }

    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Review is sent.")));
    reviews.add(Review(email: widget.email, review: rev));

    setState(() {
      reviewController.text = "";
    });

    return;
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: themeProvider.getTheme.primaryColor,
            title: const Text("Food Details"),
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(icon: Icon(Icons.info)),
                Tab(icon: Icon(Icons.comment))
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.brightness_6),
                onPressed: () {
                  themeProvider.changeTheme();
                },
              )
            ],
          ),
          body: TabBarView(children: [
            Container(
                color: themeProvider.getTheme.secondaryHeaderColor,
                padding: const EdgeInsets.all(0),
                child: SingleChildScrollView(
                  child: Column(children: [
                    Image.asset(
                      widget.food.image,
                      height: 150,
                    ),
                    Text(widget.food.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 1,
                          fontSize: 30,
                          color: themeProvider.getTheme.accentColor,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        widget.food.desc,
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          height: 1,
                          fontSize: 15,
                          color: themeProvider.getTheme.accentColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Text(widget.food.price,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          height: 1.5,
                          fontSize: 30,
                          color: themeProvider.getTheme.accentColor,
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextField(
                          style: const TextStyle(color: Colors.black),
                          controller: reviewController,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey.shade100,
                              hintText: 'Review...',
                              hintStyle: TextStyle(color: Colors.grey[700]),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color:
                                          themeProvider.getTheme.primaryColor)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: themeProvider.getTheme.primaryColor,
                                    width: 2,
                                  ))),
                        )),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                themeProvider.getTheme.primaryColor),
                        onPressed: handleReview,
                        child: const Text("Send Review"))
                  ]),
                )),
            Container(
                color: themeProvider.getTheme.secondaryHeaderColor,
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Expanded(
                    child: ListView.builder(
                  itemCount: reviews.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: themeProvider.getTheme.primaryColor,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(reviews[index].email + " : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: themeProvider.getTheme.accentColor,
                                )),
                          ),
                          Text(reviews[index].review,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                                color: themeProvider.getTheme.accentColor,
                              )),
                        ],
                      ),
                    );
                  },
                )))
          ]),
        ));
  }
}
