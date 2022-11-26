part of 'customer_reg_bloc.dart';

@immutable
abstract class CustomerRegState {}

class CustomerRegInitial extends CustomerRegState {}

class CustomerRegLoaded extends CustomerRegInitial {
  bool? isBillingChecked;

  bool? isDeliveryAddressChecked;
  bool? isLoading;
  bool? showBillingAddFields;
  bool? showDeliveryAddFields;

  CustomerRegLoaded({
    this.isBillingChecked = false,
    this.isDeliveryAddressChecked = false,
    this.isLoading = false,
    this.showBillingAddFields = false,
    this.showDeliveryAddFields = false,
  });

  CustomerRegLoaded copyWith({
    bool? isBillingChecked,
    bool? isDeliveryAddressChecked,
    bool? isLoading,
    bool? showBillingAddFields,
    bool? showDeliveryAddFields,
  }) {
    return CustomerRegLoaded(
        isDeliveryAddressChecked: isDeliveryAddressChecked ?? this.isDeliveryAddressChecked,
        isBillingChecked: isBillingChecked ?? this.isBillingChecked,
        isLoading: isLoading ?? this.isLoading,
        showBillingAddFields: showBillingAddFields ?? this.showBillingAddFields,
        showDeliveryAddFields: showDeliveryAddFields ?? this.showDeliveryAddFields);
  }
}
