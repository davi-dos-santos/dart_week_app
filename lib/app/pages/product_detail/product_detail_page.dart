import 'package:auto_size_text/auto_size_text.dart';
import 'package:dart_week_app/app/core/extensions/farmatter_extension.dart';
import 'package:dart_week_app/app/core/ui/Helpers/size_extensions.dart';
import 'package:dart_week_app/app/core/ui/base_state/base_state.dart';
import 'package:dart_week_app/app/core/ui/styles/text_styles.dart';
import 'package:dart_week_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dart_week_app/app/core/ui/widgets/delivery_increment_decrement_buton.dart';
import 'package:dart_week_app/app/dto/orden_product_dto.dart';
import 'package:dart_week_app/app/models/product_model.dart';
import 'package:dart_week_app/app/pages/product_detail/product_detail_controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailPage extends StatefulWidget {
  final ProductModel product;
  final OrdenProductDto? order;

  const ProductDetailPage({super.key, required this.product, this.order});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState
    extends BaseState<ProductDetailPage, ProductDetailController> {
  @override
  void initState() {
    super.initState();
    final amount = widget.order?.amount ?? 1;
    controller.initial(amount, widget.order != null);
  }

  void _showConfirmeDelete(int amout) {
    showDialog(
      context: context,
      barrierDismissible:
          false, //para que ao clicar executar, clicnado fora não saia da tela sem selecionar uma opção
      builder: (context) {
        return AlertDialog(
          title: const Text("Deseja Excluir o Produto?"),
          actions: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Cancelar',
                style: context.textStyles.textBold.copyWith(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Confirmar',
                style: context.textStyles.textBold,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth,
            height: context.percentHeight(.4),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.product.image),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.product.name,
              style: context.textStyles.textExtraBold.copyWith(fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                //cria um scrol para rolagem somente na descrição
                child: Text(widget.product.description),
              ),
            ),
          ),
          const Divider(),
          Row(
            children: [
              Container(
                width: context.percentWidth(.5),
                height: 68,
                padding: const EdgeInsets.all(8),
                child: BlocBuilder<ProductDetailController, int>(
                    builder: (context, amount) {
                  return DeliveryIncrementDecrementButon(
                    decrementTap: () {
                      controller.decrement();
                    },
                    incrementTap: () {
                      controller.increment();
                    },
                    amount: amount,
                  );
                }),
              ),
              Container(
                  width: context.percentWidth(.5),
                  height: 68,
                  padding: const EdgeInsets.all(8),
                  child: BlocBuilder<ProductDetailController, int>(
                      builder: (context, amount) {
                    return ElevatedButton(
                      style: amount == 0
                          ? ElevatedButton.styleFrom(
                              backgroundColor: Colors.red)
                          : null,
                      onPressed: () {
                        if (amount == 0) {
                          _showConfirmeDelete(amount);
                        } else {
                          Navigator.of(context).pop(
                            OrdenProductDto(
                              product: widget.product,
                              amount: amount,
                            ),
                          );
                        }
                      },
                      child: Visibility(
                        visible: amount > 0,
                        replacement: Text('Excluir Produto',
                            style: context.textStyles.textExtraBold),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Adicionar',
                              style: context.textStyles.textExtraBold
                                  .copyWith(fontSize: 13),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: AutoSizeText(
                                (widget.product.price * amount).currencyPTBR,
                                maxFontSize: 13,
                                minFontSize: 5,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: context.textStyles.textExtraBold,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }))
            ],
          )
        ],
      ),
    );
  }
}
