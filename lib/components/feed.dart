import 'package:flutter/material.dart';
import 'package:frontend/components/settings.dart';
import 'package:frontend/components/stacked_bar_chart.dart';
import 'package:frontend/components/tag_chips.dart';
import 'package:intl/intl.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  Widget getBottomSheetText(int index) {
    if (index % 2 == 0) {
      return const Text(
          "This post is shown to you because you are following the user who posted it. You can unfollow the user to stop seeing posts from them.");
    }
    return const Text("The Algorithm");
  }




  @override
  Widget build(BuildContext context) {
     final feed = [
        Post("Mathilde", DateTime(2023, 5, 21, 10, 00, 00), "1", ["Cars", "Tech", "Climate"], 6, ["Cars"], "TAGS"),
        Post("Markus", DateTime(2023, 5, 20, 9, 00, 00), "2", ["Lifestyle"], 6, [""], "FRIENDS"),
       Post(
           "Randy",
           DateTime(2023, 5, 10, 19, 30, 00),
           "3",
           ["Music", "Pop", "Instruments"],
           134,
           ["Music"],
           "POPULAR"),
       null,
       Post("Rosa", DateTime(2023, 5, 9, 18, 00, 00), "4", ["Beauty", "Fashion"], 6, [""], "RANDOM"),

    ];

     final recommendationDescription = { "TAGS": "","FRIENDS": "","POPULAR": "","RANDOM": ""};

     final format = DateFormat('hh:mm dd-MM-yyyy');



     return Scaffold(
        appBar: AppBar(
          title: const Text('Feed'),
          actions: [
            IconButton(onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Settings()));
            }, icon: const Icon(Icons.settings))
          ],
        ),
        body: ListView.builder(
          itemCount: feed.length,
          itemBuilder: (BuildContext context, int index) {
            return
              (feed[index] == null)
                  ?
              SizedBox(
                  height: 320,
                  width: 200,
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text("Most viewed tags:", style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: StackedBarChart(data: [
                              TagData('Unhealthy lifestyle', 0.6,
                                  Colors.black),
                              TagData('Tech', 0.2,
                                  Colors.red),
                              TagData('Cars', 0.2,
                                  Colors.green),
                            ]),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8),
                            child: Text(
                                "You have consumed a lot of content from the following tags. Ban them to see less of them in your feed."),
                          ),
                          Wrap(
                            runSpacing: 3,
                            spacing: 8,
                            children: [
                              ElevatedButton.icon(onPressed: () {

                              }, icon: Icon(Icons.block), label: Text(
                                  "Beauty"),),
                              ElevatedButton.icon(onPressed: () {

                              }, icon: Icon(Icons.block), label: Text("Tech"),),
                              ElevatedButton.icon(onPressed: () {

                              }, icon: Icon(Icons.block), label: Text("Cars"),),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
              )


                  : Card(
                  margin: const EdgeInsets.all(8),
                  color: Colors.blue,
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
                                  leading: const Icon(
                                    Icons.account_circle_rounded,
                                    size: 48.0,
                                  ),
                                  title: Text(feed[index]!.username),
                                  subtitle: Text(
                                      format.format(feed[index]!.date).toString()),
                                  trailing: IconButton(
                                      onPressed: () {
                                        showModalBottomSheet<dynamic>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return SizedBox(
                                                height: index % 2 == 0
                                                    ? 175
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
                                                  const Divider(
                                                    color: Colors.blue,
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 20),
                                                    child: feed[index]!.recommendedReason != "TAGS"
                                                        ? Text(recommendationDescription[feed[index]!.recommendedReason]!)
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
                                                                FontWeight
                                                                    .bold),
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
                                                                  FontWeight
                                                                      .bold)),
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
                                            'https://images.lmu.social/${(index +
                                                1) % 50}.jpg'))),
                                const Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: null,
                                            icon:
                                            Icon(Icons.favorite_border)),
                                        Text(
                                          "0",
                                        ),
                                      ],
                                    ),
                                    ButtonBar(children: [
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
        ));
  }
}

class Post {
  String username;
  DateTime date;
  String imageURl;
  List<String> postTags;
  int likes;
  List<String> userTags;
  String recommendedReason;

  Post(this.username, this.date, this.imageURl, this.postTags, this.likes,
      this.userTags, this.recommendedReason);
}
