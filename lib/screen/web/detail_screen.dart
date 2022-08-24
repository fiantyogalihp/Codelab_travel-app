import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../configuration/configuration.dart';
import '../../model/tourism_page_model.dart';
import '../favorite_button.dart';

class DetailWebScreen extends StatefulWidget {
  final TourismPlace place;
  const DetailWebScreen({Key? key, required this.place}) : super(key: key);

  @override
  State<DetailWebScreen> createState() => _DetailWebScreenState();
}

class _DetailWebScreenState extends State<DetailWebScreen> {
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 64),
                child: Center(
                  child: SizedBox(
                    width: 1200,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // * title
                          Text(
                            'Wisata Indonesia',
                            style: montserratBold(
                                color: black, size: 32),
                          ),
                          addVertivalSpace(20),

                          // * detail
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // * image
                              Expanded(
                                child: Column(
                                  children: [
                                    Image.asset(widget.place.imageAsset),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 10),
                                      height: 150,
                                      child: ListView(
                                        controller: _scrollController,
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        physics: const BouncingScrollPhysics(),
                                        children: widget.place.imageUrls
                                            .map((url) => GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      showCupertinoDialog(
                                                          barrierDismissible:
                                                              true,
                                                          context: context,
                                                          builder: (context) =>
                                                              AlertDialog(
                                                                actions: [
                                                                  Image.network(
                                                                    url,
                                                                    width: 400,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                    filterQuality:
                                                                        FilterQuality
                                                                            .high,
                                                                  ),
                                                                ],
                                                              ));
                                                    });
                                                  },
                                                  child: Container(
                                                    margin:
                                                        const EdgeInsets.all(5),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: Image.network(
                                                        url,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ))
                                            .toList(),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              addHorizontalSpace(32),

                              // * detail
                              Expanded(
                                child: Card(
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          widget.place.name,
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 30.0,
                                            fontWeight: medium,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                    Icons.calendar_today),
                                                addHorizontalSpace(8),
                                                Text(widget.place.openDays,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            normal)),
                                              ],
                                            ),
                                            const FavoriteButton(),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.access_time),
                                            addHorizontalSpace(8),
                                            Text(widget.place.openTime,
                                                style: const TextStyle(
                                                    fontWeight: normal)),
                                          ],
                                        ),
                                        addVertivalSpace(8),
                                        Row(
                                          children: [
                                            const Icon(Icons.monetization_on),
                                            addHorizontalSpace(8),
                                            Text(widget.place.ticketPrice,
                                                style: const TextStyle(
                                                    fontWeight: normal)),
                                          ],
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16.0),
                                          child: Text(widget.place.description,
                                              textAlign: TextAlign.justify,
                                              style: const TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: normal)),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ]),
                  ),
                ),
              ))),
    );
  }
}
