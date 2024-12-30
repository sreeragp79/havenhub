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

class ResortAddingDetails {
  String id;
  String image;
  String name;
  String place;
  String information;
  String price;
  ResortAddingDetails(this.id,this.image,this.name,this.place,this.information,this.price);
  }

class ReviewStore{
  String id;
  String image;
  String name;
  String resortName;
  String reviewSub;
  ReviewStore(this.id,this.image,this.name,this.resortName,this.reviewSub);
}
class BookingGetAdmin{
  String id;
  String image;
  String price;
  String resortName;
  String checkIn;
  String guest;
  String checkOut;
  String totelAmount;
  String taxTotelAmount;
  String userName;
  String number;
  BookingGetAdmin(
      this.id,this.image,this.price,this.resortName,this.checkIn,this.guest,
      this.checkOut,this.totelAmount,this.taxTotelAmount,
      this.userName,this.number,
      );
}
class NotificationMessage{
  String bookingId;
  String title;
  String subTitle;
  String opened;
  String userId;
  String notificationId;
  NotificationMessage(this.bookingId,this.title,this.subTitle,this.opened,this.userId,this.notificationId);
}
class SignUpGet{
  String userId;
  SignUpGet(this.userId);
}