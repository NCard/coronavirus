class Covid19api extends Object {
  Country global;
  List<Country> countries;

  Covid19api({this.global, this.countries});

  factory Covid19api.fromJson(Map<String, dynamic> json) {
    List<Country> countries = [];
    (json["Countries"]).forEach((element) => countries.add(Country.fromJson(element)));
    return Covid19api(
      global: Country.fromJson(json["Global"] as Map),
      countries: countries
    );
  }
}

class Country extends Object {
  String country;
  String countryCode;
  String slug;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  String date;

  Country(
      {this.country,
      this.countryCode,
      this.slug,
      this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered,
      this.date});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        country: json["Country"] as String,
        countryCode: json["CountryCode"] as String,
        slug: json["Slug"] as String,
        newConfirmed: json["NewConfirmed"] as int,
        totalConfirmed: json["TotalConfirmed"] as int,
        newDeaths: json["NewDeaths"] as int,
        totalDeaths: json["TotalDeaths"] as int,
        newRecovered: json["NewRecovered"] as int,
        totalRecovered: json["TotalRecovered"] as int,
        date: json["Date"] as String
    );
  }
}
