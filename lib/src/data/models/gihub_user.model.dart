import 'dart:convert';

GithubUser githubUserFromJson(String str) =>
    GithubUser.fromJson(json.decode(str));

String githubUserToJson(GithubUser data) => json.encode(data.toJson());

class GithubUser {
  GithubUser({
    required this.login,
    required this.id,
    this.avatarUrl,
    this.name,
    this.blog,
    this.location,
    this.email,
    this.bio,
    this.twitterUsername,
    this.publicRepos,
    required this.followers,
    required this.following,
    required this.createdAt,
    required this.updatedAt,
  });

  String login;
  int id;
  String? avatarUrl;
  String? blog;
  String? name;
  String? location;
  String? email;
  String? bio;
  String? twitterUsername;
  int? publicRepos;
  int followers;
  int following;
  DateTime createdAt;
  DateTime updatedAt;

  factory GithubUser.fromJson(Map<String, dynamic> json) => GithubUser(
        login: json["login"],
        id: json["id"],
        avatarUrl: json["avatar_url"],
        name: json["name"],
        blog: json["blog"],
        location: json["location"],
        email: json["email"],
        bio: json["bio"],
        twitterUsername: json["twitter_username"],
        publicRepos: json["public_repos"],
        followers: json["followers"],
        following: json["following"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "avatar_url": avatarUrl,
        "name": name,
        "blog": blog,
        "location": location,
        "email": email,
        "bio": bio,
        "twitter_username": twitterUsername,
        "public_repos": publicRepos,
        "followers": followers,
        "following": following,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
