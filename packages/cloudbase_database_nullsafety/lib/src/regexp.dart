class RegExp {
  String regexp;
  String? options;

  RegExp(this.regexp, [this.options]);

  Map<String, dynamic> toJson() {
    var json = {'\$regex': regexp};

    if (this.options != null) {
      json['\$options'] = options!;
    }

    return json;
  }
}
