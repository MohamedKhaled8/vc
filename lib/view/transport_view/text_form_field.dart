import 'package:flutter/material.dart';
import 'package:vc/theme/constant/const_colors.dart';
import 'package:vc/theme/constant/sized.dart';
import 'package:vc/widgets/custom_textform_field.dart';

import '../../controller/authentication_controller/login_controller.dart';
import '../../model/auth/login_model.dart';
import '../../model/company/all_compaany_model.dart';

class FormFieldTransport extends StatelessWidget {
  LoginModel?loginModel;

   FormFieldTransport({
    super.key,
    required GlobalKey<FormState> forKey,
    required this.emailTransport,
    required this.numberTransport,
    required this.adressTransport,
    required this.companyidTransport,required this.data,
  }) : _forKey = forKey;
  final Data data;

  final GlobalKey<FormState> _forKey;
  final TextEditingController emailTransport;
  final TextEditingController numberTransport;
  final TextEditingController adressTransport;
  final TextEditingController companyidTransport;
final LoginController loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    setData();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "E-mail",
          style:
              TextStyle(fontSize: 16, color: ColorApp.primary),
        ),
        SizedBox(
          height: screenUtil.setHeight(10),
        ),
        SingleChildScrollView(
          child: Form(
            key: _forKey,
              child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                  enable: false,
                  controller: emailTransport,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  type: TextInputType.name,
                  text: 'Enter Your Email',
                ),
                SizedBox(height: screenUtil.setHeight(10)),
                Text(
                  "Phone Number",
                  style: TextStyle(
                      fontSize: 16, color: ColorApp.primary),
                ),
                SizedBox(height: screenUtil.setHeight(10)),
                CustomTextFormField(
                  enable: false,

                  controller: numberTransport,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  type: TextInputType.name,
                  text: 'Enter Yor Number-',
                ),
                SizedBox(height: screenUtil.setHeight(15)),
                Text(
                  "Address",
                  style: TextStyle(
                      fontSize: 16, color: ColorApp.primary),
                ),
                SizedBox(height: screenUtil.setHeight(10)),
                TextFormField(
                  enabled: false,
                  controller: adressTransport,
                  // controller: ,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    } else if (!value.contains('@')) {
                      return 'invalid Email';
                    }
                    return null;
                  },
                  autofocus: false,
                  // controller: controller,
                  textInputAction: TextInputAction.next,
                  onSaved: (newValue) {},
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 1, color: Colors.green),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 1, color: Colors.green),
                      ),

                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 1, color: Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            width: 1, color: Colors.red),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:  BorderSide(
                            width: 1, color: ColorApp.primary),
                      ),
                      contentPadding:
                          const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
                      hintText: "Enter Your Address",
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: Image.asset(
                        "assets/icons/maps.png",
                      )),
                ),
                SizedBox(height: screenUtil.setHeight(15)),
                Text(
                  "Company ID",
                  style: TextStyle(
                      fontSize: 16, color: ColorApp.primary),
                ),
                SizedBox(height: screenUtil.setHeight(10)),
                CustomTextFormField(
                  enable: false,
                  controller: companyidTransport,
                  validate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Required';
                    }
                    return null;
                  },
                  type: TextInputType.emailAddress,
                  text: 'Enter Company Id',
                ),
              ],
            ),
          )),
        )
      ],
    );
  }
  setData(){
    emailTransport.text=data.email;
    numberTransport.text=data.phone.toString();
    adressTransport.text=data.address;
    companyidTransport.text=data.companyId.toString();
  }
}
