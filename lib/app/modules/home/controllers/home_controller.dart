import 'package:checker_account/app/modules/home/account_model.dart';
import 'package:checker_account/app/modules/home/providers/account_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final TextEditingController server = TextEditingController();
  final TextEditingController id = TextEditingController();
  RxBool isLoading = false.obs;
  Rxn<Account> account = Rxn<Account>();
  RxBool isSubmit = false.obs;

  Rxn<String> errorServer = Rxn<String>(null);
  Rxn<String> errorId = Rxn<String>(null);

  AccountProvider accountProvider = AccountProvider();

  Future<void> getAccount() async {
    if (server.text.isEmpty || id.text.isEmpty) {
      if (server.text.isEmpty) {
        errorServer.value = "Server tidak boleh kosong";
      }

      if (id.text.isEmpty) {
        errorId.value = "ID tidak boleh kosong";
      }

      return;
    }

    try {
      isLoading.value = true;
      isSubmit.value = true;
      account.value = null;

      var response =
          await accountProvider.getAccount(id: id.text, server: server.text);

      if (response.isEmpty || response['error'] != null) {
        account.value = null;
      } else {
        var acc = Account.fromJson(response);
        account.value = acc;
      }
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading.value = false;
    }
  }

  void resetForm() {
    server.clear();
    id.clear();
  }
}
