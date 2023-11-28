import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.label,
    required this.onDelete,
    required this.onUpdate,
  });

  final String label;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(label)),
        IconButton(onPressed: onUpdate, icon: const Icon(Icons.edit)),
        IconButton(onPressed: onDelete, icon: const Icon(Icons.cancel)),
      ],
    );
  }
}
