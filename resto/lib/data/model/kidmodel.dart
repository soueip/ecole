import '../../core/constant/imageasset.dart';

class Kid {
  final String id;
  final String name;
  final double solde;
  final String image;

  Kid({
    required this.id,
    required this.name,
    required this.solde,
    required this.image,
  });
}

List<Kid> kids = [
  Kid(id: '1', name: 'Mohamed Alii', solde: 10.99, image: ImageAsset.boy1),
  Kid(id: '2', name: 'Yasmine', solde: 15.99, image: ImageAsset.boy2),
  Kid(id: '3', name: 'Yassine', solde: 22.99, image: ImageAsset.girl1),
];
