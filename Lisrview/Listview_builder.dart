/*Food List Json
{
    "foods": {
        "burger": [
            {
                "ord_item_id": 66,
                "res_id": "86",
                "ord_id": "15",
                "item_id": "96",
                "is_print": "0"
            }
        ],
        "pizza": [
            {
                "ord_item_id": 68,
                "res_id": "86",
                "ord_id": "15",
                "item_id": "97",
                "is_print": "0"
            }
        ]
    },
    "drinks": {
        "cocktail": [
            {
                "ord_item_id": 66,
                "res_id": "86",
                "ord_id": "15",
                "item_id": "96",
                "is_print": "0"
            }
        ],
        "mocktail": [
            {
                "ord_item_id": 68,
                "res_id": "86",
                "ord_id": "15",
                "item_id": "97",
                "is_print": "0"
            }
        ]
    }
}*/

import 'dart:convert';

import 'package:flutter/material.dart';

class OrderItem {
  final int ordItemId;
  final String resId;
  final String ordId;
  final String itemId;
  final String isPrint;

  OrderItem({
    required this.ordItemId,
    required this.resId,
    required this.ordId,
    required this.itemId,
    required this.isPrint,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        ordItemId: json['ord_item_id'],
        resId: json['res_id'],
        ordId: json['ord_id'],
        itemId: json['item_id'],
        isPrint: json['is_print'],
      );

  Map<String, dynamic> toJson() => {
        'ord_item_id': ordItemId,
        'res_id': resId,
        'ord_id': ordId,
        'item_id': itemId,
        'is_print': isPrint,
      };
}

class Order {
  final Map<String, List<OrderItem>> foods;
  final Map<String, List<OrderItem>> drinks;

  Order({
    required this.foods,
    required this.drinks,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    final Map<String, List<OrderItem>> foods = {};
    json['foods'].forEach((key, value) {
      foods[key] =
          (value as List).map((item) => OrderItem.fromJson(item)).toList();
    });

    final Map<String, List<OrderItem>> drinks = {};
    json['drinks'].forEach((key, value) {
      drinks[key] =
          (value as List).map((item) => OrderItem.fromJson(item)).toList();
    });

    return Order(
      foods: foods,
      drinks: drinks,
    );
  }

  Map<String, dynamic> toJson() => {
        'foods': foods.map((key, value) =>
            MapEntry(key, value.map((item) => item.toJson()).toList())),
        'drinks': drinks.map((key, value) =>
            MapEntry(key, value.map((item) => item.toJson()).toList())),
      };
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final jsonExample = '''
  {
    "foods": {
      "breakfast": [
        {"ord_item_id": 1, "res_id": "res1", "ord_id": "ord1", "item_id": "item1", "is_print": "yes"},
        {"ord_item_id": 2, "res_id": "res2", "ord_id": "ord2", "item_id": "item2", "is_print": "no"}
      ],
      "lunch": [
        {"ord_item_id": 3, "res_id": "res3", "ord_id": "ord3", "item_id": "item3", "is_print": "yes"}
      ]
    },
    "drinks": {
      "soda": [
        {"ord_item_id": 4, "res_id": "res4", "ord_id": "ord4", "item_id": "item4", "is_print": "no"}
      ]
    }
  }
  ''';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: Center(
        child: FutureBuilder<Order>(
          future: Future.delayed(const Duration(seconds: 3),
              () => Order.fromJson(json.decode(jsonExample))),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              final order = snapshot.data!;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Foods:', style: TextStyle(fontSize: 20)),
                  for (var key in order.foods.keys)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(key,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        for (var item in order.foods[key]!)
                          Text('${item.ordItemId}: ${item.itemId}'),
                      ],
                    ),
                  const SizedBox(height: 20),
                  const Text('Drinks:', style: TextStyle(fontSize: 20)),
                  for (var key in order.drinks.keys)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(key,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        for (var item in order.drinks[key]!)
                          Text('${item.ordItemId}: ${item.itemId}'),
                      ],
                    ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
