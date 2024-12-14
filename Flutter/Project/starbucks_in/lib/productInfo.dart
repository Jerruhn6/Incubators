import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductsInfo extends StatefulWidget {
  const ProductsInfo({super.key});

  @override
  State<ProductsInfo> createState() => _ProductsInfoState();
}

class _ProductsInfoState extends State<ProductsInfo> {
  String selectedSize = 'Small';
  int caramelCount = 0;
  int chocolateCount = 1;
  int bananaCount = 0;
  int strawberryCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset('assets/cappuccino.png'),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //  const Text('Cappuccino', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Row(
                    children: <Widget>[
                      // Text('Cappuccino', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      Text(
                        'Cappuccino',
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.displayLarge,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.star),
                      Text('4.9'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text('Coffee Size',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    children: <Widget>[
                      _buildSizeButton('Small'),
                      const SizedBox(width: 20),
                      _buildSizeButton('Medium'),
                      const SizedBox(width: 20),
                      _buildSizeButton('Large'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text('About',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id ipsum vivamus velit lorem amet.'),
                  const SizedBox(height: 16),
                  const Text('Add Topping (\$1)',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),

                  _buildToppingRow('Caramel', caramelCount),
                  _buildToppingRow('Chocolate', chocolateCount),
                  _buildToppingRow('Banana', bananaCount),
                  _buildToppingRow('Strawberry', strawberryCount),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 85,
                    width: 360,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                        style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.black),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Add to Cart - \$4',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSizeButton(
    String size,
  ) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedSize = size;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            selectedSize == size ? Colors.brown[500] : Colors.white70,
      ),
      child: Text(
        size,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _buildToppingRow(String topping, int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(topping),
        Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  if (count > 0) {
                    if (topping == 'Caramel') {
                      caramelCount--;
                    } else if (topping == 'Chocolate'){
                      chocolateCount--;
                    }
                    else if (topping == 'Banana'){
                      bananaCount--;
                    }
                    else if (topping == 'Strawberry'){
                       strawberryCount--;
                    }
                  }
                });
              },
            ),
            Text('$count'),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  if (topping == 'Caramel') {
                    caramelCount++;
                  } else if (topping == 'Chocolate') {
                    chocolateCount++;
                  }
                  else if (topping == 'Banana'){
                    bananaCount++;
                  }
                  else if (topping == 'Strawberry') strawberryCount++;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
