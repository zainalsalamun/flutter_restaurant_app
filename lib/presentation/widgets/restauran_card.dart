import 'package:flutter/material.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/restaurant');
        },
        child: Card(
          child: ListTile(
            title: Text('Restaurant Name'),
            subtitle: Text('Restaurant Address'),
            leading: CircleAvatar(
              radius: 18,
              child: Image.network('https://via.placeholder.com/150'),
            ),
          ),
        ));
  }
}
