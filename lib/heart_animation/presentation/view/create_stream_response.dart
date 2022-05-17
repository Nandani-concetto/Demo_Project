import 'dart:convert';
import 'package:demo_project/heart_animation/presentation/view/user.dart';
import 'package:json_annotation/json_annotation.dart';

import 'equatable.dart';

part 'create_stream_response.g.dart';

@JsonSerializable(includeIfNull: false, explicitToJson: true)
// ignore: must_be_immutable
class CreateStreamResponse extends SEquatable {
  int? id;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "channel_name")
  String? channelName;
  String? token;
  String? status;
  @JsonKey(name: "stream_type")
  int? streamType;
  @JsonKey(name: "start_datetime")
  String? startDatetime;
  @JsonKey(name: "cover_photo")
  String? coverPhoto;
  @JsonKey(name: "title_to_chat")
  String? titleToChat;
  @JsonKey(name: "stream_publication_type")
  int? streamPublicationType;
  @JsonKey(name: "broadcast_type")
  int? broadcastType;
  dynamic tags;
  @JsonKey(name: "end_datetime")
  dynamic endDatetime;
  @JsonKey(name: "total_minutes")
  String? totalMinutes;
  @JsonKey(name: "available_minutes")
  String? availableMinutes;
  @JsonKey(name: "created_at`")
  String? createdAt;
  @JsonKey(name: "updated_at`")
  String? updatedAt;
  @JsonKey(name: "deleted_at`")
  dynamic deletedAt;
  int? followers;
  @JsonKey(name: "total_likes")
  int? totalLikes;
  @JsonKey(name: "member_count")
  int? memberCount;
  @JsonKey(name: "cover_photo_url")
  String? coverPhotoUrl;
  Owner? owner;
  @JsonKey(name: "is_like")
  int? isLike;
  @JsonKey(name: "total_viewers")
  int? totalViewers;
  @JsonKey(name: "is_follow")
  int? isFollow;
  @JsonKey(ignore: true)
  bool addAsHost = false;
  @JsonKey(name: "notification_id")
  String? notificationId;

  CreateStreamResponse(
      {this.isFollow,
      this.id,
      this.userId,
      this.channelName,
      this.token,
      this.status,
      this.streamType,
      this.startDatetime,
      this.coverPhoto,
      this.titleToChat,
      this.streamPublicationType,
      this.broadcastType,
      this.tags,
      this.endDatetime,
      this.totalMinutes,
      this.availableMinutes,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.followers,
      this.totalLikes,
      this.memberCount,
      this.coverPhotoUrl,
      this.owner,
      this.isLike,
      this.totalViewers,
      this.notificationId});

  factory CreateStreamResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateStreamResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateStreamResponseToJson(this);

  @override
  List<Object?> get props => [id, channelName, owner];

  factory CreateStreamResponse.fromNotification(Map<String, dynamic> json) {
    return CreateStreamResponse(
      channelName: json['channel_name'],
      notificationId: json['notification_id'],
      id: int.tryParse(json['stream_id']) ?? -1,
      streamType: int.tryParse(json['stream_type']) ?? 0,
      broadcastType: int.tryParse(json['broadcast_type']) ?? 0,
      owner: json['stream_owner'] == null
          ? null
          : Owner.fromJson(jsonDecode(json['stream_owner'])),
    );
  }
}

@JsonSerializable(includeIfNull: false, explicitToJson: true)
// ignore: must_be_immutable
class Owner extends SEquatable {
  int? id;
  String? name;
  int? following;
  int? follower;
  @JsonKey(name: "profile_image_url")
  String? profileImageUrl;
  // @JsonKey(name: "total_diamonds")
  // int? totalDiamonds;
  // @JsonKey(name: "total_beans")
  // int? totalBeans;
  @JsonKey(name: "user_wallet")
  UserWallet? userWallet;
  @JsonKey(name: "is_follow")
  int? isFollow;

  Owner({
    this.id,
    this.name,
    this.following,
    this.follower,
    this.profileImageUrl,
    // this.totalDiamonds,
    // this.totalBeans,
    this.userWallet,
    this.isFollow,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);

  Map<String, dynamic> toJson() => _$OwnerToJson(this);

  @override
  List<Object?> get props => [id, following, follower, isFollow];

  Owner copyWith({int? follower}) {
    this.follower = follower;
    return this;
  }
}
