import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';

class EditAddSkills {
  static Future verify(task, token) async {
    print('tasks added');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'skillsets': task,
    });

    var response = await dio.patch(
      'https://mybud.herokuapp.com/user/editskill',
      data: formData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {
          'Authorization': "Bearer " + token

          // token
        },
      ),
    );

    if (response.statusCode == 200) {
      print('Response data : ${response.data}');
      print('tasks added successfully');
      return response.data;
      // return json.decode(response.data);
    } else if (response.statusCode == 400) {
      print('Error code : ${response.data}');
      return response.data;
      //  print('message of signup - ${json.decode(response.data)['error']}');
      // return json.decode(response.data);
    } else {
      return null;
    }
  }
}
