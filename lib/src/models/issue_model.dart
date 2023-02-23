import 'package:intl/intl.dart';

import './user_model.dart';

/// Model class for an issue posted on BugHeist.
class Issue {
  final int? id;
  final User? user;
  final String url;
  final String description;
  final int? label;
  final bool isVerified;
  final int? score;
  final bool isOpen;
  final String? userAgent;
  final String ocr;
  int? likes;
  int? flags;
  bool? liked;
  bool? flagged;
  final List<String>? screenshotsLink;
  final DateTime? closedDate;
  final String? githubUrl;
  final DateTime? created;
  final DateTime? lastModified;
  final int? hunt;
  final int? domain;
  final String? closedBy;

  final DateFormat dateFormatter = DateFormat('d MMMM, yyyy');

  String? get closed_date {
    return (closedDate != null)
        ? dateFormatter.format(closedDate!.toLocal())
        : null;
  }

  String get created_date => dateFormatter.format(created!.toLocal());

  String? get last_modified_date {
    return (lastModified != null)
        ? dateFormatter.format(lastModified!.toLocal())
        : null;
  }

  Issue({
    this.id,
    this.user,
    required this.url,
    required this.description,
    this.label,
    required this.isVerified,
    this.score,
    required this.isOpen,
    this.userAgent,
    required this.ocr,
    this.likes,
    this.flags,
    this.liked,
    this.flagged,
    this.screenshotsLink,
    this.closedDate,
    this.githubUrl,
    this.created,
    this.lastModified,
    this.hunt,
    this.domain,
    this.closedBy,
  });

  factory Issue.fromJson(Map<String, dynamic> responseData) {
    return Issue(
      id: responseData["id"] as int?,
      user: (responseData["user"] != null)
          ? User(
              id: responseData["user"]["id"] as int? ,
              username: responseData["user"]["username"] as String?,
            )
          : null,
      url: responseData["url"].toString() as String,
      description: responseData["description"] as String,
      label: responseData["label"] as int?,
      isVerified: responseData["verified"] as bool,
      score: responseData["score"] as int?,
      isOpen: (responseData["status"] == "open") ? true : false,
      userAgent: responseData["user_agent"] as String?,
      ocr: responseData["ocr"] as String,
      likes: responseData["upvotes"] as int?,
      flags: responseData["flags"] as int?,
      liked: responseData["upvotted"] as bool?,
      flagged: responseData["flagged"] as bool?,
      screenshotsLink: responseData["screenshots"].cast<String>() as List<String>?,
      closedDate: (responseData["closed_date"].runtimeType != Null)
          ? DateTime.parse(responseData["closed_date"] as String)
          : null,
      githubUrl: responseData["github_url"] as String?,
      created: DateTime.parse(responseData["created"] as String),
      lastModified: DateTime.parse(responseData["modified"] as String),
      hunt: responseData["hunt"] as int?,
      domain: responseData["domain"] as int?,
      closedBy: responseData["closed_by"] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': {
        'username': user!.username!.trim(),
      },
      'url': url.trim(),
      'verified': isVerified,
      'score': 0,
      'status': isOpen ? "open" : "closed",
      'description': description,
      // "hunt": null,
      // "domain": null,
      // "closed_by": null,
    };
  }
}
