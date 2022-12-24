import 'package:finalproject/controller/cart_controller.dart';
import 'package:finalproject/views/global_widget/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('CART', style: TextStyle(color: Colors.white, fontSize: 13)),
          centerTitle: true,
          elevation: 0,
        ),
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
                  child: GetBuilder<CartController>(
                    init: CartController(),
                    builder: (con)  =>   con.cartItemModel.length == 0
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'images/undraw_empty_cart_co35.svg',
                              height: 200,
                              width: 200,
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Your cart is empty',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              'Looks like you haven\'t made your choice yet',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        )


                      :
                    Column(
                      children: [
                        Expanded(
                          child: GetBuilder<CartController>(
                            init: CartController(),
                            builder: (conroller1) => ListView.builder(
                              itemCount: conroller1.cartItemModel.length,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                                    height: 100,
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(20)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5.0,
                                          spreadRadius: 0.0,
                                          offset: Offset(0.0, 0.0), // shadow direction: bottom right
                                        )
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(left: 10),
                                          height: 80,
                                          width: 80,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                          ),
                                          child: Image.network('${conroller1.cartItemModel[index].image}'),
                                        ),
                                        const SizedBox(width: 10),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(conroller1.cartItemModel[index].name!.length > 13 ? '${conroller1.cartItemModel[index].name!.substring(0, 12)}...' :'${conroller1.cartItemModel[index].name }' , style: TextStyle(fontSize: 15)),
                                            const SizedBox(height: 10),
                                            Text('${conroller1.cartItemModel[index].price}', style: TextStyle(fontSize: 15)),
                                          ],
                                        ),
                                        const Spacer(),
                                        Container(
                                          margin: const EdgeInsets.only(right: 10),
                                          height: 30,
                                          width: 80,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(Radius.circular(20)),
                                          ),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(child: Icon(Icons.remove, size: 15)
                                                , onTap: () {
                                                  conroller1.decreaseQuantity(index);
                                                },),
                                              Text('${conroller1.cartItemModel[index].quantity.toString()}',
                                                  style: TextStyle(fontSize: 15)),
                                              InkWell(child: Icon(Icons.add, size: 15)
                                                , onTap: () {
                                                  conroller1.increaseQuantity(index);
                                                },),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            conroller1.deleteItem(index);
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(right: 10),
                                            height: 30,
                                            width: 30,
                                            decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.all(Radius.circular(20)),
                                            ),
                                            child: const Icon(Icons.delete, color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(20),
                          height: 200,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                   Text('SUBTOTAL', style: TextStyle(color: Color(0xffF7F7F7), fontSize: 14)),
                                  const Spacer(),
                                   GetBuilder<CartController>(
                                      init: CartController(),
                                     builder: (controller2) => Text('€ ${controller2.totalPrice}',
                                         style: TextStyle(color: Colors.white, fontSize: 14)),
                                   ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                   Text('SHIPPING', style: TextStyle(color: Color(0xffF7F7F7), fontSize: 14)),
                                  const Spacer(),
                                   Text('€ 100', style: TextStyle(color: Colors.white, fontSize: 14)),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                children: [
                                  const Text('Total to Pay', style: TextStyle(color: Color(0xffF7F7F7), fontSize: 20)),
                                  const Spacer(),
                                  GetBuilder<CartController>(
                                    init: CartController(),
                                    builder: (controller2) => Text('€ ${controller2.totalPrice}',
                                        style: TextStyle(color: Colors.white, fontSize: 20)),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              CustomButton(
                                  width: 240,
                                  height: 44,
                                  text: "PLACE ORDER",
                                  onPressed: () {},
                              )
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
}
