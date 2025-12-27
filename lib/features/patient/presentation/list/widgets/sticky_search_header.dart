import 'package:flutter/material.dart';
import 'package:medpal/core/presentation/constants/mp_ui_constants.dart';
import 'package:medpal/core/presentation/utils/theme_extensions.dart';
import 'package:medpal/l10n/l10n.dart';

class StickySearchHeader extends StatelessWidget {
  const StickySearchHeader({required this.onChangeSearchQuery, super.key});

  final Function(String query) onChangeSearchQuery;

  @override
  Widget build(BuildContext context) =>
      SliverPersistentHeader(pinned: true, delegate: _SearchHeaderDelegate(onChangeSearchQuery: onChangeSearchQuery));
}

class _SearchHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SearchHeaderDelegate({required this.onChangeSearchQuery});

  final Function(String query) onChangeSearchQuery;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final l10n = context.l10n;
    return Container(
      padding: const EdgeInsets.fromLTRB(MPUiConstants.spacingMD, MPUiConstants.spacingSM, MPUiConstants.spacingMD, MPUiConstants.spacingM),
      child: TextField(
        decoration: InputDecoration(
          hintText: l10n.searchPatients,
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: context.colorScheme.surface,
          border: OutlineInputBorder(borderRadius: MPUiConstants.circularRadiusMD, borderSide: BorderSide.none),
        ),
        onChanged: onChangeSearchQuery,
      ),
    );
  }

  @override
  double get minExtent => 72;

  @override
  double get maxExtent => 72;

  @override
  bool shouldRebuild(_) => false;
}
