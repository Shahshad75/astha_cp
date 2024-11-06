import 'package:astha_cp/src/controller/profile%20bloc/profile_bloc.dart';
import 'package:astha_cp/src/features/dashboard/view/profile_screen.dart';
import 'package:astha_cp/src/features/dashboard/widget/cutomlistview.dart';
import 'package:astha_cp/src/features/dashboard/widget/icon_tile.dart';
import 'package:astha_cp/src/model/user_model.dart';
import 'package:astha_cp/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBox extends StatefulWidget {
  const ProfileBox({super.key});

  @override
  State<ProfileBox> createState() => _ProfileBoxState();
}

class _ProfileBoxState extends State<ProfileBox> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(GetProfileDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is ProfileDataSuccessState) {
          UserModel user = state.userModel;
          return InkWell(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => ProfileScreen(user: user))),
            child: Container(
              height: size.height / 4.1,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: SizedBox(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            SizedBox(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                  Text(
                                    user.firstName + user.lastName,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        fontSize: 25.0,
                                        fontFamily: "ReadexPro",
                                        fontWeight: FontWeight.w500,
                                        color: primaryColor),
                                  ),
                                  Text('${user.gender} | 45',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 14.0,
                                          fontFamily: "ReadexPro",
                                          color: Colors.grey)),
                                ])),
                            const CutomListTile(
                                leading: "REGD NO - ",
                                text: "AVS76889JK90KKL1"),
                            const CutomListTile(
                                leading: "DEPT - ",
                                text: "Obstetrics and gynaecology"),
                            CutomIconTile(
                                logoUrl: "assets/images/call_icon.png",
                                text: "+91 ${user.personalMobile}"),
                            CutomIconTile(
                                logoUrl: "assets/images/email_icon.png",
                                text: user.email)
                          ])),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: const CircleAvatar(
                          radius: 38,
                          backgroundImage: AssetImage("assets/images/men.webp"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
