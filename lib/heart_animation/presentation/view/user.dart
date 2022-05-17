import 'package:json_annotation/json_annotation.dart';

import 'custom_convert.dart';
import 'equatable.dart';

part 'user.g.dart';

@JsonSerializable(includeIfNull: false)
// ignore: must_be_immutable
class User extends SEquatable {
  @JsonKey(name: 'user_level')
  int? userLevel;
  int? id;
  String? uuid;
  String? name;
  String? email;
  @JsonKey(name: 'email_verified_at')
  String? emailVerifiedAt;
  String? mobile;
  @JsonKey(name: 'gender', fromJson: CustomConvert.iConvertor)
  int? gender;
  @JsonKey(name: 'social_media_type')
  String? socialMediaType;
  @JsonKey(name: 'social_id')
  String? socialId;
  String? avatar;
  @JsonKey(name: 'last_login_date')
  String? lastLoginDate;
  @JsonKey(name: 'last_logout_date')
  String? lastLogoutDate;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'entity_type_id')
  String? entityTypeId;
  @JsonKey(name: 'status_id')
  int? statusId;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'date_of_birth')
  String? dateOfBirth;
  @JsonKey(name: 'role_id')
  int? roleId;
  @JsonKey(name: 'apple_id')
  String? appleId;
  @JsonKey(name: 'country_code')
  String? countryCode;
  @JsonKey(name: 'user_address')
  UserAddress? userAddress;

  @JsonKey(name: 'token')
  String? token;

  @JsonKey(name: 'stream_cover_photo_url')
  String? streamCoverPhotoUrl;

  @JsonKey(name: 'stream_cover_photo')
  String? streamCoverPhoto;

  @JsonKey(name: 'profile_image_url')
  String? profileImageUrl;

  @JsonKey(name: 'vip_user')
  int? vipUser;
  int? following;
  int? follower;
  @JsonKey(name: 'total_friends')
  int? totalFriend;

  @JsonKey(name: 'user_wallet')
  UserWallet? userWallet;

  @JsonKey(name: 'level')
  UserLevel? level;

  User({
    this.vipUser,
    this.level,
    this.profileImageUrl,
    this.totalFriend,
    this.streamCoverPhoto,
    this.streamCoverPhotoUrl,
    this.id,
    this.userLevel,
    this.uuid,
    this.name,
    this.email,
    this.emailVerifiedAt,
    this.mobile,
    this.gender,
    this.socialMediaType,
    this.socialId,
    this.avatar,
    this.lastLoginDate,
    this.lastLogoutDate,
    this.createdAt,
    this.updatedAt,
    this.entityTypeId,
    this.statusId,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.roleId,
    this.appleId,
    this.countryCode,
    this.userAddress,
    this.token,
    this.userWallet,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  Map<String, dynamic> toJsonLimit() => _$UserToJsonLimit(this);

  Map<String, dynamic> _$UserToJsonLimit(User instance) {
    final val = <String, dynamic>{};

    void writeNotNull(String key, dynamic value) {
      if (value != null) {
        val[key] = value;
      }
    }

    writeNotNull('id', instance.id);
    writeNotNull('name', instance.name);
    writeNotNull('profile_image_url', instance.profileImageUrl);
    writeNotNull('following', instance.following);
    writeNotNull('follower', instance.follower);
    writeNotNull('user_wallet', instance.userWallet);
    writeNotNull('level', instance.level);
    return val;
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, gender: $gender, avatar: $avatar, statusId: $statusId, dateOfBirth: $dateOfBirth, countryCode: $countryCode, address: $userAddress,wallet :$userWallet}';
  }

  @override
  List<Object?> get props => [
        id,
        name,
        avatar,
        statusId,
        userAddress,
        userLevel,
        userWallet,
      ];

  String get uid => "$id";
}

@JsonSerializable(explicitToJson: true)
class UserAddress {
  int? id;
  String? address;
  String? city;
  String? country;
  String? lat;
  String? long;

  UserAddress({
    this.id,
    this.address,
    this.city,
    this.country,
    this.lat,
    this.long,
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) =>
      _$UserAddressFromJson(json);

  Map<String, dynamic> toJson() => _$UserAddressToJson(this);

  @override
  String toString() {
    return 'UserAddress{id: $id, address: $address, city: $city, country: $country, lat: $lat, long: $long}';
  }
}

@JsonSerializable(explicitToJson: true)
class UserWallet {
  int? id;
  int? diamond;
  int? coin;
  int? bean;

  UserWallet({this.id, this.diamond, this.coin, this.bean});

  factory UserWallet.zero() {
    return UserWallet(id: 0, diamond: 0, coin: 0, bean: 0);
  }

  factory UserWallet.fromJson(Map<String, dynamic> json) =>
      _$UserWalletFromJson(json);

  Map<String, dynamic> toJson() => _$UserWalletToJson(this);

  @override
  String toString() {
    return 'UserWallet{diamond: $diamond, coin: $coin, bean: $bean}';
  }
}

@JsonSerializable()
class UserLevel {
  int? id;
  @JsonKey(name: 'section_id')
  int? sectionId;
  @JsonKey(name: 'level_name')
  String? levelName;
  @JsonKey(name: 'range_starting')
  int? rangeStarting;
  @JsonKey(name: 'range_ending')
  int? rangeEnding;
  @JsonKey(name: 'completed_level')
  int? completedLevel;
  @JsonKey(name: 'sectiondetail')
  SectionDetail? sectiondetail;

  UserLevel(
      {this.id,
      this.sectionId,
      this.levelName,
      this.rangeStarting,
      this.rangeEnding,
      this.completedLevel,
      this.sectiondetail});

  factory UserLevel.fromJson(Map<String, dynamic> json) =>
      _$UserLevelFromJson(json);

  Map<String, dynamic> toJson() => _$UserLevelToJson(this);
}

@JsonSerializable(includeIfNull: false)
class SectionDetail {
  int? id;
  @JsonKey(name: 'section_id')
  String? sectionName;

  SectionDetail({
    this.id,
    this.sectionName,
  });

  factory SectionDetail.fromJson(Map<String, dynamic> json) =>
      _$SectionDetailFromJson(json);

  Map<String, dynamic> toJson() => _$SectionDetailToJson(this);
}
