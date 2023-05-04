class BaseResponseList<T> {
  final int? offset;
  final int? limit;
  final int? total;
  final int? count;
  final List<T> data;

  BaseResponseList(
      {this.offset, this.limit, this.total, this.count, required this.data});

  factory BaseResponseList.fromJson(
      Map<String, dynamic> json, T Function(dynamic json) fromJsonT) {
    return BaseResponseList<T>(
      offset: json['offset'] as int,
      limit: json['limit'] as int,
      total: json['total'] as int,
      count: json['count'] as int,
      data: (json['results'] as List).map(fromJsonT).toList(),
    );
  }
}
