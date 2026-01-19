import '../models/category_item.dart';

class CategoriesData {
  static List<CategoryItem> getCategories() {
    return [
      CategoryItem(
        title: 'Natural Diamonds',
        subItems: ['Collection', 'Best Selling', 'Seasonal Offers', 'Occasion Offer', 'Deals'],
      ),
      CategoryItem(
        title: 'Lab-grown Diamonds',
        subItems: ['Collection', 'Best Selling', 'Seasonal Offers', 'Occasion Offer', 'Deals'],
      ),
      CategoryItem(
        title: 'Gemstone',
        subItems: ['Collection', 'Best Selling', 'Seasonal Offers', 'Occasion Offer', 'Deals'],
      ),
      CategoryItem(
        title: 'Jewellery',
        subItems: ['Collection', 'Best Selling', 'Seasonal Offers', 'Occasion Offer', 'Deals'],
      ),
      CategoryItem(
        title: 'Do it Yourself',
        subItems: ['Collection', 'Best Selling', 'Seasonal Offers', 'Occasion Offer', 'Deals'],
      ),
      CategoryItem(
        title: 'About Us',
        subItems: ['Our Story', 'Team', 'Mission', 'Contact Us', 'Careers'],
      ),
      CategoryItem(
        title: 'Education',
        subItems: ['Diamond Guide', '4Cs Explained', 'Buying Tips', 'Care Guide', 'FAQ'],
      ),
    ];
  }
}

