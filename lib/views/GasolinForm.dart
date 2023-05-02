import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mapgas/main.dart';

class RegisterGasStation extends StatefulWidget {
  const RegisterGasStation({Key? key}) : super(key: key);

  @override
  State<RegisterGasStation> createState() => _RegisterGasStationState();
}

class _RegisterGasStationState extends State<RegisterGasStation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'Selecione a localização',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff675F58)
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(3, 3),
                            )
                          ],
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(20),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                    'lib/assets/imgs/pin.svg'
                                ),
                              )


                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Sua localização será carregada automaticamente.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 10,
                              color: Color(0xffBDBDBD)
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'Nome do Posto',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff675F58)
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(.5),
                              spreadRadius: 1,
                              blurRadius: 2,
                              offset: const Offset(3, 3),
                            )
                          ],
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(20),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Essa informação não será divulgada.',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 10,
                              color: Color(0xffBDBDBD)
                          ),
                        ),
                      ),
                    ],
                  )
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        'Volume de água após o teste',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xff675F58)
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(3, 3),
                          )
                        ],
                      ),
                      child: SizedBox(
                        height: 50,
                        width: 130,
                        child: Stack(
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(20),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 11, top: 20),
                                child: Text(
                                  'ml',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xffBDBDBD),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Digite o valor do volume de água após o teste.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 10,
                            color: Color(0xffBDBDBD)
                        ),
                      ),
                    ),
                  ],
                )
              ),
              Align(
                alignment: Alignment.center,
                heightFactor: 3,
                child:  ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp())    
                    );
                  },
                  child: Text('Registrar análise'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff2D9CDB),
                    shadowColor: Colors.grey.withOpacity(0.5),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 64),
                  ),

                )
              ),
              Align(
                alignment: Alignment.center,
                child: RichText(
                  text: const  TextSpan(
                    children: [
                      TextSpan(text: 'Certificado '),
                      TextSpan(
                        text: 'MapGas',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      TextSpan(text: ' de qualidade')
                    ],
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xff9B9B9B)
                    ),
                  ),
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
