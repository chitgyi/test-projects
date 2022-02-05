class Country {
  final String name;
  final String prefixPhoneCode;

  Country({required this.name, required this.prefixPhoneCode});
}

final countries = [
  Country(name: 'Singapore', prefixPhoneCode: '+65'),
  Country(name: 'Myanmar', prefixPhoneCode: '+95'),
  Country(name: 'Thailand', prefixPhoneCode: '+66'),
  Country(name: 'Japan', prefixPhoneCode: '+81'),
  Country(name: 'China', prefixPhoneCode: '+86'),
  Country(name: 'India', prefixPhoneCode: '+91'),
  Country(name: 'United States', prefixPhoneCode: '+1'),
  Country(name: 'United Kingdom', prefixPhoneCode: '+44'),
  Country(name: 'France', prefixPhoneCode: '+33'),
  Country(name: 'Italy', prefixPhoneCode: '+39'),
];
