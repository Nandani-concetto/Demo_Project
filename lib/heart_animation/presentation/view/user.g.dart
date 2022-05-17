// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      vipUser: json['vip_user'] as int?,
      level: json['level'] == null
          ? null
          : UserLevel.fromJson(json['level'] as Map<String, dynamic>),
      profileImageUrl: json['profile_image_url'] as String?,
      totalFriend: json['total_friends'] as int?,
      streamCoverPhoto: json['stream_cover_photo'] as String?,
      streamCoverPhotoUrl: json['stream_cover_photo_url'] as String?,
      id: json['id'] as int?,
      userLevel: json['user_level'] as int?,
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      mobile: json['mobile'] as String?,
      gender: CustomConvert.iConvertor(json['gender']),
      socialMediaType: json['social_media_type'] as String?,
      socialId: json['social_id'] as String?,
      avatar: json['avatar'] as String?,
      lastLoginDate: json['last_login_date'] as String?,
      lastLogoutDate: json['last_logout_date'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      entityTypeId: json['entity_type_id'] as String?,
      statusId: json['status_id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      dateOfBirth: json['date_of_birth'] as String?,
      roleId: json['role_id'] as int?,
      appleId: json['apple_id'] as String?,
      countryCode: json['country_code'] as String?,
      userAddress: json['user_address'] == null
          ? null
          : UserAddress.fromJson(json['user_address'] as Map<String, dynamic>),
      token: json['token'] as String?,
      userWallet: json['user_wallet'] == null
          ? null
          : UserWallet.fromJson(json['user_wallet'] as Map<String, dynamic>),
    )
      ..following = json['following'] as int?
      ..follower = json['follower'] as int?;

Map<String, dynamic> _$UserToJson(User instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_level', instance.userLevel);
  writeNotNull('id', instance.id);
  writeNotNull('uuid', instance.uuid);
  writeNotNull('name', instance.name);
  writeNotNull('email', instance.email);
  writeNotNull('email_verified_at', instance.emailVerifiedAt);
  writeNotNull('mobile', instance.mobile);
  writeNotNull('gender', instance.gender);
  writeNotNull('social_media_type', instance.socialMediaType);
  writeNotNull('social_id', instance.socialId);
  writeNotNull('avatar', instance.avatar);
  writeNotNull('last_login_date', instance.lastLoginDate);
  writeNotNull('last_logout_date', instance.lastLogoutDate);
  writeNotNull('created_at', instance.createdAt);
  writeNotNull('updated_at', instance.updatedAt);
  writeNotNull('entity_type_id', instance.entityTypeId);
  writeNotNull('status_id', instance.statusId);
  writeNotNull('first_name', instance.firstName);
  writeNotNull('last_name', instance.lastName);
  writeNotNull('date_of_birth', instance.dateOfBirth);
  writeNotNull('role_id', instance.roleId);
  writeNotNull('apple_id', instance.appleId);
  writeNotNull('country_code', instance.countryCode);
  writeNotNull('user_address', instance.userAddress);
  writeNotNull('token', instance.token);
  writeNotNull('stream_cover_photo_url', instance.streamCoverPhotoUrl);
  writeNotNull('stream_cover_photo', instance.streamCoverPhoto);
  writeNotNull('profile_image_url', instance.profileImageUrl);
  writeNotNull('vip_user', instance.vipUser);
  writeNotNull('following', instance.following);
  writeNotNull('follower', instance.follower);
  writeNotNull('total_friends', instance.totalFriend);
  writeNotNull('user_wallet', instance.userWallet);
  writeNotNull('level', instance.level);
  return val;
}

UserAddress _$UserAddressFromJson(Map<String, dynamic> json) => UserAddress(
      id: json['id'] as int?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
    );

Map<String, dynamic> _$UserAddressToJson(UserAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'city': instance.city,
      'country': instance.country,
      'lat': instance.lat,
      'long': instance.long,
    };

UserWallet _$UserWalletFromJson(Map<String, dynamic> json) => UserWallet(
      id: json['id'] as int?,
      diamond: json['diamond'] as int?,
      coin: json['coin'] as int?,
      bean: json['bean'] as int?,
    );

Map<String, dynamic> _$UserWalletToJson(UserWallet instance) =>
    <String, dynamic>{
      'id': instance.id,
      'diamond': instance.diamond,
      'coin': instance.coin,
      'bean': instance.bean,
    };

UserLevel _$UserLevelFromJson(Map<String, dynamic> json) => UserLevel(
      id: json['id'] as int?,
      sectionId: json['section_id'] as int?,
      levelName: json['level_name'] as String?,
      rangeStarting: json['range_starting'] as int?,
      rangeEnding: json['range_ending'] as int?,
      completedLevel: json['completed_level'] as int?,
      sectiondetail: json['sectiondetail'] == null
          ? null
          : SectionDetail.fromJson(
              json['sectiondetail'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserLevelToJson(UserLevel instance) => <String, dynamic>{
      'id': instance.id,
      'section_id': instance.sectionId,
      'level_name': instance.levelName,
      'range_starting': instance.rangeStarting,
      'range_ending': instance.rangeEnding,
      'completed_level': instance.completedLevel,
      'sectiondetail': instance.sectiondetail,
    };

SectionDetail _$SectionDetailFromJson(Map<String, dynamic> json) =>
    SectionDetail(
      id: json['id'] as int?,
      sectionName: json['section_id'] as String?,
    );

Map<String, dynamic> _$SectionDetailToJson(SectionDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('section_id', instance.sectionName);
  return val;
}
