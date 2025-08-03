import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thermonic/pages/product_detail/product_detail_controller.dart';
import 'package:thermonic/utils/widget_extensions.dart';

import '../../core/common/widget/common_appbar.dart';
import '../../core/routes/app_pages.dart';
import '../../core/theme/color_constants.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductDetailController());

    return Scaffold(
      /*appBar: AppBar(
        title: const Text(
          "Product Detail",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: ColorConstants.primaryColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),*/
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.vBox,
            CommonAppBar(text: 'lblProductDetailTitle'.tr),
            // Product Info
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Placeholder(
                  fallbackWidth: 80,
                  fallbackHeight: 80,
                  color: Colors.grey,
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    'FLP HEAD J TYPE DUPLEX 6MM WITH REVERSE THREAD C8 (5MM TO 100MM)\n(REGULAR DISC, 5MM)',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),

            // DISC1 Section
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('DISC1', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Obx(() {
                    return Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: controller.discOptions.map((option) {
                        final isSelected = controller.selectedDisc.value == option;
                        return ChoiceChip(
                          showCheckmark: false,
                          avatar: isSelected
                              ? const Icon(Icons.check, color: Colors.white, size: 18)
                              : null,
                          label: Text(option),
                          selected: isSelected,
                          onSelected: (_) => controller.selectedDisc.value = option,
                          selectedColor: ColorConstants.primaryColor,
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                          backgroundColor: Colors.grey.shade200,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      }).toList(),
                    );
                  }),
                ],
              ),
            ),

            // LENGTH Section
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('LENGTH', style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Obx(() {
                    return Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: controller.lengthOptions.map((option) {
                        final isSelected = controller.selectedLength.value == option;
                        return ChoiceChip(
                          showCheckmark: false,
                          avatar: isSelected
                              ? const Icon(Icons.check, color: Colors.white, size: 18)
                              : null,
                          label: Text(option),
                          selected: isSelected,
                          onSelected: (_) => controller.selectedLength.value = option,
                          selectedColor: ColorConstants.primaryColor,
                          labelStyle: TextStyle(
                            color: isSelected ? Colors.white : Colors.black,
                          ),
                          backgroundColor: Colors.grey.shade200,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      }).toList(),
                    );
                  }),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // Quantity and Price Section
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text("Quantity: "),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: controller.decrementQty,
                      ),
                      Text('${controller.quantity.value}'),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: controller.incrementQty,
                      ),
                    ],
                  ),
                  Text(
                    "Price: ₹ ${controller.totalPrice.toStringAsFixed(2)}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              );
            }),

            const SizedBox(height: 30),

            // Full-width Checkout Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.toNamed(Routes.checkOut);
                    //Get.snackbar("Success", "Product configured successfully");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.primaryColor,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Checkout",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
