import 'package:flutter/material.dart';
import 'package:frontend/components/settings.dart';
import 'package:frontend/components/stacked_bar_chart.dart';
import 'package:frontend/components/tag_chips.dart';
import 'package:intl/intl.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

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

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => FeedState();
}

final feed1 = [
  Post(
      "Mathilde",
      DateTime(2023, 5, 21, 10, 00, 00),
      "https://images.pexels.com/photos/1325654/pexels-photo-1325654.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "https://images.pexels.com/photos/16784239/pexels-photo-16784239/free-photo-of-fashion.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      ["Sports", "Lifestyle"],
      121,
      ["Sports", "Celebrity", "Tech"],
      "TAGS"),
  Post(
      "Kai",
      DateTime(2023, 5, 9, 18, 00, 00),
      "https://photos.desired.de/04/bf/cc/557bdefe66caf91343c2f3a897_ZmMgODU2ODQ0NzlmZmZmIDE2MDAgMTIwMAMwZjViZjZmM2MzOQ==_imago0115775955h.jpg",
      "https://www.ingame.de/bilder/2022/11/30/91947994/30402349-kai-pflaume-bei-den-elevator-boys-2uaMmeCHieec.jpg",
      ["Lifestyle","Beauty"],
      13833,
      ["Sports", "Celebrity", "Tech"],
      "POPULAR"),
  Post(
      "Robert",
      DateTime(2023, 5, 20, 9, 00, 00),
      "https://images.pexels.com/photos/1432675/pexels-photo-1432675.jpeg?auto=compress&cs=tinysrgb&w=800",
      "https://images.pexels.com/photos/1212984/pexels-photo-1212984.jpeg?auto=compress&cs=tinysrgb&w=800",
      ["Tech"],
      52,
      ["Sports", "Celebrity", "Tech"],
      "TAGS"),
  Post(
      "Markus",
      DateTime(2023, 5, 20, 9, 00, 00),
      "https://images.pexels.com/photos/1407818/pexels-photo-1407818.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      ["Sports","Lifestyle"],
      167,
      ["Sports", "Celebrity", "Tech"],
      "TAGS"),
  Post(
      "Havertz",
      DateTime(2023, 5, 9, 18, 00, 00),
      "https://imgresizer.eurosport.com/unsafe/1200x0/filters:format(jpeg):focal(1447x353:1449x351)/origin-imgresizer.eurosport.com/2023/04/25/3692060-75131128-2560-1440.jpg",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/2019-06-11_Fu%C3%9Fball%2C_M%C3%A4nner%2C_L%C3%A4nderspiel%2C_Deutschland-Estland_StP_2059_LR10_by_Stepro.jpg/640px-2019-06-11_Fu%C3%9Fball%2C_M%C3%A4nner%2C_L%C3%A4nderspiel%2C_Deutschland-Estland_StP_2059_LR10_by_Stepro.jpg",
      ["Sports", "Celebrity"],
      21341,
      ["Sports", "Celebrity", "Tech"],
      "POPULAR"),
  Post(
      "Randy",
      DateTime(2023, 5, 10, 19, 30, 00),
      "https://images.pexels.com/photos/3772226/pexels-photo-3772226.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "https://images.pexels.com/photos/1485031/pexels-photo-1485031.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      ["Sports"],
      134,
      ["Sports", "Celebrity", "Tech"],
      "TAGS"),
  null,
  Post(
      "Rosa",
      DateTime(2023, 5, 9, 18, 00, 00),
      "https://images.pexels.com/photos/2325446/pexels-photo-2325446.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "https://images.pexels.com/photos/921646/pexels-photo-921646.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      ["Landscapes", "Lifestyle"],
      2978,
      ["Sports", "Celebrity", "Tech"],
      "FRIENDS"),
  Post(
      "Marc",
      DateTime(2023, 5, 9, 18, 00, 00),
      "https://images.lmu.social/new/marc_big.png",
      "https://upload.wikimedia.org/wikipedia/commons/c/c4/Mark_Zuckerberg_F8_2018_Keynote_%28cropped%29.jpg",
      ["Celebrity"],
      313446,
      ["Sports", "Celebrity", "Tech"],
      "POPULAR"),
];

