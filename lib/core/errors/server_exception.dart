class ServerException implements Exception {
  final String message;

  ServerException({this.message = 'Server Exception'});

  @override
  String toString() {
    return message;
  }
}
