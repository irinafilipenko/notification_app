import 'dart:convert';

MainModel dataFromJson(String str) => MainModel.fromJson(json.decode(str));

String dataToJson(MainModel data) => json.encode(data.toJson());

class MainModel {
  MainModel({
    required this.items,
  });

  late final List<Items> items;

  MainModel.fromJson(Map<String, dynamic> json) {
    items = List.from(json['items']).map((e) => Items.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() => {
        'items': List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Items {
  Items(
      {required this.id,
      required this.name,
      required this.date,
      this.time,
      this.icon,
      this.iconColor});

  late final String id;
  String? name;
  DateTime? date;
  String? time;
  String? icon;
  int? iconColor;

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'].toString();
    name = json['name'];
    date = json["date"] == null || json["date"] == ''
        ? null
        : DateTime.parse(json["date"]).toLocal();
    time = json["time"] ?? "";
    icon = json["icon"] == null || json["icon"] == '' ? '' : json["icon"];
    iconColor = json['icon_color'] == null || json['icon_color'] == 0
        ? 0
        : json['icon_color'];
  }

  @override
  String toString() {
    return 'id:$id,name:$name, time:$time,icon:$icon,icon_color:$iconColor,date:$date';
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "time": time,
        "icon": icon,
        "icon_color": iconColor,
        "date": date?.toIso8601String(),
      };
}
