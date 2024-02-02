import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../model/PaymentResponse.dart';
import '../../../network/api_error.dart';
import '../../../repo/paymentrepo.dart';
import '../../../values/strings.dart';

part 'payment_event.dart';
part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  final PaymentRepo repository;
  PaymentBloc(this.repository) : super(PaymentState()) {
    on<PaymentInit>((event, emit) async {
      emit(state.copyWith(loading: true));
      ApiResponse apiSiteResponse = await repository.Paymentlistcall(Strings.userid);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(paymentResponse: apiSiteResponse.data,loading: false,));
      } else {
        emit(state.copyWith(loading: false, message: apiSiteResponse.message));
      }

    });

    on<PaymentDefault>((event, emit) async {
      emit(state.copyWith(loading: true,selectedindex:event.index));
      ApiResponse apiSiteResponse = await repository.DefaultPaymentcall(Strings.userid,event.id);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(message: "Success, Default payment method changed"));
        emit(state.copyWith(message: ""));
        apiSiteResponse = await repository.Paymentlistcall(Strings.userid);
        if (apiSiteResponse.data != null) {
          emit(state.copyWith(
            paymentResponse: apiSiteResponse.data, loading: false,));
        }else {
          emit(state.copyWith(loading: false, message: apiSiteResponse.message));
        }
      } else {
        emit(state.copyWith(loading: false, message: apiSiteResponse.message));
      }

    });
    on<NewPaymentDefault>((event,emit) async{
      emit(state.copyWith(defaultpay: event.defaultpay));
    });
    on<AddCard>((event,emit) async{
      emit(state.copyWith(loading: true));
      ApiResponse apiSiteResponse = await repository.AddPaymnetcall(Strings.userid,event.name,event.cvv,event.cardNo,event.defaultPayment,event.expiry);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(message:apiSiteResponse.message));
        emit(state.copyWith(message:""));
        apiSiteResponse = await repository.Paymentlistcall(Strings.userid);
        if (apiSiteResponse.data != null) {
          emit(state.copyWith(
              paymentResponse: apiSiteResponse.data, loading: false,message:"Success"));
          emit(state.copyWith(message:""));
        }else {
          emit(state.copyWith(loading: false, message: apiSiteResponse.message));
        }
      } else {
        emit(state.copyWith(loading: false, message: apiSiteResponse.message));
      }
    });
    on<DeleteCard>((event,emit) async{
      emit(state.copyWith(loading: true));
      ApiResponse apiSiteResponse = await repository.DeletePaymentcall(Strings.userid,event.id);
      if (apiSiteResponse.data != null) {
        emit(state.copyWith(message:apiSiteResponse.message));
        emit(state.copyWith(message:""));
        apiSiteResponse = await repository.Paymentlistcall(Strings.userid);
        if (apiSiteResponse.data != null) {
          emit(state.copyWith(
            paymentResponse: apiSiteResponse.data, loading: false,message:"Success"));
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
