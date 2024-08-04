import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> product;
  const ProductDetailsPage({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//---------------------------------App Bar--------------------------------------
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            widget.product['title'] as String,
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 33),
          ),
        ),
        // title: Text(
        //   'Details',
        // ),
      ),
      body: Column(
        children: [
//
//------------------------------Main heading------------------------------------
//
//           Text(
//             widget.product['title'] as String,
//             style: Theme.of(context).textTheme.titleLarge,
//           ),
//
//------------------------------Center Image------------------------------------
//
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(widget.product['imageUrl'] as String),
          ),
          const Spacer(),
//
//------------------------------Bottom Box--------------------------------------
//
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            // margin: const EdgeInsets.symmetric(vertical: 16),
            decoration: const BoxDecoration(
              color: Color.fromRGBO(224, 244, 245, 1.0),
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            ),
            height: MediaQuery.of(context).size.height * 0.33,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //..........price................
                Text(
                  '\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                //..........Shoe Sizes...........
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.product['sizes'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size =
                          (widget.product['sizes'] as List<int>)[index];

                      return Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (selectedSize == size) {
                                selectedSize = 0;
                              } else {
                                selectedSize = size;
                              }
                            });
                          },
                          child: CircleAvatar(
                            backgroundColor: selectedSize == size
                                ? Theme.of(context).colorScheme.primary
                                // ? const Color.fromRGBO(255, 235, 89, 1.0)
                                : const Color.fromRGBO(217, 217, 224, 1.0),
                            child: Text(
                              size.toString(),
                              style: GoogleFonts.lato(fontSize: 14),
                            ),
                          ),
                          // child: Chip(
                          //   shape: const StadiumBorder(
                          //     side: BorderSide(
                          //       color: Color.fromRGBO(152, 152, 164, 1.0),
                          //       // width: 2.0,
                          //     ),
                          //   ),
                          //   label: Text(
                          //     size.toString(),
                          //     style: GoogleFonts.lato(fontSize: 13),
                          //   ),
                          //   backgroundColor: selectedSize == size
                          //       ? Theme.of(context).colorScheme.primary
                          //       // ? const Color.fromRGBO(255, 235, 89, 1.0)
                          //       : null,
                          // ),
                        ),
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),
                //
                //...........Add to Cart Button...........
                //
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black,
                    ),
                    label: Text(
                      'Add to Cart',
                      style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                      // TextStyle(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
