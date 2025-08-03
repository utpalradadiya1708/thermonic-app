import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../core/common/widget/common_appbar.dart';
import '../../core/routes/app_pages.dart';
import '../../core/theme/color_constants.dart';
import 'course_package_list_controller.dart';

class CoursePackageListView extends GetView<CoursePackageListController> {
  const CoursePackageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          20.vBox,
          CommonAppBar(text: 'lblProductListTitle'.tr).marginOnly(left: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  // Search Field
                  TextField(
                    controller: controller.searchController,
                    focusNode: controller.searchFocus,
                    onChanged: controller.onSearchDebounced,
                    decoration: InputDecoration(
                      hintText: 'Search product...',
                      prefixIcon: const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  // Product Grid
                  Expanded(
                    child: Obx(() {
                      if (controller.isShimmerShow.value) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (controller.productList.isEmpty) {
                        return const Center(child: Text("No products found."));
                      }

                      return GridView.builder(
                        itemCount: controller.productList.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12,
                          crossAxisSpacing: 12,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) {
                          final product = controller.productList[index];
                          return GestureDetector(
                            onTap: (){
                              Get.toNamed(
                                Routes.productDetail,
                                arguments: product,
                              );
                            },
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Product Title
                                    Text(
                                      product['name'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const Spacer(),
                                    // Product Description
                                    Text(
                                      product['description'] ?? 'No description available.',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black54,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),

                                    const Spacer(),

                                    // Price
                                    Text(
                                      '₹ ${product['price']}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 8),

                                    // Add Button
                                    SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          // Add to cart logic here
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: ColorConstants.primaryColor,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: const Text("Add",style: TextStyle(color: Colors.white),),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
