import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tz/helpers/catch_exceptions.dart';
import 'package:tz/logic/publications/publications_provider.dart';
import 'package:tz/model/model_image_screen.dart';

part 'publications_cubit.freezed.dart';

class PublicationsCubit extends Cubit<PublicationsState> {
  PublicationsProvider provider = PublicationsProvider();
  PublicationsCubit() : super(const PublicationsState.initial());

  getPublications() async {
    try {
      emit(const PublicationsState.loading());
      final response = await provider.getPublications();
      emit(PublicationsState.loaded(response));
    } catch (e) {
      print(e);
      emit(
        PublicationsState.failed(
          CatchException.convertException(e).message.toString(),
        ),
      );
    }
  }
}

//  login(String login, String password) async {
//     try {
//       emit(const AuthState.loading());
//       final response = await authProvider.login(login, password);
//       bool success = response['success'];
//       emit(AuthState.loaded(success));
//     } catch (error) {
//       print(error);
//       emit(AuthState.failed(CatchException.convertException(error).toString()));
//     }
//   }

@freezed
class PublicationsState with _$PublicationsState {
  const factory PublicationsState.initial() = _Initial;
  const factory PublicationsState.loading() = _Loading;
  const factory PublicationsState.loaded(List<PublicationModel> publications) =
      _Loaded;
  const factory PublicationsState.failed(String error) = _Feiled;
}
