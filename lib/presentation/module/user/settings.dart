
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hopehub/presentation/module/user/change.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 30,)),
      bottom: PreferredSize(preferredSize: Size.fromHeight(20), child: Divider()),
      toolbarHeight: 50,
      backgroundColor: Colors.transparent,
      title: Text("Settings",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:20),),
      ),
      backgroundColor: Colors.grey[850],
      body:Column(children: [ Padding(
        padding: const EdgeInsets.only(top: 40),
        child: ListTile(leading:Icon(Icons.language,color: Colors.white,size: 25,),
        title: Text("Language",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:20)),
        trailing: Icon(Icons.arrow_drop_down,color: Colors.white,size: 65,),
        ),
      ),
      Divider(),
      ListTile(leading: Icon(Icons.brightness_4_outlined,color: Colors.white,size: 25,),
      title: Text("Light Mode",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15)),
      
      ),
      Divider(),
      ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>changes()));
        },
        leading:Icon(Icons.vpn_key_off_outlined,color: Colors.white,size: 25,),
      title: Text("Change Password",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15)
      
      ),
     
      ),
      Divider(),
      ListTile(leading:Icon(Icons.delete,color: Colors.white,size: 25,),
      title: Text("Delete Account",style: GoogleFonts.inknutAntiqua(color:Colors.white,fontSize:15)),
      
      
      ),
      Divider()
],)

    );
  }
}
   