class EditProfileModel{
  String id;
  String userName;
  String email;
  String phoneNumber;
  String password;
  EditProfileModel(this.id,this.userName,this.phoneNumber,this.email,this.password);

}
class EditBookingDateModel{
  String  id;
  String checkIn;
  String checkOut;
  String value;
  EditBookingDateModel(this.id,this.checkIn,this.checkOut,this.value);
}

// Favorite Model Classs
class FavoriteModel{
  String image;
  String name;
  String ratingImage;
  String price;
  FavoriteModel(this.image,this.name,this.ratingImage,this.price);
}
class ResortAddingDetails {
  String id;
  String image;
  String name;
  String place;
  String information;
  ResortAddingDetails(this.id,this.image,this.name,this.place,this.information);

  }
class ReviewStore{
  String id;
  String image;
  String name;
  String resortName;
  String reviewSub;
  ReviewStore(this.id,this.image,this.name,this.resortName,this.reviewSub);
}