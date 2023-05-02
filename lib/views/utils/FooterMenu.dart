import 'package:flutter/material.dart';

class FooterMenu extends StatefulWidget {
  final void Function(String)? onItemTapped;
  const FooterMenu({Key? key, this.onItemTapped}) : super(key: key);

  @override
  State<FooterMenu> createState() => _FooterMenuState();
}

class _FooterMenuState extends State<FooterMenu> {
  int _selectedButtonIndex = 0;

  void onTapButton(int index){
    setState(() {
      _selectedButtonIndex = index;
    });
    widget.onItemTapped!(_getTitle(index));
  }

  String _getTitle(int index) {
    switch (index) {
      case 2:
        return 'Mapa de Postos Certificados';
      case 3:
        return 'Sobre ';
      default:
        return 'Regiões verdes';
    }
  }


  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xffFCFCFC),
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary, ),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed:() => {
                  onTapButton(0)
                },
                icon: Icon(Icons.home),
                color: _selectedButtonIndex == 0 ? Color(0xff656565):Color(0xffBDBDBD),
              ),
              IconButton(
                onPressed: () => onTapButton(1),
                icon: Icon(Icons.map),
                color: _selectedButtonIndex == 1 ? Color(0xff656565):Color(0xffBDBDBD),
              ),
              IconButton(
                onPressed: () => onTapButton(2),
                icon: Icon(Icons.local_gas_station),
                color: _selectedButtonIndex == 2 ? Color(0xff656565):Color(0xffBDBDBD),
              ),
              IconButton(
                onPressed: () => onTapButton(3),
                icon: Icon(Icons.info),
                color: _selectedButtonIndex == 3 ? Color(0xff656565):Color(0xffBDBDBD),
              ),
            ],
          ),
        ),
      ),
    );;
  }

}
