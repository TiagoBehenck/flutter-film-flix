abstract class JsonSerializable<T> {
  Map<String, dynamic> toJson();
  
  static T fromJson<T extends JsonSerializable>(Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJson) {
    return fromJson(json);
  }

  Map<String, dynamic> toMap() {
    return toJson();
  }
}