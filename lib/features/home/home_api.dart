import 'package:algostudio/api/api1.dart';

class HomeApi{
  Future<dynamic> listImg ()async{
    var r = await Api1().apiJSONGet("get_memes");
    return r;
  }
}