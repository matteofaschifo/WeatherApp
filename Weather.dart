import 'dart:html';

class Weather{

  String _locality = "";
  String _country = "";
  String _localTime = "";
  String _icon = "";
  double _temperature = 0.0;
  String _description = "";
  double _rainfall = 0.0;
  double _wind = 0.0;
  double _humidity = 0.0;


  Weather(this._locality, this._country, this._localTime, this._icon, this._temperature, this._description, this._rainfall, this._wind, this._humidity);


  Weather.fromJsonNow(Map<String, dynamic> json):
        _locality = json['location']['name'],
        _country = json['location']['country'],
        _localTime = json['location']['localtime'],
        _icon = json['current']['condition']['icon'] ?? 'https://i.ibb.co/GnPgM2d/white.png',
        _temperature = json['current']['temp_c'].toDouble(),
        _description = json['current']['condition']['text'],
        _rainfall = json['current']['precip_mm'].toDouble(),
        _wind = json['current']['wind_kph'].toDouble(),
        _humidity = json['current']['humidity'].toDouble();

  Weather.fromJson(Map<String, dynamic> json):
        _locality = json['location']['name'],
        _country = json['location']['country'],
        _localTime = json['location']['localtime'],
        _icon = json['current']['condition']['icon'] ?? 'https://i.ibb.co/GnPgM2d/white.png',
        _temperature = json['current']['temp_c'].toDouble(),
        _description = json['current']['condition']['text'],
        _rainfall = json['current']['precip_mm'].toDouble(),
        _wind = json['current']['wind_kph'].toDouble(),
        _humidity = json['current']['humidity'].toDouble();


  double get wind => _wind;

  set wind(double value) {
    _wind = value;
  }

  double get rainfall => _rainfall;

  set rainfall(double value) {
    _rainfall = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  double get temperature => _temperature;

  set temperature(double value) {
    _temperature = value;
  }

  String get icon => _icon;

  set icon(String value) {
    _icon = value;
  }

  String get localTime => _localTime;

  set localTime(String value) {
    _localTime = value;
  }

  String get country => _country;

  set country(String value) {
    _country = value;
  }

  String get locality => _locality;

  set locality(String value) {
    _locality = value;
  }

  double get humidity => _humidity;

  set humidity(double value) {
    _humidity = value;
  }

  @override
  String toString() {
    return 'Weather{_locality: $_locality, _country: $_country, _localTime: $_localTime, _icon: $_icon, _temperature: $_temperature, _description: $_description, _rainfall: $_rainfall, _wind: $_wind, _humidity: $_humidity}';
  }
}
