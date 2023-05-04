class CharacterResponse {
  int id;
  String name;
  String description;
  String modified;
  Thumbnail? thumbnail;
  String resourceUri;
  Comics? comics;
  Comics? series;
  Stories? stories;
  Comics? events;
  List<Url> urls;

  CharacterResponse({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.thumbnail,
    required this.resourceUri,
    required this.comics,
    required this.series,
    required this.stories,
    required this.events,
    required this.urls,
  });

  factory CharacterResponse.fromJson(Map<String, dynamic> json) => CharacterResponse(
        id: json["id"] ?? 0,
        name: json["name"] ?? "",
        description: json["description"] ?? "",
        modified: json["modified"] ?? "",
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        resourceUri: json["resourceURI"] ?? "",
        comics: Comics.fromJson(json["comics"]),
        series: Comics.fromJson(json["series"]),
        stories: Stories.fromJson(json["stories"]),
        events: Comics.fromJson(json["events"]),
        urls: json["urls"] != null
            ? List<Url>.from(json["urls"].map((x) => Url.fromJson(x)))
            : [],
      );
}

class Comics {
  int available;
  String collectionUri;
  List<ComicsItem> items;
  int returned;

  Comics({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  factory Comics.fromJson(Map<String, dynamic> json) => Comics(
        available: json["available"] ?? 0,
        collectionUri: json["collectionURI"] ?? "",
        items: json["items"] != null
            ? List<ComicsItem>.from(
                json["items"].map((x) => ComicsItem.fromJson(x)))
            : [],
        returned: json["returned"] ?? 0,
      );
}

class ComicsItem {
  String resourceUri;
  String name;

  ComicsItem({
    required this.resourceUri,
    required this.name,
  });

  factory ComicsItem.fromJson(Map<String, dynamic> json) => ComicsItem(
        resourceUri: json["resourceURI"] ?? "",
        name: json["name"] ?? "",
      );
}



class Thumbnail {
  String path;
  String extension;

  Thumbnail({
    required this.path,
    required this.extension,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"] ?? "",
        extension: json["extension"] ?? "",
      );
}

class Url {
  String type;
  String url;

  Url({
    required this.type,
    required this.url,
  });

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: json["type"] ?? "",
        url: json["url"] ?? "",
      );
}

class Characters {
  int available;
  String collectionUri;
  List<Series> items;
  int returned;

  Characters({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
    available: json["available"] ?? 0,
    collectionUri: json["collectionURI"] ?? "",
    items: json["items"] != null
        ? List<Series>.from(json["items"].map((x) => Series.fromJson(x)))
        : [],
    returned: json["returned"] ?? 0,
  );
}

class Series {
  String resourceUri;
  String name;

  Series({
    required this.resourceUri,
    required this.name,
  });

  factory Series.fromJson(Map<String, dynamic> json) => Series(
    resourceUri: json["resourceURI"] ?? "",
    name: json["name"] ?? "",
  );
}

class Creators {
  int available;
  String collectionUri;
  List<CreatorsItem> items;
  int returned;

  Creators({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  factory Creators.fromJson(Map<String, dynamic> json) => Creators(
    available: json["available"] ?? 0,
    collectionUri: json["collectionURI"] ?? "",
    items: json["items"] != null
        ? List<CreatorsItem>.from(
        json["items"].map((x) => CreatorsItem.fromJson(x)))
        : [],
    returned: json["returned"] ?? 0,
  );
}

class CreatorsItem {
  String resourceUri;
  String name;
  String role;

  CreatorsItem({
    required this.resourceUri,
    required this.name,
    required this.role,
  });

  factory CreatorsItem.fromJson(Map<String, dynamic> json) => CreatorsItem(
    resourceUri: json["resourceURI"] ?? "",
    name: json["name"] ?? "",
    role: json["role"] ?? "",
  );
}

class Stories {
  int available;
  String collectionUri;
  List<StoriesItem> items;
  int returned;

  Stories({
    required this.available,
    required this.collectionUri,
    required this.items,
    required this.returned,
  });

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
    available: json["available"] ?? 0,
    collectionUri: json["collectionURI"] ?? "",
    items: json["items"] != null
        ? List<StoriesItem>.from(
        json["items"].map((x) => StoriesItem.fromJson(x)))
        : [],
    returned: json["returned"] ?? 0,
  );
}

class StoriesItem {
  String resourceUri;
  String name;
  String? type;

  StoriesItem({
    required this.resourceUri,
    required this.name,
    required this.type,
  });

  factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
    resourceUri: json["resourceURI"] ?? "",
    name: json["name"] ?? "",
    type: json["type"] ?? "",
  );
}
