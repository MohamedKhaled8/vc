// ignore_for_file: public_member_api_docs, sort_constructors_first
class VisaCard {
  final String text;
  final int id;
  final String date;
  VisaCard({
    required this.text,
    required this.id,
    required this.date,
  });
}

List<VisaCard> visaCard = [
  VisaCard(text: 'Dr Code', id: 1, date: '07/24'),
  VisaCard(text: 'Jason Green', id: 2, date: '07/25'),
];
