import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:frontend/components/feed.dart';

void main() => runApp(const Settings());

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: const Color(0xff6750a4),
        useMaterial3: true,
      ),
      home: const SliderExample(),
    );
  }
}

class Tag {
  String name;
  int preference;

  Tag(this.name, this.preference);
}

class PreferenceTag {
  String name;
  List<bool> preference;

  PreferenceTag(this.name, this.preference);
}

const List<Color> selectedColor = [
  Color(0x80f44336),
  Color(0x4003a9f4),
  Color(0x804caf50),
];

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => SliderState();
}

class SliderState extends State<SliderExample> {
  double _popularSliderValue = 2;
  double _friendsLikesSliderValue = 1;
  double _randomizationSliderValue = 0;
  double _tagsSliderValue = 2;

  double headingSize = 25;
  double descriptionSize = 16;
  double sliderDescriptionSize = 12;
  double paddingHeading = 10;
  double paddingSides = 16;
  double paddingBottom = 25;

  final double _tableFontSize = 20;
  final Color _tableFontColor = Colors.black54;

  // Colors:
  Color textColor = Colors.black54;
  Color sliderDescriptionColor = Colors.black45;
  final Color darkBlue = const Color(0xFF00008B);

  getPreference(int preference) {
    switch (preference) {
      case 0:
        return [true, false, false];
      case 2:
        return [false, false, true];
      default:
        return [false, true, false];
    }
  }

  whichPreference(String name, int preference) {
    List<bool> element;
    switch (preference) {
      case 0:
        element = [true, false, false];
        break;
      case 2:
        element = [false, false, true];
        break;
      default:
        element = [false, true, false];
    }
    preferenceTags.add(PreferenceTag(name, element));
    return element;
  }

  List<PreferenceTag> preferenceTags = [];

  List<Tag> list = [
    Tag("Beauty", 1),
    Tag("Cars", 0),
    Tag("Celebrity", 2),
    Tag("Climate", 0),
    Tag("Dancing", 0),
    Tag("Fashion", 1),
    Tag("Funny", 1),
    Tag("Gaming", 1),
    Tag("Landscapes", 1),
    Tag("Lifestyle", 1),
    Tag("Music", 1),
    Tag("Pop", 1),
    Tag("Sports", 2),
    Tag("Star Wars", 1),
    Tag("Tech", 1),
  ];


  // List<Color> backgroundColor = [Colors.orange, const Color(0xFFff841f), const Color(0xFFff6f32), const Color(0xFFff5944), const Color(0xFFff4255), const Color(0xFFff2a65), const Color(0xFFf60e76), const Color(0xFFe70087), const Color(0xFFd30096), const Color(0xFFba16a4), Colors.purple];

  labelSwitch(num sliderValue) {
    switch (sliderValue) {
      case 0:
        return "Very Insignificant";
      case 1:
        return "Insignificant";
      case 2:
        return "Medium";
      case 3:
        return "Essential";
      default:
        return "Very Essential";
    }
  }

  labelLowHighSwitch(num sliderValue) {
    switch (sliderValue) {
      case 0:
        return "None";
      case 1:
        return "Low";
      case 2:
        return "Medium-Low";
      case 3:
        return "Medium-High";
      default:
        return "High";
    }
  }

