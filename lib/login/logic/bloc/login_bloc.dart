import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:promilo_test/login/models/login_response.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});

    on<SignInEvent>((event, emit) => login(event, emit));
  }

  login(SignInEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final response = await http.post(
        Uri.parse('https://apiv2stg.promilo.com/user/oauth/token'),
        headers: {
          'Authorization': 'Basic UHJvbWlsbzpxNCE1NkBaeSN4MiRHQg==',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          'username': event.userName,
          'password': sha256convert(event.password),
          'grant_type': 'password',
        },
      );

      LoginResponse data = loginResponseFromJson(json.encode(response));

      if (data.status?.code == 200) {
        emit(LoginSuccess());
      } else {
        emit(LoginError());
      }
    } catch (e) {
      emit(LoginError());
    }
  }

  String sha256convert(String input) {
    var bytes = utf8.encode(input); // Convert input string to bytes
    var digest = sha256.convert(bytes); // Calculate SHA-256 hash

    return digest.toString(); // Convert Digest to a hexadecimal string
  }
}
