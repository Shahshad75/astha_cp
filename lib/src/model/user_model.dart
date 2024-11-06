class UserModel {
  int userId;
  String email;
  Address address;
  IdProof idProof;
  int id;
  String firstName;
  String middleName;
  String lastName;
  String gender;
  String dob;
  String createdAt;
  String updatedAt;
  String personalMobile;
  String consultationMobile;
  int addressId;
  int proofId;
  int isLocked;
  String photo;
  int categoryId;
  String regNo;
  String degree;
  String specialty;
  String subSpecialty;
  String superSpecialty;
  String fellowship;
  int cfRequired;

  UserModel({
    required this.userId,
    required this.email,
    required this.address,
    required this.idProof,
    required this.id,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.gender,
    required this.dob,
    required this.createdAt,
    required this.updatedAt,
    required this.personalMobile,
    required this.consultationMobile,
    required this.addressId,
    required this.proofId,
    required this.isLocked,
    required this.photo,
    required this.categoryId,
    required this.regNo,
    required this.degree,
    required this.specialty,
    required this.subSpecialty,
    required this.superSpecialty,
    required this.fellowship,
    required this.cfRequired,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['user_id'],
      email: json['email'],
      address: Address.fromJson(json['address']),
      idProof: IdProof.fromJson(json['id_proof']),
      id: json['id'],
      firstName: json['first_name'],
      middleName: json['middle_name'],
      lastName: json['last_name'],
      gender: json['gender'],
      dob: json['dob'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      personalMobile: json['personal_mobile'],
      consultationMobile: json['consultation_mobile'],
      addressId: json['address_id'],
      proofId: json['proof_id'],
      isLocked: json['is_locked'],
      photo: json['photo'],
      categoryId: json['category_id'],
      regNo: json['reg_no'],
      degree: json['degree'],
      specialty: json['specialty'],
      subSpecialty: json['sub_specialty'],
      superSpecialty: json['super_specialty'],
      fellowship: json['fellowship'],
      cfRequired: json['cf_required'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'email': email,
      'address': address.toJson(),
      'id_proof': idProof.toJson(),
      'id': id,
      'first_name': firstName,
      'middle_name': middleName,
      'last_name': lastName,
      'gender': gender,
      'dob': dob,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'personal_mobile': personalMobile,
      'consultation_mobile': consultationMobile,
      'address_id': addressId,
      'proof_id': proofId,
      'is_locked': isLocked,
      'photo': photo,
      'category_id': categoryId,
      'reg_no': regNo,
      'degree': degree,
      'specialty': specialty,
      'sub_specialty': subSpecialty,
      'super_specialty': superSpecialty,
      'fellowship': fellowship,
      'cf_required': cfRequired,
    };
  }
}

class Address {
  String line1;
  String line2;
  String state;
  String zipcode;
  String district;
  String cityBlock;

  Address({
    required this.line1,
    required this.line2,
    required this.state,
    required this.zipcode,
    required this.district,
    required this.cityBlock,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      line1: json['line1'],
      line2: json['line2'],
      state: json['state'],
      zipcode: json['zipcode'],
      district: json['district'],
      cityBlock: json['city_block'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'line1': line1,
      'line2': line2,
      'state': state,
      'zipcode': zipcode,
      'district': district,
      'city_block': cityBlock,
    };
  }
}

class IdProof {
  String proof;
  String proofNo;
  int proofType;

  IdProof({
    required this.proof,
    required this.proofNo,
    required this.proofType,
  });

  factory IdProof.fromJson(Map<String, dynamic> json) {
    return IdProof(
      proof: json['proof'],
      proofNo: json['proof_no'],
      proofType: json['proof_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'proof': proof,
      'proof_no': proofNo,
      'proof_type': proofType,
    };
  }
}
