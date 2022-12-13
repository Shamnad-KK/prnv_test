import 'package:flutter/material.dart';
import 'package:prnv_test/model/carousal_model.dart';
import 'package:prnv_test/model/product_model.dart';
import 'package:prnv_test/view/login/login_screen.dart';
import 'package:prnv_test/view/products/products_screen.dart';

import '../helper/preference_manager.dart';

class HomeController extends ChangeNotifier {
  List<CategoryModel> foundList = [];
  List<ProductModel> productsByCategory = [];
  PreferenceManager manager = PreferenceManager();

  List<CategoryModel> categoriesList = [
    CategoryModel(
      id: 1,
      name: "Fruits",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxvatq63W_GGR3EyU4hpZGDLfJiaxEgKUQPw&usqp=CAU",
    ),
    CategoryModel(
      id: 2,
      name: "Vegetables",
      image:
          "https://img.freepik.com/free-photo/healthy-vegetables-wooden-table_1150-38014.jpg",
    ),
    CategoryModel(
      id: 3,
      name: "Electronics",
      image:
          "https://thumbs.dreamstime.com/b/many-used-modern-electronic-gadgets-use-white-floor-reuse-recycle-concept-top-view-164230611.jpg",
    ),
    CategoryModel(
      id: 4,
      name: "Furniture",
      image: "https://www.woodenstreet.com/images/furniture/deal-1.jpg?v1",
    ),
  ];

  List<CarousalModel> carousal = [
    CarousalModel(
      title: "New Offer",
      description: "Todays special offer",
      offer: "50",
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxvatq63W_GGR3EyU4hpZGDLfJiaxEgKUQPw&usqp=CAU',
    ),
    CarousalModel(
      title: "New Offer",
      description: "Todays special offer",
      offer: "40",
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwkTy-Tz7sCGADJjcFDQgjmgsUZgVgnYv_iQ&usqp=CAU',
    ),
    CarousalModel(
      title: "New Offer",
      description: "Todays special offer",
      offer: "20",
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLt40yPvd6UQFbX04QKt0VIRMskRGyntKnbw&usqp=CAU',
    )
  ];
  List<ProductModel> productsList = [
    ProductModel(
      name: "Apple",
      price: 100,
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-9kAUcxvGwBFNhxm3wXaK_zn7rGP2ROf6Ow&usqp=CAU',
      categoryId: 1,
    ),
    ProductModel(
      name: "Orange",
      price: 80,
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRL7L1kxqTiuV5UEx8Xf89jVFOfSANjvQ4CVQ&usqp=CAU',
      categoryId: 1,
    ),
    ProductModel(
      name: "Onion",
      price: 80,
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFCKshWyO_BVZ402eyrIACwvGKECnrBJkYvw&usqp=CAU',
      categoryId: 2,
    ),
    ProductModel(
      name: "Tomato",
      price: 80,
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSM8hgn_g8Cdz0phxINZ1M2QRDBSeIoZ2-0Wg&usqp=CAU',
      categoryId: 2,
    ),
    ProductModel(
      name: "Potato",
      price: 80,
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZ9stXBVb0eIn5hSCMdAVJb29PdI4-7gZ_Lw&usqp=CAU',
      categoryId: 2,
    ),
    ProductModel(
      name: "Pumpkin",
      price: 80,
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEVZYYDSPtvlZk2Ekqbl6cwI6yrPkBrNdsMw&usqp=CAU',
      categoryId: 2,
    ),
    ProductModel(
      name: "Cucumber",
      price: 80,
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTsCvSBwwp2D4m1CiKMMmZUi6rDRY9kEzSciw&usqp=CAU',
      categoryId: 2,
    ),
    ProductModel(
      name: "Bananna",
      price: 120,
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnpr0D-KE8qePBzqmdJA2PsAAp_qAXPYoC6g&usqp=CAU',
      categoryId: 1,
    )
  ];

  void getProductsByCategory(int categoryId, BuildContext context) {
    productsByCategory = productsList
        .where((element) => element.categoryId == categoryId)
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ProductsScreen(),
    ));
    notifyListeners();
  }

  void logout(BuildContext context) async {
    await manager
        .logOut()
        .then((value) => Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (ctx) => const LogInScreen(),
              ),
              (route) => false,
            ));
  }

  void searchQuery(String query) {
    List<CategoryModel> results = [];

    if (query.isEmpty) {
      results = categoriesList;
    } else {
      results = categoriesList
          .where((element) => element.name
              .toLowerCase()
              .trim()
              .contains(query.toLowerCase().trim()))
          .toList();
    }
    foundList = results;
    notifyListeners();
  }
}
