import 'package:flutter/material.dart';
import '../../initializer.dart';
import '../base_page_state.dart';

class InitPageState extends BasePageState {
  final Initializer _initializer = Initializer();

  @override
  void initState() {
    _initializer.init(context);
    super.initState();
  }

  @override
  Widget? appBar() => null;

  @override
  String? getTitle() => null;

  @override
  Widget buildBody(BuildContext context) {
    return Center(
      child: FlutterLogo(),
    );
  }
}
