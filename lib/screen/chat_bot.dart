import 'dart:async';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:chatgpt_bot/model/message_model.dart';
import 'package:flutter/material.dart';

import '../constances.dart';

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
  final String apikey = kApiKey;

  ///List message 换为不可修改的列表
  /*final List<MessageModel> messageList =
      List.unmodifiable([MessageModel(true, 'hi')]);*/
  final messageList = [MessageModel(true, 'Hi')];

  void sendMessage(String message) async {
    final request =
        ChatCompleteText(model: Gpt4oMiniChatModel(), maxToken: 400, messages: [
      Map.of({'role': 'user', 'content': message})
    ]);


    /*
    subscription = openAI.onChatCompletion(request: request).asStream().listen((it){
      setState(() {
        messageList.add(MessageModel(true, "${it?.choices.last.message}"));
      });
    });*/

    ///流式响应,异步处理,实时更新
   /* openAI.onChatCompletionSSE(request: request).listen((it) {
      setState(() {
        messageList.add(MessageModel(true, it.choices?.last.message?.content.toString()??'Error'));
      });
    });*/


    ///一次性响应
    final response = await openAI.onChatCompletion(request: request);

    setState(() {
      //TODO 可能有问题
      messageList.add(MessageModel(
          true, response?.choices.last.message?.content.toString() ?? 'Error'));
    });

    //TODO 流式响应
    /* openAI.onChatCompletionSSE(request: request).listen((it) {
      debugPrint(it.choices?.last.message?.content);
    });*/

    /* for (var message in messageList) {
      print(message.message); // 打印每个消息的内容
      print('高度是:'+MediaQuery.of(context).size.height.toString());
    }*/

  }

  @override
  void initState() {
    openAI = OpenAI.instance.build(token: kApiKey);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    subscription?.cancel();
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
              _messageList(),
              /*SizedBox(height: 75,)*/
            ],
          ),

          /**
           * 底部导航
           * */
          _bottomNavigation(context)
        ],
      ),
    );
  }

  Expanded _messageList() {
    return Expanded(
        flex: 7,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 75),
          child: ListView.builder(
            ///TODO: Find out the builder and itemCount
            itemCount: messageList.length,
            //苹果的滚动风格 到底部会回弹
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return messageList[index].isBot
                  ? _botCard(index: index)
                  : _userCard(index: index);
            },
          ),
        ));
  }

  Padding _userCard({required int index}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: CircleAvatar(
                backgroundColor: Colors.teal,
                child: Icon(
                  Icons.person,
                  color: Colors.black,
                )),
          ),
          Positioned(
            right: 50,
            child: Column(
              children: [
                Container(
                  //TODO padding应该在外面 不能写在里面
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(5)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(.23),
                            offset: Offset(3, .2),
                            //阴影模糊半径
                            blurRadius: kDefault)
                      ]),
                  child: Text(
                    //第二个是model的字段
                    messageList[index].message,
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }

  //TODO 详细了解命名参数和其他的区别
  Padding _botCard({required int index}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
      child: Stack(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                kAsukaAvatar),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 60,),
            //TODO padding应该在外面 不能写在里面
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(5)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(.23),
                      offset: Offset(3, .2),
                      //阴影模糊半径
                      blurRadius: kDefault)
                ]),
            child: Text(
              messageList[index].message,
              //自动换行
              softWrap: true,
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
                suffixIcon: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      sendMessage(txtMessage.text.toString());
                      messageList
                          .add(MessageModel(false, txtMessage.text.toString()));
                    });
                    txtMessage.clear();
                  },
                  child: Icon(
                    Icons.send,
                    size: 30,
                    color: Colors.blue,
                  ),
                ),
                hintText: '  plz input the question here',
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
              color: Colors.white,
              size: kDefault * 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kDefault,
              ),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    kAsukaAvatar),
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
