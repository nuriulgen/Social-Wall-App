class NoNetworkException implements Exception {
  @override
  String toString() {
    return "Couldn't fetch characters. Is the device online?";
  }
}