





import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel
{
  String? productName;
  String? money;
  DateTime? dateTime;

  ProductModel({
    this.productName,
    this.money,
    this.dateTime,
  });

  ProductModel.fromjson(Map<String,dynamic> json)
  {
    productName =json['productName'];
    money =json['money'];
    dateTime =(json["dateTime"] as Timestamp).toDate();

  }
  //دي كأنها متغير ماسك فيها البيانات اللي هستخدمها
  Map<String,dynamic> toMap()
  {
    return {
      'productName' : productName,
      'money':money,
      'dateTime':dateTime,
    };
  }
}
