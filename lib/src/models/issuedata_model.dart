import 'package:bugheist/src/models/issue_model.dart';

/// Model class for the paginated data sent on requesting issues.
class IssueData {
  final int count;
  String? nextQuery;
  String? previousQuery;
  List<Issue>? issueList;

  IssueData({
    required this.count,
    this.nextQuery,
    this.previousQuery,
    this.issueList,
  });

  factory IssueData.fromJson(Map<String, dynamic> responseData) {
    return IssueData(
      count: responseData["count"] as int,
      nextQuery: responseData["next"] as String,
      previousQuery: responseData["previous"] as String,
      issueList: responseData["results"] as List<Issue>,
    );
  }
}
