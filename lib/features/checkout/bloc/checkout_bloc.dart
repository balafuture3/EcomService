import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../model/PlaceOrderRequest.dart';
import '../../../model/ShippingResponse.dart';
import '../../../model/PaymentResponse.dart';
import '../../../network/api_error.dart';
import '../../../repo/checkoutrepo.dart';
import '../../../values/strings.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CheckoutRepo repository;
  CheckoutBloc(this.repository) : super(CheckoutState()) {
    on<InitEvent>((event, emit) async {
      state.copyWith(loading: true);
      ApiResponse apiSiteResponse = await repository.Shippingcall(Strings.userid);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(response: apiSiteResponse.data,loading: false,));
      } else {
        emit(state.copyWith(loading: false, message: apiSiteResponse.message));
      }
      apiSiteResponse = await repository.Paymentcall(Strings.userid);
      if (apiSiteResponse.data != null)
      emit(state.copyWith(paymentResponse: apiSiteResponse.data,loading: false,));
      else
        emit(state.copyWith(loading: false, message: apiSiteResponse.message));
    }

    );
    on<PlaceOrder>((event, emit) async {
      state.copyWith(loading: true);
      ApiResponse apiSiteResponse = await repository.PlaceOrdercall(Strings.userid,event.orderTotal,event.paymentId,event.shippmentId,1,event.promoPercent,event.promoCode,event.details);
      if (apiSiteResponse.data != null) {
        apiSiteResponse = await repository.CartDeletecall(Strings.userid);
        emit(OrderSuccess());
      } else {
        emit(state.copyWith(loading: false, message: apiSiteResponse.message));
      }
    }

    );
  }
}
