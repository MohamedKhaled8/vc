import 'package:internet_connection_checker/internet_connection_checker.dart';

bool? internet;
check_Internet() async {
  internet = await InternetConnectionChecker().hasConnection;
  print(internet);
}
