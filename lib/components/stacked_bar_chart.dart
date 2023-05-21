import 'package:flutter/material.dart';

class StackedBarChart extends StatelessWidget {
  final List<TagData> data;

  const StackedBarChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    double maxWidth = MediaQuery.of(context).size.width - 36;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          Row(
            children: [
              for (int i = 0; i < data.length; i++)
                i == data.length - 1
                    ? Expanded(
                        child: Column(
                          children: [
                            Text(
                              '${(data[i].percentage * 100).toStringAsFixed(0)}%',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                              width: data[i].percentage * maxWidth,
                              child: ColoredBox(
                                color: data[i].color,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          Text(
                            '${(data[i].percentage * 100).toStringAsFixed(0)}%',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                            width: data[i].percentage * maxWidth,
                            child: ColoredBox(
                              color: data[i].color,
                            ),
                          ),
                        ],
                      ),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            for (int i = 0; i < data.length; i++)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 8,
                      height: 8,
                      child: ColoredBox(color: data[i].color),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      data[i].tag,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: data[i].color,
                      ),
                    ),
                  ],
                ),
              ),
          ])
        ],
      ),
    );
  }
}

class TagData {
  TagData(this.tag, this.percentage, this.color);

  final String tag;
  final double percentage;
  final Color color;
}
