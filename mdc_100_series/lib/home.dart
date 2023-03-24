// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/product.dart';
import 'model/products_repository.dart';
import 'supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.category}) : super(key: key);

  final Category category;

  // TODO: Make a collection of cards (102)
  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        elevation: 0.0,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.asset(product.assetName, package: product.assetPackage, fit: BoxFit.fitWidth,),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(product.name, style: theme.textTheme.button, maxLines: 1, softWrap: false, overflow: TextOverflow.ellipsis,),
                    const SizedBox(height: 8.0,),
                    Text(formatter.format(product.price), style: theme.textTheme.caption,),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }).toList();
  }

  // TODO: Add a variable for Category (104)
  @override
  Widget build(BuildContext context) {
    // TODO: Return an AsymmetricView (104)
    return AsymmetricView(
      products: ProductsRepository.loadProducts(category));
    // TODO: Pass Category variable to AsymmetricView (104)
    // return Scaffold(
    //   // TODO: Add app bar (102)
    //   appBar: AppBar(
    //     leading: IconButton(
    //       icon: const Icon(
    //         Icons.menu,
    //         semanticLabel: 'menu',
    //       ),
    //       onPressed: () {},
    //     ),
    //     title: const Text("SHRINE"),
    //     actions: <Widget>[
    //       IconButton(
    //         icon: const Icon(
    //           Icons.search,
    //           semanticLabel: 'search',
    //         ),
    //         onPressed: () {},
    //       ),
    //       IconButton(
    //         onPressed: () {},
    //         icon: const Icon(
    //           Icons.tune,
    //           semanticLabel: 'filter',
    //         ),
    //       ),
    //     ],
    //   ),
    //   // TODO: Add a grid view (102)
    //   //childAspectRatio => width over height
    //   // body: GridView.count(
    //   //   crossAxisCount: 2,
    //   //   padding: const EdgeInsets.all(16.0),
    //   //   childAspectRatio: 8.0 / 9.0,
    //   //   children: _buildGridCards(context),
    //   // ),
    //   body: AsymmetricView(
    //     products: ProductsRepository.loadProducts(Category.all),
    //   ),
    //   resizeToAvoidBottomInset: false,
    // );
  }
}

/// List.generate
// List<Card> _buildGridCards(int count) {
//     List<Card> cards = List.generate(count, (int index) {
//       return Card(
//         clipBehavior: Clip.antiAlias,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             AspectRatio(
//               aspectRatio: 18.0 / 11.0,
//               child: Image.asset('assets/diamond.png'),
//             ),
//             Padding(
//               padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: const [
//                   Text('Title'),
//                   SizedBox(height: 8.0,),
//                   Text('Secondary Text'),
//                 ],
//               ),
//             )
//           ],
//         ),
//       );
//     },);
//
//     return cards;
//   }
/// Use in gridView
// GridView.count(
//         crossAxisCount: 2,
//         padding: const EdgeInsets.all(16.0),
//         childAspectRatio: 8.0 / 9.0,
//         children: _buildGridCards(10),
//       )
