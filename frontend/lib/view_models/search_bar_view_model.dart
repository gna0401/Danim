import 'package:danim/models/UserSearchResults.dart';
import 'package:danim/services/search_repository.dart';
import 'package:danim/utils/auth_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../models/UserInfo.dart';

var logger = Logger();

class SearchBarViewModel extends ChangeNotifier {

  String? _searchKeyWord = "";
  String? get searchKeyWord => _searchKeyWord;
  set searchKeyWord (String? newString) {
    _searchKeyWord = newString;
    notifyListeners();
  }

  List<UserInfo> _searchedResults = [];
  List<UserInfo> get searchedResults => _searchedResults;
  set searchedResults (List<UserInfo> newList) {
    _searchedResults = newList;
  }

  List? _posts;
  List? get posts => _posts;
  set posts (List? newPosts) {
    _posts = newPosts;
  }

  bool _isSearching = false;
  bool get isSearching => _isSearching;
  set isSearching (bool newBool) {
    _isSearching = newBool;
  }


  FocusNode _myfocus = FocusNode();
  FocusNode get myfocus => _myfocus;


  Future<void> searchUser(BuildContext context, String? keyword) async {
    _searchKeyWord = keyword;
    _searchedResults = await SearchRepository().searchToSearchBar(context, keyword!);
    logger.d(_searchedResults);
    notifyListeners();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // isSearching = false;
    // searchKeyWord = "";
    super.dispose();
  }
}