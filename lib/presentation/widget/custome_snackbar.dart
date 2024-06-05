import 'package:flutter/material.dart';

class CSnackBar{


static  showErrorSnack(context,String message){
  return ScaffoldMessenger.of(context).showSnackBar( SnackBar(
    backgroundColor: Colors.red,
          content: Text(message),
        ));
}

static  showSuccesSnack(context,String message){
  return ScaffoldMessenger.of(context).showSnackBar( SnackBar(
    backgroundColor: Colors.green,
          content: Text(message),
        ));
}


}