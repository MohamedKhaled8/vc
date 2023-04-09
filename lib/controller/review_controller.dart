import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/helper/caching_data.dart';
import 'package:vc/model/review/create_review_model.dart';
import 'package:vc/model/review/create_worker_review_model.dart';
import 'package:vc/model/review/delete_review_model.dart';
import 'package:vc/model/review/get_review_model.dart';
import 'package:vc/services/review/add_review_service.dart';
import 'package:vc/services/review/delete_review_service.dart';
import 'package:vc/services/review/get_review_service.dart';
import 'package:vc/services/review/update_review_service.dart';


class ReviewController extends GetxController {
  Future<String> getToken() async {
    final token = await CachingData.cachingLoginData();
    return token.token;
  }

  Future<GetReviewModel?> getReview({required BuildContext context,required String url,}) async {
    final data = await GetReviewService().getReview(
      url:url,
      token: await getToken(),
    );
    if (data != null) {
      return GetReviewModel.fromJson(data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data.toString())));
    }
  }

  Future<ReviewModel?> addReview({
    required String comments,
    required String starRating,
    required String serviceId,
    required BuildContext context,
    required String url,
  }) async {
    final data = await AddReviewService().addReview(
      url: url,
      lang: 'en',
      body: {
        'service_id': serviceId,
        'comments': comments,
        'star_rating': starRating,
      },
      token: await getToken(),
    );
    if (data['statusCode'] != null && data['statusCode'] == 200) {
      return ReviewModel.fromJson(data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    }
  } Future<AddWorkerReviewModel?> addWorkerReview({
    required String comments,
    required String starRating,
    required String workerId,
    required BuildContext context,
    required String url,
  }) async {
    final data = await AddReviewService().addReview(
      url: url,
      lang: 'en',
      body: {
        'worker_id': workerId,
        'comments': comments,
        'star_rating': starRating,
      },
      token: await getToken(),
    );
    if (data['statusCode'] != null && data['statusCode'] == 200) {
      return AddWorkerReviewModel.fromJson(data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    }
  }

  Future<DeleteReviewModel?> deleteReview({required int id,required String url,required BuildContext context,}) async {
    final data = await DeleteReviewService().deleteReview(
      id: id,
      url:url,
      token: await getToken(),
    );
    if (data != null) {
      return DeleteReviewModel.fromJson(data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    }
  }

  updateReview({
    String comments = '',
    required String starRating,
    required int serviceId,
    required BuildContext context,
    required String url,
  }) async {
    final data = await UpdateReviewService().updateReview(
      url: url,
      id: serviceId,
      body: {
        'comments': comments,
        'star_rating': starRating,
      },
      token: await getToken(),
    );
    if (data['statusCode'] != null && data['statusCode'] == 200) {
      print(data);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(data['message'])));
    }
  }
}