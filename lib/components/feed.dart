import 'package:flutter/material.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Feed'),
        ),
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            // A card which looks like twitter posts
            return Card(
                margin: const EdgeInsets.all(8),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ListTile(
                          contentPadding: EdgeInsets.all(0),
                          leading: Icon(
                            Icons.account_circle_rounded,
                            size: 48.0,
                          ),
                          title: Text("User"),
                          subtitle: Text("Date"),
                        ),
                        const Text("Lorem ipsum "),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: const Image(
                              image: NetworkImage("https://images.pexels.com/photos/2662116/pexels-photo-2662116.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1")
                            )
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: null,
                                icon: Icon(Icons.favorite_border)),
                           IconButton(onPressed: null, icon: Icon(Icons.share)),
                            IconButton(onPressed: null, icon: Icon(Icons.turned_in_not))
                          ],
                        )
                      ]),
                ));
          },
        ));
  }
}
