import 'package:flutter/material.dart';
import 'package:loansettle/utils/FilesUtils.dart';
import '../color/Colors.dart';
import '../fonts/Fonts.dart';
import '../res/Resources.dart';

Drawer homeNavigationDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(color: Color(editTextBg)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 86,
                height: 86,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  // This makes the corners circular
                  child: Image.asset(
                    profilePic,
                    fit: BoxFit
                        .cover, // This ensures the image covers the box without stretching
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Anuj Rai",
                        style: TextStyle(
                            fontFamily: publicSansBold,
                            color: Color(textColor),
                            fontSize: 16)),
                    Text("Delhi NCR",
                        style: TextStyle(
                            fontFamily: publicSansReg,
                            color: Color(editTextColor),
                            fontSize: 14)),
                    Text("+91983345678",
                        style: TextStyle(
                            fontFamily: publicSansReg,
                            color: Color(editTextColor),
                            fontSize: 14)),
                  ],
                ),
              )
            ],
          ),
        ),
        ListTile(
          title: const Text("DashBoard"),
          leading: const Icon(Icons.home),
          focusColor: const Color(editTextBg),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text("Credit Builder"),
          leading: const Icon(Icons.credit_card_rounded),
          focusColor: const Color(editTextBg),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Anytime Lawyer"),
          leading: const Icon(Icons.person),
          focusColor: const Color(editTextBg),
          onTap: () {},
        ),
        ListTile(
          title: const Text("Intimation Letter/Preferred Location Letter"),
          leading: const Icon(Icons.edit_document),
          focusColor: const Color(editTextBg),
          onTap: () {
            Navigator.pop(context);
            context.goToNextScreen("/intimationDoc");
          },
        ),
        ListTile(
          title: const Text("Complaint Against Recovery"),
          leading: const Icon(Icons.details),
          focusColor: const Color(editTextBg),
          onTap: () {
            Navigator.pop(context);
            context.goToNextScreen("/complaintAgainstOfficer");
          },
        ),
        ListTile(
          title: const Text("Negotiation Status"),
          leading: const Icon(Icons.handshake_outlined),
          focusColor: const Color(editTextBg),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text("Help & Resource"),
          leading: const Icon(Icons.help),
          focusColor: const Color(editTextBg),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text("Escalation"),
          leading: const Icon(Icons.auto_graph),
          focusColor: const Color(editTextBg),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: const Text("Contact Us"),
          leading: const Icon(Icons.support_agent),
          focusColor: const Color(editTextBg),
          onTap: () {
            context.goToNextScreen("/contactUs");
          },
        ),
        ListTile(
          title: const Text("Logout"),
          leading: const Icon(Icons.login),
          focusColor: const Color(editTextBg),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 80),
          margin: const EdgeInsets.only(top: 10),
          child: const Align(
            alignment: FractionalOffset.bottomCenter,
            child: Text(
              "version 1.1",
              style: TextStyle(
                  color: Color(editTextColor),
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    ),
  );
}
