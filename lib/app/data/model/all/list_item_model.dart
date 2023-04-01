class ListItem {
  String value;
  String name;
  ListItem({required this.value, required this.name});

  factory ListItem.fromJson(Map<String, dynamic> json) => ListItem(name: json["name"], value: json["value"]);

  Map<String, dynamic> toJson() => {"name": name, "value": value};
}
