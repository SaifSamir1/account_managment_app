










class UserInfoModel
{
  String? name;
  String? email;
  String? userId;
  String? countryName;
  bool? isEmailVerified;

  UserInfoModel({
    this.name,
    this.email,
    this.userId,
    this.countryName,
    this.isEmailVerified
  });

  UserInfoModel.fromjson(Map<String,dynamic> json)
  {
    name =json['name'] ;
    email =json['email'];
    userId =json['userId'];
    countryName =json['countryName'];
    isEmailVerified =json['isEmailVerified'];
  }
  //دي كأنها متغير ماسك فيها البيانات اللي هستخدمها
  Map<String,dynamic> toMap()
  {
    return {
      'name':name,
      'email' : email,
      'userId':userId,
      'countryName':countryName,
      'isEmailVerified':isEmailVerified,
    };
  }
}
