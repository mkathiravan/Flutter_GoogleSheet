import 'package:flutter/material.dart';
import 'package:flutter_googlesheet/controller.dart';
import 'package:flutter_googlesheet/model/feedback_form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _formKey = GlobalKey<FormState>();
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  //TextField Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();


  void _submitForm()
  {
    if(_formKey.currentState.validate())
      {
        FeedbackForm feedbackForm = FeedbackForm(
          nameController.text,
          emailController.text,
          phoneNumberController.text,
          feedbackController.text
        );

        FormController formController = FormController(
            (String response){
              print(response);
              if(response == FormController.STATUS_SUCCESS){
                  _showSnackBar("Feedback Submitted");
              }else{
                  _showSnackBar('Error Occured');
              }
            }
        );

        _showSnackBar("Submitting Feedback");
        formController.submitForm(feedbackForm);
      }


  }


  _showSnackBar(String message)
  {
    final snackbar = SnackBar(content: Text(message),);
    _scaffoldkey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 100, horizontal: 24),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: nameController,
                validator: (value){
                  if(value.isEmpty) {
                    return "Enter valid Name";
                  }
                  else
                    {
                      return null;
                    }
                },
                decoration: InputDecoration(
                  hintText: 'Name'
                ),
              ),
              TextFormField(
                controller: emailController,
                validator: (value){
                  if(value.isEmpty) {
                    return "Enter valid Email";
                  }
                  else
                  {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: 'Email'
                ),
              ),
              TextFormField(
                controller: phoneNumberController,
                validator: (value){
                  if(value.isEmpty) {
                    return "Enter valid MobileNo";
                  }
                  else
                  {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: 'MobileNo'
                ),
              ),
              TextFormField(
                controller: feedbackController,
                validator: (value){
                  if(value.isEmpty) {
                    return "Enter valid Feedback";
                  }
                  else
                  {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Feedback'
                ),
              ),
              RaisedButton(onPressed: ()
              {
                _submitForm();
              },
                child: Text('Save Data'),)
            ],
          ),
        ),
      ),
    );
  }
}

