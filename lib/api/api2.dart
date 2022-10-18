import 'package:get_storage/get_storage.dart';

const String CACHE_NETWORKIMG = 'network_img';
const String CACHE_STORAGEIMG = 'storage_img';
const String CACHE_TEXTIMG = "text_img";

class Api2{
  final storage = GetStorage();

  //set get network img
  Future setNetworkImg({String? networkImg}) async {
    networkImg ??= "";
    await storage.write(CACHE_NETWORKIMG, networkImg);
  }
  Future<String?> getNetworkImg() async {
    return storage.read(CACHE_NETWORKIMG);
  }

  //set get storage img
  Future setStorageImg({String? storageImg}) async {
    storageImg ??= "";
    await storage.write(CACHE_STORAGEIMG, storageImg);
  }
  Future<String?> getStorageImg() async {
    return storage.read(CACHE_STORAGEIMG);
  }

  //set get text img
  Future setTextImg({String? textImg}) async {
    textImg ??= "";
    await storage.write(CACHE_TEXTIMG, textImg);
  }
  Future<String?> getTextImg() async {
    return storage.read(CACHE_TEXTIMG);
  }
}