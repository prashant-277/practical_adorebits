//
// class UserResponseModel {
//   UserResponseModel({
//     this.userId,
//     this.roleId,
//     this.firstName,
//     this.middleName,
//     this.lastName,
//     this.email,
//     this.phoneNo,
//     this.profilePic,
//     this.storeId,
//     this.timezone,
//     this.status,
//     this.isDeleted,
//     this.isVerified,
//     this.zipCode,
//     this.gender,
//     this.countryCode,
//     this.title,
//     this.preferredLanguage,
//     this.preferredCurrency,
//     this.registerVia,
//     this.dob,
//     this.createdBy,
//     this.updatedBy,
//     this.createdDate,
//     this.updatedDate
//   });
//
//   String userId;
//   int roleId;
//   String firstName;
//   String middleName;
//   String lastName;
//   String email;
//   String phoneNo;
//   String profilePic;
//   String storeId;
//   String timezone;
//   int status;
//   bool isDeleted;
//   bool isVerified;
//   String zipCode;
//   String gender;
//   String countryCode;
//   String title;
//   String preferredLanguage;
//   String preferredCurrency;
//   String registerVia;
//   String dob;
//   String createdBy;
//   String updatedBy;
//   DateTime createdDate;
//   DateTime updatedDate;
//
//   factory UserResponseModel.fromJson(Map<String, dynamic> json) => UserResponseModel(
//     userId: json["userId"],
//     roleId: json["roleId"],
//     firstName: json["firstName"],
//     middleName: json["middleName"],
//     lastName: json["lastName"],
//     email: json["email"],
//     phoneNo: json["phoneNo"],
//     profilePic: json["profilePic"],
//     storeId: json["storeId"],
//     timezone: json["timezone"],
//     status: json["status"],
//     isDeleted: json["isDeleted"],
//     isVerified: json["isVerified"],
//     zipCode: json["zipCode"],
//     gender: json["gender"],
//     countryCode: json["countryCode"],
//     title: json["title"],
//     preferredLanguage: json["preferredLanguage"],
//     preferredCurrency: json["preferredCurrency"],
//     registerVia: json["registerVia"],
//     dob: json["dob"],
//     createdBy: json["createdBy"],
//     updatedBy: json["updatedBy"],
//     createdDate: json["createdDate"] == null ? null : DateTime.parse(json["createdDate"]),
//     updatedDate: json["updatedDate"] == null ? null : DateTime.parse(json["updatedDate"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "userId": userId,
//     "roleId": roleId,
//     "firstName": firstName,
//     "middleName": middleName,
//     "lastName": lastName,
//     "email": email,
//     "phoneNo": phoneNo,
//     "profilePic": profilePic,
//     "storeId": storeId,
//     "timezone": timezone,
//     "status": status,
//     "isDeleted": isDeleted,
//     "isVerified": isVerified,
//     "zipCode": zipCode,
//     "gender": gender,
//     "countryCode": countryCode,
//     "title": title,
//     "preferredLanguage": preferredLanguage,
//     "preferredCurrency": preferredCurrency,
//     "registerVia": registerVia,
//     "dob": dob,
//     "createdBy": createdBy,
//     "updatedBy": updatedBy,
//     "createdDate": createdDate.toIso8601String(),
//     "updatedDate": updatedDate.toIso8601String(),
//   };
// }
//
// class CreateUserRequest {
//   String first_name;
//   String last_name;
//   String email;
//   int user_type; //send 2 for reseller, 3 for normal user
//   String confirm_password;
//   String password;
//
//   CreateUserRequest(
//       {this.first_name,
//         this.last_name,
//         this.email,
//         this.user_type,
//         this.confirm_password,
//         this.password});
//
//   CreateUserRequest.fromJson(Map<String, dynamic> json) {
//     first_name = json['first_name'];
//     last_name = json['last_name'];
//     email = json['email'];
//     user_type = json['user_type'];
//     confirm_password = json['confirm_password'];
//     password = json['password'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['first_name'] = first_name;
//     data['last_name'] = last_name;
//     data['email'] = email;
//     data['user_type'] = user_type;
//     data['confirm_password'] = confirm_password;
//     data['password'] = password;
//     return data;
//   }
// }
//
//
// class UpdateUserRequest {
//   String first_name = "";
//   String last_name = "";
//   String email = "";
//
//   UpdateUserRequest(
//       {this.first_name,
//         this.last_name,
//         this.email,
//         });
//
//   UpdateUserRequest.fromJson(Map<String, dynamic> json) {
//     first_name = json['first_name'];
//     last_name = json['last_name'];
//     email = json['email'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['first_name'] = first_name;
//     data['last_name'] = last_name;
//     data['email'] = email;
//
//     return data;
//   }
// }