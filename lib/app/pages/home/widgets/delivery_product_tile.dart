import 'package:dart_week_app/app/core/extensions/farmatter_extension.dart';
import 'package:dart_week_app/app/core/ui/styles/colors_app.dart';
import 'package:dart_week_app/app/core/ui/styles/text_styles.dart';
import 'package:dart_week_app/app/dto/orden_product_dto.dart';
import 'package:dart_week_app/app/models/product_model.dart';
import 'package:dart_week_app/app/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DeliveryProductTile extends StatelessWidget {
  final ProductModel product;
  final OrdenProductDto? ordenProduct;

  const DeliveryProductTile({
    super.key,
    required this.product,
    required this.ordenProduct,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final controller = context.read<HomeController>();
        final ordenProductResult = await Navigator.of(context).pushNamed(
            '/productDetail',
            arguments: {'product': product, 'order': ordenProduct});

        if (ordenProductResult != null) {
          controller.addOrUpdateBag(ordenProductResult as OrdenProductDto);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.name,
                      style: context.textStyles.textExtraBold
                          .copyWith(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.description,
                      style:
                          context.textStyles.textLight.copyWith(fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      product.price.currencyPTBR,
                      style: context.textStyles.textMedium.copyWith(
                          fontSize: 12, color: context.colors.secundary),
                    ),
                  )
                ],
              ),
            ),
            FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif',
              image: product.image,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            )
          ],
        ),
      ),
    );
  }
}
