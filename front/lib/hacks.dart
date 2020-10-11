import 'package:flutter/material.dart';

class Hacks extends StatelessWidget {
  final List<Hack> hacks;
  Hacks({this.hacks});
  factory Hacks.fromJson(Map<String, dynamic> json) {
    List<dynamic> asjson = json['hacks'];
    List<dynamic> ashacks = asjson.map((e) => Hack.fromJson(e)).toList();
    return Hacks(hacks: ashacks);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 305,
      childAspectRatio: 9 / 16,
      padding: EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      children: hacks.map((e) => HackView(hack: e)).toList(),
    );
  }
}

class Hack {
  final String name;
  final String description;
  Hack({this.name, this.description});
  factory Hack.fromJson(Map<String, dynamic> json) {
    return Hack(
      name: json['name'],
      description: json['description'],
    );
  }
}

class HackView extends StatelessWidget {
  final Hack hack;
  HackView({this.hack});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Container(
              margin: EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.asset(
                  'peanutlamp.jpg',
                ),
              )),
          Text(
            hack.name,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(hack.description),
          Container(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                PartView(),
                PartView(),
                PartView(),
                PartView(),
                PartView(),
                PartView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            "part name",
            style: Theme.of(context).textTheme.subtitle2,
          ),
          Text("picture"),
        ],
      ),
    );
  }
}
