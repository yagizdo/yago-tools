import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:yago_tools/constants/app_colors.dart';
import 'package:yago_tools/localizations/locale_keys.g.dart';
import 'package:yago_tools/models/home_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:yago_tools/widgets/app_list.dart';

import '../models/app_model.dart';


class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // ViewModel with locator
  final HomeViewModel _homeViewModel = GetIt.I<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.home_home_title.tr()),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: _homeViewModel.fetchApps(),
              builder: (BuildContext context, AsyncSnapshot<List<AppModel>> snapshot){
                return AppList(snapshot: snapshot);
              }
            ),
          )
        ],
      )
    );
  }
}
