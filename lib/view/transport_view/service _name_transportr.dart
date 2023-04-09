import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/controller/company/company_register_controller.dart';
import 'package:vc/controller/myController.dart';
import 'package:vc/theme/constant/sized.dart';
import 'package:vc/view/transport_view/bottom_navbar_transport.dart';
import 'package:vc/view/transport_view/text_form_field.dart';
import 'package:vc/widgets/arrow_back_icons.dart';
import '../../model/company/all_compaany_model.dart';

class ServiceNameTransport extends StatelessWidget {
  final Data? data;

  ServiceNameTransport({super.key, this.data});

  final controller = Get.put(MyController());
  final TextEditingController emailTransport = TextEditingController();
  final TextEditingController numberTransport = TextEditingController();
  final TextEditingController addressTransport = TextEditingController();
  final TextEditingController companyidTransport = TextEditingController();
  final GlobalKey<FormState> _forKey = GlobalKey();
  final CompanyRegisterController registerController =
      CompanyRegisterController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(
              children: [
                Container(
                  width: double.maxFinite,
                  height: screenUtil.setHeight(300),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/icons/backg1.jpg"),
                    fit: BoxFit.cover,
                  )),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: ArrowBackIcon(
                    color: Colors.white,
                    ontap: () {
                      Get.back();
                    },
                  ),
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(right: 20, left: 20, top: 15),
              width: MediaQuery.of(context).size.width,
              height: screenUtil.setHeight(500),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22))),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data!.name,
                      style:
                          const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: screenUtil.setHeight(20)),
                    FormFieldTransport(
                        data: data!,
                        forKey: _forKey,
                        emailTransport: emailTransport,
                        numberTransport: numberTransport,
                        adressTransport: addressTransport,
                        companyidTransport: companyidTransport),
                    SizedBox(height: screenUtil.setHeight(25)),
                  ],
                ),
              ),
            ),
          ]),
        ),
        bottomNavigationBar: const BottomNavBarTransport(),
      ),
    );
  }
}
