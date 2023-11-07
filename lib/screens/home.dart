import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


 String carta = "https://www.deckofcardsapi.com/static/img/back.png";
 String? codCarta;
 int pontos = 0;


  _drawCard() async {
    String url = "https://www.deckofcardsapi.com/api/deck/mvxknn3ro4x5/draw/?count=1";

    http.Response response;

    response = await http.get(Uri.parse(url));

    final Map<String, dynamic> retorno = json.decode(response.body);

    String novaCarta = retorno["cards"][0]["image"];
    String novoNaipe = retorno["cards"][0]["code"];

    switch (novoNaipe)
    {
      case 'AS':
        pontos +=1;
        break;
      case '2S':
        pontos +=2;
        break;
      case '3S':
        pontos +=3;
        break;
      case '4S':
        pontos +=4;
        break;
      case '5S':
        pontos +=5;
        break;
      case '6S':
        pontos +=6;
        break;
      case '7S':
        pontos +=7;
        break;
      case '8S':
        pontos +=8;
        break;
      case '9S':
        pontos +=9;
        break;
      case '0S':
        pontos +=10;
        break;
      case 'JS':
        pontos +=10;
        break;
      case 'QS':
        pontos +=10;
        break;
      case 'KS':
        pontos +=10;
        break;
      case 'AD':
        pontos +=1;
        break;
      case '2D':
        pontos +=2;
        break;
      case '3D':
        pontos +=3;
        break;
      case '4D':
        pontos +=4;
        break;
      case '5D':
        pontos +=5;
        break;
      case '6D':
        pontos +=6;
        break;
      case '7D':
        pontos +=7;
        break;
      case '8D':
        pontos +=8;
        break;
      case '9D':
        pontos +=9;
        break;
      case '0D':
        pontos +=10;
        break;
      case 'JD':
        pontos +=10;
        break;
      case 'QD':
        pontos +=10;
        break;
      case 'KD':
        pontos +=10;
        break;
      case 'AC':
        pontos +=1;
        break;
      case '2C':
        pontos +=2;
        break;
      case '3C':
        pontos +=3;
        break;
      case '4C':
        pontos +=4;
        break;
      case '5C':
        pontos +=5;
        break;
      case '6C':
        pontos +=6;
        break;
      case '7C':
        pontos +=7;
        break;
      case '8C':
        pontos +=8;
        break;
      case '9C':
        pontos +=9;
        break;
      case '0C':
        pontos +=10;
        break;
      case 'JC':
        pontos +=10;
        break;
      case 'QC':
        pontos +=10;
        break;
      case 'KC':
        pontos +=10;
        break;
      case 'AH':
        pontos +=1;
        break;
      case '2H':
        pontos +=2;
        break;
      case '3H':
        pontos +=3;
        break;
      case '4H':
        pontos +=4;
        break;
      case '5H':
        pontos +=5;
        break;
      case '6H':
        pontos +=6;
        break;
      case '7H':
        pontos +=7;
        break;
      case '8H':
        pontos +=8;
        break;
      case '9H':
        pontos +=9;
        break;
      case '0H':
        pontos +=10;
        break;
      case 'JH':
        pontos +=10;
        break;
      case 'QH':
        pontos +=10;
        break;
      case 'KH':
        pontos +=10;
        break;
    }

    setState(() {
      carta = "$novaCarta";
      codCarta = novoNaipe;
    });
  }

  _shuffle() async {
    String url = "https://www.deckofcardsapi.com/api/deck/mvxknn3ro4x5/shuffle/?deck_count=1";

    http.Response response;

    response = await http.get(Uri.parse(url));

    final Map<String, dynamic> retorno = json.decode(response.body);

    //otimizar

  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BLACKJACK GAME",
            style: GoogleFonts.kanit(
              textStyle: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold ,
                color: Colors.blue[900],
              ),)
        ),
          centerTitle: true,
          backgroundColor: Colors.yellowAccent
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
           children: <Widget>[
              Image.network(
                  "$carta"
              ),
              Text(
                  "Código da carta: $codCarta",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kanit(
                    textStyle: TextStyle(
                      fontSize: 25,
                      color: Colors.blue[900],
                    ),)
              ),
             Text(
                 "Pontos: $pontos",
                 textAlign: TextAlign.center,
                 style: GoogleFonts.kanit(
                   textStyle: TextStyle(
                     fontSize: 25,
                     color: Colors.blue[900],
                   ),)
             ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: SizedBox(
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: _drawCard,
                    child: Text('Draw' ,
                        style: GoogleFonts.kanit(
                          textStyle: TextStyle(
                            fontSize: 25,
                            color: Colors.blue[900],
                          ),
                        )),
                  ),
                ),

              ),
             Padding(
               padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
               child: SizedBox(
                 height: 50.0,
                 child: ElevatedButton(
                   onPressed: _shuffle,
                   child: Text('Embaralhar' ,
                       style: GoogleFonts.kanit(
                         textStyle: TextStyle(
                           fontSize: 25,
                           color: Colors.blue[900],
                         ),
                       )),
                 ),
               ),

             )
            ],
        ),
      ),
    );
  }
}