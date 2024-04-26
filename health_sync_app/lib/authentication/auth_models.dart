class User {
  String uId;
  String name;
  String gmail;
  String? dob;
  String? gender;
  String? address;
  EmergencyContact? emergencyContact;

  User({
    this.address,
    required this.name,
    this.dob,
    this.emergencyContact,
    this.gender,
    required this.gmail,
    required this.uId,
  });

  Map<String, dynamic> toJson() => {
        "uId": uId,
        "name": name,
        "gmail": gmail,
        "dob": dob,
        "gender": gender,
        "address": address,
        "emergencyContact": emergencyContact,
      };

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        gmail: json["gmail"],
        uId: json["uId"],
        address: json["address"],
        dob: json["dob"],
        emergencyContact: EmergencyContact.fromJson(json["emergencyContact"]),
        gender: json["gender"],
      );
}

class EmergencyContact {
  String name;
  String phone;
  String address;

  EmergencyContact({
    required this.name,
    required this.address,
    required this.phone,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "address": address,
      };

  factory EmergencyContact.fromJson(Map<String, dynamic> json) =>
      EmergencyContact(
        name: json["name"],
        address: json["address"],
        phone: json["phone"],
      );
}

// Name, DOB, Gender, Address, Emergency contact- (name, phone, address