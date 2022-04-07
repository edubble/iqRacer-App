import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iq_racer/src/global_values/utils.dart';
import 'package:iq_racer/src/screens/map_screen.dart';

class DetailTrophyPage extends StatefulWidget {
  const DetailTrophyPage({Key? key, required this.trophy}) : super(key: key);
  final Map trophy;

  @override
  State<DetailTrophyPage> createState() => _DetailTrophyPageState();
}

class _DetailTrophyPageState extends State<DetailTrophyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.trophy["title"]),
          centerTitle: true,
          toolbarHeight: 60,
          flexibleSpace: appBarStyle(),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: widget.trophy["title"],
                child: CarouselSlider(
                  items: [
                    _sliderImage(widget.trophy["images"][0]),
                    _sliderImage(widget.trophy["images"][1]),
                  ],
                  options: CarouselOptions(
                      autoPlay: true,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: true,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: 1),
                ),
              ),
              // Repasar esta parte, mejor hacer dos widgets separados (para el Mapa, y para la fecha)
              _optionButton(context, widget.trophy["dateTime"], Icons.date_range, 0, "", 0, 0),
              _optionButton(context, widget.trophy["address"], Icons.map, 1,widget.trophy["city"], widget.trophy["latitude"], widget.trophy["longitude"]),
            ],
          ),
        ));
  }
}

_sliderImage(String image) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
      ),
    ),
  );
}

_optionButton(BuildContext context, String text, IconData icon, int indexPage, String city, double latitude, double longitude,) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: GestureDetector(
      onTap: () {
        if (indexPage == 1) {
          Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MapPage(city: city, latitude: latitude, longitude: longitude)));
        }
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffF5591F),
            gradient: const LinearGradient(
              colors: [(Color(0xffF5591F)), (Color(0xffF2861E))],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
            const SizedBox(width: 20),
            Expanded(
                child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            )),
            const Icon(Icons.arrow_forward_ios, color: Colors.white)
          ],
        ),
      ),
    ),
  );
}
