import 'character_response.dart';

class ComicResponse {
  int id;
  int digitalId;
  String title;
  int issueNumber;
  String variantDescription;
  String description;
  String modified;
  String isbn;
  String upc;
  String diamondCode;
  String ean;
  String issn;
  String format;
  int pageCount;
  List<TextObject> textObjects;
  String resourceUri;
  List<Url> urls;
  Series? series;
  List<Series> variants;
  List<dynamic> collections;
  List<dynamic> collectedIssues;
  List<Date> dates;
  List<Price> prices;
  Thumbnail? thumbnail;
  List<Thumbnail> images;
  Creators? creators;
  Characters? characters;
  Stories? stories;
  Characters? events;

  ComicResponse({
    required this.id,
    required this.digitalId,
    required this.title,
    required this.issueNumber,
    required this.variantDescription,
    required this.description,
    required this.modified,
    required this.isbn,
    required this.upc,
    required this.diamondCode,
    required this.ean,
    required this.issn,
    required this.format,
    required this.pageCount,
    required this.textObjects,
    required this.resourceUri,
    required this.urls,
    required this.series,
    required this.variants,
    required this.collections,
    required this.collectedIssues,
    required this.dates,
    required this.prices,
    required this.thumbnail,
    required this.images,
    required this.creators,
    required this.characters,
    required this.stories,
    required this.events,
  });

  factory ComicResponse.fromJson(Map<String, dynamic> json) => ComicResponse(
        id: json["id"] ?? 0,
        digitalId: json["digitalId"] ?? 0,
        title: json["title"] ?? "",
        issueNumber: json["issueNumber"] ?? 0,
        variantDescription: json["variantDescription"] ?? "",
        description: json["description"] ?? "",
        modified: json["modified"] ?? "",
        isbn: json["isbn"] ?? "",
        upc: json["upc"] ?? "",
        diamondCode: json["diamondCode"] ?? "",
        ean: json["ean"] ?? "",
        issn: json["issn"] ?? "",
        format: json["format"] ?? "",
        pageCount: json["pageCount"] ?? 0,
        textObjects: json["textObjects"] != null
            ? List<TextObject>.from(
                json["textObjects"].map((x) => TextObject.fromJson(x)))
            : [],
        resourceUri: json["resourceURI"] ?? "",
        urls: json["urls"] != null
            ? List<Url>.from(json["urls"].map((x) => Url.fromJson(x)))
            : [],
        series: json["series"] != null ? Series.fromJson(json["series"]) : null,
        variants: json["variants"] != null
            ? List<Series>.from(json["variants"].map((x) => Series.fromJson(x)))
            : [],
        collections: List<dynamic>.from(json["collections"].map((x) => x)),
        collectedIssues:
            List<dynamic>.from(json["collectedIssues"].map((x) => x)),
        dates: json["dates"] != null
            ? List<Date>.from(json["dates"].map((x) => Date.fromJson(x)))
            : [],
        prices: json["prices"] != null
            ? List<Price>.from(json["prices"].map((x) => Price.fromJson(x)))
            : [],
        thumbnail: json["thumbnail"] != null
            ? Thumbnail.fromJson(json["thumbnail"])
            : null,
        images: json["images"] != null
            ? List<Thumbnail>.from(
                json["images"].map((x) => Thumbnail.fromJson(x)))
            : [],
        creators: json["creators"] != null
            ? Creators.fromJson(json["creators"])
            : null,
        characters: json["characters"] != null
            ? Characters.fromJson(json["characters"])
            : null,
        stories:
            json["stories"] != null ? Stories.fromJson(json["stories"]) : null,
        events:
            json["events"] != null ? Characters.fromJson(json["events"]) : null,
      );
}

class Date {
  String type;
  String date;

  Date({
    required this.type,
    required this.date,
  });

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        type: json["type"] ?? "",
        date: json["date"] ?? "",
      );
}

class Price {
  String type;
  double price;

  Price({
    required this.type,
    required this.price,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        type: json["type"] ?? "",
        price: json["price"]==null? 0.0: double.parse(json["price"].toString()),
      );
}

class TextObject {
  String type;
  String language;
  String text;

  TextObject({
    required this.type,
    required this.language,
    required this.text,
  });

  factory TextObject.fromJson(Map<String, dynamic> json) => TextObject(
        type: json["type"] ?? "",
        language: json["language"] ?? "",
        text: json["text"] ?? "",
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
