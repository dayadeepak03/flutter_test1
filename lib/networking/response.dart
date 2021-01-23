class DataResponse<T> {
  T companies;
  String error;
  String message;
  String data;
  int length;

  DataResponse(
      {this.companies, this.error, this.message, this.length, this.data});
}
