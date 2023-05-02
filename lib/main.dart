import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mapgas/views/SideBar.dart';
import 'package:mapgas/views/GoogleMapsBody.dart';
import 'package:mapgas/views/utils/FooterMenu.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MapGas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),

      home: const MyHomePage(title: 'Flutter Map Gas'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          _updateTitle(title);
          _scaffoldKey.currentState?.closeDrawer();
        },
      ),
      // body: RegisterGasStation(),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          GoogleMapsBody(),
          textField(),
        ],
      ),
    );
  }
}



Padding textField(){
  return Padding(
    padding: EdgeInsets.only(top: 12, left: 15, right: 15),
    child: TextFormField(
      keyboardType: TextInputType.streetAddress,
      decoration: InputDecoration(
        prefixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search),color: Color(0xffFFFFFF),),
        hintText: 'Digite a região que deseja consultar',
        contentPadding: EdgeInsets.only(top: 12),
        filled: true,
        fillColor: Color(0x460A0A0A),
        border: InputBorder.none,
        hintStyle: TextStyle(
          fontSize: 14,
          color: Color(0xffFFFFFF),
        ),
      ),
    )
  );

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