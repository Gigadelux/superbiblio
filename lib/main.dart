import 'package:flutter/material.dart';
import 'package:searchbar_animation/searchbar_animation.dart';
import 'package:toast/toast.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _controller = TextEditingController();
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[700],
      body: SafeArea(
        child: 
        Stack(
          children: [
            ListView.builder(
              controller: _scrollController,
              itemCount: 400,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                if(index==0) {
                  print(index);
                  return const SizedBox(height: 100,);
                }
                if(index%8>=7) {
                  return SizedBox(
                    height: 70,
                    child: ListTile(
                      leading: const Icon(Icons.book),
                      title: Text(index.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Color.fromARGB(128, 255, 255, 255))),
                      subtitle: const Text("down, bad", style: TextStyle(color: Colors.redAccent),)
                    ),
                  );
                } else if(index%8>=5) {
                  return SizedBox(
                    height: 70,
                    child: ListTile(
                      leading: const Icon(Icons.book),
                      title: Text(index.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Color.fromARGB(128, 255, 255, 255))),
                      subtitle: const Text("down mid, good", style: TextStyle(color: Colors.white),),
                    ),
                  );
                } else if(index%8>=3) { //TODO adjust
                  return SizedBox(
                    height: 70,
                    child: ListTile(
                      leading: const Icon(Icons.book),
                      title: Text(index.toString(), style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 40, color: Color.fromARGB(128, 255, 255, 255))),
                      subtitle: const Text("upper mid, good", style: TextStyle(color: Colors.white),),
                    ),
                  );
                } else if(index%8>=1) { //TODO adjust
                  return SizedBox(
                    height: 70,
                    child: ListTile(
                      leading: const Icon(Icons.book),
                      title: Text(index.toString(), style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 40, color: Color.fromARGB(128, 255, 255, 255))),
                      subtitle: const Text("upper, bad", style: TextStyle(color: Colors.redAccent),),
                    ),
                  );
                } 
                else {
                  return SizedBox(
                    height: 70,
                    child: ListTile(
                      leading: const Icon(Icons.book),
                      title: Text(index.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 40, color: Color.fromARGB(128, 255, 255, 255))),
                      subtitle: const Text("down, bad", style: TextStyle(color: Colors.redAccent),)
                    ),
                  );
                }
              },
            ),
            Container(
              color: const Color.fromARGB(255, 255, 160, 0),
              height: 100,
              child: SearchBarAnimation(
                        textEditingController: _controller, 
                        isOriginalAnimation: true,
                        durationInMilliSeconds: 300,
                        enableKeyboardFocus: true,
                        buttonWidget: const Icon(
                          Icons.search_rounded,
                          color: Color.fromARGB(255, 0, 30, 75),
                        ),
                        onFieldSubmitted: (value) {
                          double? search = double.tryParse(value);
                          if(search!=null) {
                            _scrollController.jumpTo(search*70-70);
                          } else {
                            ToastContext().init(context);
                            Toast.show("enter a valid number pls☹️");
                          }
                        },
                        trailingWidget: const Icon(Icons.search_rounded), 
                        secondaryButtonWidget: const Icon(Icons.cancel_outlined),),
            ),
          ],
        ),
      ),
    );
  }
}