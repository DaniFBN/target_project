import 'package:flutter/material.dart';

import '../core/shared/themes/color_extension.dart';
import '../core/shared/widgets/fields/tg_text_field.dart';
import '../core/shared/widgets/item_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();

  void sendMessage(String value) {
    if (value.isEmpty) return;
    controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<ColorExtension>()!;

    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: theme.gradient,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: ListView.separated(
                      itemCount: 1,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, index) {
                        return ItemCard(
                          label: 'Whatever',
                          onDelete: () {},
                          onUpdate: () {},
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TgTextField(
                label: 'Digite seu texto',
                controller: controller,
                onSubmit: sendMessage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
