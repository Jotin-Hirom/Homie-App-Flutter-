// ignore: duplicate_ignore
// ignore_for_file: file_names, duplicate_ignore
// ignore: file_names
// class UserModel {
// 	bool? connection;
// 	Sensors? sensors;
// 	Devices? devices;

// 	UserModel({this.connection, this.sensors, this.devices});

// 	UserModel.fromJson(Map<String, dynamic> json) {
// 		connection = json['Connection'];
// 		sensors = json['Sensors'] != null ? new Sensors.fromJson(json['Sensors']) : null;
// 		devices = json['Devices'] != null ? new Devices.fromJson(json['Devices']) : null;
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['Connection'] = this.connection;
// 		if (this.sensors != null) {
//       data['Sensors'] = this.sensors!.toJson();
//     }
// 		if (this.devices != null) {
//       data['Devices'] = this.devices!.toJson();
//     }
// 		return data;
// 	}
// }

// class Sensors {
// 	DHT11? dHT11;
// 	LDR? lDR;
// 	Ultrasonic? ultrasonic;

// 	Sensors({this.dHT11, this.lDR, this.ultrasonic});

// 	Sensors.fromJson(Map<String, dynamic> json) {
// 		dHT11 = json['DHT11'] != null ? new DHT11.fromJson(json['DHT11']) : null;
// 		lDR = json['LDR'] != null ? new LDR.fromJson(json['LDR']) : null;
// 		ultrasonic = json['Ultrasonic'] != null ? new Ultrasonic.fromJson(json['Ultrasonic']) : null;
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		if (this.dHT11 != null) {
//       data['DHT11'] = this.dHT11!.toJson();
//     }
// 		if (this.lDR != null) {
//       data['LDR'] = this.lDR!.toJson();
//     }
// 		if (this.ultrasonic != null) {
//       data['Ultrasonic'] = this.ultrasonic!.toJson();
//     }
// 		return data;
// 	}
// }

// class DHT11 {
// 	double? heatIndex;
// 	double? temperature;
// 	int? humidity;

// 	DHT11({this.heatIndex, this.temperature, this.humidity});

// 	DHT11.fromJson(Map<String, dynamic> json) {
// 		heatIndex = json['Heat index'];
// 		temperature = json['Temperature'];
// 		humidity = json['Humidity'];
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['Heat index'] = this.heatIndex;
// 		data['Temperature'] = this.temperature;
// 		data['Humidity'] = this.humidity;
// 		return data;
// 	}
// }

// class LDR {
// 	int? value;

// 	LDR({this.value});

// 	LDR.fromJson(Map<String, dynamic> json) {
// 		value = json['value'];
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['value'] = this.value;
// 		return data;
// 	}
// }

// class Ultrasonic {
// 	int? distance;

// 	Ultrasonic({this.distance});

// 	Ultrasonic.fromJson(Map<String, dynamic> json) {
// 		distance = json['distance'];
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['distance'] = this.distance;
// 		return data;
// 	}
// }

// class Devices {
// 	Fan? fan;
// 	Fan? lamp;

// 	Devices({this.fan, this.lamp});

// 	Devices.fromJson(Map<String, dynamic> json) {
// 		fan = json['fan'] != null ? new Fan.fromJson(json['fan']) : null;
// 		lamp = json['lamp'] != null ? new Fan.fromJson(json['lamp']) : null;
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		if (this.fan != null) {
//       data['fan'] = this.fan!.toJson();
//     }
// 		if (this.lamp != null) {
//       data['lamp'] = this.lamp!.toJson();
//     }
// 		return data;
// 	}
// }

// class Fan {
// 	int? counting;
// 	bool? isSet;
// 	int? start;
// 	int? end;
// 	bool? isCount;
// 	bool? switch;

// 	Fan({this.counting, this.isSet, this.start, this.end, this.isCount, this.switch});

// 	Fan.fromJson(Map<String, dynamic> json) {
// 		counting = json['counting'];
// 		isSet = json['isSet'];
// 		start = json['start'];
// 		end = json['end'];
// 		isCount = json['isCount'];
// 		switch = json['switch'];
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		data['counting'] = this.counting;
// 		data['isSet'] = this.isSet;
// 		data['start'] = this.start;
// 		data['end'] = this.end;
// 		data['isCount'] = this.isCount;
// 		data['switch'] = this.switch;
// 		return data;
// 	}
// }

// class Devices {
// 	Fan? fan;
// 	Fan? lamp;

// 	Devices({this.fan, this.lamp});

// 	Devices.fromJson(Map<String, dynamic> json) {
// 		fan = json['fan'] != null ? new Fan.fromJson(json['fan']) : null;
// 		lamp = json['lamp'] != null ? new Fan.fromJson(json['lamp']) : null;
// 	}

// 	Map<String, dynamic> toJson() {
// 		final Map<String, dynamic> data = new Map<String, dynamic>();
// 		if (this.fan != null) {
//       data['fan'] = this.fan!.toJson();
//     }
// 		if (this.lamp != null) {
//       data['lamp'] = this.lamp!.toJson();
//     }
// 		return data;
// 	}
// }