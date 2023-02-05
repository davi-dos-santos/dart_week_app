import 'package:dart_week_app/app/core/ui/Helpers/loader.dart';
import 'package:dart_week_app/app/core/ui/Helpers/menssages.dart';
import 'package:dart_week_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:dart_week_app/app/models/product_model.dart';
import 'package:dart_week_app/app/pages/home/widgets/delivery_product_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with Loader, Menssages {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetBuilder.instance.addPostFrameCalback((timeStamp) {
  //     context.read<HomeController>().loadProducts();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return DeliveryProductTile(
                  product: ProductModel(
                    id: 0,
                    nome: 'lache x',
                    description: 'Descrição',
                    price: 15.0,
                    image:
                        'https://assets.unileversolutions.com/recipes-v2/106684.jpg?imwidth=800',
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
