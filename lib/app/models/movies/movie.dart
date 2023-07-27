class Movie {
  String? status;
  String? statusMessage;
  Data? data;
  Meta? meta;

  Movie({this.status, this.statusMessage, this.data, this.meta});

  Movie.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusMessage = json['status_message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    meta = json['@meta'] != null ? new Meta.fromJson(json['@meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['status_message'] = this.statusMessage;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.meta != null) {
      data['@meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data {
  MovieDetail? movie;

  Data({this.movie});

  Data.fromJson(Map<String, dynamic> json) {
    movie =
        json['movie'] != null ? new MovieDetail.fromJson(json['movie']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.movie != null) {
      data['movie'] = this.movie!.toJson();
    }
    return data;
  }
}

class MovieDetail {
  int? id;
  String? url;
  String? imdbCode;
  String? title;
  String? titleEnglish;
  String? titleLong;
  String? slug;
  int? year;
  int? rating;
  int? runtime;
  List<String>? genres;
  int? downloadCount;
  int? likeCount;
  String? descriptionIntro;
  String? descriptionFull;
  String? ytTrailerCode;
  String? language;
  String? mpaRating;
  String? backgroundImage;
  String? backgroundImageOriginal;
  String? smallCoverImage;
  String? mediumCoverImage;
  String? largeCoverImage;
  List<Torrents>? torrents;
  String? dateUploaded;
  int? dateUploadedUnix;

  MovieDetail(
      {this.id,
      this.url,
      this.imdbCode,
      this.title,
      this.titleEnglish,
      this.titleLong,
      this.slug,
      this.year,
      this.rating,
      this.runtime,
      this.genres,
      this.downloadCount,
      this.likeCount,
      this.descriptionIntro,
      this.descriptionFull,
      this.ytTrailerCode,
      this.language,
      this.mpaRating,
      this.backgroundImage,
      this.backgroundImageOriginal,
      this.smallCoverImage,
      this.mediumCoverImage,
      this.largeCoverImage,
      this.torrents,
      this.dateUploaded,
      this.dateUploadedUnix});

  MovieDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    imdbCode = json['imdb_code'];
    title = json['title'];
    titleEnglish = json['title_english'];
    titleLong = json['title_long'];
    slug = json['slug'];
    year = json['year'];
    rating = json['rating'];
    runtime = json['runtime'];
    genres = json['genres'].cast<String>();
    downloadCount = json['download_count'];
    likeCount = json['like_count'];
    descriptionIntro = json['description_intro'];
    descriptionFull = json['description_full'];
    ytTrailerCode = json['yt_trailer_code'];
    language = json['language'];
    mpaRating = json['mpa_rating'];
    backgroundImage = json['background_image'];
    backgroundImageOriginal = json['background_image_original'];
    smallCoverImage = json['small_cover_image'];
    mediumCoverImage = json['medium_cover_image'];
    largeCoverImage = json['large_cover_image'];
    if (json['torrents'] != null) {
      torrents = <Torrents>[];
      json['torrents'].forEach((v) {
        torrents!.add(new Torrents.fromJson(v));
      });
    }
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['imdb_code'] = this.imdbCode;
    data['title'] = this.title;
    data['title_english'] = this.titleEnglish;
    data['title_long'] = this.titleLong;
    data['slug'] = this.slug;
    data['year'] = this.year;
    data['rating'] = this.rating;
    data['runtime'] = this.runtime;
    data['genres'] = this.genres;
    data['download_count'] = this.downloadCount;
    data['like_count'] = this.likeCount;
    data['description_intro'] = this.descriptionIntro;
    data['description_full'] = this.descriptionFull;
    data['yt_trailer_code'] = this.ytTrailerCode;
    data['language'] = this.language;
    data['mpa_rating'] = this.mpaRating;
    data['background_image'] = this.backgroundImage;
    data['background_image_original'] = this.backgroundImageOriginal;
    data['small_cover_image'] = this.smallCoverImage;
    data['medium_cover_image'] = this.mediumCoverImage;
    data['large_cover_image'] = this.largeCoverImage;
    if (this.torrents != null) {
      data['torrents'] = this.torrents!.map((v) => v.toJson()).toList();
    }
    data['date_uploaded'] = this.dateUploaded;
    data['date_uploaded_unix'] = this.dateUploadedUnix;
    return data;
  }
}

class Torrents {
  String? url;
  String? hash;
  String? quality;
  String? type;
  String? isRepack;
  String? videoCodec;
  String? bitDepth;
  String? audioChannels;
  int? seeds;
  int? peers;
  String? size;
  int? sizeBytes;
  String? dateUploaded;
  int? dateUploadedUnix;

  Torrents(
      {this.url,
      this.hash,
      this.quality,
      this.type,
      this.isRepack,
      this.videoCodec,
      this.bitDepth,
      this.audioChannels,
      this.seeds,
      this.peers,
      this.size,
      this.sizeBytes,
      this.dateUploaded,
      this.dateUploadedUnix});

  Torrents.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    hash = json['hash'];
    quality = json['quality'];
    type = json['type'];
    isRepack = json['is_repack'];
    videoCodec = json['video_codec'];
    bitDepth = json['bit_depth'];
    audioChannels = json['audio_channels'];
    seeds = json['seeds'];
    peers = json['peers'];
    size = json['size'];
    sizeBytes = json['size_bytes'];
    dateUploaded = json['date_uploaded'];
    dateUploadedUnix = json['date_uploaded_unix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['hash'] = this.hash;
    data['quality'] = this.quality;
    data['type'] = this.type;
    data['is_repack'] = this.isRepack;
    data['video_codec'] = this.videoCodec;
    data['bit_depth'] = this.bitDepth;
    data['audio_channels'] = this.audioChannels;
    data['seeds'] = this.seeds;
    data['peers'] = this.peers;
    data['size'] = this.size;
    data['size_bytes'] = this.sizeBytes;
    data['date_uploaded'] = this.dateUploaded;
    data['date_uploaded_unix'] = this.dateUploadedUnix;
    return data;
  }
}

class Meta {
  int? serverTime;
  String? serverTimezone;
  int? apiVersion;
  String? executionTime;

  Meta(
      {this.serverTime,
      this.serverTimezone,
      this.apiVersion,
      this.executionTime});

  Meta.fromJson(Map<String, dynamic> json) {
    serverTime = json['server_time'];
    serverTimezone = json['server_timezone'];
    apiVersion = json['api_version'];
    executionTime = json['execution_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['server_time'] = this.serverTime;
    data['server_timezone'] = this.serverTimezone;
    data['api_version'] = this.apiVersion;
    data['execution_time'] = this.executionTime;
    return data;
  }
}
