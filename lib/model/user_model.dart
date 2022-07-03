class User {
  String firstName;
  String lastName;
  String email;
  int age;
  String phoneNumber;
  String city;
  String state;
  String country;
  int postcode;
  String userThumbnail;
  String userLargeImage;

  User(int userId, 
    {
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.age,
      required this.phoneNumber,
      required this.city,
      required this.state,
      required this.country,
      required this.postcode,
      required this.userThumbnail,
      required this.userLargeImage});

  User.fromJson(Map<String, dynamic> json)
      : firstName = "${json['name']['first']}",
        lastName = "${json['name']['last']}",
        email = "${json['email']}",
        age = json['dob']['age'],
        phoneNumber = "${json['phone']}",
        city = "${json['location']['city']}",
        state = "${json['location']['state']}",
        country = "${json['location']['country']}",
        postcode = json['location']['postcode'],
        userLargeImage = "${json['picture']['large']}",
        userThumbnail = "${json['picture']['thumbnail']}";

  String getFullName() => '$firstName $lastName';

  String getLocation() => '$city, $state, $country';
}