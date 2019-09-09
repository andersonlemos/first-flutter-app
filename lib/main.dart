import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter/src/widgets/binding.dart';
import 'package:flutter/widgets.dart';

import 'models/item.dart';


void main() => runApp(App());



class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todo App",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends  StatefulWidget{
  List<Item> items = new List<Item>();
  
  HomePage(){

    items = [];

    items.add(Item(title: "Banana",done: false));
    items.add(Item(title: "Abacate",done: true));
    items.add(Item(title: "Laranja",done: false));
  }

  @override
  _HomePage createState()=> _HomePage();

}

class _HomePage extends State<HomePage>{
  
  TextEditingController taskController = new TextEditingController();
  
  void add(){
    
    if(taskController.text.isEmpty) return; 
    
    setState(() {
       widget.items.add(Item(title: taskController.text, done: false));
       taskController.clear();
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title: TextFormField(
          controller: taskController,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          decoration: InputDecoration(
            labelText: "Nova Tarefa",
            labelStyle: TextStyle(color: Colors.white)
          ),
        ),        
      ),
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index){
          final item = widget.items[index];
          return CheckboxListTile(
            key: Key(item.title),
            title: Text(item.title),
            value: item.done,
            onChanged: (value){
              setState(() {
               item.done = value; 
              });
            },

          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,       
        onPressed: add,),
    );
  }
}



