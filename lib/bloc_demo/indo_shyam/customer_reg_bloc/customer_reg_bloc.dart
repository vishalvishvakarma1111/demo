import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'customer_reg_event.dart';

part 'customer_reg_state.dart';

class CustomerRegBloc extends Bloc<CustomerRegEvent, CustomerRegState> {
  CustomerRegBloc() : super(CustomerRegInitial()) {
    on<CustomerInitialEvent>(_onInitEvent);
    on<BillingAddressEvent>(_onBillingAddressEvent);
    on<DeliveryAddressEvent>(_onDeliverAddressEvent);
    on<CustomerLoadingEvent>(_onLoadingEvent);
    on<CustomerHideBillingEvent>(_onHideBillingEvent);
    on<CustomerHideDeliveryEvent>(_onHideDeliveryEvent);
  }

  FutureOr<void> _onBillingAddressEvent(BillingAddressEvent event, Emitter<CustomerRegState> emit) {
    CustomerRegLoaded lastState = state as CustomerRegLoaded;
    emit(lastState.copyWith(
      isBillingChecked: !(lastState.isBillingChecked ?? false),
    ));
  }

  FutureOr<void> _onDeliverAddressEvent(DeliveryAddressEvent event, Emitter<CustomerRegState> emit) {
    CustomerRegLoaded lastState = state as CustomerRegLoaded;
    emit(lastState.copyWith(
      isDeliveryAddressChecked: !(lastState.isDeliveryAddressChecked ?? false),
    ));
  }

  FutureOr<void> _onLoadingEvent(CustomerLoadingEvent event, Emitter<CustomerRegState> emit) {
    CustomerRegLoaded lastState = state as CustomerRegLoaded;
    emit(lastState.copyWith(
      isLoading: !(lastState.isLoading ?? false),
    ));
  }

  FutureOr<void> _onInitEvent(CustomerInitialEvent event, Emitter<CustomerRegState> emit) {
    emit(CustomerRegLoaded());
  }

  FutureOr<void> _onHideBillingEvent(CustomerHideBillingEvent event, Emitter<CustomerRegState> emit) {
    CustomerRegLoaded lastState = state as CustomerRegLoaded;
    print("--print _onHideBillingEvent------ ${lastState.showBillingAddFields} ");
    emit(lastState.copyWith(
      showBillingAddFields: !(lastState.showBillingAddFields ?? false),
    ));
  }

  FutureOr<void> _onHideDeliveryEvent(CustomerHideDeliveryEvent event, Emitter<CustomerRegState> emit) {
    CustomerRegLoaded lastState = state as CustomerRegLoaded;
    print("1--print ------ ${lastState.showBillingAddFields} ");
    print("2--print ------ ${lastState.showDeliveryAddFields} ");
    emit(lastState.copyWith(
      showDeliveryAddFields: !(lastState.showDeliveryAddFields ?? false),
    ));
  }
}
