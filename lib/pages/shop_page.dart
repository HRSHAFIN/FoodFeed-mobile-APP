import 'package:flutter/material.dart';
import 'package:foodfeed/models/cart.dart';
import 'package:foodfeed/pages/create_post.dart';
import 'package:provider/provider.dart';

import '../components/food_tile.dart';
import '../models/food.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key, required List<Map<String, String>> posts})
      : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void addFoodToCart(Food food) {
    Provider.of<Cart>(context, listen: false).addItemToCart(food);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Added into Cart'),
        content: Text('Thanks for Shopping'),
      ),
    );
  }

  void _openPostCreationForm(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => CreatePostPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: ((context, value, child) => Stack(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search for food',
                              hintStyle: TextStyle(color: Colors.grey),
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                            style: TextStyle(color: Colors.black),
                            cursorColor: Colors.grey[600],
                            onSubmitted: (value) {},
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.search, color: Colors.grey),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'Trending Food 🔥',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: value.getFoodList().length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        Food food = value.getFoodList()[index];
                        return Padding(
                          padding:
                              const EdgeInsets.only(right: 10.0, left: 10.0),
                          child: FoodTile(
                            food: food,
                            onTap: () => addFoodToCart(food),
                          ),
                        );
                      },
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 25, right: 25),
                    child: Divider(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: FloatingActionButton(
                  onPressed: () => _openPostCreationForm(context),
                  child: Icon(Icons.add),
                ),
              ),
            ],
          )),
    );
  }
}
