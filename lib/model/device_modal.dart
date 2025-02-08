class DeviceModal {
  Fan fan;
  Famm famm;
  Famm ft;

  DeviceModal({
    required this.fan,
    required this.famm,
    required this.ft,
  });
}

class Famm {
  bool fammSwitch;

  Famm({
    required this.fammSwitch,
  });
}

class Fan {
  bool fanSwitch;
  String start;
  String end;

  Fan({
    required this.fanSwitch,
    required this.start,
    required this.end,
  });
}
