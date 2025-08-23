import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Dialog(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                  labelText: 'Název zastávky',
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  context.pop(controller.text);
                },
                label: const Text('Použít filtr'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
