class SignUpRequest {
  final String fullName;
  final String userName;
  final String email;
  final String password;

  SignUpRequest({required this.fullName, required this.userName, required this.email, required this.password});

  Map<String, dynamic>toJson()=>{
    "full_name":fullName,
    "username":userName,
    "email":email,
    "password":password
  };
}