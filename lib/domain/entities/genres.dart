import 'package:equatable/equatable.dart';

class Genres extends Equatable {
  final double id;
  const Genres({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
