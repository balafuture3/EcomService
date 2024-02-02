
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../model/ShippingResponse.dart';
import '../../../network/api_error.dart';
import '../../../repo/shippingrepo.dart';
import '../../../values/strings.dart';

part 'shipping_event.dart';
part 'shipping_state.dart';

class ShippingBloc extends Bloc<ShippingEvent, ShippingState> {
  final ShippingRepo repository;
  ShippingBloc(this.repository) : super(ShippingState()) {
    on<ShippingInit>((event, emit) async {
      emit(state.copyWith(loading: true));
      ApiResponse apiSiteResponse = await repository.Shippinglistcall(Strings.userid);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(response: apiSiteResponse.data,loading: false,));
      } else {
        emit(state.copyWith(loading: false, message: apiSiteResponse.message));
      }

    });

    on<ShippingDefault>((event, emit) async {
      emit(state.copyWith(loading: true,selectedindex:event.index));
      ApiResponse apiSiteResponse = await repository.DefaultShippingcall(Strings.userid,event.id);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(message: "Success, Default Shipping method changed"));
        emit(state.copyWith(message: ""));
        apiSiteResponse = await repository.Shippinglistcall(Strings.userid);
        if (apiSiteResponse.data != null) {
          emit(state.copyWith(
            response: apiSiteResponse.data, loading: false,));
        }else {
          emit(state.copyWith(loading: false, message: apiSiteResponse.message));
        }
      } else {
        emit(state.copyWith(loading: false, message: apiSiteResponse.message));
      }

    });
    on<NewShippingDefault>((event,emit) async{
      emit(state.copyWith(defaultpay: event.defaultpay));
    });
    on<AddAddress>((event,emit) async{
      emit(state.copyWith(loading: true));
      ApiResponse apiSiteResponse = await repository.AddShippingcall(Strings.userid,event.name,event.address,event.city,event.state,event.country,event.zipcode);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(message:apiSiteResponse.message));
        emit(state.copyWith(message:""));
        apiSiteResponse = await repository.Shippinglistcall(Strings.userid);
        if (apiSiteResponse.data != null) {
          emit(state.copyWith(
              response: apiSiteResponse.data, loading: false,message:"Success"));
          emit(state.copyWith(message:""));
        }else {
          emit(state.copyWith(loading: false, message: apiSiteResponse.message));
        }
      } else {
        emit(state.copyWith(loading: false, message: apiSiteResponse.message));
      }
    });
    on<DeleteAddress>((event,emit) async{
      emit(state.copyWith(loading: true));
      ApiResponse apiSiteResponse = await repository.DeleteShippingcall(Strings.userid,event.id);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(message:apiSiteResponse.message));
        emit(state.copyWith(message:""));
        apiSiteResponse = await repository.Shippinglistcall(Strings.userid);
        if (apiSiteResponse.data != null) {
          emit(state.copyWith(
              response: apiSiteResponse.data, loading: false,message:"Success"));
          emit(state.copyWith(message:""));
        }else {
          emit(state.copyWith(loading: false, message: apiSiteResponse.message));
        }
      } else {
        emit(state.copyWith(loading: false, message: apiSiteResponse.message));
      }
    });
  }
}
