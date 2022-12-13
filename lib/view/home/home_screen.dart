import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:prnv_test/controller/home_controller.dart';
import 'package:prnv_test/view/home/widgets/home_carousal_widget.dart';
import 'package:prnv_test/view/home/widgets/home_category_widget.dart';
import 'package:prnv_test/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      homeController.searchQuery('');
    });
    log('kuuyt');
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 80),
        child: Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(color: Colors.blue),
          child: Center(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Consumer<HomeController>(
                builder: (context, value, child) => CustomTextField(
                  fillColor: Colors.white,
                  filled: true,
                  hint: 'Search..',
                  onchanged: (p0) {
                    value.searchQuery(p0);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<HomeController>(builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(height: 10),
                HomeCarousalWidget(),
                HomeCategoryWidget(),
                HomeCarousalWidget()
              ],
            );
          }),
        ),
      ),
    );
  }
}
