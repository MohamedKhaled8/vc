// ignore_for_file: public_member_api_docs, sort_constructors_first
class NotificationsModel {
  final String title;
  final String images;
  final String descripthon;
  final String date;
  NotificationsModel(
 {
   required   this.date,
  required  this.title,
   required this.images,
   required this.descripthon,
  });
}

List<NotificationsModel> notificationsmodel = [
  NotificationsModel(
      title: "Discount",
      descripthon: "Dear customer, you can now get a ....",
      images: "assets/icons/gift  1.png", date: '10 hours ago'),
  NotificationsModel(
      title: "Deep Cleaning is completed  ",
      descripthon: "You can now rate our service",
      images: "assets/icons/cleaning 1.png", date: '10 hours ago'),
];
