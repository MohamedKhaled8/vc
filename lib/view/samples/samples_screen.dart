import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vc/controller/profile_controller.dart';
import 'package:vc/theme/constant/sized.dart';
import 'package:vc/view/payment/payment_method_screen.dart';

import 'package:vc/widgets/custom_text_next_button.dart';
import 'package:whatsapp_camera/camera/camera_whatsapp.dart';
import '../../model/services_model/user_home_model.dart';
import '../../theme/constant/const_colors.dart';
import '../../widgets/custom_app_bar.dart';

class SamplesScreen extends StatefulWidget {
  final Service serviceModel;
  final Map orderData;
  const SamplesScreen(
      {Key? key, required this.serviceModel, required this.orderData})
      : super(key: key);

  @override
  State<SamplesScreen> createState() => _SamplesScreenState();
}

class _SamplesScreenState extends State<SamplesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    images.clear();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    Size size = MediaQuery.of(context).size;
    List<String> imagesList = [];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 0.85),
      body: Column(
        children: [
          CustomAppbar(
            image: setImage(),
            serviceName: widget.serviceModel.title!,
            rating: widget.serviceModel.rate!.toDouble(),
          ),
          Container(
            padding: const EdgeInsets.only(right: 20, left: 20, top: 30),
            width: MediaQuery.of(context).size.width,
            height: screenUtil.setHeight(532),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
              ),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Picture',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: screenUtil.setHeight(15),
              ),
              const Text(
                'Please upload some samples',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(
                height: screenUtil.setHeight(10),
              ),
              images.isNotEmpty
                  ? Container(
                      height: screenUtil.setHeight(390),
                      child: GridView.count(
                        scrollDirection: Axis.vertical,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20,
                        children: List.generate(images.length, (index) {
                          if (index == images.length - 1) {
                            return images.last;
                          }
                          return imageCard(
                            index: index,
                          );
                        }),
                      ),
                    )
                  : const SizedBox(),
              images.isEmpty ? const AddImage() : const SizedBox(),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: CustomTextNextButton(
        totalPrice: widget.orderData['totalPrice'].toString(),
        onTap: () {
          images.forEach((element) {
            if (images.last != element) {
              imagesList.add(element);
            }
          });
          widget.orderData.addAll({'orderImages': imagesList});
          Get.to(
            () => PaymentMethodScreen(
              orderData: widget.orderData,
              serviceInfo: widget.serviceModel,
            ),
            transition: Transition.leftToRight,
            duration: const Duration(milliseconds: 1000),
          );
        },
      ),
    );
  }

  dynamic setImage() {
    if (widget.serviceModel.images!.length > 1 &&
        widget.serviceModel.images!.contains('http')) {
      return NetworkImage(widget.serviceModel.images!);
    } else {
      return const AssetImage('assets/icons/cleaning 1.png');
    }
  }
}

List<dynamic> images = [];

class AddImage extends StatelessWidget {
  const AddImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ScreenUtil screenUtil = ScreenUtil();
    Size size = MediaQuery.of(context).size;
    return Container(
      height: screenUtil.setHeight(180),
      width: size.width / 2 - 20,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border:
            Border.all(color: Colors.black, width: 1, style: BorderStyle.none),
      ),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(20),
        padding: const EdgeInsets.all(10),
        strokeWidth: 2,
        color: ColorApp.grey,
        dashPattern: const [8, 8, 8, 8],
        child: InkWell(
          onTap: () async {
            try {
              List<File>? res = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WhatsappCamera(),
                ),
              );
              if (res != null) {
                for (int index = 0; index < 20; index++) {
                  if (images.length >= 2) {
                    images.removeLast();
                    images.add(res[index].path);
                    images.insert(images.length, const AddImage());
                  } else {
                    images.add(res[index].path);
                    images.insert(images.length, const AddImage());
                  }
                }
              }
            } catch (e) {}
          },
          child: Container(
            height: screenUtil.setHeight(150),
            width: size.width / 2 - 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child: Icon(
                Icons.add,
                size: 55,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class imageCard extends StatelessWidget {
  final int index;
  const imageCard({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return InteractiveViewer(
      child: Container(
        height: screenUtil.setHeight(150),
        width: size.width / 2 - 20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1,
              color: const Color.fromARGB(255, 20, 20, 20),
            )),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.file(
            File(images[index]),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
