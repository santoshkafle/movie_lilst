import 'dart:convert';

import 'package:equatable/equatable.dart';

class MovieModel extends Equatable {
  const MovieModel({
    this.id,
    this.url,
    this.name,
    this.type,
    this.language,
    this.genres,
    this.status,
    this.runtime,
    this.averageRuntime,
    this.premiered,
    this.ended,
    this.officialSite,
    this.schedule,
    this.rating,
    this.weight,
    this.network,
    this.webChannel,
    this.dvdCountry,
    this.externals,
    this.image,
    this.summary,
    this.updated,
    this.links,
  });

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      id: map['id'] as int?,
      url: map['url'] as String?,
      name: map['name'] as String?,
      type: map['type'] as String?,
      language: map['language'] as String?,
      genres:
          map['genres'] != null
              ? List<String>.from(map['genres'] as List)
              : null,
      status: map['status'] as String?,
      runtime: map['runtime'] as int?,
      averageRuntime: map['averageRuntime'] as int?,
      premiered: map['premiered'] as String?,
      ended: map['ended'] as String?,
      officialSite: map['officialSite'] as String?,
      schedule:
          map['schedule'] != null
              ? Schedule.fromMap(map['schedule'] as Map<String, dynamic>)
              : null,
      rating:
          map['rating'] != null
              ? Rating.fromMap(map['rating'] as Map<String, dynamic>)
              : null,
      weight: map['weight'] as int?,
      network:
          map['network'] != null
              ? Network.fromMap(map['network'] as Map<String, dynamic>)
              : null,
      webChannel: map['webChannel'] as dynamic?,
      dvdCountry: map['dvdCountry'] as dynamic?,
      externals:
          map['externals'] != null
              ? Externals.fromMap(map['externals'] as Map<String, dynamic>)
              : null,
      image:
          map['image'] != null
              ? Image.fromMap(map['image'] as Map<String, dynamic>)
              : null,
      summary: map['summary'] as String?,
      updated: map['updated'] as int?,
      links:
          map['_links'] != null
              ? Links.fromMap(map['_links'] as Map<String, dynamic>)
              : null,
    );
  }

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final int? id;
  final String? url;
  final String? name;
  final String? type;
  final String? language;
  final List<String>? genres;
  final String? status;
  final int? runtime;
  final int? averageRuntime;
  final String? premiered;
  final String? ended;
  final String? officialSite;
  final Schedule? schedule;
  final Rating? rating;
  final int? weight;
  final Network? network;
  final dynamic? webChannel;
  final dynamic? dvdCountry;
  final Externals? externals;
  final Image? image;
  final String? summary;
  final int? updated;
  final Links? links;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'url': url,
      'name': name,
      'type': type,
      'language': language,
      'genres': genres,
      'status': status,
      'runtime': runtime,
      'averageRuntime': averageRuntime,
      'premiered': premiered,
      'ended': ended,
      'officialSite': officialSite,
      'schedule': schedule?.toMap(),
      'rating': rating?.toMap(),
      'weight': weight,
      'network': network?.toMap(),
      'webChannel': webChannel,
      'dvdCountry': dvdCountry,
      'externals': externals?.toMap(),
      'image': image?.toMap(),
      'summary': summary,
      'updated': updated,
      '_links': links?.toMap(),
    };
  }

  String toJson() => json.encode(toMap());

  MovieModel copyWith({
    int? id,
    String? url,
    String? name,
    String? type,
    String? language,
    List<String>? genres,
    String? status,
    int? runtime,
    int? averageRuntime,
    String? premiered,
    String? ended,
    String? officialSite,
    Schedule? schedule,
    Rating? rating,
    int? weight,
    Network? network,
    dynamic? webChannel,
    dynamic? dvdCountry,
    Externals? externals,
    Image? image,
    String? summary,
    int? updated,
    Links? Links,
  }) {
    return MovieModel(
      id: id ?? this.id,
      url: url ?? this.url,
      name: name ?? this.name,
      type: type ?? this.type,
      language: language ?? this.language,
      genres: genres ?? this.genres,
      status: status ?? this.status,
      runtime: runtime ?? this.runtime,
      averageRuntime: averageRuntime ?? this.averageRuntime,
      premiered: premiered ?? this.premiered,
      ended: ended ?? this.ended,
      officialSite: officialSite ?? this.officialSite,
      schedule: schedule ?? this.schedule,
      rating: rating ?? this.rating,
      weight: weight ?? this.weight,
      network: network ?? this.network,
      webChannel: webChannel ?? this.webChannel,
      dvdCountry: dvdCountry ?? this.dvdCountry,
      externals: externals ?? this.externals,
      image: image ?? this.image,
      summary: summary ?? this.summary,
      updated: updated ?? this.updated,
      links: Links ?? this.links,
    );
  }

  @override
  List<Object?> get props => [
    id,
    url,
    name,
    type,
    language,
    genres,
    status,
    runtime,
    averageRuntime,
    premiered,
    ended,
    officialSite,
    schedule,
    rating,
    weight,
    network,
    webChannel,
    dvdCountry,
    externals,
    image,
    summary,
    updated,
    links,
  ];
}

