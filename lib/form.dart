import 'package:mobx/mobx.dart';
import 'package:flutter/material.dart';
part 'form.g.dart';


class FormStore = _FormStore with _$FormStore;


abstract class _FormStore with Store{
   @observable
   Color colorE = Colors.blue;
   Color colorP = Colors.blue;
   @observable
    ObservableList<Map<String,String>> users = ObservableList<Map<String,String>>.of([
      {
      'Email': 'Jango@gmail.com',
      'Password': 'chlp',
      },
      {
      'Email': 'Dilleros@gmail.com',
      'Password': 'mlp',
      },
      {
      'Email': 'bobeyFisher@gmail.com',
      'Password': 'ILOVECHESS',
      },

    ]);

    @observable
    bool isValid = false; 

    @observable
    String error = '';
    @observable
    String passwordError = '';
    @observable 
    String email = ''; 

    @observable
    String password = '';

    
    @action
    void setEmail(String value) => email = value;
    
    @action
    void setPassword(String value) => password = value;


    @action 
    void validateEmail(){
      if(email.isNotEmpty){
        for(int i = 0; i < users.length; ++i){
          if(users[i]['Email'] == email){
            error = "Email is valid";
            colorE = Colors.green;
            isValid = true;
            return;
          } else{
            isValid = false;
            error = "please enter the correct email";
            colorE = Colors.red;
          }
        }
         
        
        
      }
    }

    @action 
    void validatePassword(){
      if(email.isNotEmpty){
        for(int i = 0; i < users.length; ++i){
          if(users[i]['Password'] == password){
            passwordError = ' ';
            colorP = Colors.blue;
            isValid = true;
            return;
          }
          else{
            colorP = Colors.red;
            passwordError = 'Please enter the correct password';
            isValid = false;
          }
        }
        

      }
    
    }
}