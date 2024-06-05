
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/presentation/module/user/app.dart';
import 'package:hopehub/presentation/module/user/help_cent.dart';

class helps extends StatefulWidget {
  const helps({super.key});

  @override
  State<helps> createState() => _helpsState();
}

class _helpsState extends State<helps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(leading:  IconButton(
          onPressed: (){
            Navigator.pop(context);},
             icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 25,)
             ),
             title:  Text("Help",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:18),),
             bottom: PreferredSize(preferredSize: Size.fromHeight(20), child: Divider()),
             toolbarHeight: 50,
             backgroundColor: Colors.transparent,
             ),
             backgroundColor: Colors.grey[850],
             body:Column(children: [ Padding(
        padding: const EdgeInsets.only(top: 20),
        child: ListTile(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>helpcent()));},
          leading:Icon(Icons.help,color: Colors.white,size: 30,),
        title: Text("Help Center",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15)),
        
        ),
      ),
      Divider(),
      ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>appinfo()));
        },
        leading: Icon(Icons.info,color: Colors.white,size: 30,),
      title: Text("App Info",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15)),
      
      ),
      Divider(),
      ])

      
    );
  }
}
