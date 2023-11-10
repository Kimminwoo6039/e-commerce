import 'dart:io';

import 'package:common/core/utils/error/error_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CommonDialog {
  CommonDialog();

  static Future<bool?> errorDialog(BuildContext context, ErrorResponse error) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: SizedBox(
              height: 70,
              child: Column(
                  children: [Text('${error.message}'), Text('${error.code}')]),
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                onPressed: () => context.pop(true),
                child: Text('다시 시도'),
              ),
              ElevatedButton(
                onPressed: () => exit(0),
                child: Text("종료"),
              ),
            ],
          );
        });
  }
}
