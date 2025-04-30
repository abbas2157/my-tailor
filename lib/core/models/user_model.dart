class User {
  final int id;
  final String name;
  final String email;
  final String? phone;
  final String? profilePicture;
  final String? shopName;
  final String? address;
  final String? role;
  final String? token;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    this.profilePicture,
    this.shopName,
    this.address,
    this.role,
    this.token,
    this.createdAt,
    this.updatedAt,
  });

  // Create User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      profilePicture: json['profile_picture'],
      shopName: json['shop_name'],
      address: json['address'],
      role: json['role'],
      token: json['token'],
      createdAt: json['created_at'] != null 
          ? DateTime.parse(json['created_at']) 
          : null,
      updatedAt: json['updated_at'] != null 
          ? DateTime.parse(json['updated_at']) 
          : null,
    );
  }

  // Convert User to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'profile_picture': profilePicture,
      'shop_name': shopName,
      'address': address,
      'role': role,
      'token': token,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  // Create a copy of the User with some changes
  User copyWith({
    int? id,
    String? name,
    String? email,
    String? phone,
    String? profilePicture,
    String? shopName,
    String? address,
    String? role,
    String? token,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      profilePicture: profilePicture ?? this.profilePicture,
      shopName: shopName ?? this.shopName,
      address: address ?? this.address,
      role: role ?? this.role,
      token: token ?? this.token,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}