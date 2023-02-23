import 'dart:ui';

/// Model class for a company/domain on BugHeist
class Company {
  int? id;
  final String companyName;
  String? email;
  String? url;
  String? hexcolor;
  final int openIssues;
  final int closedIssues;
  final DateTime lastModified;
  final String logoLink;
  final String topTester;

  Company(
    this.id,
    this.companyName,
    this.email,
    this.url,
    this.hexcolor,
    this.openIssues,
    this.closedIssues,
    this.lastModified,
    this.logoLink,
    this.topTester,
  );

  Color? get valueColor {
    Color? color;
    try {
      String val = "0xFF" + this.hexcolor!.toUpperCase();
      int colorInt = int.parse(val);
      color = Color(colorInt);
    } catch (e) {
      print(e);
    }
    return color;
  }

  factory Company.fromJson(Map<String, dynamic> parsedJson) {
    return Company(
      parsedJson["id"] as int? ?? null,
      parsedJson["name"] as String,
      parsedJson["email"] as String? ?? null,
      parsedJson["url"] as String? ?? null,
      parsedJson["color"] as String? ?? null,
      parsedJson["open"] as int ,
      parsedJson["closed"] as int ,
      DateTime.parse(parsedJson["modified"] as String),
      parsedJson["logo"] as String,
      parsedJson["top"] as String,
    );
  }

  void setMoreInfo(
    int id,
    String mail,
    String link,
    String color,
  ) {
    this.id = id;
    this.email = mail;
    this.url = link;
    this.hexcolor = color.substring(1);
  }
}
