import 'package:flutter/material.dart';

import '../configuration/configuration.dart';
import '../model/tourism_page_model.dart';
import '../screen/detail_screen.dart';
import '../screen/web/main_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Wisata Indonesia',
            style: montserratMedium(color: black, size: 20),
          ),
        ),
        body: LayoutBuilder(builder: (context, constraints) {
          if (constraints.maxWidth <= 600) {
            return const TourismPlaceList();
          } else if (constraints.maxWidth <= 1200) {
            return const TourismPlaceGrid(
              crossAxisCount: 4,
            );
          } else {
            return const TourismPlaceGrid(
              crossAxisCount: 6,
            );
          }
        }));
  }
}

class TourismPlaceList extends StatelessWidget {
  final bool isMobile = true;
  const TourismPlaceList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: isMobile ? false : true,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: tourismPlaceList.length,
        itemBuilder: (BuildContext context, int index) {
          final TourismPlace place = tourismPlaceList[index];

          return InkWell(
            splashColor: Colors.blue,
            splashFactory: InkRipple.splashFactory,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailScreen(place: place);
              }));
            },
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // * give expaned with flex, so it will no overflow
                  Expanded(
                    flex: 1,
                    child: Hero(
                      tag: 'gambar$index',
                      child: Image.asset(
                        place.imageAsset,
                      ),
                    ),
                  ),
                  // * give expaned with flex, so it will no overflow
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Hero(
                            tag: 'name$index',
                            child: Text(
                              place.name,
                              style: montserratMedium(color: black, size: 16),
                            ),
                          ),
                          addVertivalSpace(10),
                          Hero(
                              tag: 'location$index',
                              child: Text(place.location)),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
