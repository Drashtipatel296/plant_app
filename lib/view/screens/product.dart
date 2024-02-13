import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/utils/cartlist.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {

    var productPage = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 330,
                  width: 350,
                  child: Image.asset(
                    productPage['img'],
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  productPage['name'],
                  style: GoogleFonts.cabin(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                ),
                const SizedBox(width: 75),
                const Icon(
                  Icons.star,
                  color: Colors.teal,
                ),
                Text(
                  '${productPage['rating']}',
                  style: GoogleFonts.cabin(
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  '(${productPage['review']} reviews)',
                  style: GoogleFonts.cabin(
                    textStyle: TextStyle(
                      color: Colors.grey.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Row(
              children: [
                Text(
                  'Description',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Text(
                  productPage['description'],
                  style: GoogleFonts.cabin(
                    textStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),
            Row(
              children: [
                Text(
                  'Size',
                  style: GoogleFonts.cabin(
                    textStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  width: 70,
                ),
                Text(
                  'Plant',
                  style: GoogleFonts.cabin(
                    textStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  width: 60,
                ),
                Text(
                  'Height',
                  style: GoogleFonts.cabin(
                    textStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                Text(
                  'Humidnity',
                  style: GoogleFonts.cabin(
                    textStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  'Medium',
                  style: GoogleFonts.cabin(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 27),
                Text(
                  'Orchid',
                  style: GoogleFonts.cabin(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 37),
                Text(
                  '${productPage['height']}',
                  style: GoogleFonts.cabin(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(width: 58),
                Text(
                  '${productPage['humidnity']}',
                  style: GoogleFonts.cabin(
                    textStyle: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: GoogleFonts.cabin(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                    Text(
                      '\$ ${productPage['price']}',
                      style: GoogleFonts.cabin(
                        textStyle: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    cartList.add(productPage);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10),
                    height: 60,
                    width: 220,
                    decoration: BoxDecoration(
                      color: const Color(0xff50AD98),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Add to Cart',
                      style: GoogleFonts.cabin(
                        textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}