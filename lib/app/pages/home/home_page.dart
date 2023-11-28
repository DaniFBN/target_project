import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../core/shared/themes/color_extension.dart';
import '../../core/shared/widgets/fields/tg_text_field.dart';
import '../../core/shared/widgets/item_card.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.homeStore,
  });

  final HomeStore homeStore;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  void save(String value) {
    if (widget.homeStore.isEditing) {
      widget.homeStore.edit(value);
    } else {
      widget.homeStore.save(value);
    }

    controller.clear();
    focusNode.requestFocus();
  }

  void toEdit(int index, String value) {
    controller.text = value;

    widget.homeStore.toEdit(index);

    focusNode.requestFocus();
  }

  void delete(int index) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        final theme = Theme.of(context);

        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Tem certeza que deseja apagar?'),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: Navigator.of(context).pop,
                      child: Text(
                        'Cancelar',
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        widget.homeStore.delete(index);
                        Navigator.of(context).pop();
                      },
                      child: const Text('Apagar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

    focusNode.requestFocus();
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
                    child: Observer(
                      builder: (context) {
                        return ListView.separated(
                          itemCount: widget.homeStore.state.length,
                          separatorBuilder: (_, __) => const Divider(),
                          itemBuilder: (context, index) {
                            final item = widget.homeStore.state[index];

                            return ItemCard(
                              label: item,
                              onDelete: () => delete(index),
                              onUpdate: () => toEdit(index, item),
                            );
                          },
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
                onSubmit: save,
                focusNode: focusNode,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
