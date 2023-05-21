import 'package:flutter/material.dart';

class TagChips extends StatefulWidget {
  const TagChips({Key? key, required this.alltags, required this.selectedTags}) : super(key: key);

  final List<String> alltags;
  final List<String> selectedTags;

  @override
  State<TagChips> createState() => _TagChipsState();
}

class _TagChipsState extends State<TagChips> {
  List<String> selectedTags = [];
  List<String> blockedTags = [];

  @override
  Widget build(BuildContext context) {
    selectedTags = widget.selectedTags;
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: widget.alltags.map((String tag) {
        return ActionChip(
          label: Text(tag),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0))

          ),
          backgroundColor: selectedTags.contains(tag)
              ? const Color(0x804caf50)
              : blockedTags.contains(tag)
                  ? const Color(0x80f44336)
                  : const Color(0x4003a9f4),
          avatar: selectedTags.contains(tag)
              ? const Icon(Icons.check, color: Colors.green)
              : blockedTags.contains(tag)
                  ? const Icon(
                      Icons.close,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.circle_outlined,
                      color: Colors.grey,
                    ),
          onPressed: () {
            setState(() {
              if (selectedTags.contains(tag)) {
                selectedTags.remove(tag);
                blockedTags.add(tag);
              } else if (blockedTags.contains(tag)) {
                blockedTags.remove(tag);
              } else {
                selectedTags.add(tag);
              }
            });
          },
        );
      }).toList(),
    );
  }
}
