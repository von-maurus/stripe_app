import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:stripe_app/models/credit_card_custom_model.dart';

part 'pay_event.dart';
part 'pay_state.dart';

class PayBloc extends Bloc<PayEvent, PayState> {
  PayBloc() : super(PayState()) {
    on<OnCardSelected>((event, emit) {
      emit(state.copyWith(card: event.card));
    });

    on<OnDeactivateCard>((event, emit) {
      emit(state.copyWith(active: false));
    });
  }
}
