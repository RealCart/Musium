import 'package:shared_preferences/shared_preferences.dart';

abstract interface class SharedStorage {
  void writeString(String key, String value);
  void writeBool(String key, bool value);
  void writeInt(String key, int value);
  String? readString(String key);
  bool readBool(String key);
  int? readInt(String key);
}

class SharedStorageImpl implements SharedStorage {
  SharedStorageImpl._(this._sharedPreferences);

  static SharedStorageImpl? _instance;
  final SharedPreferences _sharedPreferences;

  static Future<SharedStorageImpl> init() async {
    if (_instance == null) {  
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      _instance = SharedStorageImpl._(prefs);
    }
    return _instance!;
  }

  @override
  bool readBool(String key) => _sharedPreferences.getBool(key) ?? false;

  @override
  int? readInt(String key) => _sharedPreferences.getInt(key);

  @override
  String? readString(String key) => _sharedPreferences.getString(key);

  @override
  void writeBool(String key, bool value) {
    _sharedPreferences.setBool(key, value);
  }

  @override
  void writeInt(String key, int value) {
    _sharedPreferences.setInt(key, value);
  }

  @override
  void writeString(String key, String value) {
    _sharedPreferences.setString(key, value);
  }

}