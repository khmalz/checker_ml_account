import 'package:get/get.dart';

class AccountProvider extends GetConnect {
  late String apiKey = 'b9bbf6233emsh7e77e8d75d86275p13ff65jsnb5d89b94b0b0';

  Future<Map<String, dynamic>> getAccount(
      {required String id, required String server}) async {
    final response = await get(
      'https://id-game-checker.p.rapidapi.com/mobile-legends/$id/$server',
      headers: {
        'X-RapidAPI-Key': apiKey,
        'X-RapidAPI-Host': 'id-game-checker.p.rapidapi.com',
      },
    );

    if (response.body['error'] != null) {
      return response.body as Map<String, dynamic>;
    }

    var result = response.body['data'] as Map<String, dynamic>;
    return result;
  }
}
