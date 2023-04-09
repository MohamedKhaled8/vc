class RecipeModel {
  late final List<Data> data;
  late final String msg;
  RecipeModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
    msg = json['msg'];
  }
}
class Data {
  late final String alias;
  late final int randomNumber;
  late final Details details;
  late final String updatedAt;
  late final String createdAt;

  Data.fromJson(Map<String, dynamic> json){
    alias = json['alias'];
    randomNumber = json['random_number'];
    details = Details.fromJson(json['details']);
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }
}

class Details {
  late final List<Products> products;
  late final String doctorName;

  Details.fromJson(Map<String, dynamic> json){
    products = List.from(json['products']).map((e)=>Products.fromJson(e)).toList();
    doctorName = json['doctor_name'];
  }
}

class Products {
  late final String scientificName;
  late final String commercialName;
  late final int concentrate;
  late final int quantity;
  late final bool taken;

  Products.fromJson(Map<String, dynamic> json){
    scientificName = json['scientific_name'];
    commercialName = json['commercial_name'];
    concentrate = json['concentrate'];
    quantity = json['quantity'];
    taken = json['taken'];
  }

}