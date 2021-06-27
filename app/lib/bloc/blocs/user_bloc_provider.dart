import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../../models/classes/user.dart';

class UserBloc {
  final _repository = Repository();
  final _userGetter = PublishSubject<User>();

  Observable<User> get getUser => _userGetter.stream;

  registerUser(String username, String firstname, String lastname,
      String password, String email) async {
    print(username);
    User itemModel = await _repository.registerUser(
        username, firstname, lastname, password, email);
    _userGetter.sink.add(itemModel);
    return itemModel;
  }

  signinUser(String username, String password) async {
    // print(username);
    User itemModel = await _repository.signinUser(username, password);
    _userGetter.sink.add(itemModel);
    return itemModel;
  }

  dispose() {
    _userGetter.close();
  }
}

final bloc = UserBloc();
