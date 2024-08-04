import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/product_card.dart';
import 'package:shopping_app/product_details_page.dart';

import 'global_variables.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    'All',
    'Bata',
    'Addidas',
    'Nike',
    'Puma',
    'Skechers',
    'Crocks',
  ];

  late String selectedFilter;

  @override
  void initState() {
    selectedFilter = filters[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 2)),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );

    return SafeArea(
      child: Column(
        children: [
//--------------------------Heading + Search box--------------------------------
          Row(
            children: [
              //............Heading...............
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Text(
                  "Shoes \nCollection",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              //............Search Box.............
              const Expanded(
                child: SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                      border: border,
                      enabledBorder: border,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black54),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
//--------------------------List of Types of shoes------------------------------
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18, vertical: 10),
                        label: Text(
                          filter,
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w600,
                            fontSize: selectedFilter == filter ? 17 : 15,
                          ),

                          // style: const TextStyle(
                          //     fontWeight: FontWeight.w500,
                          //     fontFamily: 'EduAUVICWANTHand'),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        backgroundColor: selectedFilter == filter
                            ? Theme.of(context).colorScheme.primary
                            : const Color.fromRGBO(218, 238, 246, 1.0),
                        side: const BorderSide(
                          color: Color.fromRGBO(238, 238, 245, 1.0),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
//----------------------------List of items(shoes)------------------------------
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return ProductDetailsPage(product: product);
                      }),
                    );
                  },
                  child: ProductCard(
                    title: product['title'] as String,
                    price: product['price'] as double,
                    image: product['imageUrl'] as String,
                    backgroundColor: index.isEven
                        ? const Color.fromRGBO(177, 197, 213, 1.0)
                        : const Color.fromRGBO(198, 198, 204, 1.0),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
