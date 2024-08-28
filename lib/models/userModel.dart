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
  String place;
  String ratingImage;
  String rate;
  FavoriteModel(this.image,this.name,this.place,this.ratingImage,this.rate);
}