import 'package:favorite_places/providers/user_places.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlacesScreen extends ConsumerStatefulWidget {
  const AddPlacesScreen({super.key});

  @override
  ConsumerState<AddPlacesScreen> createState() {
    return _AddPlacesState();
  }
}

class _AddPlacesState extends ConsumerState<AddPlacesScreen> {
  final _titleController = TextEditingController();

  void _savePlace(){
    final enteredText = _titleController.text;

    if(enteredText.isEmpty){
      return;
    }

    ref.read(userPlacesProvider.notifier).addPlace(enteredText);

    Navigator.of(context).pop();
  }

  @override
  void dispose(){
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText:'Title',
                ),
                controller: _titleController,
                style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                icon: const Icon(Icons.add),
                onPressed: _savePlace,
                label: const Text('Add Item'),
              ),
            ],
          ),
        ),
    );
  }
}
