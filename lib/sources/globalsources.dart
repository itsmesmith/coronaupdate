class GlobalCases {
  String sId;
  String country;
  String countryCode;
  int totalCases;
  int newCases;
  int totalDeaths;
  int newDeaths;
  int activeCases;
  int totalRecovered;
  int criticalCases;
  //double casesPerOneMillion;
  //double deathsPerOneMillion;
  int tests;
  //double testsPerOneMillion;
  String continent;
  CountryInfo countryInfo;
  String updated;
  int iV;

  GlobalCases(
      {this.sId,
      this.country,
      this.countryCode,
      this.totalCases,
      this.newCases,
      this.totalDeaths,
      this.newDeaths,
      this.activeCases,
      this.totalRecovered,
      this.criticalCases,
      //this.casesPerOneMillion,
      //this.deathsPerOneMillion,
      this.tests,
      //this.testsPerOneMillion,
      this.continent,
      this.countryInfo,
      this.updated,
      this.iV});

  GlobalCases.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    country = json['country'];
    countryCode = json['countryCode'];
    totalCases = json['totalCases'];
    newCases = json['newCases'];
    totalDeaths = json['totalDeaths'];
    newDeaths = json['newDeaths'];
    activeCases = json['activeCases'];
    totalRecovered = json['totalRecovered'];
    criticalCases = json['criticalCases'];

    ///casesPerOneMillion = json['casesPerOneMillion'];
    ///deathsPerOneMillion = json['deathsPerOneMillion'];
    tests = json['tests'];

    ///testsPerOneMillion = json['testsPerOneMillion'];
    continent = json['continent'];
    countryInfo = json['countryInfo'] != null
        ? new CountryInfo.fromJson(json['countryInfo'])
        : null;
    updated = json['updated'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['country'] = this.country;
    data['countryCode'] = this.countryCode;
    data['totalCases'] = this.totalCases;
    data['newCases'] = this.newCases;
    data['totalDeaths'] = this.totalDeaths;
    data['newDeaths'] = this.newDeaths;
    data['activeCases'] = this.activeCases;
    data['totalRecovered'] = this.totalRecovered;
    data['criticalCases'] = this.criticalCases;

    ///data['casesPerOneMillion'] = this.casesPerOneMillion;
    //data['deathsPerOneMillion'] = this.deathsPerOneMillion;
    data['tests'] = this.tests;
    //data['testsPerOneMillion'] = this.testsPerOneMillion;
    data['continent'] = this.continent;
    if (this.countryInfo != null) {
      data['countryInfo'] = this.countryInfo.toJson();
    }
    data['updated'] = this.updated;
    data['__v'] = this.iV;
    return data;
  }
}

class CountryInfo {
  int iId;
  String iso2;
  String iso3;
  int lat;
  int long;
  String flag;

  CountryInfo({this.iId, this.iso2, this.iso3, this.lat, this.long, this.flag});

  CountryInfo.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    //lat = json['lat'];
    //long = json['long'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.iId;
    data['iso2'] = this.iso2;
    data['iso3'] = this.iso3;
    //data['lat'] = this.lat;
    //data['long'] = this.long;
    data['flag'] = this.flag;
    return data;
  }
}
