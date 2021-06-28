import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../../models/classes/user.dart';

class UserBloc {
  final _repository = Repository();
  final _userGetter = PublishSubject<User>();

  Observable<User> get getUser => _userGetter.stream;

  registerUser(String email, String name, String state, String district,
      String type, String password) async {
    print(email);
    User itemModel = await _repository.registerUser(
        email, name, state, district, type, password);
    _userGetter.sink.add(itemModel);
    return itemModel;
  }

  signinUser(String email, String password) async {
    // print(username);
    User itemModel = await _repository.signinUser(email, password);
    _userGetter.sink.add(itemModel);
    return itemModel;
  }

  dispose() {
    _userGetter.close();
  }
}

final bloc = UserBloc();
