// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderCardModel {
  final dynamic id;
  final String date;
  final String time;
  final String address;
  final String orderState;
  const OrderCardModel({
    required this.orderState,
    required this.id,
    required this.date,
    required this.time,
    required this.address,
  });
}
