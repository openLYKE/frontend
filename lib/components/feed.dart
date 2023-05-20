import 'package:flutter/material.dart';
import 'package:frontend/components/tag_chips.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Feed'),
        ),
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            return Card(
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
                                title: const Text("User"),
                                subtitle: const Text("Date"),
                                trailing: IconButton(
                                    onPressed: () {
                                      showModalBottomSheet<dynamic>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SizedBox(
                                              height: index % 2 == 0 ? 175 : 500,
                                              child: ListView(
                                              children: [
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
                                                  child: (index % 2 == 0)
                                                      ? const Text(
                                                          "This post is shown to you because you are following the user who posted it. You can unfollow the user to stop seeing posts from them.")
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
                                          'https://images.lmu.social/${(index + 1) % 50}.jpg'))),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: null,
                                          icon: Icon(Icons.favorite_border)),
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
