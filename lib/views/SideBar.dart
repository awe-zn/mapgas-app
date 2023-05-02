import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'RegisterStation.dart';

class NavSideBar extends StatefulWidget {
  final void Function(String)? onItemTapped;
  const NavSideBar({Key? key, this.onItemTapped}) : super(key: key);

  @override
  State<NavSideBar> createState() => _NavSideBarState();
}

class _NavSideBarState extends State<NavSideBar> {
  int _selectedButtonIndex = 0;

  void onTapButton(int index){
    setState(() {
      _selectedButtonIndex = index;
    });
    widget.onItemTapped!(_getTitle(index));
  }

  String _getTitle(int index) {
    switch (index) {
      case 1:
        return 'Mapa de Postos Certificados';
      case 2:
        return 'Análises da Gasolina ';
      case 3:
        return 'Registrar posto';
      case 4:
        return 'Processo de Análise';
      case 5:
        return 'Sobre';
      default:
        return 'Regiões verdes';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff333333),
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 35),
        children: [
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.symmetric(vertical: 15,),
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Color(0xffFFFFFF),
                  size: 30,
                ),
              ),
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 18),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Pesquise aqui',
                        hintStyle: TextStyle(
                            fontSize: 18, color: Color(0x50FFFFFF)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.only(),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  )
              ),
            ],
          ),

          ElevatedButton(
              onPressed: () => onTapButton(1),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  padding: EdgeInsets.only(top: 30, bottom: 15)
              ),
              child: Row(
                children: [
                  Icon(Icons.local_gas_station, color: Colors.white,),
                  SizedBox(width: 18,),
                  const Text(
                    'Postos certificados', style: TextStyle(fontSize: 18),)
                ],
              )
          ),

          ElevatedButton(
              onPressed: () => onTapButton(0),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Row(
                children: [
                  Icon(Icons.map, color: Colors.white,),
                  SizedBox(width: 18,),
                  const Text('Regiões Verdes', style: TextStyle(fontSize: 18),)
                ],
              )
          ),

          ElevatedButton(
              onPressed: () => onTapButton(2),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'lib/assets/imgs/pizza_graphic.svg',
                  ),
                  SizedBox(width: 18,),
                  const Text(
                    'Análises da Gasolina', style: TextStyle(fontSize: 18),)
                ],
              )
          ),

          ElevatedButton(
              onPressed: () {
                onTapButton(3);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterStation())
                );
              } ,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('lib/assets/imgs/add_archive.svg'),
                  SizedBox(width: 18,),
                  const Text('Registrar posto', style: TextStyle(fontSize: 18),)
                ],
              )
          ),

          ElevatedButton(
              onPressed: () => onTapButton(4),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'lib/assets/imgs/todo_list.svg',
                  ),
                  SizedBox(width: 18,),
                  const Text(
                    'Processo de Análise', style: TextStyle(fontSize: 18),)
                ],
              )
          ),

          ElevatedButton(
              onPressed: () => onTapButton(5),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Row(
                children: [
                  Icon(Icons.info, color: Colors.white,),
                  SizedBox(width: 18,),
                  const Text('Sobre', style: TextStyle(fontSize: 18),)
                ],
              )
          ),
        ],
      ),
    );
  }
}