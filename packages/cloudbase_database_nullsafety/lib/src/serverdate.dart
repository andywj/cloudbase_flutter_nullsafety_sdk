class ServerDate {
  num? offset;

  ServerDate([this.offset]);

  Map toJson() {
    return {
      '\$date': {'offset': offset == null ? 0 : offset}
    };
  }
}
