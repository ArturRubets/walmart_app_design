import 'package:walmart_app_design/model/food.dart';

class FoodRepository {
  static List<Food> loadFoods() {
    const allFoods = [
      Food(
        id: 0,
        assetPath: 'assets/images/food_line/image 17.png',
        productName: 'Gala Apples, 3lb Bag',
        note: 'Final cost by weight',
        pricePerWeight: 2.27,
        price: 4.62,
        isStock: true,
        location: 'S23',
      ),
      Food(
        id: 1,
        assetPath: 'assets/images/food_line/image 17 (1).png',
        productName: 'Wonder Bread Classic',
        note: 'Wonder',
        pricePerWeight: 11.9,
        price: 2.39,
        isStock: true,
        location: 'S23',
      ),
      Food(
        id: 2,
        assetPath: 'assets/images/food_line/image 17 (2).png',
        productName: 'Ultra-Filtered Milk',
        note: 'Fairlife 2%',
        pricePerWeight: 7.7,
        price: 3.98,
        isStock: true,
        location: 'S23',
      ),
      Food(
        id: 3,
        assetPath: 'assets/images/food_line/image 17 (3).png',
        productName: 'Bananas, Each',
        note: 'Fresh Produce',
        price: 0.21,
        isStock: true,
        location: 'S23',
      ),
      Food(
        id: 4,
        assetPath: 'assets/images/food_line/image 17 (4).png',
        productName: 'Creamy Peanut Butter',
        note: '18 oz, Great Value',
        pricePerWeight: 9.6,
        price: 1.72,
        isStock: true,
        location: 'S23',
      ),
      Food(
        id: 5,
        assetPath: 'assets/images/food_line/image 17 (5).png',
        productName: 'Ben & Jerry' 's',
        note: 'Strawberry Cheesecake',
        pricePerWeight: 28.0,
        price: 4.62,
        isStock: true,
        location: 'S23',
      ),
      Food(
        id: 6,
        assetPath: 'assets/images/food_line/image 17 (6).png',
        productName: 'Hass Avocados',
        note: 'Fresh Produce',
        pricePerWeight: 2.27,
        price: 3.78,
        isStock: true,
        location: 'S23',
      ),
      Food(
        id: 7,
        assetPath: 'assets/images/food_line/image 17 (7).png',
        productName: 'Fresh Spinach, 10 oz',
        note: 'Marketside',
        pricePerWeight: 21.8,
        price: 2.18,
        isStock: true,
        location: 'S23',
      ),
    ];
    return allFoods;
  }
}