final feed2 = [
  Post(
      "Markus",
      DateTime(2023, 5, 20, 9, 00, 00),
      "https://images.pexels.com/photos/1035108/pexels-photo-1035108.jpeg?auto=compress&cs=tinysrgb&w=800",
      "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      ["Cars"],
      167,
      ["Cars", "Gaming"],
      "TAGS"),
  Post(
      "Havertz",
      DateTime(2023, 5, 9, 18, 00, 00),
      "https://images.pexels.com/photos/7862657/pexels-photo-7862657.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/2019-06-11_Fu%C3%9Fball%2C_M%C3%A4nner%2C_L%C3%A4nderspiel%2C_Deutschland-Estland_StP_2059_LR10_by_Stepro.jpg/640px-2019-06-11_Fu%C3%9Fball%2C_M%C3%A4nner%2C_L%C3%A4nderspiel%2C_Deutschland-Estland_StP_2059_LR10_by_Stepro.jpg",
      ["Gaming", "Celebrity"],
      21341,
      ["Cars", "Gaming"],
      "TAGS"),
  Post(
      "Robert",
      DateTime(2023, 5, 20, 9, 00, 00),
      "https://images.pexels.com/photos/1545743/pexels-photo-1545743.jpeg?auto=compress&cs=tinysrgb&w=800",
      "https://images.pexels.com/photos/1212984/pexels-photo-1212984.jpeg?auto=compress&cs=tinysrgb&w=800",
      ["Cars"],
      52,
      ["Cars", "Gaming"],
      "TAGS"),
  Post(
      "Randy",
      DateTime(2023, 5, 10, 19, 30, 00),
      "https://images.pexels.com/photos/1174746/pexels-photo-1174746.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      "https://images.pexels.com/photos/1485031/pexels-photo-1485031.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      ["Gaming"],
      134,
      ["Cars", "Gaming"],
      "TAGS"),
  Post(
      "Rosa",
      DateTime(2023, 5, 9, 18, 00, 00),
      "https://images.pexels.com/photos/3732652/pexels-photo-3732652.jpeg?auto=compress&cs=tinysrgb&w=800",
      "https://images.pexels.com/photos/921646/pexels-photo-921646.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
      ["Beauty", "Lifestyle"],
      2978,
      ["Cars", "Gaming"],
      "RANDOM"),
];

class FeedState extends State<SliderExample> {
  List<Post?> feed = feed1;

  Future<void> update() async {
    await Future.delayed(const Duration(seconds: 2));


    setState(() {
        feed = feed2;
    });
    return Future.delayed(const Duration(seconds: 0));
  }
  Widget getBottomSheetText(int index) {
    if (index % 2 == 0) {
      return const Text(
          "This post is shown to you because you are following the user who posted it. You can unfollow the user to stop seeing posts from them.");
    }
    return const Text("The Algorithm");
  }




  @override
  Widget build(BuildContext context) {


    final colorMap = {
      "TAGS": const Color(0xFF00008B),
      "FRIENDS": Colors.orange,
      "POPULAR": Colors.purple,
      "RANDOM": Colors.red,
    };

    final recommendationDescription = {
      "TAGS":
          "This Post was chosen because it has some tags which correspond with your tags",
      "FRIENDS": "This post was chosen, because one of your friends liked it",
      "POPULAR": "This Post was chosen because it has a lot of likes in our community.",
      "RANDOM": "This Post was randomly chosen from all possible posts"
    };

    final format = DateFormat('hh:mm dd-MM-yyyy');

    return Scaffold(
        appBar: AppBar(
          title: const Text('Feed'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Settings()));
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        body: RefreshIndicator (
          onRefresh: update,
          child: buildListView(feed, colorMap, format, recommendationDescription))
        );

  }

