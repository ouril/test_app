enum ErrorType {
  NETWORK, DEFAULT, SYS
}

class RepositoryError {
  final ErrorType type;
  final String msg;

  RepositoryError({this.type, this.msg});

}