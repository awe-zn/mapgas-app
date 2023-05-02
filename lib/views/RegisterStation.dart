import 'package:flutter/material.dart';
import 'package:mapgas/main.dart';
import 'package:mapgas/views/SideBar.dart';
import 'package:mapgas/views/utils/FooterMenu.dart';
import 'package:mapgas/views/GasolinForm.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterStation extends StatefulWidget {
  const RegisterStation({Key? key}) : super(key: key);

  @override
  State<RegisterStation> createState() => _RegisterStationState();
}

class _RegisterStationState extends State<RegisterStation> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _title = 'Regiões verdes';

  void _updateTitle(String newTitle) {
    setState(() {
      _title = newTitle;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      key: _scaffoldKey,
      drawer: NavSideBar(
        onItemTapped: (title) {
          _updateTitle(title);
          _scaffoldKey.currentState?.closeDrawer();
        },
      ),
      extendBody: true,
      appBar: top_menu(_scaffoldKey, _title),
      bottomNavigationBar: FooterMenu(
        onItemTapped: (title) {
          _scaffoldKey.currentState?.closeDrawer();
          _updateTitle(title);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp())
          );

        },
      ),
      body: RegisterGasStation(),
    );
  }
}

PreferredSizeWidget top_menu(GlobalKey<ScaffoldState> key, String title){
  final GlobalKey<ScaffoldState> scaffoldKey = key;

  return AppBar(
    title: Text(
      title,
      style: const TextStyle(
          color: Color(0xff4F4F4F),
          fontSize: 15,
          fontWeight: FontWeight.w500
      ),
    ),
    centerTitle: true,
    backgroundColor: const Color(0xffFCFCFC),
    actions: [
      IconButton(
        onPressed: (){
          scaffoldKey.currentState?.openDrawer();
        },
        icon: Icon(Icons.menu),
        color: Color(0xff000000),
      )
    ],
    leading: Padding(
      padding: const EdgeInsets.only(top: 8, left: 12),
      child: Text(
        'Map \nGás',
        style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w800,
            color: const Color(0xff4F4F4F),
            fontSize: 15.0
        ),
      ),
    ),
  );
}
