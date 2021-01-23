import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_test1/Utils/constants.dart';
import 'package:flutter_test1/model/companies.dart';
import 'package:flutter_test1/networking/api.dart';
import 'package:flutter_test1/networking/response.dart';
import 'package:get_it/get_it.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int len = 0;
  API get apiService => GetIt.I<API>();
  DataResponse<List<CompanyData>> _dataResponse;
  CompanyData listData;

  @override
  void initState() {
    _getList();
    super.initState();
  }

  _getList() async {
    _dataResponse = await apiService.getCompanyList();

    setState(() {
      len = _dataResponse.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView.builder(
          itemCount: len,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            CompanyData companyList = _dataResponse.companies[index];
            return GestureDetector(
              onTap: () {
                _getList();
              },
              child: ListTile(
                leading: Image.network(
                  companyList.logo_url,
                  height: 25.0,
                  width: 25.0,
                ),
                title: Text(companyList.company),
                subtitle: Text(companyList.ceo),
              ),
            );
          },
        ),
      ),
    );
  }
}
