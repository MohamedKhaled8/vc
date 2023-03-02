class OnBoardingContent {
  String? image;
  String? title;
  String? discription;
  OnBoardingContent({
    this.image,
    this.title,
    this.discription,
  });


}
  List<OnBoardingContent> contents = [
    OnBoardingContent(
        image: "assets/icons/clean1.png",
        title: "Application features",
        discription:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum mollis nunc a molestie dictum"),
    OnBoardingContent(
        image: "assets/icons/clean3.png",
        title: "Application features",
        discription:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum mollis nunc a molestie dictum"),
  ];