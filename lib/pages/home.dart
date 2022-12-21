import 'package:flutter/material.dart';
import 'package:fruit_ui/categories/all.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController control;

  @override
  void initState() {
    super.initState();
    control = TabController(
        length: 5,
        vsync: this,
        animationDuration: const Duration(milliseconds: 1));
  }

  @override
  void dispose() {
    control.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber,
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.arrow_back))),
                  Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber,
                      ),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                              Icons.production_quantity_limits_rounded))),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "welcome",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                textAlign: TextAlign.left,
                "BD Shops",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50)),
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.filter),
                    hintText: "Search Category"),
              ),
              Container(
                child: TabBar(
                    indicatorColor: Colors.amber,
                    labelPadding: const EdgeInsets.all(16),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    controller: control,
                    isScrollable: true,
                    tabs: const [
                      Text(
                        "All",
                      ),
                      Text("Fruits"),
                      Text("Vegetables"),
                      Text("Egg & Meat"),
                      Text("Rice"),
                    ]),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: TabBarView(controller: control, children: const [
                  All(),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                  Text("data"),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
