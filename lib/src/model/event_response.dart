import 'character_response.dart';

class EventResponse {
  int id;
  String title;
  String description;
  String resourceUri;
  List<Url> urls;
  String modified;
  String start;
  String end;
  Thumbnail? thumbnail;
  Creators? creators;
  Characters? characters;
  Stories? stories;
  Characters? comics;
  Characters? series;
  Series? next;
  Series? previous;

  EventResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.resourceUri,
    required this.urls,
    required this.modified,
    required this.start,
    required this.end,
    required this.thumbnail,
    required this.creators,
    required this.characters,
    required this.stories,
    required this.comics,
    required this.series,
    required this.next,
    required this.previous,
  });

  factory EventResponse.fromJson(Map<String, dynamic> json) => EventResponse(
        id: json["id"] ?? 0,
        title: json["title"] ?? "",
        description: json["description"] ?? "",
        resourceUri: json["resourceURI"] ?? "",
        urls: json["urls"] != null
            ? List<Url>.from(json["urls"].map((x) => Url.fromJson(x)))
            : [],
        modified: json["modified"] ?? "",
        start: json["start"] ?? "",
        end: json["end"] ?? "",
        thumbnail: json["thumbnail"] != null
            ? Thumbnail.fromJson(json["thumbnail"])
            : null,
        creators: json["creators"] != null
            ? Creators.fromJson(json["creators"])
            : null,
        characters: json["characters"] != null
            ? Characters.fromJson(json["characters"])
            : null,
        stories:
            json["stories"] != null ? Stories.fromJson(json["stories"]) : null,
        comics:
            json["comics"] != null ? Characters.fromJson(json["comics"]) : null,
        series:
            json["series"] != null ? Characters.fromJson(json["series"]) : null,
        next: json["next"] != null ? Series.fromJson(json["next"]) : null,
        previous:
            json["previous"] != null ? Series.fromJson(json["previous"]) : null,
      );
}
