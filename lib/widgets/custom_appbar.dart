import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 50,
      pinned: true,
      expandedHeight: 150,
      floating: true,
      backgroundColor: Colors.white,
      title: const Text(
        'Notes',
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () {},
          color: Colors.black,
          splashRadius: 20,
          icon: const Icon(Icons.search),
        ),
        IconButton(
          onPressed: () {},
          color: Colors.black,
          splashRadius: 20,
          icon: const Icon(Icons.more_vert),
        ),
      ],
    );
  }
}
