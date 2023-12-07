













import 'package:account_managment/featuers/home_screen/data/modle/product_model.dart';
import 'package:flutter/material.dart';

class DetailsBodyListViewItem extends StatelessWidget {
  const DetailsBodyListViewItem({
    super.key,
    required this.index1,
    required this.productData,
  });

  final int index1;
  final List<ProductModel> productData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                '${productData[index1].productName}',
                style: const TextStyle(fontSize: 15),

              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              color: Colors.black26,
              width: 1,
              height: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              ' ${productData[index1].dateTime!.day} / ${productData[index1].dateTime!.month} / ${productData[index1].dateTime!.year}',
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              color: Colors.black26,
              width: 1,
              height: 25,
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              '${productData[index1].money}',
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Divider(),
        ),
      ],
    );
  }
}
