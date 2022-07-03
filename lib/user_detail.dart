import 'package:flutter/material.dart';
import 'package:myapp/model/user_model.dart';

import 'model/user_model.dart';

class UserDetail extends StatefulWidget {

  final User user;

  const UserDetail({Key? key, required this.user}) : super(key: key);

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {

  final UserTitleController = TextEditingController();

  late FocusNode _titleFocus;


  @override
  void initState() {

    _titleFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    UserTitleController.dispose();

    _titleFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0
          ),
          color: const Color(0xFFF6F6F6),
          child: Stack(
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: InkWell(
                      child: IconButton(
                        highlightColor: Colors.transparent,
                        color: Colors.black54,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}