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