  ListView buildListView(List<Post?> feed, Map<String, Color> colorMap, DateFormat format, Map<String, String> recommendationDescription) {
    return ListView.builder(
        itemCount: feed.length,
        itemBuilder: (BuildContext context, int index) {
          return (feed[index] == null)
              ? SizedBox(
                  height: 280,
                  width: 200,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                      child: Column(
                        children: [
                          const Text("Most viewed tags:",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: StackedBarChart(data: [
                              TagData(
                                  'Sports', 0.45, Colors.black),
                              TagData('Celebrities', 0.3, Colors.red),
                              TagData('Tech', 0.2, Colors.green),
                              TagData('Others', 0.05, Colors.lightBlue)
                            ]),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8),
                            child: Text(
                                "You have consumed a lot of content from the following tags. Blacklist them to see less of them in your feed."),
                          ),
                          Wrap(
                            runSpacing: 3,
                            spacing: 8,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.block),
                                label: const Text("Sports"),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.block),
                                label: const Text("Celebritys"),
                              ),
                              ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.block),
                                label: const Text("Tech"),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ))
              : Card(
                  margin: const EdgeInsets.all(8),
                  color: colorMap[feed[index]!.recommendedReason],
                  child: Column(children: [
                    Card(
                        margin: const EdgeInsets.only(top: 6),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  contentPadding: const EdgeInsets.all(0),
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        (feed[index]!.profileImageUrl)
                                            .toString()),
                                  ),
                                  title: Text(feed[index]!.username),
                                  subtitle: Text(format
                                      .format(feed[index]!.date)
                                      .toString()),
                                  trailing: IconButton(
                                      onPressed: () {
                                        showModalBottomSheet<dynamic>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SizedBox(
                                                height: feed[index]!
                                                            .recommendedReason !=
                                                        "TAGS"
                                                    ? 150
                                                    : 500,
                                                child: ListView(children: [
                                                  const ListTile(
                                                    title: Text(
                                                        "Why do I see this post?",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                            fontSize: 20)),
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            top: 10,
                                                            bottom: 0,
                                                            left: 20,
                                                            right: 20),
                                                  ),
                                                  Divider(
                                                    color: colorMap[feed[index]!.recommendedReason],
                                                    thickness: 3,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 20),
                                                    child: feed[index]!
                                                                .recommendedReason !=
                                                            "TAGS"
                                                        ? Text(recommendationDescription[
                                                            feed[index]!
                                                                .recommendedReason]!, style: TextStyle(fontSize: 16))
                                                        : const Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                                Text(
                                                                  "The Algorithm",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight.bold),
                                                                ),
                                                                Text(
                                                                    "1. The number of likes \n"
                                                                    "2. The number of comments\n"
                                                                    "3. The number of shares\n"
                                                                    "4. The number of views\n"
                                                                    "5. The number of reports\n"
                                                                    "6. The number of times the post was hidden"),
                                                                Text(
                                                                    "Tags of this post:",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            16,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                                TagChips(
                                                                    tags: [
                                                                      "#tags1",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2",
                                                                      "#tags2"
                                                                    ])
                                                              ]),
                                                  ),
                                                ]));
                                          },
                                        );
                                      },
                                      icon: const Icon(Icons.info_outline)),
                                ),
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image(
                                        image: NetworkImage(
                                            feed[index]!.imageURl))),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        const IconButton(
                                            onPressed: null,
                                            icon:
                                                Icon(Icons.favorite_border)),
                                        Text(
                                          feed[index]!.likes.toString()
                                        ),
                                      ],
                                    ),
                                    const ButtonBar(children: [
                                      IconButton(
                                          onPressed: null,
                                          icon: Icon(Icons.share)),
                                      IconButton(
                                          onPressed: null,
                                          icon: Icon(Icons.turned_in_not))
                                    ])
                                  ],
                                )
                              ]),
                        ))
                  ]));
        },
      );
  }
}

class Post {
  String username;
  DateTime date;
  String imageURl;
  String profileImageUrl;
  List<String> postTags;
  int likes;
  List<String> userTags;
  String recommendedReason;

  Post(this.username, this.date, this.imageURl, this.profileImageUrl,
      this.postTags, this.likes, this.userTags, this.recommendedReason);
}