class Schedule extends Equatable {
  const Schedule({this.time, this.days});

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      time: map['time'] as String?,
      days: map['days'] != null ? List<String>.from(map['days'] as List) : null,
    );
  }

  factory Schedule.fromJson(String source) =>
      Schedule.fromMap(json.decode(source) as Map<String, dynamic>);

  final String? time;
  final List<String>? days;

  Map<String, dynamic> toMap() {
    return {'time': time, 'days': days};
  }

  String toJson() => json.encode(toMap());

  Schedule copyWith({String? time, List<String>? days}) {
    return Schedule(time: time ?? this.time, days: days ?? this.days);
  }

  @override
  List<Object?> get props => [time, days];
}

class Rating extends Equatable {
  const Rating({this.average});

  factory Rating.fromMap(Map<String, dynamic> map) {
    return Rating(average: (map['average'] as num?)?.toDouble());
  }

  factory Rating.fromJson(String source) =>
      Rating.fromMap(json.decode(source) as Map<String, dynamic>);

  final double? average;

  Map<String, dynamic> toMap() {
    return {'average': average};
  }

  String toJson() => json.encode(toMap());

  Rating copyWith({double? average}) {
    return Rating(average: average ?? this.average);
  }

  @override
  List<Object?> get props => [average];
}

class Network extends Equatable {
  const Network({this.id, this.name, this.country, this.officialSite});

  factory Network.fromMap(Map<String, dynamic> map) {
    return Network(
      id: map['id'] as int?,
      name: map['name'] as String?,
      country:
          map['country'] != null
              ? Country.fromMap(map['country'] as Map<String, dynamic>)
              : null,
      officialSite: map['officialSite'] as String?,
    );
  }

  factory Network.fromJson(String source) =>
      Network.fromMap(json.decode(source) as Map<String, dynamic>);

  final int? id;
  final String? name;
  final Country? country;
  final String? officialSite;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'country': country?.toMap(),
      'officialSite': officialSite,
    };
  }

  String toJson() => json.encode(toMap());

  Network copyWith({
    int? id,
    String? name,
    Country? country,
    String? officialSite,
  }) {
    return Network(
      id: id ?? this.id,
      name: name ?? this.name,
      country: country ?? this.country,
      officialSite: officialSite ?? this.officialSite,
    );
  }

  @override
  List<Object?> get props => [id, name, country, officialSite];
}

class Country extends Equatable {
  const Country({this.name, this.code, this.timezone});

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      name: map['name'] as String?,
      code: map['code'] as String?,
      timezone: map['timezone'] as String?,
    );
  }

  factory Country.fromJson(String source) =>
      Country.fromMap(json.decode(source) as Map<String, dynamic>);

  final String? name;
  final String? code;
  final String? timezone;

  Map<String, dynamic> toMap() {
    return {'name': name, 'code': code, 'timezone': timezone};
  }

  String toJson() => json.encode(toMap());

  Country copyWith({String? name, String? code, String? timezone}) {
    return Country(
      name: name ?? this.name,
      code: code ?? this.code,
      timezone: timezone ?? this.timezone,
    );
  }

  @override
  List<Object?> get props => [name, code, timezone];
}

