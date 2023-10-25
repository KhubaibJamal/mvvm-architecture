import 'package:mvvm/data/response/status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message);

  // loading
  ApiResponse.loading() : status = Status.loading;

  // completed
  ApiResponse.completed(this.data) : status = Status.completed;

  // error
  ApiResponse.error(this.message) : status = Status.error;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data: $data";
  }
}
