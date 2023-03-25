import 'package:cinephile/common/base_url.dart';
import 'package:cinephile/common/end_url.dart';
import 'package:dio/dio.dart';
class HomeService{
  final dio = Dio();
  final baseurl=BaseUrl().baseurl;
  final endUrl=EndUrl().getMovie;
  

}