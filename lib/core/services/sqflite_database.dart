// import 'package:flutter/foundation.dart';
// import 'package:path/path.dart';
//
// import 'package:sqflite/sqflite.dart';
//
// class SqlDataBase {
//   static Database? _db;
//
//   Future<Database?> get db async {
//     if (_db == null) {
//       _db = await initialDB();
//       return _db;
//     } else {
//       return _db;
//     }
//   }
//
//   //دي ال fun اللي هعرف فيها ال DB
//   initialDB() async {
//     //اول حاجه هعملها اني هعمل المثار بتاع الجهاز اللي هخزن فيه ال DB
//     String databasePath = await getDatabasesPath();
//     String path = join(databasePath, 'saif.db');
//     Database myDb = await openDatabase(
//       path,
//       onCreate: _onCreate,
//       version: 1,
//       onUpgrade: _onUpgrade,
//     );
//     return myDb;
//   }
//
//
//   _onUpgrade(Database db ,int oldVersion , int newVersion){
//
//     if (kDebugMode) {
//       print('onUpgrade =========');
//     }
//   }
// //دي ال fun اللي هنشئ فيها الجداول اللي هخزن فيها الداتا
//   _onCreate(Database db, int version) async {
//     //كدا انا انشئت جدول عندي
//     // ف ال database ولو عايز انشئ جدول تاني هعمل نفس الخطوات
//
//     // جدول اضافة زبون
//
//     Batch batch = db.batch();
//
//      batch.execute('''
//     CREATE TABLE "customers" (
//     "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
//     "customerName" TEXT NOT NULL ,
//     "phone" TEXT ,
//     "money" INTEGER
//     )
//   ''');
//
//      batch.execute('''
//     CREATE TABLE "addAndDeduction" (
//     "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT ,
//     "customerId" INTEGER NOT NULL ,
//     "productName" TEXT ,
//     "price" INTEGER ,
//     "date" TEXT
//     )
//     ''');
//
//      batch.commit();
//     if (kDebugMode) {
//       print('Create database and tables =======================');
//     }
//   }
//
//   //1-دي اول fun وهي خاصه بال SELECT من الداتابيز
//   // Future<Either<Exception,List<Map>>> readDataFromDatabase(String sql) async {
//   //
//   //   try{
//   //     Database? mydb = await db;
//   //     List<Map> response = await mydb!.rawQuery(sql);
//   //     return Right(response);
//   //   }catch(error){
//   //     return Left(Exception(error.toString()));
//   //   }
//   //
//   // }
//
//
//
//   readDDataFromDatabase(String sql) async {
//       Database? mydb = await db;
//       List<Map> response = await mydb!.rawQuery(sql);
//       return response;
//   }
//
//   //دي ال fun الخاصه بأضافة صف الي
//   //  الجدول بس اكيد لازم عامل create للجدول ده ف البدايه وهنا
//   //  هي بترجع int اللي هو رقم الصف
//   //  اللي اتضاف جديد بس لو رجعة صفر يبق العمليه فشلت
//   insertDataToDatabase(String sql) async {
//     Database? mydb = await db;
//     int response = await mydb!.rawInsert(sql);
//     return response;
//   }
//
//   //  دي الخاصه بتحديث البيانات ف الجدول وبترجع بردو رقم الصف
//   //  تااي تم فيه تحديث بس لو رجعة صفر يبق العمليه فشلت
//   upDateDataInDatabase(String sql) async {
//     Database? mydb = await db;
//     int response = await mydb!.rawUpdate(sql);
//     return response;
//   }
//
//   //دي الخاصه بحذف صف ف الجدول وبترجع بردو رقم الصف اللي تم حذفه
//   // بس لو رجعة صفر يبق العمليه فشلت
//   deleteDataFromDatabase(String sql) async {
//     Database? mydb = await db;
//     int response = await mydb!.rawDelete(sql);
//     return response;
//   }
//
//
//   //دي لو عايز احزف الداتا بيز كلها
//   deleteAllDatabase()async
//   {
//     String databasePath = await getDatabasesPath();
//     String path = join(databasePath, 'saif.db');
//     await deleteDatabase(path);
//   }
//
// }
//
//
// // Future<void> insertData(String sql) async {
// //   await sqlDataBase.insertDataToDatabase(sql).then((value) {
// //     if (value == 0) {
// //       emit(InsertDataErrorState());
// //     } else {
// //       emit(InsertDataSuccessState());
// //     }
// //   }).catchError((error) {
// //     print(error.toString());
// //     emit(InsertDataErrorState());
// //   });
// // }
// //
// // Future<void> updateData(String sql) async {
// //   await sqlDataBase.upDateDataInDatabase(sql).then((value) {
// //     if (value == 0) {
// //       emit(UpDateDataErrorState());
// //     } else {
// //       emit(UpDateDataSuccessState());
// //     }
// //   }).catchError((error) {
// //     print(error.toString());
// //     emit(UpDateDataErrorState());
// //   });
// // }
// //
// // Future<void> deleteData(String sql) async {
// //   await sqlDataBase.deleteDataFromDatabase(sql).then((value) {
// //     if (value == 0) {
// //       emit(DeleteDataErrorState());
// //     } else {
// //       emit(DeleteDataSuccessState());
// //     }
// //   }).catchError((error) {
// //     print(error.toString());
// //     emit(DeleteDataErrorState());
// //   });
// // }
//
//
// // Future<List<Map>> readData() async {
// //   List<Map> response =
// //       await sqlDataBase.readDDataFromDatabase("SELECT * FROM 'customers' ");
// //   return response;
// // }
//
// // void sendMessage({
// //   required String? receiverId,
// //   required String dateTime,
// //   required String text,
// //   String? image,
// // }) {
// //   MessageModel messageModel = MessageModel(
// //     text: text,
// //     senderId: model.userId,
// //     receiverId: receiverId,
// //     dateTime: dateTime,
// //     image: image ?? '',
// //   );
// //
// //   //set my chats
// //
// // //   FirebaseFirestore.instance
// // //       .collection('users')
// // //       .doc(model.userId)
// // //       .collection('chats')
// // //       .doc(receiverId)
// // //       .collection('messages')
// // //       .add(messageModel.toMap())
// // //       .then((value) {
// // //     emit(SocialHomeSendMessageSuccessState());
// // //   }).catchError((error) {
// // //     emit(SocialHomeSendMessageErrorState());
// // //   });
// // //
// // //   //set receiver chat
// // //
// // //   FirebaseFirestore.instance
// // //       .collection('users')
// // //       .doc(receiverId)
// // //       .collection('chats')
// // //       .doc(model.userId)
// // //       .collection('messages')
// // //       .add(messageModel.toMap())
// // //       .then((value) {
// // //     emit(SocialHomeSendMessageSuccessState());
// // //   }).catchError((error) {
// // //     emit(SocialHomeSendMessageErrorState());
// // //   });
// // // }
// // //
// // //
// // // List<MessageModel> messages =[];
// // //
// // // void getMessages({
// // //   required String receiverId,
// // // })
// // // {
// // //   FirebaseFirestore.instance
// // //       .collection('users')
// // //       .doc(model.userId)
// // //       .collection('chats')
// // //       .doc(receiverId)
// // //       .collection('messages')
// // //       .orderBy('dateTime') // علشان ارتب الداتا اللي جايه عندي
// // //       .snapshots()
// // //       .listen((event)//listen دي بقوله ابدا استمع للتغيرات اللي بتحصل فيك
// // //   {
// // //     // ال event ده هو ال messages اللي عندي
// // //     messages =[];
// // //     event.docs.forEach((element) {
// // //
// // //       messages.add(MessageModel.fromjson(element.data()));
// // //     });
// // //     emit(SocialHomeGetMessagesSuccessState());
// // //   });
// // //
// // // }
// //
