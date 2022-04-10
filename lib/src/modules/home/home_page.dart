import 'package:flutter/material.dart';

import '../mercadorias/mercadorias_interface.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLogged = true;
  final PageController pageController = PageController(viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pushReplacementNamed(context, '/home'),
              child: const Text('Agro Services'),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/mercadorias',
                  arguments: {'type': TypeOfMerchandise.produts}),
              child: const Padding(
                padding: EdgeInsets.only(left: 100, right: 50),
                child: Text('Produtos'),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/mercadorias',
                  arguments: {'type': TypeOfMerchandise.services}),
              child: const Text('Serviços'),
            )
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10, right: 50),
            child: SizedBox(
              width: 250,
              child: Card(
                color: Colors.white,
                child: Row(
                  children: [
                    SizedBox(
                      width: 200,
                      child: TextFormField(),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              icon: const Icon(Icons.account_circle_rounded),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, '/carrinho'),
              icon: const Icon(Icons.shopping_cart),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 350,
                child: GestureDetector(
                  onTap: () {
                    pageController.animateToPage(1,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOutCubicEmphasized);
                  },
                  onDoubleTap: () {
                    pageController.animateToPage(0,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOutCubicEmphasized);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: PageView(
                      controller: pageController,
                      children: [
                        Image.asset('assets/logo.png'),
                        Image.asset('assets/logo.png'),
                        Image.asset('assets/logo.png')
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'Produtos',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/logo.png',
                            height: 150,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: const Center(
                                  child: Text('Comprar'),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Center(
                                  child: Text('Carrinho'),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/logo.png',
                            height: 150,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: const Center(
                                  child: Text('Comprar'),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Center(
                                  child: Text('Carrinho'),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/logo.png',
                            height: 150,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: const Center(
                                  child: Text('Comprar'),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Center(
                                  child: Text('Carrinho'),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20, top: 100),
                child: Text(
                  'Servicos',
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/logo.png',
                            height: 150,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: const Center(
                                  child: Text('Comprar'),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Center(
                                  child: Text('Carrinho'),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/logo.png',
                            height: 150,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: const Center(
                                  child: Text('Comprar'),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Center(
                                  child: Text('Carrinho'),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/logo.png',
                            height: 150,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: const Center(
                                  child: Text('Comprar'),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Center(
                                  child: Text('Carrinho'),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
