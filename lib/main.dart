import 'package:common/data/repository_impl/display.repository.impl.dart';
import 'package:common/presentation/pages/main/cubit/mall_type_cubit.dart';
import 'package:flutter/material.dart';
import 'core/theme/theme_data.dart';
import 'data/data_source/mock/display_mock_api.dart';
import 'presentation/routes/routes.dart';

void main() async {
  final data = await DisplayRepositoryImpl(DisplayMockApi()).getMenusByMallType(mallType: MallType.market);
  print(data);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router, /// routes/routes.dart 경로지정
      theme: CustomThemeData.themeData, /// core/theme 디자인 지정
    );
  }
}
