enum ErrorCode { SUCCESS, UNKNOWN }

class AppResponse<T> {
  ErrorCode errorCode;
  T payload;

  AppResponse.success({T payload}) {
    this.errorCode = null;
    this.payload = payload;
  }

  AppResponse.failure({ErrorCode errorCode, T payload}) {
    this.errorCode = errorCode;
    this.payload = payload;
  }

  bool isSuccess() {
    return errorCode == null;
  }
}
