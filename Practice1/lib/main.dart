import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    home:Layout(),
    debugShowCheckedModeBanner: false,
  ));
}
class Layout extends StatelessWidget{
  const Layout({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:const Text("My Layout Columns wise"),
        backgroundColor: Colors.grey,
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child:const Text("Columns Demo",
            style:TextStyle(fontSize:18,fontWeight:FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              boxWidget(Colors.red,"box1"),
              boxWidget(Colors.purple,"box2"),
              boxWidget(Colors.orange,"box3"),
            ],
          ),

          const SizedBox(height:30),

          Padding(
              padding:const EdgeInsetsGeometry.all(10),
          child:Text("Row demo",
          style:TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
          ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              boxWidget(Colors.red,"Box1"),
              boxWidget(Colors.blue,"Box2"),
              boxWidget(Colors.green,"Box3"),
            ],

          )
        ],
      ),
    );
  }


  Widget boxWidget(Color color,String text){
    return Container(
      margin:const EdgeInsets.all(10),
      height:80,
      width:80,
      color:color,
      alignment:Alignment.center,
      child:Text(
        text,
        style:const TextStyle(color:Colors.white),
      )
    );

  }
}