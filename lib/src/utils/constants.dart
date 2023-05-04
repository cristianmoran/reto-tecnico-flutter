import 'dart:convert';

import 'package:crypto/crypto.dart';

const String routeLogin = "login";
const String routeForgotPass = "forgotPass";
const String routeForgotPassSuccess = "forgotPassSuccess";
const String routeRegister = "register";
const String routeResetPass = "resetPass";
const String routeIntroduzcaPin = "introduzcaPin";
const String routeChangePass = "changePass";

const String routeHome = "home";
const String routeDetail = "detail";

//Images
const String imageLanguageEspanol = "assets/img/png/idioma_espanol.png";
const String imageLanguageAleman = "assets/img/png/idioma_aleman.png";

const String baseUrlDev = "https://gateway.marvel.com/";
const String baseUrlProd = "https://gateway.marvel.com/";

const String tabComics = "Comics";
const String tabEvents = "Events";
const String tabSeries = "Series";
const String tabStories = "Stories";

const String publicKey = "fea4ddbf370376865724c2b03db5ffef";
const String privateKey = "dcca949708ec8a3a3b97cf51cacf65cd98a314c4";

int getTimeStamp() {
  DateTime time = DateTime.now();
  return time.millisecondsSinceEpoch;
}

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}
