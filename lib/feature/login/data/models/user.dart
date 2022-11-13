

class User {

 late List<int> user_id;
 User({
   required this.user_id,

 });
 factory User.fromJson(Map<String, dynamic> json) => User(
   user_id:json["user_id"]!=null? List<int>.from(json["user_id"].map((x) => x)):[],
 );

 static Map<String, dynamic> toJson(User user) {
   return {
   "user_id": List<dynamic>.from(user.user_id!.map((x) => x)),
 };
}}
