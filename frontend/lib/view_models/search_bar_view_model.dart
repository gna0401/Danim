import 'package:danim/services/search_repository.dart';
import 'package:flutter/material.dart';

import '../models/UserInfo.dart';

class SearchBarViewModel extends ChangeNotifier {
  final bool isMyFeed;

  String? _searchKeyWord = "";

  String? get searchKeyWord => _searchKeyWord;

  double getSearchBarHeight() {
    if (!isMyFeed) {
      if (searchedResults.isEmpty) {
        return (searchedResults.length + 1) * 105;
      } else if (searchedResults.length == 1) {
        return (searchedResults.length + 1) * 82;
      } else if (searchedResults.length >= 2 && searchedResults.length <= 4) {
        return (searchedResults.length + 1) * 75;
      } else {
        return 450;
      }
    }
    return 105;
  }

  List<UserInfo> _searchedResults = [];

  List<UserInfo> get searchedResults => _searchedResults;

  List? _posts;

  List? get posts => _posts;

  final bool _isSearching = false;

  bool get isSearching => _isSearching;

  SearchBarViewModel({required this.isMyFeed}) {
    unFocus();
  }

  final FocusNode _myFocus = FocusNode();

  FocusNode get myFocus => _myFocus;

  UnfocusDisposition disposition = UnfocusDisposition.scope;

  Future<void> searchUser(BuildContext context, String? keyword) async {
    _searchKeyWord = keyword;
    if (keyword != "") {
      if (!isMyFeed) {
        _searchedResults =
            await SearchRepository().searchToSearchBar(context, keyword!);
      }
    }
    notifyListeners();
  }

  void unFocus() {
    _myFocus.unfocus();
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
