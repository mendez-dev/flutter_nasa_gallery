import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: SizedBox(
        height: 56,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
          ),
          padding: const EdgeInsets.fromLTRB(31, 12, 12, 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.search),
              const SizedBox(width: 23.5),
              Expanded(
                child: TextField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    isDense: true,
                    border: InputBorder.none,
                    hintText: 'Search replies',
                    hintStyle: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              CircleAvatar(
                backgroundImage:
                    NetworkImage('https://picsum.photos/seed/picsum/200/300'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
