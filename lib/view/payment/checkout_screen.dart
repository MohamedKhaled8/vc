import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/theme/extensions/extensions.dart';
import 'package:vc/view/payment/order_details_screen.dart';
import 'package:vc/widgets/container_shadow.dart';
import '../../theme/constant/const_colors.dart';
import '../../widgets/custom_appbar_two.dart';
import '../../widgets/cutom_buttom_two.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: size.width,
                height: size.height / 2 - 100,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                height: size.height / 2 - 180,
                decoration: BoxDecoration(
                  color: ColorApp.primary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    CustomAppBarOne(110, text: 'Checkout'),
                  ],
                ),
              ),
              Positioned(
                left: 30,
                right: 30,
                top: size.height / 3 - 140,
                child: Container(
                  width: size.width,
                  height: 140,
                  decoration: buildShadowContainer(borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          width: size.width - 90,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.yellow.shade700,
                            image: DecorationImage(
                              image: AssetImage('assets/icons/checkout.png')
                            )
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                            Text('Change Card',style: TextStyle(fontSize: 18,color: Colors.white),),
                                    Container(
                                      height: screenUtil.setHeight(30),
                                      width: screenUtil.setWidth(30),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle
                                      ),
                                    ),

                                  ],
                                ),
                                20.ph,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('•••• •••• •••• 3333',style: TextStyle(fontSize: 14,color: Colors.white),),
                                    Text('07/24',style: TextStyle(fontSize: 14,color: Colors.white),),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: screenUtil.setHeight(48),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                        ),
                        child: Center(child: Text('Change Card',style: TextStyle(fontSize: 18),),),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Container(
              width: size.width / 2,
              height: 40,
              decoration: buildShadowContainer(borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: [
                    Container(
                      height: 30,
                      width:30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorApp.primary),
                      ),
                      child: Center(child: Icon(Icons.add,color: ColorApp.primary,)),
                    ),
                    SizedBox(
                      width: screenUtil.setWidth(10),
                    ),
                    Expanded(
                        child: Text(
                      'Add Payment Card',
                      style: TextStyle(color: ColorApp.primary, fontSize: 14),
                    )),
                  ],
                ),
              ),
            ),
          ),
          10.ph,
          Container(
            height: screenUtil.setHeight(186.5),
            width: size.width - 40,
            decoration: buildShadowContainer(borderRadius: BorderRadius.circular(20)),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         'Order details',
                         style: TextStyle(fontSize: 18, color: ColorApp.primary),
                       ),
                10.ph,
                       Row(
                         children: [
                           Expanded(
                             child: Row(
                               children: const [
                                 Text(
                                   'Date :',
                                   style:
                                       TextStyle(fontSize: 14, color: Colors.grey),
                                 ),
                                 Text(
                                   'September 21, 2023',
                                   style: TextStyle(fontSize: 12),
                                 ),
                               ],
                             ),
                           ),
                           Row(
                             children: [
                               Text(
                                 'Time :',
                                 style: TextStyle(fontSize: 14, color: Colors.grey),
                               ),
                               Text(
                                 '01:30 pm',
                                 style: TextStyle(fontSize: 12),
                               ),
                             ],
                           ),
                         ],
                       ),
                       10.ph,
                       const Text(
                         'Address :',
                         style: TextStyle(fontSize: 14, color: Colors.grey),
                       ),
                       const Text(
                         '95, Opposite Arjun College, Kairav Plot, Township No. 21',
                         style: TextStyle(fontSize: 12),
                       ),
                     ],
                   ),
                 ),
                 10.ph,
                 Row(
                   children: [
                     Expanded(
                         child:InkWell(
                           onTap:(){
                             Get.to(()=>OrderDetailsScreen());
                           },
                           child: Container(
                             height: 40,
                             decoration: BoxDecoration(
                               color: ColorApp.primary,
                               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),),
                             ),
                             child: Center(child: Text('See All',style: TextStyle(color: Colors.white,fontSize: 14),),),
                           ),
                         )),
                     5.pw,
                     Expanded(
                         child:InkWell(
                           onTap:(){
                           },
                           child: Container(
                             height: 40,
                             decoration: BoxDecoration(
                               color: ColorApp.buttonBlue,
                               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10),),
                             ),
                             child: Center(child: Text('Edit',style: TextStyle(color: Colors.white,fontSize: 14),),),
                           ),
                         )),
                   ],
                 ),
               ],
             ),
          ),
          10.ph,
          Container(
            height: 158,
            width: size.width - 40,
            decoration: buildShadowContainer(borderRadius: BorderRadius.circular(20),),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Price Summary',
                        style: TextStyle(fontSize: 18, color: ColorApp.primary),
                      ),
                      SizedBox(
                        height: screenUtil.setHeight(5),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'Cleaning',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          Text(
                            '250 \$',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenUtil.setHeight(5),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          Text(
                            '10 \$',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenUtil.setHeight(5),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Discount',
                            style: TextStyle(fontSize: 18, color: Colors.grey),
                          ),
                          Text(
                            '0 \$',
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ],
                      ),
                      5.ph,
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child:Container(
                            height: 40,
                            decoration: BoxDecoration(
                              color: ColorApp.primary,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20),)
                            ),
                            child:
                            Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 20.0),
                          textAlign: TextAlign.center),
                      Text('260\$',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal,
                              fontSize: 18.0),
                          textAlign: TextAlign.center),
                    ],
                  ),
                ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenUtil.setHeight(10),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 50,
        width: size.width,
        decoration:buildShadowContainer(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          child: CustomButtonTWo(
            screenUtil: screenUtil,
            color: ColorApp.primary,
            color1: Colors.white,
            txt: 'Payment confirmation',onTap: (){},),
        ),
      ),
    );
  }
}
