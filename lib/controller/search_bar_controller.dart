import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vc/model/model_card.dart';
import 'package:vc/model/transport_companies_model.dart';

class SearchBarController extends GetxController {
  List<ModelCard>? topservices = _topservices;
  List<TransportCompaniesModel>? transportcompaniesmodel =
      _transportcompaniesmodel;

  var searchList = <ModelCard>[];
  var searchListTransport = <TransportCompaniesModel>[];
  TextEditingController searchEditingController = TextEditingController();
  TextEditingController searchTextController = TextEditingController();

  void addSearchToList({required String value, required List serviceList}) {
    value = value.toLowerCase();

    searchList = topservices!.where((search) {
      var searchTitle = search.title!.toLowerCase();
      return searchTitle.contains(value);
    }).toList();

    update();
  }

  void addSearchToListTransport(String value) {
    value = value.toLowerCase();

    searchListTransport = transportcompaniesmodel!.where((search) {
      var searchTitleTransport = search.title!.toLowerCase();
      return searchTitleTransport.contains(value);
    }).toList();

    update();
  }

  void clearSearch() {
    searchEditingController.clear();
    addSearchToList(value: "value", serviceList: []);
  }

  void clearSearchTransport() {
    searchTextController.clear();
    addSearchToListTransport("value");
  }
}

List<ModelCard> _topservices = [
  ModelCard(
      image: "assets/icons/cleaning 1.png", id: 1, title: 'deep cleaning '),
  ModelCard(
      image: "assets/icons/cleaning 1.png", id: 1, title: 'deep cleaning '),
  ModelCard(
      image: "assets/icons/cleaning 1.png", id: 1, title: 'deep cleaning '),
  ModelCard(
      image: "assets/icons/cleaning 1.png", id: 1, title: 'deep cleaning '),
  ModelCard(
      image: "assets/icons/cleaning 1.png", id: 1, title: 'deep cleaning '),
  ModelCard(
      image: "assets/icons/cleaning 1.png", id: 1, title: 'deep cleaning '),
];
List<TransportCompaniesModel> _transportcompaniesmodel = [
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
