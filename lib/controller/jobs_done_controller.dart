import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/helper/caching_data.dart';
import 'package:vc/model/jobs_done_model.dart';
import 'package:vc/services/jobs_done_service.dart';

class JobsDoneController extends GetxController {
  Future<String> getToken() async {
    final userData = await CachingData.cachingLoginData();
    return userData.token;
  }

  Future<JobsDoneModel?> jobsDone({
    required BuildContext context,
    required String id,
  }) async {
    final data =
        await JobsDoneService().jobsDone(id: id, token: await getToken());
    return JobsDoneModel.fromJson(data);
  }
}
