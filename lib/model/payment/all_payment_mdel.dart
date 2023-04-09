class AllPaymentModel {
  String? object;
  List<Data>? data = [];
  bool? hasMore;
  String? url;

  AllPaymentModel({this.object, this.data, this.hasMore, this.url});

  AllPaymentModel.fromJson(Map<String, dynamic> json) {
    object = json['object'];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    hasMore = json['has_more'];
    url = json['url'];
  }
}

class Data {
  final String id;
  final String object;
  final String brand;
  final String country;
  final String customer;
  final String cvcCheck;
  final int expMonth;
  final int expYear;
  final String fingerprint;
  final String funding;
  final String last4;

  Data({
    required this.id,
    required this.object,
    required this.brand,
    required this.country,
    required this.customer,
    required this.cvcCheck,
    required this.expMonth,
    required this.expYear,
    required this.fingerprint,
    required this.funding,
    required this.last4,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      object: json['object'],
      brand: json['brand'],
      country: json['country'],
      customer: json['customer'],
      cvcCheck: json['cvc_check'],
      expMonth: json['exp_month'],
      expYear: json['exp_year'],
      fingerprint: json['fingerprint'],
      funding: json['funding'],
      last4: json['last4'],
    );
  }
}
