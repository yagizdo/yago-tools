class AppModel {
  List<Records>? records;

  AppModel({this.records});

  AppModel.fromJson(Map<String, dynamic> json) {
    if (json['records'] != null) {
      records = <Records>[];
      json['records'].forEach((v) {
        records!.add(new Records.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.records != null) {
      data['records'] = this.records!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Records {
  String? id;
  String? createdTime;
  Fields? fields;

  Records({this.id, this.createdTime, this.fields});

  Records.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdTime = json['createdTime'];
    fields =
    json['fields'] != null ? new Fields.fromJson(json['fields']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdTime'] = this.createdTime;
    if (this.fields != null) {
      data['fields'] = this.fields!.toJson();
    }
    return data;
  }
}

class Fields {
  int? rating;
  List<String>? tags;
  String? name;
  String? description;
  String? comment;
  List<String>? category;
  List<Images>? images;

  Fields(
      {this.rating,
        this.tags,
        this.name,
        this.description,
        this.comment,
        this.category,
        this.images});

  Fields.fromJson(Map<String, dynamic> json) {
    rating = json['rating'];
    tags = json['Tags'].cast<String>();
    name = json['Name'];
    description = json['description'];
    comment = json['comment'];
    category = json['category'].cast<String>();
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    data['Tags'] = this.tags;
    data['Name'] = this.name;
    data['description'] = this.description;
    data['comment'] = this.comment;
    data['category'] = this.category;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? id;
  int? width;
  int? height;
  String? url;
  String? filename;
  int? size;
  String? type;
  Thumbnails? thumbnails;

  Images(
      {this.id,
        this.width,
        this.height,
        this.url,
        this.filename,
        this.size,
        this.type,
        this.thumbnails});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    width = json['width'];
    height = json['height'];
    url = json['url'];
    filename = json['filename'];
    size = json['size'];
    type = json['type'];
    thumbnails = json['thumbnails'] != null
        ? new Thumbnails.fromJson(json['thumbnails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['width'] = this.width;
    data['height'] = this.height;
    data['url'] = this.url;
    data['filename'] = this.filename;
    data['size'] = this.size;
    data['type'] = this.type;
    if (this.thumbnails != null) {
      data['thumbnails'] = this.thumbnails!.toJson();
    }
    return data;
  }
}

class Thumbnails {
  Small? small;
  Small? large;
  Small? full;

  Thumbnails({this.small, this.large, this.full});

  Thumbnails.fromJson(Map<String, dynamic> json) {
    small = json['small'] != null ? new Small.fromJson(json['small']) : null;
    large = json['large'] != null ? new Small.fromJson(json['large']) : null;
    full = json['full'] != null ? new Small.fromJson(json['full']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.small != null) {
      data['small'] = this.small!.toJson();
    }
    if (this.large != null) {
      data['large'] = this.large!.toJson();
    }
    if (this.full != null) {
      data['full'] = this.full!.toJson();
    }
    return data;
  }
}

class Small {
  String? url;
  int? width;
  int? height;

  Small({this.url, this.width, this.height});

  Small.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    width = json['width'];
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['width'] = this.width;
    data['height'] = this.height;
    return data;
  }
}
