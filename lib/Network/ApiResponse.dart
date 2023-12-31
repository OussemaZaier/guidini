import 'package:guidini/Network/Status.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  Map<String, dynamic>? message;

  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }

  Map<String, dynamic> toJson() {
    return {"status": status, "data": data ?? message};
  }
}
