class CompanyData {
  final String logo_url;
  final String company;
  final String ceo;
  final String category;
  final double hq_latitude;
  final double hq_longitude;

  CompanyData(
      {this.logo_url,
      this.company,
      this.ceo,
      this.category,
      this.hq_latitude,
      this.hq_longitude});

  factory CompanyData.fromJson(Map<String, dynamic> json) {
    return CompanyData(
      logo_url: json['logo_url'],
      company: json['company'],
      ceo: json['ceo'],
      category: json['category'],
      hq_latitude: json['hq_latitude'],
      hq_longitude: json['hq_longitude'],
    );
  }
}
