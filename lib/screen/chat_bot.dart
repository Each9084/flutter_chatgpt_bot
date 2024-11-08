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
            children: [
              _appBar(),
              /**
               * List View 设置对话 一来一回
               * */
              Expanded(
                  flex: 7,
                  child: ListView.builder(
                    ///TODO: Find out the builder and itemCount
                    itemCount: message.length,
                    //苹果的滚动风格 到底部会回弹
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context,index) {
                      return _botCard(index:index);
                    },
                  ))
            ],
          ),

          /*
          * 底部导航
          * */
          _bottomNavigation(context)
        ],
      ),
    );
  }

  //TODO 详细了解命名参数和其他的区别
  Padding _botCard({required int index}) {
    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Stack(
                        children: [
                          CircleAvatar(
                            child: Icon(
                              Icons.person,
                              size: 30,
                            ),
                          ),
                          Positioned(
                            left: 50,
                            child: Column(
                              children: [
                                Container(
                                  //TODO padding应该在外面 不能写在里面
                                  padding:EdgeInsets.symmetric(horizontal: 5,vertical: 0),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black.withOpacity(.23),
                                            offset: Offset(3, .2),
                                            //阴影模糊半径
                                            blurRadius: kDefault)
                                      ]
                                  ),
                                  child: Text(
                                    'data',
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
  }

  Align _bottomNavigation(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(kDefault),
                topLeft: Radius.circular(kDefault)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.23),
                  offset: Offset(3, .2),
                  //阴影模糊半径
                  blurRadius: kDefault)
            ]),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.12),
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            controller: txtMessage,
            decoration: InputDecoration(
                hintStyle: TextStyle(fontSize: 25),
                suffixIcon: Icon(
                  Icons.send,
                  size: 30,
                  color: Colors.blue,
                ),
                hintText: '  plz input the question',
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none),
          ),
        ),
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
