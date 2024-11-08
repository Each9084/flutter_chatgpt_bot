import 'dart:async';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:chatgpt_bot/constances.dart';
import 'package:chatgpt_bot/model/message_model.dart';
import 'package:flutter/material.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  State<ChatBotScreen> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBotScreen> {
  final txtMessage = TextEditingController();
  late OpenAI openAI;

  StreamSubscription? subscription;

  //api key
  final String apikey = '';

  ///List message 换为不可修改的列表
  final List<MessageModel> message =
      List.unmodifiable([MessageModel(true, 'hi')]);

  @override
  void initState() {
    openAI = OpenAI.instance.build(token: kToken);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        //可以堆叠起来
        children: [
          Column(
            children: [_appBar(), Expanded(flex: 7, child: Container())],
          ),

          /*
          * 底部导航
          * */
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: kDefault),
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'plz input the question',
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(kDefault)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(kDefault)),
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }

  Expanded _appBar() {
    return Expanded(
      flex: 1,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: kDefault, vertical: kDefault / 2),
        decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(kDefault),
                bottomLeft: Radius.circular(kDefault)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.23),
                  offset: Offset(kDefault / 1.2, .2),
                  //阴影模糊半径
                  blurRadius: kDefault)
            ]),
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: kDefault * 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kDefault,
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://img0.baidu.com/it/u=1941938688,2932034800&fm=253&fmt=auto&app=120&f=JPEG?w=801&h=500'),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ChatGpt",
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  "Online",
                  style: TextStyle(color: Colors.green),
                )
              ],
            )
          ],
        ),
      ),
      /*
              * ListView
              * */
    );
  }
}
