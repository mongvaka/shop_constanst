
class BasicResponseModel {
  final bool? success;
  final List<dynamic>? error;
  final  List<dynamic>? data;
  final  int? currentPage;
  final  int? perPage;
  final  int? totalPage;
  final  int? total;

  BasicResponseModel(
      {required this.success,
        required this.error,
        required this.currentPage,
        required this.perPage,
        required this.data,
        required this.totalPage,
        required this.total});

  factory BasicResponseModel.fromJson(Map<String, dynamic> json,
      {bool? success,
        List<dynamic>? error,
        List<dynamic>? data,
        int? currentPage,
        int? perPage,
        int? totalPage,
        int? total,
      }) {
    return BasicResponseModel(
      success: json['success'],
      error: json['error'],
      data: json['data'],
      currentPage: json['currentPage'],
      perPage: json['perPage'],
      totalPage: json['totalPage'],
      total: json['total'],
    );
  }
}