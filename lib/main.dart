import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import "form.dart";


List<int> x = [1,2,3,4,5];


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      
      initialRoute: '/',

      routes: {
        '/':(BuildContext context) => FormExample(),
        '/profile' : (BuildContext context) => Profile(),
        '/forgotpassword' : (BuildContext context) => ForgotPassword(),
        '/newuser' : (BuildContext context) => NewUser(),
      },
      
    );
  }
}

class FormExample extends StatefulWidget {
  const FormExample();

  @override 
  _FormExample createState() => _FormExample();
}

class _FormExample extends State<FormExample> {
  final FormStore store = FormStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Form Store"),),
      body:SingleChildScrollView(
        child: Form(
           child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 150,
                    child: Image.asset('assets/images/flutter.png'),
                  ),
                ),
              ),
              

              Observer(
                builder: (_) => Padding(
                padding: const EdgeInsets.only(left: 15.0,right:15.0,top:0,bottom:0),
                child: TextField(
                  onChanged: (text){
                    store.email = text;
                    store.validateEmail();
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Please enter valid email',
                    errorText: store.error,
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:BorderSide(color: store.colorE, width: 0.0),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide:BorderSide(color: store.colorE, width: 0.0),
                    ),
                    errorStyle: TextStyle(color: store.colorE, ),
                  ),
                ),
              ),
              ),
              
              
              Observer(
                builder: (_) => Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: TextField(
                  onChanged: (text) {
                    store.password = text;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Please enter secure password',
                    errorText: store.passwordError,
                    focusedErrorBorder: OutlineInputBorder(
                        borderSide:BorderSide(color: store.colorP, width: 0.0),
                    ),
                    errorBorder: OutlineInputBorder(
                        borderSide:BorderSide(color: store.colorP, width: 0.0),
                    ),
                    errorStyle: TextStyle(color: store.colorP)
                  ),
                ),
              ),
              ),
              

              TextButton(
                onPressed: (){
                         Navigator.pushNamed(context, "/forgotpassword");
                },
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color:Colors.blue,fontSize:15),
                ),
              ),


              Observer(
                builder: (_) => Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)
                ),
                child: TextButton(
                  onPressed:(){
                      store.validatePassword();
                      if(store.isValid == true){
                         Navigator.pushNamed(context, "/profile");
                      }
                     
                  },
                  child: Text(
                    'LogIn',
                    style: TextStyle(color: Colors.white,fontSize: 25),
                  ),
                ),
              ),
              ),

              
              SizedBox(
                height: 130,
              ),
              TextButton(
                onPressed: (){
                   
                         Navigator.pushNamed(context, "/newuser");
                  
                },
                child: Text(
                  'New User? Create Account',
                  style: TextStyle(color:Colors.blue,fontSize:15),
                ),
              ),
            ],
          ),
        )
       
      )

    );
  }

}



class Profile extends StatelessWidget{
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"),),
      body: Center(
        child: TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text("Exit"), 
        )
      ),
    );
  }
}


class ForgotPassword extends StatelessWidget{
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ForgotPassword"),),
      body: Center(
        child: TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text("Exit"), 
        )
      ),
    );
  }
}

class NewUser extends StatelessWidget{
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New User"),),
      body: Center(
        child: TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: Text("Exit"), 
        )
      ),
    );
  }
}