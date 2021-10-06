class UserModel {
  String uid;
  String email;
  String firstName;
  String secondName;

  UserModel({this.uid, this.email, this.firstName, this.secondName});

  // receiving data from server
  factory UserModel.fromMap(map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      firstName: map['firstName'],
      secondName: map['secondName'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'firstName': firstName,
      'secondName': secondName,
    };
  }
}

class Datacar {
  String carCompany;
  String carModel;
  String carPlate;

  Datacar({this.carCompany, this.carModel, this.carPlate});
}

class DataService {
  String odometer;
  String price;
  String notes;

  DataService({this.odometer, this.price, this.notes});
}

class Datafuel {
  String odometer;
  String price;
  String alldistance;
  String summary;
  String ratefuel;
  String notes;
  String preiceFulePerLit;

  Datafuel({
    this.odometer,
    this.price,
    this.alldistance,
    this.summary,
    this.ratefuel,
    this.notes,
    this.preiceFulePerLit,
  });
}

class DataNofication {
  String odometer;
  String notes;

  DataNofication({this.odometer, this.notes, String typeNoficationService, typeNoficationTax, String remark});
}
