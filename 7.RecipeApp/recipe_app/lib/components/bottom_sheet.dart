import "package:flutter/material.dart";

class MyBottomSheet extends StatefulWidget {
  const MyBottomSheet({super.key});

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  Set<String> chipFilters = <String>{};

  void updateChip(bool selected, String value) {
    setState(() {
      if (selected) {
        chipFilters.add(value);
      } else {
        chipFilters.remove(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: Wrap(
            spacing: 12,
            runSpacing: 8,
            children: [
              FilterChip(label: const Text("Dairy"), selected: chipFilters.contains("Dairy"), onSelected: (bool selected) => updateChip(selected, "Dairy")),
              FilterChip(label: const Text("Protein"), selected: chipFilters.contains("Protein"), onSelected: (bool selected) => updateChip(selected, "Protein")),
              FilterChip(label: const Text("Fish"), selected: chipFilters.contains("Fish"), onSelected: (bool selected) => updateChip(selected, "Fish")),
              FilterChip(label: const Text("Fruit"), selected: chipFilters.contains("Fruit"), onSelected: (bool selected) => updateChip(selected, "Fruit")),
              FilterChip(label: const Text("Cereal"), selected: chipFilters.contains("Cereal"), onSelected: (bool selected) => updateChip(selected, "Cereal")),
              FilterChip(label: const Text("Vegetables"), selected: chipFilters.contains("Vegetables"), onSelected: (bool selected) => updateChip(selected, "Vegetables")),
            ],
          ),
        )
    );
  }
}
