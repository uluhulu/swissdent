class NetworkException implements Exception {
  final String errorMessage;
  final String customErrorMessage;
  final int code;

  NetworkException({
    this.errorMessage,
    this.code,
    this.customErrorMessage,
  });

  @override
  String toString() {
    return 'NetworkException('
        'errorMessage: $errorMessage,'
        'customErrorMessage: $customErrorMessage,'
        'code: $code'
        ')';
  }
}
