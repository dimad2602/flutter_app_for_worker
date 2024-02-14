import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  late WebSocketChannel _channel;

  void connect() {
    _channel = WebSocketChannel.connect(
      Uri.parse('wss://socketsbay.com/wss/v2/1/demo/'),
    );
  }

  void sendMessage(String message) {
    _channel.sink.add(message);
  }

  Stream<dynamic> get stream => _channel.stream;

  void close() {
    _channel.sink.close();
  }
}
