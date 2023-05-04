import 'character_response.dart';

class SeriesResponse {
  int id;
  String title;
  String description;
  String resourceUri;
  List<Url> urls;
  int startYear;
  int endYear;
  String rating;
  String type;
  String modified;
  Thumbnail? thumbnail;
  Creators? creators;
  Characters? characters;
  Stories? stories;
  Characters? comics;
  Characters? events;
  Series? next;
  Series? previous;

  SeriesResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.resourceUri,
    required this.urls,
    required this.startYear,
    required this.endYear,
    required this.rating,
    required this.type,
    required this.modified,
    required this.thumbnail,
    required this.creators,
    required this.characters,
    required this.stories,
    required this.comics,
    required this.events,
    this.next,
    this.previous,
  });

  factory SeriesResponse.fromJson(Map<String, dynamic> json) => SeriesResponse(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        resourceUri: json["resourceURI"] ?? "",
        urls: json["urls"] != null
            ? List<Url>.from(json["urls"].map((x) => Url.fromJson(x)))
            : [],
        startYear: json["startYear"] ?? 0,
        endYear: json["endYear"] ?? 0,
        rating: json["rating"] ?? "",
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
        stories: json["stories"]!= null ? Stories.fromJson(json["stories"]) : null,
        comics:
            json["comics"] != null ? Characters.fromJson(json["comics"]) : null,
        events:
            json["events"] != null ? Characters.fromJson(json["events"]) : null,
        next: json["next"] == null ? null : Series.fromJson(json["next"]),
        previous:
            json["previous"] == null ? null : Series.fromJson(json["previous"]),
      );
}
