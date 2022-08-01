import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(
      ),
      home: const MyHomePage(title: 'Flutter To Do'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List <String> title = [];
  final List <String> description = [];
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  void generateList(){
    setState(() {
      title.insert(0,titleController.text);
      description.insert(0,descriptionController.text);

    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // alignment:Alignment.topLeft,

          children: <Widget>[
            TextField(
              decoration: const InputDecoration(
                hintText: 'Title',
              ),
              controller: titleController,
            ),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Description',
              ),
              controller: descriptionController,
            ),
           Expanded(
              child: ListView.builder(
                itemCount: title.length,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey,
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.topLeft,
                    child: Column(
                        children:[
                      Text('${title[index]}'),
                      Text( '${description[index]}'),
                  ] ),
                  );
                },
              ),
            )
         ],
       ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>{generateList(),},
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

