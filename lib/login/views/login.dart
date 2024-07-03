import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:promilo_test/home_screen/views/home_bottom_nav_bar.dart';
import 'package:promilo_test/login/logic/bloc/login_bloc.dart';
import 'package:promilo_test/utils/app_colors.dart';
import 'package:promilo_test/utils/text_styles.dart';
import 'package:promilo_test/utils/widget/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<bool> isSelected = ValueNotifier(false);
  final ValueNotifier<bool> isFilled = ValueNotifier(false);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 26),
          child: SingleChildScrollView(
            child: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeNavBar(),
                      ));
                }
              },
              builder: (context, state) {
                return Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 28,
                      ),
                      Center(
                        child: Text(
                          "promilo",
                          style: TextStyles.textStyleBold26,
                        ),
                      ),
                      const SizedBox(
                        height: 46,
                      ),
                      Text(
                        "Hi, Welcome  Back!",
                        style: TextStyles.textStyleBold24,
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              "Please Sign in to Continue",
                              style: TextStyles.textStyleRegular16,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFieldWithLabel(
                            controller: userNameController,
                            error: state is LoginError ? "" : null,
                            label: "Enter Email or Mobile Number",
                            onChanged: (p0) {
                              if (userNameController.text.isNotEmpty &&
                                  passwordController.text.isNotEmpty) {
                                isFilled.value = true;
                              } else {
                                isFilled.value = false;
                              }
                            },
                            validator: (value) {
                              String pattern =
                                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                              RegExp regex = RegExp(pattern);
                              if (!regex.hasMatch(value!)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Spacer(),
                            Text(
                              "Sign In With OTP",
                              style: TextStyles.textStyleBold16
                                  .copyWith(color: AppColors.secondaryBlue),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              "Password",
                              style: TextStyles.textStyleRegular16,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFieldWithLabel(
                            controller: passwordController,
                            maxLine: 1,
                            obscureText: true,
                            label: "Enter the password",
                            error: state is LoginError
                                ? "Invalid ID or Invalid Password"
                                : null,
                            onChanged: (p0) {
                              if (userNameController.text.isNotEmpty &&
                                  passwordController.text.isNotEmpty) {
                                isFilled.value = true;
                              } else {
                                isFilled.value = false;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Row(
                              children: [
                                ValueListenableBuilder(
                                    valueListenable: isSelected,
                                    builder: (context, value, child) {
                                      return SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Checkbox(
                                            side: const BorderSide(
                                                color: AppColors.grey6),
                                            value: value,
                                            onChanged: (value) {
                                              isSelected.value = value ?? false;
                                            }),
                                      );
                                    }),
                                const SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  "Remember Me",
                                  style: TextStyles.textStyleRegular14
                                      .copyWith(color: AppColors.grey10),
                                ),
                                const Spacer(),
                                Text(
                                  "Forgot Password",
                                  style: TextStyles.textStyleBold16
                                      .copyWith(color: AppColors.secondaryBlue),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      ValueListenableBuilder(
                          valueListenable: isFilled,
                          builder: (context, value, child) {
                            return InkWell(
                              onTap: value
                                  ? () {
                                      if (_formKey.currentState?.validate() ==
                                          true) {
                                        context.read<LoginBloc>().add(
                                            SignInEvent(
                                                password:
                                                    userNameController.text,
                                                userName:
                                                    passwordController.text));
                                      }
                                    }
                                  : null,
                              child: Container(
                                height: 45,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9),
                                  border: Border.all(
                                      color: AppColors.secondaryBlue, width: 2),
                                  color: value
                                      ? AppColors.secondaryBlue
                                      : Colors.blue[100],
                                ),
                                child: Center(
                                  child: Text(
                                    "Submit",
                                    style: TextStyles.textStyleBold18
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            );
                          }),
                      const SizedBox(
                        height: 26,
                      ),
                      const Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Divider(
                              color: AppColors.grey3,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3),
                            child: Text("or"),
                          ),
                          Expanded(
                            child: Divider(
                              color: AppColors.grey3,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 26,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/google_icon.svg',
                            height: 35,
                            width: 35,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          SvgPicture.asset(
                            'assets/linkedin_icon.svg',
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          SvgPicture.asset(
                            'assets/facebook_icon.svg',
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          SvgPicture.asset(
                            'assets/instagram_icon.svg',
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          SvgPicture.asset(
                            'assets/whatsapp_icon.svg',
                            height: 40,
                            width: 40,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Business User?",
                            style: TextStyles.textStyleRegular16
                                .copyWith(color: AppColors.grey8),
                          ),
                          Text(
                            "Don't have an account",
                            style: TextStyles.textStyleRegular16
                                .copyWith(color: AppColors.grey8),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Login Here",
                            style: TextStyles.textStyleBold16
                                .copyWith(color: AppColors.secondaryBlue),
                          ),
                          Text(
                            "Sign Up",
                            style: TextStyles.textStyleBold16
                                .copyWith(color: AppColors.secondaryBlue),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "By continuing,you agree to",
                        style: TextStyles.textStyleRegular14
                            .copyWith(color: AppColors.grey6),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Promilos  ",
                            style: TextStyles.textStyleRegular12
                                .copyWith(color: AppColors.grey6)),
                        TextSpan(
                            text: "Terms of Use & Privacy Policy",
                            style: TextStyles.textStyleRegular12)
                      ]))
                    ],
                  ),
                );
              },
            ),
          ),
        )),
      ),
    );
  }
}
