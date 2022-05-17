// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_stream_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateStreamResponse _$CreateStreamResponseFromJson(
        Map<String, dynamic> json) =>
    CreateStreamResponse(
      isFollow: json['is_follow'] as int?,
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      channelName: json['channel_name'] as String?,
      token: json['token'] as String?,
      status: json['status'] as String?,
      streamType: json['stream_type'] as int?,
      startDatetime: json['start_datetime'] as String?,
      coverPhoto: json['cover_photo'] as String?,
      titleToChat: json['title_to_chat'] as String?,
      streamPublicationType: json['stream_publication_type'] as int?,
      broadcastType: json['broadcast_type'] as int?,
      tags: json['tags'],
      endDatetime: json['end_datetime'],
      totalMinutes: json['total_minutes'] as String?,
      availableMinutes: json['available_minutes'] as String?,
      createdAt: json['created_at`'] as String?,
      updatedAt: json['updated_at`'] as String?,
      deletedAt: json['deleted_at`'],
      followers: json['followers'] as int?,
      totalLikes: json['total_likes'] as int?,
      memberCount: json['member_count'] as int?,
      coverPhotoUrl: json['cover_photo_url'] as String?,
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      isLike: json['is_like'] as int?,
      totalViewers: json['total_viewers'] as int?,
      notificationId: json['notification_id'] as String?,
    );

Map<String, dynamic> _$CreateStreamResponseToJson(
    CreateStreamResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('user_id', instance.userId);
  writeNotNull('channel_name', instance.channelName);
  writeNotNull('token', instance.token);
  writeNotNull('status', instance.status);
  writeNotNull('stream_type', instance.streamType);
  writeNotNull('start_datetime', instance.startDatetime);
  writeNotNull('cover_photo', instance.coverPhoto);
  writeNotNull('title_to_chat', instance.titleToChat);
  writeNotNull('stream_publication_type', instance.streamPublicationType);
  writeNotNull('broadcast_type', instance.broadcastType);
  writeNotNull('tags', instance.tags);
  writeNotNull('end_datetime', instance.endDatetime);
  writeNotNull('total_minutes', instance.totalMinutes);
  writeNotNull('available_minutes', instance.availableMinutes);
  writeNotNull('created_at`', instance.createdAt);
  writeNotNull('updated_at`', instance.updatedAt);
  writeNotNull('deleted_at`', instance.deletedAt);
  writeNotNull('followers', instance.followers);
  writeNotNull('total_likes', instance.totalLikes);
  writeNotNull('member_count', instance.memberCount);
  writeNotNull('cover_photo_url', instance.coverPhotoUrl);
  writeNotNull('owner', instance.owner?.toJson());
  writeNotNull('is_like', instance.isLike);
  writeNotNull('total_viewers', instance.totalViewers);
  writeNotNull('is_follow', instance.isFollow);
  writeNotNull('notification_id', instance.notificationId);
  return val;
}

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      id: json['id'] as int?,
      name: json['name'] as String?,
      following: json['following'] as int?,
      follower: json['follower'] as int?,
      profileImageUrl: json['profile_image_url'] as String?,
      userWallet: json['user_wallet'] == null
          ? null
          : UserWallet.fromJson(json['user_wallet'] as Map<String, dynamic>),
      isFollow: json['is_follow'] as int?,
    );

Map<String, dynamic> _$OwnerToJson(Owner instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('following', instance.following);
  writeNotNull('follower', instance.follower);
  writeNotNull('profile_image_url', instance.profileImageUrl);
  writeNotNull('user_wallet', instance.userWallet?.toJson());
  writeNotNull('is_follow', instance.isFollow);
  return val;
}
