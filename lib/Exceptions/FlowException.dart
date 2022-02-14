class FlowException extends Error {
  FlowException(this.message) {
    print('Error: $message');
  }

  final String message;
}
