// lib/listpage/listdata_state.dart
import 'package:productlist/models/listmodel.dart';

abstract class ListdataState {}

class ListdataInitial extends ListdataState {
  ListdataInitial();
}

class ListdataLoading extends ListdataState {}

class ListdataLoaded extends ListdataState {
  final List<Product> products;
  ListdataLoaded(this.products);
}

class ListdataError extends ListdataState {
  final String message;
  ListdataError(this.message);
}