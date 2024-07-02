import 'package:animation_app/models/grocery_item.dart';
import 'package:animation_app/widgets/new_item.dart';
import 'package:flutter/material.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItem = [];
  @override
  Widget build(BuildContext context) {
    Widget content = const Center(
      child: Text("no item add yet"),
    );
    if (_groceryItem.isNotEmpty) {
      content = ListView.builder(
          itemCount: _groceryItem.length,
          itemBuilder: (ctx, index) => Dismissible(
                key: ValueKey(_groceryItem[index].id),
                onDismissed: (_) {
                 setState(() {
                    _groceryItem.remove(_groceryItem[index]);
                 });
                },
                child: ListTile(
                  title: Text(_groceryItem[index].name),
                  leading: Container(
                      height: 24,
                      width: 24,
                      color: _groceryItem[index].category.color),
                  trailing: Text(_groceryItem[index].quantity.toString()),
                ),
              ));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("GroceryList"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push<GroceryItem>(
                MaterialPageRoute(
                  builder: (ctx) => const NewItem(),
                ),
              )
                  .then((GroceryItem? value) {
                if (value == null) return;
                setState(() {
                  _groceryItem.add(value);
                });
              });
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: content,
    );
  }
}
