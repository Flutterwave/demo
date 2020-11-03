class FLWError implements Exception {
  dynamic message = "FLW Exception";
  FLWError({this.message});

  FLWError.networkError(Map json) {
    message = json;
  }

  String _getNetworkError() {
    if (message == null) return " ";
    print("error message is $message");
    final dynamic error = message["error"];
    try {
      if(error.runtimeType == String) return error;
      return (error as Map).values.first;
    } catch (exc) {
      return exc.toString();
    }

  }

  @override
  String toString() {
    return this._getNetworkError();
  }

}