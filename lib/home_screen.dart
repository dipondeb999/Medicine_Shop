import 'package:flutter/material.dart';
import 'package:medicine_shop/items_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  MySnackBar(message, context){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Medicine Shop',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                MySnackBar('I am a Search', context);
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
          ),
          IconButton(
            onPressed: () {
              MySnackBar('I am a more Option', context);
            },
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: GridView.builder(
        itemCount: ItemsList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            crossAxisSpacing: 2,
          ),
          itemBuilder: (context, index){
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Image.network(ItemsList[index]['img']!,
                      fit: BoxFit.cover,
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Name : ${ItemsList[index]['name'].toString()}",
                        style: const TextStyle(
                          fontSize: 8,
                        ),
                        ),
                        Text("Price : ${ItemsList[index]['price'].toString()}",
                          style: const TextStyle(
                            fontSize: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
