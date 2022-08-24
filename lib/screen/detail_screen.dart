import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/tourism_page_model.dart';
import '../screen/favorite_button.dart';
import '../screen/web/detail_screen.dart';
import '../configuration/configuration.dart';

class DetailScreen extends StatelessWidget {
  final TourismPlace place;
  const DetailScreen({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= 600) {
        return DetailMobileScreen(place: place);
      } else {
        return DetailWebScreen(
          place: place,
        );
      }
    });
  }
}

class DetailMobileScreen extends StatefulWidget {
  final TourismPlace place;
  const DetailMobileScreen({Key? key, required this.place}) : super(key: key);

  @override
  State<DetailMobileScreen> createState() => _DetailMobileScreenState();
}

class _DetailMobileScreenState extends State<DetailMobileScreen> {
  int currentindex = 0;

  onTabTapped(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // * navigator bar
            Stack(
              children: [
                Hero(
                    tag: 'gambar$currentindex',
                    child: Image.asset(widget.place.imageAsset)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: black, width: 1.5)),
                        child: CircleAvatar(
                          backgroundColor: grey.withOpacity(.5),
                          child: IconButton(
                              color: black,
                              icon: const Icon(Icons.arrow_back),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                      ),
                      const FavoriteButton()
                    ],
                  ),
                )
              ],
            ),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Hero(
                  tag: 'name$currentindex',
                  child: Text(
                    widget.place.name,
                    textAlign: TextAlign.center,
                    style: montserratBold(color: black, size: 20),
                  ),
                )),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child: Hero(
                  tag: 'location$currentindex',
                  child: Text(
                    widget.place.location,
                    textAlign: TextAlign.center,
                    style: montserratNormal(color: black, size: 12),
                  ),
                )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.calendar_today,
                            color: black, size: 25),
                        addVertivalSpace(5),
                        Text(
                          widget.place.openDays,
                          style: montserratNormal(color: black, size: 12),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.watch_later_outlined,
                            color: black, size: 25),
                        addVertivalSpace(5),
                        Text(
                          widget.place.openTime,
                          style: montserratNormal(color: black, size: 12),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Icon(Icons.monetization_on,
                            color: black, size: 25),
                        addVertivalSpace(5),
                        Text(
                          widget.place.ticketPrice,
                          style: montserratNormal(color: black, size: 12),
                        ),
                      ],
                    ),
                  ]),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.place.description,
                textAlign: TextAlign.center,
                style: montserratNormal(color: black, size: 12),
              ),
            ),

            // * slide card
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              height: 150,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                children: widget.place.imageUrls
                    .map((url) => GestureDetector(
                          onTap: () {
                            setState(() {
                              showCupertinoDialog(
                                  barrierDismissible: true,
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        actions: [
                                          Image.network(
                                            url,
                                            fit: BoxFit.cover,
                                            filterQuality: FilterQuality.high,
                                          ),
                                        ],
                                      ));
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                url,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ))
                    .toList(),
                /*  [
                      ...List.generate(
                          widget.place.imageUrls.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      widget.place.imageUrls[index],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )),
                    ], */
              ),
            )
          ],
        ),
      ),
    ));
  }
}
