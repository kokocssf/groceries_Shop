import 'dart:developer';


import 'package:flutter/material.dart';

import '../data/data/categories.dart';
import '../models/category.dart';
import '../models/grocery_item.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  String _enteredName = "";
  int _enteredQuantity = 0;
  Category _selectedCategory = categories[Categories.fruite]!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("add new item")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                onSaved: (newValue) {
                  _enteredName = newValue!;
                },
                decoration: const InputDecoration(labelText: "name"),
                validator: (String? value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return "error";
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: "1",
                      onSaved: (newValue) {
                        _enteredQuantity = int.parse(newValue!);
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(labelText: "Quantity"),
                      validator: (String? value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0 ||
                            value.trim().length > 50) {
                          return "error";
                        }
                        return null;
                      },
                    ),
                  ),
                  Expanded(
                      child: DropdownButtonFormField(
                          value: _selectedCategory,
                          items: [
                            for (final category in categories.entries)
                              DropdownMenuItem(
                                value: category.value,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      height: 16,
                                      width: 16,
                                      color: category.value.color,
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(category.value.title)
                                  ],
                                ),
                              )
                          ],
                          onChanged: (Category? Value) {
                            setState(() {
                              _selectedCategory = Value!;
                            });
                          }))
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        _formKey.currentState!.reset();
                      },
                      child: const Text("reset")),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          Navigator.of(context).pop(
                           GroceryItem(id: DateTime.now().toString(), name: _enteredName, quantity: _enteredQuantity, category: _selectedCategory),
                          );
                        }
                      },
                      child: const Text("add item"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
