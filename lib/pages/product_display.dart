import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDisplay extends StatefulWidget {
  const ProductDisplay({super.key});

  @override
  State<ProductDisplay> createState() => _ProductDisplayState();
}

class _ProductDisplayState extends State<ProductDisplay> {
  // List<ProductData> prod = productList;
  var isLiked = false;
  int currentIndex = 0;
  CarouselController controller = CarouselController();
  int productWeight = 0;
  int productPrice = 10;
  int totalPrice = 0;

  addProduct() {
    setState(() {
      productWeight++;
      totalPrice = productPrice * productWeight;
    });
  }

  minusProduct() {
    setState(() {
      productWeight--;
      totalPrice = totalPrice - productPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    icon: isLiked
                        ? const Icon(
                            Icons.favorite_border,
                            color: Colors.grey,
                          )
                        : const Icon(
                            Icons.favorite,
                            color: Colors.grey,
                          ))
              ],
            ),
            const Text(
              "lemon Fruits",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "* * * * * ",
                  style: TextStyle(color: Colors.amber, fontSize: 20),
                ),
                Text(
                  "(4.5)",
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
            CarouselSlider.builder(
              carouselController: controller,
              itemCount: ProductDisplay.length,
              itemBuilder: (context, index, realIndex) {
                final image = ProductDisplay[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 8.0),
                  child: Image.asset(
                    image["image"],
                    fit: BoxFit.contain,
                  ),
                );
              },
              options: CarouselOptions(
                  viewportFraction: 1 / 1.6,
                  pageSnapping: false,
                  autoPlayInterval: const Duration(seconds: 3),
                  height: 250,
                  autoPlay: false,
                  onPageChanged: ((index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  })),
            ),
            AnimatedSmoothIndicator(
              activeIndex: currentIndex,
              count: ProductDisplay.length,
              effect: const ScrollingDotsEffect(
                  activeStrokeWidth: 2,
                  activeDotColor: Colors.amber,
                  dotColor: Colors.grey,
                  dotWidth: 16,
                  dotHeight: 6),
              onDotClicked: (index) {
                controller.animateToPage(index);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber,
                        ),
                        child: IconButton(
                            onPressed: minusProduct,
                            icon: const Icon(Icons.remove))),
                  ),
                  Text(
                    "${productWeight}kg",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber,
                        ),
                        child: IconButton(
                            onPressed: addProduct,
                            icon: const Icon(Icons.add))),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      textAlign: TextAlign.start,
                      "Description",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "The Lemon fruit is the fruit of various citrus species in the family Rosaceae. it is primarily refers to Citrus x selenosis. Which is also called sweet orange..... Read more",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Total Price"),
                      Text(
                        "\$ $totalPrice",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.amber),
                          minimumSize: MaterialStateProperty.all(Size(
                              MediaQuery.of(context).size.width / 1.5, 40))),
                      onPressed: () {},
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List ProductDisplay = [
    {
      "image": "asset/images/fruitimage.png",
      "name": "Lemon Fruit",
      "category": "Fruits",
      "price": "\$15.55/kg"
    },
    {
      "image": "asset/images/mango.jpg",
      "name": "Mango",
      "category": "Fruits",
      "price": "\$15.55/kg"
    },
    {
      "image": "asset/images/avocado.jpg",
      "name": "Avocado",
      "category": "Fruits",
      "price": "\$15.55/kg"
    },
    {
      "image": "asset/images/greenchili.jpg",
      "name": "Green Chili",
      "category": "Fruits",
      "price": "\$15.55/kg"
    },
  ];
}
