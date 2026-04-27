import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/data/models/category_model.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategoryPage> {
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  void _saveCategory() {
    if (formstate.currentState!.validate()) {
      final newCategory = Category(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: nameController.text.trim(),
        description: descriptionController.text.trim(),
      );

      Navigator.pop(context, newCategory);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add new category")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formstate,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Category Name',
                  // border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter category name';
                  }
                  if (value.length < 2) return "Min 2 chars";
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  // border: OutlineInputBorder(),
                ),
                // maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveCategory,
                child: const Text('Save Category'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
