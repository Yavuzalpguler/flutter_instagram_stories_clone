import 'package:flutter/material.dart';

class InstagramHeader extends StatelessWidget {
  const InstagramHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              'Instagram',
              style: TextStyle(
                fontSize: 35,
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.upload_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.heart_broken_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.message_rounded),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
