// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelCard {
  final String? title;
  final String? image;
  final String? images;
  final String? descripthon;
  ModelCard({
    this.title,
    this.image,
    this.descripthon,
    this.images,
  });
}

List<ModelCard> modelCard = [
  ModelCard(title: "30% off", image: "assets/images/png/Rectangle 10.png"),
  ModelCard(title: "30% off", image: "assets/images/png/Rectangle 10.png"),
  ModelCard(title: "30% off", image: "assets/images/png/Rectangle 10.png"),
  ModelCard(title: "30% off", image: "assets/images/png/Rectangle 10.png"),
  ModelCard(title: "30% off", image: "assets/images/png/Rectangle 10.png"),
  ModelCard(
      descripthon:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident , Excepteur sint occaecat cupidatat non proident.",
      images: "assets/images/jpeg/mohamed.jpeg"),
];
