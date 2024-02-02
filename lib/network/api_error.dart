import 'package:equatable/equatable.dart';

class ApiResponse<T> extends Equatable {
  Status? status;
  T? data;
  String? message;
  int? code;

  ApiResponse.loading(this.message) : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.message, this.code) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }

  @override
  List<Object?> get props => [status, data, message, code];
}

enum Status { LOADING, COMPLETED, ERROR }
