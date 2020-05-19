enum UserType{
  Distributor,
  Dealer,
  Customer,
  Admin,
}

extension UserTypeExtentions on UserType{

  // Returns String for enum Values
  String get name{
    switch(this){
      case UserType.Admin:
        return 'Admin';
      case UserType.Customer:
        return 'Customer';
      case UserType.Dealer:
        return 'Dealer';
      case UserType.Distributor:
        return 'Distributor';
      default:
        return "";
    }
  }



}