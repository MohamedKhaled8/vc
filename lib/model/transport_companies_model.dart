// ignore_for_file: public_member_api_docs, sort_constructors_first
class TransportCompaniesModel {
  String? image;
  String? title;
  TransportCompaniesModel({
    required this.image,
    required this.title,
  });
}

List<TransportCompaniesModel> transportcompaniesmodel = [
  TransportCompaniesModel(
      image: "assets/icons/logistic.png", title: 'Soylent Corp'),
  TransportCompaniesModel(
      image: "assets/icons/fastdelivery.png",
      title: 'Olivia Pope & Associates'),
  TransportCompaniesModel(
      image: "assets/icons/allcountry.png", title: 'Vehement Capital Partners'),
  TransportCompaniesModel(
      image: "assets/icons/logotexhere.png", title: 'Plexzap'),
  TransportCompaniesModel(
      image: "assets/icons/factory.png", title: 'Wonka Industries'),
  TransportCompaniesModel(
      image: "assets/icons/fast_delivery.png", title: 'Umbrella Corporation'),
  TransportCompaniesModel(
      image: "assets/icons/companyname.png", title: '(Ollivanders WandShop'),
];