class Externals extends Equatable {
  const Externals({this.tvrage, this.thetvdb, this.imdb});

  factory Externals.fromMap(Map<String, dynamic> map) {
    return Externals(
      tvrage: map['tvrage'] as int?,
      thetvdb: map['thetvdb'] as int?,
      imdb: map['imdb'] as String?,
    );
  }

  factory Externals.fromJson(String source) =>
      Externals.fromMap(json.decode(source) as Map<String, dynamic>);

  final int? tvrage;
  final int? thetvdb;
  final String? imdb;

  Map<String, dynamic> toMap() {
    return {'tvrage': tvrage, 'thetvdb': thetvdb, 'imdb': imdb};
  }

  String toJson() => json.encode(toMap());

  Externals copyWith({int? tvrage, int? thetvdb, String? imdb}) {
    return Externals(
      tvrage: tvrage ?? this.tvrage,
      thetvdb: thetvdb ?? this.thetvdb,
      imdb: imdb ?? this.imdb,
    );
  }

  @override
  List<Object?> get props => [tvrage, thetvdb, imdb];
}

class Image extends Equatable {
  const Image({this.medium, this.original});

  factory Image.fromMap(Map<String, dynamic> map) {
    return Image(
      medium: map['medium'] as String?,
      original: map['original'] as String?,
    );
  }

  factory Image.fromJson(String source) =>
      Image.fromMap(json.decode(source) as Map<String, dynamic>);

  final String? medium;
  final String? original;

  Map<String, dynamic> toMap() {
    return {'medium': medium, 'original': original};
  }

  String toJson() => json.encode(toMap());

  Image copyWith({String? medium, String? original}) {
    return Image(
      medium: medium ?? this.medium,
      original: original ?? this.original,
    );
  }

  @override
  List<Object?> get props => [medium, original];
}

class Links extends Equatable {
  const Links({this.self, this.previousepisode});

  factory Links.fromMap(Map<String, dynamic> map) {
    return Links(
      self:
          map['self'] != null
              ? Self.fromMap(map['self'] as Map<String, dynamic>)
              : null,
      previousepisode:
          map['previousepisode'] != null
              ? Previousepisode.fromMap(
                map['previousepisode'] as Map<String, dynamic>,
              )
              : null,
    );
  }

  factory Links.fromJson(String source) =>
      Links.fromMap(json.decode(source) as Map<String, dynamic>);

  final Self? self;
  final Previousepisode? previousepisode;

  Map<String, dynamic> toMap() {
    return {'self': self?.toMap(), 'previousepisode': previousepisode?.toMap()};
  }

  String toJson() => json.encode(toMap());

  Links copyWith({Self? self, Previousepisode? previousepisode}) {
    return Links(
      self: self ?? this.self,
      previousepisode: previousepisode ?? this.previousepisode,
    );
  }

  @override
  List<Object?> get props => [self, previousepisode];
}

class Self extends Equatable {
  const Self({this.href});

  factory Self.fromMap(Map<String, dynamic> map) {
    return Self(href: map['href'] as String?);
  }

  factory Self.fromJson(String source) =>
      Self.fromMap(json.decode(source) as Map<String, dynamic>);

  final String? href;

  Map<String, dynamic> toMap() {
    return {'href': href};
  }

  String toJson() => json.encode(toMap());

  Self copyWith({String? href}) {
    return Self(href: href ?? this.href);
  }

  @override
  List<Object?> get props => [href];
}

class Previousepisode extends Equatable {
  const Previousepisode({this.href, this.name});

  factory Previousepisode.fromMap(Map<String, dynamic> map) {
    return Previousepisode(
      href: map['href'] as String?,
      name: map['name'] as String?,
    );
  }

  factory Previousepisode.fromJson(String source) =>
      Previousepisode.fromMap(json.decode(source) as Map<String, dynamic>);

  final String? href;
  final String? name;

  Map<String, dynamic> toMap() {
    return {'href': href, 'name': name};
  }

  String toJson() => json.encode(toMap());

  Previousepisode copyWith({String? href, String? name}) {
    return Previousepisode(href: href ?? this.href, name: name ?? this.name);
  }

  @override
  List<Object?> get props => [href, name];
}
