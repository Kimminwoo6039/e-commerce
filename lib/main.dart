import 'package:common/core/utils/exception/common_exception.dart';
import 'package:common/core/utils/logger.dart';
import 'package:common/data/repository_impl/display.repository.impl.dart';
import 'package:common/domain/repository/display.repository.dart';
import 'package:common/domain/usecase/display/display.usecase.dart';
import 'package:common/domain/usecase/display/menu/get_menus.usecase.dart';
import 'package:common/presentation/pages/main/cubit/mall_type_cubit.dart';
import 'package:common/service_locator.dart';
import 'package:flutter/material.dart';
import 'core/theme/theme_data.dart';
import 'data/data_source/mock/display_mock_api.dart';
import 'presentation/routes/routes.dart';

void main() async {
  setLocator();

  try {
    final test = await DisplayMockApi().getMenusByMallType('marget');
    CustomLogger.logger.d(test);
  } catch(error) {
    final errorData = CommonException.setError(error);
    CustomLogger.logger.e(errorData);
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      /// routes/routes.dart 경로지정
      theme: CustomThemeData.themeData,
      /// core/theme 디자인 지정
    );
  }
}
