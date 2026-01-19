import 'package:flutter/material.dart';
import '../models/category_item.dart';
import '../data/categories_data.dart';
import '../widgets/category_card.dart';
import '../widgets/submenu_items.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? _expandedIndex;
  final List<CategoryItem> _categories = CategoriesData.getCategories();

  void _toggleCategory(int index) {
    setState(() {
      if (_expandedIndex == index) {
        _expandedIndex = null;
      } else {
        _expandedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: _buildCategoryGrid(),
      ),
    );
  }

  Widget _buildCategoryGrid() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: _buildGridRows(),
    );
  }

  Widget _buildGridRows() {
    const int crossAxisCount = 3;
    final expandedCategory = _expandedIndex != null && _expandedIndex! < _categories.length
        ? _categories[_expandedIndex!]
        : null;
    final hasSubmenu = expandedCategory != null && expandedCategory.subItems.isNotEmpty;
    final expandedRowIndex = hasSubmenu ? _expandedIndex! ~/ crossAxisCount : null;

    return CustomScrollView(
      slivers: _buildSlivers(crossAxisCount, expandedRowIndex, expandedCategory),
    );
  }

  List<Widget> _buildSlivers(int crossAxisCount, int? expandedRowIndex, CategoryItem? expandedCategory) {
    if (expandedRowIndex == null) {
      return [
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 0.85,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => _buildCard(index),
            childCount: _categories.length,
          ),
        ),
      ];
    }

    final itemsBefore = expandedRowIndex * crossAxisCount;
    final expandedRowStart = expandedRowIndex * crossAxisCount;
    final expandedRowEnd = ((expandedRowIndex + 1) * crossAxisCount).clamp(0, _categories.length);
    final expandedRowItemCount = expandedRowEnd - expandedRowStart;
    final itemsAfter = _categories.length - expandedRowEnd;

    return [
      if (itemsBefore > 0)
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 0.85,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => _buildCard(index),
            childCount: itemsBefore,
          ),
        ),
      SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          childAspectRatio: 0.85,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => _buildCard(expandedRowStart + index),
          childCount: expandedRowItemCount,
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SubmenuItems(category: expandedCategory!),
        ),
      ),
      if (itemsAfter > 0)
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            childAspectRatio: 0.85,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) => _buildCard(expandedRowEnd + index),
            childCount: itemsAfter,
          ),
        ),
    ];
  }

  Widget _buildCard(int index) {
    if (index >= _categories.length) {
      return const SizedBox.shrink();
    }
    
    final category = _categories[index];
    final isExpanded = _expandedIndex == index;
    
    return CategoryCard(
      category: category,
      index: index,
      isExpanded: isExpanded,
      onTap: () => _toggleCategory(index),
    );
  }
}