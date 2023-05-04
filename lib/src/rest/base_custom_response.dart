class BaseCustomResponse<T> {
  final int? code;
  final String? status;
  final String? copyright;
  final String? attributionText;
  final String? attributionHTML;
  final String? etag;
  final T? data;

  BaseCustomResponse(
      {this.code,
      this.status,
      this.copyright,
      this.attributionText,
      this.attributionHTML,
      this.etag,
      this.data});

  factory BaseCustomResponse.fromJson(Map<String, dynamic> json) {
    return BaseCustomResponse<T>(
      code: json['code'] as int,
      status: json['status'] as String,
      copyright: json['copyright'] as String,
      attributionText: json['attributionText'] as String,
      attributionHTML: json['attributionHTML'] as String,
      etag: json['etag'] as String,
    );
  }
}
