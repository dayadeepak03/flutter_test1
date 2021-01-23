import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_test1/Utils/constants.dart';
import 'package:flutter_test1/model/companies.dart';
import 'package:flutter_test1/networking/response.dart';

class API {
  Future<DataResponse<List<CompanyData>>> getCompanyList() {
    return http
        .get(Constants.BASE_URL, headers: Constants.headers)
        .then((data) {
      final jsonData = json.decode(data.body);
      if (data.statusCode == 200) {
        final listData = jsonData['companies'];
        final comList = <CompanyData>[];
        for (var item in listData) {
          comList.add(CompanyData.fromJson(item));
        }
        return DataResponse<List<CompanyData>>(
          error: 'false',
          companies: comList,
          length: comList.length,
        );
      }
      return DataResponse<List<CompanyData>>(
          error: 'true', message: 'An error occurred');
    }).catchError((_) => DataResponse<List<CompanyData>>(
            error: 'true', message: 'An error occurred'));
  }
}