  Future<void> changeData() async {
    await Future.delayed(const Duration(seconds: 1));
    /*setState(() {
      _popularSliderValue = 4;
    });*/
    return Future.delayed(
        const Duration(seconds: 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: RefreshIndicator(
          onRefresh: changeData,
          child: buildListView(),
        ));
  }

  ListView buildListView() {
    return ListView(children: [
          Padding(padding: EdgeInsets.only(bottom: paddingBottom)),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Your current feed distribution",
              style:
                  TextStyle(fontSize: headingSize, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 30),
          ),
          Padding(
            padding: EdgeInsets.only(left: paddingSides, right: paddingSides),
            child: PieChart(
              dataMap: _popularSliderValue == 0 &&
                      _friendsLikesSliderValue == 0 &&
                      _randomizationSliderValue == 0 &&
                      _tagsSliderValue == 0
                  ? {
                      "Popular/Viral": 1,
                      "Friends": 1,
                      "Random": 0,
                      "Tags": 1,
                    }
                  : {
                      "Popular/Viral": _popularSliderValue,
                      "Friends": _friendsLikesSliderValue,
                      "Random": _randomizationSliderValue,
                      "Tags": _tagsSliderValue,
                    },
              animationDuration: const Duration(milliseconds: 1500),
              colorList: [Colors.purple, Colors.orange, Colors.red, darkBlue],
              chartValuesOptions: const ChartValuesOptions(
                showChartValuesInPercentage: true,
                decimalPlaces: 0,
              ),
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 30)),
          const Divider(),
          const Padding(padding: EdgeInsets.only(bottom: 30)),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Popular/Viral Posts",
              style:
                  TextStyle(fontSize: headingSize, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: paddingHeading)),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: paddingSides),
              child: Text("How important are popular/viral posts for you?",
                  style: TextStyle(
                    fontSize: descriptionSize,
                    color: textColor,
                  )),
            ),
          ),
          Slider(
            activeColor: Colors.purple,
            value: _popularSliderValue,
            max: 4,
            divisions: 4,
            label: labelSwitch(_popularSliderValue.toInt()),
            onChanged: (double value) {
              setState(() {
                _popularSliderValue = value;
              });
            },
          ),
          Row(children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: paddingSides),
                  child: Text(
                    "Insignificant",
                    style: TextStyle(
                      fontSize: sliderDescriptionSize,
                      color: sliderDescriptionColor,
                    ),
                  ),
                )),
            const Spacer(),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: paddingSides),
                  child: Text(
                    "Essential",
                    style: TextStyle(
                      fontSize: sliderDescriptionSize,
                      color: sliderDescriptionColor,
                    ),
                  ),
                )),
          ]),
          Padding(padding: EdgeInsets.only(bottom: paddingBottom)),
          const Divider(),
          Padding(padding: EdgeInsets.only(bottom: paddingBottom)),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Friends Likes",
              style:
                  TextStyle(fontSize: headingSize, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: paddingHeading)),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: paddingSides),
              child:
                  Text("How important are the likes of your friends for you?",
                      style: TextStyle(
                        fontSize: descriptionSize,
                        color: textColor,
                      )),
            ),
          ),
          Slider(
            activeColor: Colors.orange,
            value: _friendsLikesSliderValue,
            max: 4,
            divisions: 4,
            label: labelSwitch(_friendsLikesSliderValue.toInt()),
            onChanged: (double value) {
              setState(() {
                _friendsLikesSliderValue = value;
              });
            },
          ),
          Row(children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: paddingSides),
                  child: Text(
                    "Insignificant",
                    style: TextStyle(
                      fontSize: sliderDescriptionSize,
                      color: sliderDescriptionColor,
                    ),
                  ),
                )),
            const Spacer(),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: paddingSides),
                  child: Text(
                    "Essential",
                    style: TextStyle(
                      fontSize: sliderDescriptionSize,
                      color: sliderDescriptionColor,
                    ),
                  ),
                )),
          ]),
          Padding(padding: EdgeInsets.only(bottom: paddingBottom)),
          const Divider(),
          Padding(padding: EdgeInsets.only(bottom: paddingBottom)),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Randomization",
              style:
                  TextStyle(fontSize: headingSize, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: paddingHeading)),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: paddingSides),
              child: Text(
                  "How high should the percentage of completely random posts be?",
                  style: TextStyle(
                    fontSize: descriptionSize,
                    color: textColor,
                  )),
            ),
          ),
          Slider(
            activeColor: Colors.red,
            value: _randomizationSliderValue,
            max: 4,
            divisions: 4,
            label: labelLowHighSwitch(_randomizationSliderValue),
            onChanged: (double value) {
              setState(() {
                _randomizationSliderValue = value;
              });
            },
          ),
          Row(children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: paddingSides),
                  child: Text(
                    "None",
                    style: TextStyle(
                      fontSize: sliderDescriptionSize,
                      color: sliderDescriptionColor,
                    ),
                  ),
                )),
            const Spacer(),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: paddingSides),
                  child: Text(
                    "High",
                    style: TextStyle(
                      fontSize: sliderDescriptionSize,
                      color: sliderDescriptionColor,
                    ),
                  ),
                )),
          ]),
          Padding(padding: EdgeInsets.only(bottom: paddingBottom)),
          const Divider(),
          Padding(padding: EdgeInsets.only(bottom: paddingBottom)),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Tags",
              style:
                  TextStyle(fontSize: headingSize, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: paddingHeading)),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: paddingSides),
              child: Text(
                  "How important are your chosen tags for you? Caution: If you deactivate this function, your blacklisted tags will be shown to you.",
                  style: TextStyle(
                    fontSize: descriptionSize,
                    color: textColor,
                  )),
            ),
          ),
          Slider(
            activeColor: darkBlue,
            value: _tagsSliderValue,
            max: 4,
            divisions: 4,
            label: labelSwitch(_tagsSliderValue.toInt()),
            onChanged: (double value) {
              setState(() {
                _tagsSliderValue = value;
              });
            },
          ),
          Row(children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: paddingSides),
                  child: Text(
                    "Insignificant",
                    style: TextStyle(
                      fontSize: sliderDescriptionSize,
                      color: sliderDescriptionColor,
                    ),
                  ),
                )),
            const Spacer(),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(right: paddingSides),
                  child: Text(
                    "Essential",
                    style: TextStyle(
                      fontSize: sliderDescriptionSize,
                      color: sliderDescriptionColor,
                    ),
                  ),
                )),
          ]),
          const Padding(padding: EdgeInsets.only(bottom: 50)),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Your personal Tag preferences",
              style: TextStyle(
                  fontSize: headingSize - 2, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 10)),
          Padding(
              padding: EdgeInsets.only(left: paddingSides, right: paddingSides),
              child: Table(children: [
                const TableRow(children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 10),
                      child: Text("Name of Tag",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ))),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("Importance",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        )),
                  )
                ]),
                for (Tag tag in list)
                  TableRow(children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: const EdgeInsets.only(bottom: 15, top: 15),
                          child: Text(tag.name,
                              style: TextStyle(
                                fontSize: _tableFontSize,
                                color: _tableFontColor,
                              ))),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5, top: 5),
                        child: ToggleButtons(
                          fillColor: selectedColor[tag.preference],
                          isSelected: whichPreference(tag.name, tag.preference),
                          onPressed: (int index) {
                            setState(() {
                              tag.preference = index;
                              preferenceTags.map((listElement) {
                                if (listElement.name == tag.name) {
                                  listElement.preference = getPreference(index);
                                }
                              });
                            });
                          },
                          borderRadius: BorderRadius.circular(30),
                          children: const [
                            Icon(
                              Icons.block,
                              color: Colors.red,
                            ),
                            Text("-", style: TextStyle(fontSize: 30)),
                            Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
              ])),
          const Padding(padding: EdgeInsets.only(bottom: 40)),
        ]);
  }
}
