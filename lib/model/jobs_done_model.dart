class JobsDoneModel {
  final int statusCode;
  final bool status;
  final int jobDone;

  JobsDoneModel({
    required this.statusCode,
    required this.status,
    required this.jobDone,
  });

  factory JobsDoneModel.fromJson(Map<String, dynamic> json) {
    return JobsDoneModel(
      statusCode: json['statusCode'] as int,
      status: json['status'] as bool,
      jobDone: json['job_done'] as int,
    );
  }
}
