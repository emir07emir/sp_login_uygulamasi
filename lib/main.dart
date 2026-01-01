import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_login_uygulamasi/Anasayfa.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<bool> oturumkontrol() async{
    var sp=await SharedPreferences.getInstance();


      String spKullaniciAdi=sp.getString("kullaniciAdi") ?? "kullanıcı adı yok";
      String spSifre=sp.getString("sifre") ?? "şifre yok";

      if(spKullaniciAdi == "admin" && spSifre == "123"){
        return true;
      }
      else{
        return false;
      }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,secondary: Colors.deepOrange),
        useMaterial3:true,
      ),
      home: FutureBuilder<bool>(
        future: oturumkontrol(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            bool? gecisIzni = snapshot.data;
            return gecisIzni! ? Anasayfa() : LoginEkrani();
          }
          else{
            return Container();
          }
        },
      ),
    );
  }
}

class LoginEkrani extends StatefulWidget {
  @override
  State<LoginEkrani> createState() => _LoginEkraniState();
}

class _LoginEkraniState extends State<LoginEkrani> {

  var tfKullaniciAdi=TextEditingController();
  var tfSifre=TextEditingController();

  var scaffoldKey=GlobalKey<ScaffoldState>();// todo Drawer Snackbar gibi durumları dışarıdan tetikleyeceksek kullanılır.
  // todo örnek olarak burada eğer kullanıcı adı şifre yanlışsa giriş hatalı ifadesini kullanıcıya göstermek için

  Future<void> girisKontrol() async{
    var ka=tfKullaniciAdi.text;
    var sf=tfSifre.text;

    if(ka=="admin" && sf == "123"){
      var sp=await SharedPreferences.getInstance();
      sp.setString("kullaniciAdi", ka);
      sp.setString("sifre", sf);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Anasayfa()));
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Giriş Hatalı")));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text("Login Ekranı",style: TextStyle(color: Colors.white),),
        ),

        body:Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: tfKullaniciAdi,
                  decoration: InputDecoration(
                    hintText: "Kullanıcı adı",
                  ),
                ),
                TextField(
                  obscureText: true,
                  controller: tfSifre,
                  decoration: InputDecoration(
                    hintText: "Şifre",
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black45
                  ),
                  child: Text("Giriş Yap"),
                  onPressed:(){
                      girisKontrol();
                  } ,
                ),
              ],
            ),
          ),
        )

    );
  }
}
