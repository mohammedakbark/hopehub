import 'package:flutter/material.dart';
import 'package:hopehub/presentation/module/doctor/drhome.dart';
import 'package:hopehub/presentation/module/doctor/drreport.dart';


class Packagedr extends StatefulWidget {
  int indexnum=0;
   Packagedr({super.key,required this.indexnum});

  @override
  State<Packagedr> createState() => _PackagedrState();
}

class _PackagedrState extends State<Packagedr> {
  final _pages=[
    // const logo(),
    // project(),
  const drhome(),
  const drreport(),
  const drhome()
    
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
     backgroundColor: Colors.grey[850]),
       BottomNavigationBarItem(icon: const Icon(Icons.contact_page_outlined),label: "Report",
       backgroundColor: Colors.grey[850]),
      
       BottomNavigationBarItem(icon: const Icon(Icons.person),label: "Profile",
       backgroundColor: Colors.grey[850]  )
      
    ]);
    

}