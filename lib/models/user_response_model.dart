class ResponseModel {
  final int? id;
  final String? username;
  final String? email;
  final String? phone;
  final String? profilePicture;
  final String? firstName;

  final String? lastName;
  // final String gender;
  // final bool kycVerified;
  // final String referCode;
  // final bool newBankUpdates;
  // final bool offerUpdates;
  // final bool emailAlerts;
  // final bool hasPinSetup;
  final bool? hasPinExpire;
  final List<RoleModel>? roles;
  final String? kycStatus;

  ResponseModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.profilePicture,
    required this.firstName,
    required this.lastName,
    required this.hasPinExpire,
    required this.roles,
    required this.kycStatus,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      id: json['user']['id'],
      username: json['user']['username'],
      email: json['user']['email'],
      phone: json['user']['phone'],
      profilePicture: json['user']['profile_picture'],
      firstName: json['user']['first_name'],
      //middleName: json['user']['middle_name'],
      lastName: json['user']['last_name'],
      hasPinExpire: json['user']['has_pin_expire'],
      roles: List<RoleModel>.from(
          json['user']['roles'].map((role) => RoleModel.fromJson(role))),
      kycStatus: json['user']['kyc_status'],
    );
  }
}

class RoleModel {
  final int? id;
  final String? role;

  RoleModel({required this.id, required this.role});

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
      id: json['id'],
      role: json['role'],
    );
  }
}

class TokenModel {
  final String refresh;
  final String access;

  TokenModel({required this.refresh, required this.access});

  factory TokenModel.fromJson(Map<String, dynamic> json) {
    return TokenModel(
      refresh: json['token']['refresh'],
      access: json['token']['access'],
    );
  }
}
