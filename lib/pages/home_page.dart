import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state/pages/product.dart';
import 'package:flutter_state/pages/product_list_repository.dart';
import 'package:flutter_state/pages/product_repository.dart';

import 'counter_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterProvider);
    final product = ref.watch(productProvider);
    final productList = ref.watch(productListProvider);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("${productList[index].name}"),
                  subtitle: Text("${productList[index].price}"),
                );
              },
            ),
          ),
          Expanded(
              child: Text(
            "${count}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          )),
          Expanded(
              child: Text(
            "${product.name}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
          )),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                final p1 = ref.read(productListProvider.notifier);
                p1.state = [...p1.state, Product(4, "고구마", 5000)];
              },
              child: Text(
                "상품추가",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).increment();
              },
              child: Text(
                "숫자증가",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
              ),
            ),
          ),
          Expanded(child: DecreaseComponent()),
        ],
      ),
    );
  }
}

class DecreaseComponent extends ConsumerWidget {
  const DecreaseComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}
