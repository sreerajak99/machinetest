// lib/listpage/listdata_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:productlist/listpage/listdata_state.dart';
import 'package:productlist/models/listmodel.dart';

class ListdataCubit extends Cubit<ListdataState> {
  ListdataCubit() : super(ListdataInitial()) {
    fetchProducts();
  }

  ApiGet? apiResponse;

  Future<void> fetchProducts() async {
    try {
      emit(ListdataLoading());

      final response = await http.get(
        Uri.parse('https://dummyjson.com/products'),
      );

      if (response.statusCode == 200) {
        apiResponse = apiGetFromJson(response.body);

        emit(ListdataLoaded(apiResponse?.products ?? []));
      } else {
        emit(ListdataError('Failed to load products'));
      }
    } catch (e) {
      emit(ListdataError(e.toString()));
    }
  }

  refresh() {
    fetchProducts();
  }
}
