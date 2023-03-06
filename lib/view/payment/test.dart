// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:vc/theme/constant/const_colors.dart';
// import 'package:vc/theme/extensions/extensions.dart';
// import 'package:vc/widgets/custom_appbar_two.dart';
//
// import '../../widgets/custom_textform_field.dart';
//
// class TestScreen extends StatelessWidget {
//    TestScreen({Key? key}) : super(key: key);
//    final  ScreenUtil screenUtil = ScreenUtil();
//    final TextEditingController number= TextEditingController();
//    final TextEditingController name= TextEditingController();
//    final TextEditingController email= TextEditingController();
//    final TextEditingController phone= TextEditingController();
//    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Column(
//         children: [
//           Stack(
//             clipBehavior: Clip.none,
//
//             alignment: Alignment.bottomCenter,
//             children: [
//               CustomAppBarTwo(160, text: 'Test Screen'),
//               Positioned(
//                   bottom: -40,
//                   child: Container(height: 100,width: 100,decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           spreadRadius: 3,
//                           blurRadius: 3,
//                           color: Colors.grey.withOpacity(0.5),
//                           offset: Offset(0, 3),
//                         ),
//                       ],
//                       image: DecorationImage(
//                         image: AssetImage('assets/images/jpeg/mohamed.jpeg',),fit: BoxFit.cover,
//                       )
//                   ),)),
//             ],
//           ),
//           50.ph,
//           SingleChildScrollView(
//             child: Container(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text('Account',style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
//                     20.ph,
//                     Container(
//                       height: size.height/2-40,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             blurRadius: 3,
//                             spreadRadius: 3,
//                             offset: Offset(0, 3),
//                           ),
//                         ],
//                       ),
//                       child:  Padding(
//                         padding: EdgeInsets.all(12.0),
//                         child: Form(
//                           key: formKey,
//                           child: Column(
//                             children: [
//                               CustomTextFormField(
//                                 text: 'Ahmed Mabrouk',
//                                 controller: name,
//                                 icon: Icon(Icons.edit_calendar_outlined),
//                                 type: TextInputType.name,
//                               ),
//                               20.ph,
//                               CustomTextFormField(
//                                 text: 'national identification number',
//                                 controller: number,
//                                 icon: Icon(Icons.edit_calendar_outlined),
//                                 type: TextInputType.number,
//                               ),
//                               20.ph,
//                               CustomTextFormField(
//                                 text: 'Ahmed@gmail.com',
//                                 controller: email,
//                                 icon: Icon(Icons.edit_calendar_outlined),
//                                 type: TextInputType.emailAddress,
//                               ),
//                               10.ph,
//                               CustomTextFormField(
//                                 text: '0201112|',
//                                 controller: phone,
//                                 icon: Icon(Icons.edit_calendar_outlined),
//                                 type: TextInputType.number,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                     20.ph,
//                     const Text('Account',style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),),
//                     20.ph,
//                     // Container(
//                     //   height: 100,
//                     //   decoration: BoxDecoration(
//                     //     color: Colors.white,
//                     //     borderRadius: BorderRadius.circular(20),
//                     //     boxShadow: [
//                     //       BoxShadow(
//                     //         color: Colors.grey.withOpacity(0.5),
//                     //         blurRadius: 3,
//                     //         spreadRadius: 3,
//                     //         offset: Offset(0, 3),
//                     //       ),
//                     //     ],
//                     //   ),
//                     //   child:  SingleChildScrollView(
//                     //     child: Padding(
//                     //       padding: EdgeInsets.all(12.0),
//                     //       child: Form(
//                     //         key: formKey,
//                     //         child: Column(
//                     //           children: [
//                     //             CustomTextFormField(
//                     //               text: 'Ahmed Mabrouk',
//                     //               controller: name,
//                     //               icon: Icon(Icons.edit_calendar_outlined),
//                     //               type: TextInputType.name,
//                     //             ),
//                     //             20.ph
//                     //           ],
//                     //         ),
//                     //       ),
//                     //     ),
//                     //   ),
//                     // ),
//
//
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
