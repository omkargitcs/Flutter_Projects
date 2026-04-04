import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(
    debugShowCheckedModeBanner:false,
      home:PortFolio(),
  ));

}

class PortFolio extends StatelessWidget{
  const PortFolio({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        title:Text("Welcome To Omkar's Arena",
        style: TextStyle(
          fontSize: 18,
          fontFamily: "times new roman",fontWeight: FontWeight.w400),),
        backgroundColor: Colors.redAccent,
      ),
      body:SingleChildScrollView(
        child:Padding(
          padding: const EdgeInsets.all(20.0),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child:Column(
                  children: [
                    CircleAvatar(
                      radius:60,
                      backgroundImage: NetworkImage("https://github.com/omkargitcs.png"),

                    ),
                    SizedBox(height:10),
                    Text(
                      "Omkar Bhalsing",
                      style:TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color:Colors.white,fontFamily: "times new roman"),
                    ),
                  ],
                ),
              ),
              Divider(height:50),

              Text(
                  "About Me",
                  style:TextStyle(fontSize:20,fontWeight:FontWeight.bold,color:Colors.red,fontFamily: "times new roman"),
              ),
              SizedBox(height:30),
              Text(
                      "I am a student currently following my Flutter Syllabus.\n\n"
                      "I have learned how to use Widgets, Rows, and Columns to build layouts.\n\n"
                      "This portfolio is my first project using the \nMVC pattern and reusable components.\n\n"
                "I am eager to expand my knowledge in areas like artificial intelligence, web development, and cybersecurity\n"
                "also working on personal projects to apply what I learn. Beyond academics, \n\nI am a proactive learner who enjoys\n"
                "collaborating with peers and engaging in challenges like coding competitions and tech events\n",
                      style:TextStyle(fontSize: 16,height:1.5,color: Colors.white,fontFamily: "times new roman"),
              ),
              SizedBox(height:40),

              Text("Skills",style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.redAccent,fontFamily: "times new roman")),
              SizedBox(height:10),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.0,
                runSpacing:4.0,
                children: [
                  _skillChip("Flutter"),
                  _skillChip("Dart"),
                  _skillChip("FireBase"),
                  _skillChip("React.js"),
                  _skillChip("Java"),
                  _skillChip("C/C++"),
                  _skillChip("PostgreSQL"),

                ],
              ),
              SizedBox(height:40),

              Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                child:Column(
                  children: [
                    TextField(
                      style:TextStyle(
                        color:Colors.white,
                        fontWeight: FontWeight.w800,
                        fontFamily:"times new roman",
                        fontSize: 18,

                ),
                      decoration: InputDecoration(
                        labelText: 'Wanna Contact Me !!',
                        border:OutlineInputBorder(),

                      ),
                    ),
                    SizedBox(height:10),
                    ElevatedButton(
                        onPressed:()=>print("Message Sent"),
                        child: Text("Submit"),
                    ),
                  ],
                ),
              ),


              Center(
                child:ElevatedButton(
                    onPressed: (){},
                    child: Text("Contact Me"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _skillChip(String label){
    return Container(
      margin:EdgeInsets.all(5),
      padding:EdgeInsets.symmetric(horizontal: 12,vertical: 8),
      decoration: BoxDecoration(
        color:Colors.red,
        borderRadius: BorderRadius.circular(20),
        border:Border.all(color:Colors.black38),
      ),
      child:Text(label,style:TextStyle(color:Colors.black,fontFamily: "times new roman",fontWeight: FontWeight.w500)),
    );
  }


}
/*
SingleChildScrollView(
scrollDirection: Axis.horizontal, // Enables horizontal scrolling
child: Row(
children: [
_skillChip("Flutter"),
_skillChip("Dart"),
_skillChip("FireBase"),
_skillChip("React.js"),
_skillChip("Java"),
_skillChip("C/C++"),
_skillChip("PostgreSQL"),
],
),
)*/


/*
Row(
mainAxisAlignment: MainAxisAlignment.center,
children: [
  _skillChip("Flutter"),
_skillChip("Dart"),
_skillChip("FireBase\n"),
_skillChip("React.js"),
_skillChip("Java"),
_skillChip("C/C++\n"),
_skillChip("PostgreSQL"),
],
*/
