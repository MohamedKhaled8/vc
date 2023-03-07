import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/theme/extensions/extensions.dart';
import 'package:vc/view/auth_view/auth_view.dart';
import 'package:vc/view/home_view/user_profile/profile_setting_screen.dart';
import 'package:vc/widgets/container_shadow.dart';
import 'package:vc/widgets/custom_appbar_two.dart';
import '../../../theme/constant/const_colors.dart';
import '../../../widgets/arrow_back_icons.dart';
import '../../payment/payment_setting_screen.dart';

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
            clipBehavior: Clip.none,
            alignment: Alignment.bottomCenter,
            children: [
              CustomAppBarOne(160, text: 'Profile Setting '),
              Positioned(
                  bottom: -50,
                  child: Container(height: 100,width: 100,decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 3,
                          blurRadius: 3,
                          color: Colors.grey.withOpacity(0.5),
                          offset: const Offset(0, 3),
                        ),
                      ],
                      image: const DecorationImage(
                        image: AssetImage('assets/images/jpeg/mohamed.jpeg',),fit: BoxFit.cover,)

                  ),
                    // child: controller.image != null?Image.file(controller.image!): Image.asset('assets/images/jpeg/mohamed.jpeg'),
                  )),
            ],
          ),
          60.ph,
          const Text('Ahmed Mabrouk',style:  TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
          5.ph,
          const Text('Ahmed@gmail.com',style:  TextStyle(fontSize: 12),),
          40.ph,
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
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
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
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Expanded(child: Text('Payment Settings',style: TextStyle(fontSize: 18,fontWeight: FontWeight.normal),),),
                            20.pw,
                            const Icon(Icons.payment_outlined,color: Colors.blue,size: 40,),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                onTap: (){
                  Get.to(()=>ProfileSettingScreen());
                },
                child: Container(
                  width: size.width,
                  height: 40,
                  decoration: buildShadowContainer(borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Icon(Icons.person_outline,color: Colors.grey,size: 30,),
                        20.pw,
                        Text('Profile Settings',style: TextStyle(fontSize: 16,color: ColorApp.grey),),
                        const Spacer(),
                        const Icon(Icons.navigate_next_sharp,color: Colors.grey,size: 30,),
                        10.pw,

                      ],
                    ),

                ),
            ),
              ),
          ),
          10.ph,
          buildContainerItem(context, txt: 'Terms and conditions', icon: Icons.indeterminate_check_box,onTap: (){}),
          10.ph,
          buildContainerItem(context, txt: 'FAQ’s', icon: Icons.question_mark_outlined,onTap: (){}),
          10.ph,
          buildContainerItem(context, txt: 'Log out', icon: Icons.logout_outlined,onTap: (){Get.to(()=>AuthAppView());}),
        ],
      ),
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
