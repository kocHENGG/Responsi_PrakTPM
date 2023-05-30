import 'package:flutter/material.dart';
import 'package:responsi/kategori.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://static.republika.co.id/files/images/logo.png'))),
            width: 300,
            height: 300,
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Kategori(kategory: "terbaru")));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 67, 170, 156)),
                  child: Container(
                      width: 90,
                      child: Text(
                        'TERBARU',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ))),
              SizedBox(
                width: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Kategori(kategory: "daerah")));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 67, 170, 156)),
                  child: Container(
                      width: 90,
                      child: Text(
                        'DAERAH',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      )))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Kategori(kategory: "internasional")));
                },
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 67, 170, 156)),
                child: Container(
                    width: 90,
                    child: Text(
                      'INTERNASIONAL',
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
              ),
              SizedBox(
                width: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Kategori(kategory: "islam")));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 67, 170, 156)),
                  child: Container(
                      width: 90,
                      child: Text(
                        'ISLAM',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      )))
            ],
          )
        ],
      ),
    );
  }
}
