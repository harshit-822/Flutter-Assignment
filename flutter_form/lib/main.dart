import 'package:flutter/material.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _easyToUse = false;
  bool _design = false;
  bool _speed = false;
  bool _support = false;
  bool _agree = false;
  final _formKey = GlobalKey<FormState>();
  String? _selectedCategory;
  final _nameController = TextEditingController();
  final _rollNumberController = TextEditingController();
  final _feedbackController = TextEditingController();
  final List<String> _categories = ['Category 1', 'Category 2', 'Category 3','Category 4','Category 5'];
  double _rating = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.close, color: Colors.black),
        title:Text('Flutter Feedback Form',
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child:Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                  controller: _nameController,
                  maxLines: 1,
                  decoration:InputDecoration(
                    hintText: 'Name',
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 21),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,

                    ),

                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please enter your name';
                    }
                    return null;
                  }
              ),
              SizedBox(height: 20,),
              TextFormField(
                  controller: _rollNumberController,
                  maxLines: 1,
                  decoration:InputDecoration(
                      hintText: 'Roll Number',
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 21),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,

                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please enter your roll number';
                    }
                    return null;
                  }
              ),
              SizedBox(height: 20,),
              TextFormField(
                  controller: _feedbackController,
                  maxLines: 5,
                  decoration:InputDecoration(
                      hintText: 'Feedback',
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 21),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,

                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please enter your feedback';
                    }
                    return null;
                  }

              ),
              SizedBox(height: 20,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                    Text('Rate your Experience',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)
                    ),
                    Text(_rating.round().toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),)
                  ]

              ),

              SizedBox(height: 20,),
              Slider(
                value: _rating,
                min: 0,
                max: 100,
                divisions: 10,
                label: _rating.round().toString(),
                onChanged: (value) {
                  setState(() {
                    _rating = value;
                  });
                },

              ),
              DropdownButtonFormField(
                  value: _selectedCategory,
                  hint: Text('Select Category'),
                  items:_categories.map((String category){
                    return DropdownMenuItem(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (value){
                    setState(() {
                      _selectedCategory = value!;
                    });
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 21),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      )
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'Please select a category';
                    }
                    return null;
                  }
              ),
              SizedBox(height: 20),
              Text(
                'What features did you like?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              CheckboxListTile(
                title: Text('Easy to Use'),
                value: _easyToUse,
                onChanged: (value) {
                  setState(() {
                    _easyToUse = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Design'),
                value: _design,
                onChanged: (value) {
                  setState(() {
                    _design = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Speed'),
                value: _speed,
                onChanged: (value) {
                  setState(() {
                    _speed = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('Support'),
                value: _support,
                onChanged: (value) {
                  setState(() {
                    _support = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text('I agree to the terms and conditions'),
                value: _agree,
                onChanged: (value) {
                  setState(() {
                    _agree = value!;
                  });
                },
              ),

              SizedBox(height: 50,),
              ElevatedButton(
                onPressed: () {
                  if (!_agree) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('You must agree to the terms and conditions'),
                        backgroundColor: Colors.red,
                      ),
                    );
                    return;
                  }

                  if (_formKey.currentState!.validate()) {
                    _showSubmittedData(context);
                  }
                },

                child: Text('Submit',
                  style: TextStyle(color: Colors.black),),
              )


            ],
          ),
        ) ,
      ),

    );
  }
  void _showSubmittedData(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
                title: Text('Submitted data'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name: ${_nameController.text}'),
                    Text('Roll Number: ${_rollNumberController.text}'),
                    Text('Feedback: ${_feedbackController.text}'),
                    Text('Category: ${_selectedCategory}'),
                    Text('Rating: ${_rating.round()}'),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('OK'),)
                ]
            )
    );
  }
}