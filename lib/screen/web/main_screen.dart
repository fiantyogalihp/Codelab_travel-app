import 'package:flutter/material.dart';

import '../../configuration/configuration.dart';
import '../../model/tourism_page_model.dart';
import '../detail_screen.dart';

class TourismPlaceGrid extends StatelessWidget {
  final int crossAxisCount;
  const TourismPlaceGrid({Key? key, required this.crossAxisCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      child: GridView.count(
        shrinkWrap: true,
        padding: const EdgeInsets.all(24),
        physics: const BouncingScrollPhysics(),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        crossAxisCount: crossAxisCount,
        children: tourismPlaceList
            .map((place) => InkWell(
                  splashColor: Colors.blue,
                  splashFactory: InkRipple.splashFactory,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen(place: place);
                    }));
                  },
                  child: Card(
                    elevation: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: .5),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.asset(
                              place.imageAsset,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              place.name,
                              style: montserratMedium(color: black, size: 14),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 8.0),
                            child: Text(place.location),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
