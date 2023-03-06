import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/theme/extensions/extensions.dart';
import 'package:vc/widgets/container_shadow.dart';
import '../../theme/constant/const_colors.dart';
import '../../widgets/arrow_back_icons.dart';
import '../payment/payment_setting_screen.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                height: size.height / 2 - 170,
                decoration: BoxDecoration(
                  color: ColorApp.primary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ArrowBackIcon(
                            color: Colors.white,
                            ontap: () {
                              Get.back();
                            }),
                        const Text(
                          'User Profile',
                          style: TextStyle(
                              color: Colors.white, fontSize: 22,fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(),
                        SizedBox(
                          width: screenUtil.setWidth(10),
                        ),
                      ],
                    ),
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
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        spreadRadius: 3,
                        blurRadius: 3,
                        color: Colors.grey.withOpacity(0.5),
                        offset: Offset(0, 3),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage('assets/images/jpeg/mohamed.jpeg',),fit: BoxFit.cover,
                    )
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Text('Ahmed Mabrouk',style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            5.ph,
              const Text('Ahmed@gmail.com',style:  TextStyle(fontSize: 12),),
              20.ph,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 55,
                        width: size.width/2,
                        decoration: BoxDecoration(
                          color: ColorApp.fav,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(child: Text('Favorite List',style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),)),
                              Icon(Icons.favorite,color: Colors.red,size: 40,),
                            ],
                          ),
                        ),
                      ),
                    ),
                    15.pw,
                    InkWell(
                      onTap: (){
                        Get.to(()=>PaymentSettingScreen());
                      },
                      child: Expanded(
                        child: Container(
                          height: 55,
                          width: size.width/2,
                          decoration: BoxDecoration(
                            color: ColorApp.payment,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(child: Text('Payment Settings',style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),),),
                                20.pw,
                                Icon(Icons.payment_outlined,color: Colors.blue,size: 40,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              30.ph,
              InkWell(
             onTap: (){},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    width: size.width,
                    height: 40,
                    decoration: buildShadowContainer(borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.person_outline,color: Colors.grey,size: 30,),
                          20.pw,
                          Text('Profile Settings',style: TextStyle(fontSize: 16,color: ColorApp.grey),),
                          Spacer(),
                          Icon(Icons.navigate_next_sharp,color: Colors.grey,size: 30,),
                          10.pw,

                        ],
                      ),
                    ),

                  ),
                ),
              ),
              10.ph,
              buildContainerItem(context, txt: 'Terms and conditions', icon: Icons.indeterminate_check_box,onTap: (){
                Get.to(()=>)
              }),
              10.ph,
              buildContainerItem(context, txt: 'FAQ’s', icon: Icons.question_mark_outlined,onTap: (){}),
              10.ph,
              buildContainerItem(context, txt: 'Log out', icon: Icons.logout_outlined,onTap: (){}),

          ],),
        ],
      )
    );
  }
 Padding buildContainerItem(BuildContext context,{ required String txt, required IconData icon,required Function() onTap}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 40,
          decoration: buildShadowContainer(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(icon,color: ColorApp.grey,size: 30,),
                20.pw,
                Text(txt,style: TextStyle(fontSize: 16,color: ColorApp.grey),),
              ],
            ),
          ),

        ),
      ),
    );

 }
}
