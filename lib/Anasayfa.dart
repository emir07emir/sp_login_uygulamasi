import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_login_uygulamasi/main.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  late String spKullaniciAdi;
  late String spSifre;

  Future<void> BilgileriOku() async{
    var sp=await SharedPreferences.getInstance();

    setState(() {
      spKullaniciAdi=sp.getString("kullaniciAdi") ?? "kullanıcı adı yok";
      spSifre=sp.getString("sifre") ?? "şifre yok";
    });

  }
  Future<void> cikisYap() async{
    var sp=await SharedPreferences.getInstance();

    sp.remove("kullaniciAdi");
    sp.remove("sifre");
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>LoginEkrani()));

  }

  @override
  void initState() {
    super.initState();
    BilgileriOku();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Login Ekranı",style: TextStyle(color: Colors.white),),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: (){
                cikisYap();
              },
            ),
          ],
        ),

        body:Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Kullanıcı Adı:$spKullaniciAdi ",style: TextStyle(fontSize: 30),),
                Text("Şifre: $spSifre",style: TextStyle(fontSize: 30),),

              ],
            ),
          ),
        )

    );
  }
}
