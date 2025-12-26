import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/utils/theme_extensions.dart';

class StickySearchHeader extends StatelessWidget {
  const StickySearchHeader({super.key});

  @override
  Widget build(BuildContext context) => SliverPersistentHeader(pinned: true, delegate: _SearchHeaderDelegate());
}

class _SearchHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 72;

  @override
  double get maxExtent => 72;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) => Container(
    padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Search patient',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: context.colorScheme.surface,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
    ),
  );

  @override
  bool shouldRebuild(_) => false;
}
