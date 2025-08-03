// import 'package:socket_io_client/socket_io_client.dart' as IO;
//
// class SocketService {
//   static final SocketService _instance = SocketService._internal();
//   factory SocketService() => _instance;
//   SocketService._internal();
//
//   late IO.Socket socket;
//
//   void connect(
//     String userId, {
//     required int gradeId,
//     required int streamId,
//     required int subjectId,
//     required int orderId,
//   }) {
//     socket = IO.io(
//       'https://dev.sumgrads.com:3000/',
//       IO.OptionBuilder()
//           .setTransports(['websocket'])
//           .enableAutoConnect()
//           .setQuery({'userId': userId})
//           .build(),
//     );
//
//     socket.onConnect((_) {
//       print('✅ Connected to chat server');
//
//       // 🔥 Join the room
//       final joinData = {
//         'grade_id': gradeId,
//         'stream_id': streamId,
//         'subject_id': subjectId,
//         'order_id': orderId,
//       };
//       print('📨 Sending join_chat: $joinData');
//       socket.emit('join_chat', joinData);
//     });
//
//     socket.onDisconnect((_) => print('❌ Disconnected from chat'));
//   }
//
//   void sendMessage(Map<String, dynamic> message) {
//     print('📤 Sending message: $message');
//     socket.emit('send_message', message);
//   }
//
//   void onMessage(Function(dynamic) callback) {
//     socket.on('receive_message', (data) {
//       print('📥 Received message: $data');
//       callback(data);
//     });
//   }
//
//   void dispose() {
//     print('🧹 Disposing socket');
//     socket.dispose();
//   }
// }
