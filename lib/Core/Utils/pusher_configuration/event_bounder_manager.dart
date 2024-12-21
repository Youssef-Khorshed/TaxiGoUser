class EventBindingManager {
  static final EventBindingManager _instance = EventBindingManager._internal();
  final Map<String, Set<String>> _boundEvents = {}; // Tracks bound events per channel

  factory EventBindingManager() => _instance;

  EventBindingManager._internal();

  bool isEventBound(String channelName, String eventName) {
    return _boundEvents[channelName]?.contains(eventName) ?? false;
  }

  void addBoundEvent(String channelName, String eventName) {
    _boundEvents.putIfAbsent(channelName, () => <String>{});
    _boundEvents[channelName]!.add(eventName);
  }

  void removeBoundEvent(String channelName, String eventName) {
    _boundEvents[channelName]?.remove(eventName);
    if (_boundEvents[channelName]?.isEmpty ?? false) {
      _boundEvents.remove(channelName);
    }
  }
}
