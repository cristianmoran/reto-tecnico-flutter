import 'character_response.dart';

class StoriesResponse {
  int id;
  String title;
  String description;
  String resourceUri;
  String type;
  String modified;
  Thumbnail? thumbnail;
  Creators? creators;
  Characters? characters;
  Characters? series;
  Characters? comics;
  Characters? events;
  Series? originalIssue;

  StoriesResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.resourceUri,
    required this.type,
    required this.modified,
    required this.thumbnail,
    required this.creators,
    required this.characters,
    required this.series,
    required this.comics,
    required this.events,
    required this.originalIssue,
  });

  factory StoriesResponse.fromJson(Map<String, dynamic> json) =>
      StoriesResponse(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        resourceUri: json["resourceURI"] ?? "",
        type: json["type"] ?? "",
        modified: json["modified"] ?? "",
        thumbnail: json["thumbnail"] != null
            ? Thumbnail.fromJson(json["thumbnail"])
            : null,
        creators: json["creators"] != null
            ? Creators.fromJson(json["creators"])
            : null,
        characters: json["characters"] != null
            ? Characters.fromJson(json["characters"])
            : null,
        series:
            json["series"] != null ? Characters.fromJson(json["series"]) : null,
        comics:
            json["comics"] != null ? Characters.fromJson(json["comics"]) : null,
        events:
            json["events"] != null ? Characters.fromJson(json["events"]) : null,
        originalIssue: json["originalIssue"] != null
            ? Series.fromJson(json["originalIssue"])
            : null,
      );
}
