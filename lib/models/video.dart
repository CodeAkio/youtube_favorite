import 'dart:convert';

class Video {
  final String? id;
  final String? title;
  final String? thumb;
  final String? channel;

  Video({
    this.id,
    this.title,
    this.thumb,
    this.channel,
  });

  Video copyWith({
    String? id,
    String? title,
    String? thumb,
    String? channel,
  }) {
    return Video(
      id: id ?? this.id,
      title: title ?? this.title,
      thumb: thumb ?? this.thumb,
      channel: channel ?? this.channel,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'thumb': thumb,
      'channel': channel,
    };
  }

  factory Video.fromMap(Map<String, dynamic> json) {
    if (json.containsKey("id")) {
      return Video(
          id: json["id"]["videoId"],
          title: json["snippet"]["title"],
          thumb: json["snippet"]["thumbnails"]["high"]["url"],
          channel: json["snippet"]["channelTitle"]);
    } else {
      return Video(
          id: json["videoId"],
          title: json["title"],
          thumb: json["thumb"],
          channel: json["channel"]);
    }
  }

  String toJson() => json.encode(toMap());

  factory Video.fromJson(String source) => Video.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Video(id: $id, title: $title, thumb: $thumb, channel: $channel)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Video &&
        other.id == id &&
        other.title == title &&
        other.thumb == thumb &&
        other.channel == channel;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ thumb.hashCode ^ channel.hashCode;
  }
}
