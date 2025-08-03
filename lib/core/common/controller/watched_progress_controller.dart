import 'package:get/get.dart';

import '../../di/injector_container.dart';
import '../repository/local_data/local_data_source.dart';

class WatchedProgressController extends GetxController {
  final watchedProgressMap = <String, double>{}.obs;
  final lastWatchedPositionMap = <String, Duration>{}.obs;
  final updateNotifier = 0.obs;

  final _localDataSource = getIt<LocalDataSource>();

  void updateWatchedProgress({
    required String topicId,
    required Duration position,
    required Duration total,
  }) {
    if (total.inSeconds == 0) return;

    final percent = (position.inSeconds / total.inSeconds) * 100;
    _localDataSource.saveLastPlayedPosition(topicId, position);
    _localDataSource.saveVideoProgress(topicId, percent >= 95 ? 100 : percent);
    updateNotifier.value++; // 🔁 notify UI to rebuild
  }

  double getWatchedPercent(String topicId) {
    return _localDataSource.getVideoProgress(topicId);
  }

  Duration getLastWatchedPosition(String topicId) {
    return _localDataSource.getLastPlayedPosition(topicId);
  }
}
