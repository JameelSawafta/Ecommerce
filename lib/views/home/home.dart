
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/homeController.dart';
import '../global_widget/custom_item.dart';



class Home extends StatelessWidget {


  List Categories = [
    CustomItem(),
    CustomItem(),
    CustomItem(),
    CustomItem(),
  ];

  List FeaturedProducts = [
    CustomItem(),
    CustomItem(),
    CustomItem(),
    CustomItem(),
  ];

  List FeaturedProducts2 = [
    CustomItem(),
    CustomItem(),
    CustomItem(),
    CustomItem(),
  ];

  final ScrollController _scrollController = ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('STORE', style: TextStyle(color: Colors.white, fontSize: 13)),
        centerTitle: true,
        elevation: 0,
      ),

      bottomNavigationBar: bottomNavigationBar(),
      body: Column(
        children: [
          Expanded(
              child: Container(
                // padding: const EdgeInsets.all(20),
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Ottoman Collection',
                              style: TextStyle(
                                fontSize: 30,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            const Text(
                              'Find the perfect watch for your wrist',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Categories',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    'See all >>',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xffCC9D76),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 213.5,
                        child: ListView.builder(
                          itemCount: Categories.length > 3 ? 3 : Categories.length,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Categories[index];
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Featured Products',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    'See all >>',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xffCC9D76),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            Container(
                              height: 213.5,
                              child: ListView.builder(
                                shrinkWrap: true,
                                controller: _scrollController,
                                itemCount: FeaturedProducts.length > 3 ? 3 : FeaturedProducts.length,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return FeaturedProducts[index];
                                },
                              ),
                            ),
                            Container(
                              height: 213.5,
                              child: ListView.builder(
                                shrinkWrap: true,
                                controller: _scrollController,
                                itemCount: FeaturedProducts2.length > 3 ? 3 : FeaturedProducts2.length,
                                physics: NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return FeaturedProducts2[index];
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              )
          )
        ],
      )

    );
  }

  Widget bottomNavigationBar() {
    return GetBuilder(
      init: HomeController(),
      builder: (controller) => BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
          currentIndex: controller.navIndex,
          onTap: (index) {
            controller.setNavIndex(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset('images/icons/Icons-icon-home.png', width: 20, height: 20),
              label: 'Store',
              activeIcon: Image.asset('images/active_icons/Icons-icon-home.png', width: 20, height: 20),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/icons/Symbols.png', width: 20, height: 20),
              label: 'Categories',
              activeIcon: Image.asset('images/active_icons/Symbols.png', width: 20, height: 20),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/icons/Icons-icon-shopping-bag.png', width: 20, height: 20),
              label: 'Cart',
              activeIcon: Image.asset('images/active_icons/Icons-icon-shopping-bag.png', width: 20, height: 20),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/icons/Icons-icon-bookmark.png', width: 20, height: 20),
              label: 'Wishlist',
              activeIcon: Image.asset('images/active_icons/Icons-icon-bookmark.png', width: 20, height: 20),
            ),
            BottomNavigationBarItem(
              icon: Image.asset('images/icons/Icons-icon-settings.png', width: 20, height: 20),
              label: 'Settings',
              activeIcon: Image.asset('images/active_icons/Icons-icon-settings.png', width: 20, height: 20),
            ),
          ],

      ),
    );
  }

}

