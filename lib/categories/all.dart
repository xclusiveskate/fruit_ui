import 'package:flutter/material.dart';
import 'package:fruit_ui/pages/product_display.dart';

class All extends StatefulWidget {
  const All({super.key});

  @override
  State<All> createState() => _AllState();
}

class _AllState extends State<All> {
  ScrollController scroll = ScrollController();
  List allCategory = [
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
    {
      "image": "asset/images/fruitimage.png",
      "name": "Lemon Fruit",
      "category": "Fruits",
      "price": "\$15.55/kg"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
          padding: const EdgeInsets.all(8),
          controller: scroll,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: allCategory.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 15.0,
              childAspectRatio: 2 / 2.6),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProductDisplay()));
              },
              child: Container(
                // color: Colors.blue,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(255, 224, 224, 224),
                          spreadRadius: 2,
                          blurRadius: 3,
                          blurStyle: BlurStyle.outer),
                      BoxShadow(
                          color: Color.fromARGB(255, 224, 224, 224),
                          spreadRadius: 2,
                          blurRadius: 3,
                          blurStyle: BlurStyle.outer)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: 100,
                      width: 200,
                      child: Image.asset(allCategory[index]["image"]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  allCategory[index]["name"],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(allCategory[index]["category"]),
                                Text(allCategory[index]["price"]),
                              ],
                            ),
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: const BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    bottomLeft: Radius.circular(5))),
                            child: const Icon(
                              Icons.lock,
                              color: Colors.white,
                              size: 15,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
