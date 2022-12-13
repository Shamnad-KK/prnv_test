import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/home_controller.dart';
import 'home_title_widget.dart';

class HomeCategoryWidget extends StatelessWidget {
  const HomeCategoryWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeTitleWidget(text: 'Categories'),
            const SizedBox(height: 10),
            value.foundList.isNotEmpty
                ? SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: value.foundList.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final category = value.foundList[index];
                        return GestureDetector(
                          onTap: () =>
                              value.getProductsByCategory(category.id, context),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(category.image),
                              ),
                              const SizedBox(height: 5),
                              Text(category.name)
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 14,
                      ),
                    ),
                  )
                : const Center(
                    child: Text('No categories found'),
                  ),
            const SizedBox(height: 10),
            const HomeTitleWidget(text: 'Best Offers'),
          ],
        ),
      ),
    );
  }
}
