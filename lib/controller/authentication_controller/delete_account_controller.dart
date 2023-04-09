
import '../../helper/caching_data.dart';
import '../../model/auth/delete_account_model.dart';
import '../../services/auth/delete_account_service.dart';

class DeleteAccountController{
  deleteAccount() async {
    final loginData = await CachingData.cachingLoginData();
    final data = await DeleteAccountService()
        .deleteAccount(token: loginData.token ?? '',);
    return DeleteAccountModel.fromJson(data);

  }
}