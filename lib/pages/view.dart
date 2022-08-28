import 'package:flutter/material.dart';
import 'package:project_tampa/pages/homepage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:project_tampa/pages/order.dart';
import 'package:project_tampa/utils/size_config.dart';

class View extends StatefulWidget {
  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  late String size;
  int price = 100;
  int a = 0;
  bool selected = true;
  bool selected1 = false;
  bool selected2 = false;
  final _offerController1 = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (c) => const homePage()));
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                    height: 500,
                    width: 368,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: PageView(
                          controller: _offerController1,
                          children: [
                            Image.asset(
                              'assets/images/tshirt.png',
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/tshirt.png',
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/tshirt.png',
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              'assets/images/tshirt.png',
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                //dot indicator
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: SmoothPageIndicator(
                    controller: _offerController1,
                    count: 4,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.blue,
                      dotHeight: 8,
                      dotWidth: 8,
                    ),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Chill Hai',
                            style: TextStyle(
                              fontSize: getProportionateScreenHeight(30),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Rs. $price',
                            style: TextStyle(
                              fontSize: getProportionateScreenHeight(20),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                selected = true;
                                selected1 = false;
                                selected2 = false;
                                print(selected1);
                              });
                            },
                            height: 33,
                            minWidth: 33,
                            elevation: 0,
                            color: selected ? Colors.black : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                              side: const BorderSide(
                                color: Color.fromRGBO(195, 195, 195, 0.5),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'S',
                                style: TextStyle(
                                  color:
                                      !selected ? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                selected1 = true;
                                selected = false;
                                selected2 = false;
                                print(selected1);
                              });
                            },
                            height: 33,
                            minWidth: 33,
                            elevation: 0,
                            color: selected1 ? Colors.black : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                              side: const BorderSide(
                                color: Color.fromRGBO(195, 195, 195, 0.5),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'M',
                                style: TextStyle(
                                  color:
                                      !selected1 ? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                selected = false;
                                selected1 = false;
                                selected2 = true;
                                print(selected1);
                              });
                            },
                            height: 33,
                            minWidth: 33,
                            elevation: 0,
                            color: selected2 ? Colors.black : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(35),
                              side: const BorderSide(
                                color: Color.fromRGBO(195, 195, 195, 0.5),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'L',
                                style: TextStyle(
                                  color:
                                      !selected2 ? Colors.black : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]),
                SizedBox(
                  height: getProportionateScreenHeight(30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                        minWidth: getProportionateScreenWidth(180),
                        onPressed: () {
                          selected?size='S':selected1?size='M':selected2?size='L':size='S';
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (c) => Order(size, price)));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.black)),
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenHeight(15),
                            horizontal: getProportionateScreenWidth(25)),
                        child: Text('Buy now',
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(15),
                                color: Colors.black))),
                    MaterialButton(
                        minWidth: getProportionateScreenWidth(180),
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(color: Colors.black)),
                        padding: EdgeInsets.symmetric(
                            vertical: getProportionateScreenHeight(15),
                            horizontal: getProportionateScreenWidth(25)),
                        child: Text('TRY now',
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(15),
                                color: Colors.black))),
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}
