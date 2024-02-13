import 'package:flutter/material.dart';
import 'package:plant_app/utils/cartlist.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  double calculateTotalPrice() {
    double total = 0.0;
    for (var item in cartList) {
      double price = double.parse(item['price']);
      total += (item['quantity'] * price);
    }
    return total;
  }

  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'My Cart',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    cartList.length,
                    (index) => Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(15),
                          width: 380,
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 230,
                                    width: 180,
                                    decoration: BoxDecoration(
                                      color: const Color(0xffEDEDED),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Image.asset(cartList[index]['img'], fit: BoxFit.cover),
                                  ),
                                  const SizedBox(width: 18),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cartList[index]['name'],
                                        style: const TextStyle(
                                            fontSize: 25, fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 8),
                                      // Add spacing between lines
                                      Text(
                                        'Size: M',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey.shade600,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(height: 15),
                                      // Add spacing between lines
                                      Text(
                                        '\$ ${cartList[index]['price']}',
                                        style: const TextStyle(
                                            fontSize: 18, fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(height: 90),
                                      Row(
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: 25,
                                            width: 25,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              border:
                                              Border.all(color: Colors.black, width: 1.5),
                                            ),
                                            child: InkWell(
                                              onTap: (){
                                                  setState(() {
                                                    cartList[index]['quantity']--;
                                                  });
                                                },
                                              child: const Text(
                                                ' - ',
                                                style: TextStyle(
                                                    color: Colors.black, fontSize: 18),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            '${cartList[index]['quantity']}',
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 19,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(width: 15),
                                          Container(
                                            alignment: Alignment.center,
                                            height: 25,
                                            width: 25,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8),
                                              border:
                                              Border.all(color: Colors.black, width: 1.5),
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                  setState(() {
                                                    cartList[index]['quantity']++;
                                                  });
                                                },
                                              child: const Text(
                                                ' + ',
                                                style:
                                                TextStyle(color: Colors.black, fontSize: 18),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 40),
                                          IconButton(
                                            onPressed: () {
                                                setState(() {
                                                  cartList.removeAt(index);
                                                });
                                            },
                                            icon: const Icon(
                                              Icons.delete_outline,
                                              color: Colors.grey,
                                              size: 30,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  const Text(
                    ('Sub Total'),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    '\$${calculateTotalPrice().toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const Divider(thickness: 0.5),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  const Text(
                    ('Total'),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    '\$${calculateTotalPrice().toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                  height: 50,
                  width: 400,
                  decoration: BoxDecoration(
                    color: const Color(0xff50AD98),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: const Color(0xff50AD98), width: 1),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.teal,
                        blurRadius: 1,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'Checkout',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
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
