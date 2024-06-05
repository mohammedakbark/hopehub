
import 'package:flutter/material.dart';
import 'package:hopehub/presentation/module/user/page_home.dart';
import 'package:hopehub/presentation/module/user/payment.dart';
import 'package:hopehub/presentation/module/user/page_prescription.dart';
import 'package:hopehub/presentation/module/user/page_profilepage.dart';
import 'package:hopehub/presentation/module/user/page_schedule.dart';

class packages extends StatefulWidget {
   int indexnum=0;
   packages({super.key,required this.indexnum});

  @override
  State<packages> createState() => _packagesState();
}

class _packagesState extends State<packages> {
 final _pages=[
    
    const HomePage(),
    const schedle(),
    const Prescription(),
    const ProfilePage(),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
  body: _pages[widget.indexnum],
      bottomNavigationBar:mynav(
        index:widget.indexnum,
        onTap:(index){
        setState(() {
          widget.indexnum=index;
        });
      }
        )

    );
  }
}
Widget mynav({
  int? index,
  void Function(int)?onTap,
  selectedcolor,
})
{
  return BottomNavigationBar(
    showUnselectedLabels: true,
    currentIndex: index!,
    selectedItemColor: Colors.amber[900],
    unselectedItemColor: Colors.white,
    showSelectedLabels: true,
    onTap: onTap ,
    items: [
      BottomNavigationBarItem(icon: const Icon(Icons.home),label: "Home",
      backgroundColor: Colors.grey[850],),
       BottomNavigationBarItem(icon: const Icon(Icons.pending_actions_rounded),label: "Schedule",
      backgroundColor: Colors.grey[850],),
       BottomNavigationBarItem(icon: const Icon(Icons.contact_page_outlined),label: "Prescription",
      backgroundColor: Colors.grey[850],),
       BottomNavigationBarItem(icon: const Icon(Icons.person),label: "Profile",
      backgroundColor: Colors.grey[850],)
      
    ]);
    

}

   