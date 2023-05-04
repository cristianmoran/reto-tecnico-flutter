import '../utils/constants.dart';

class GetCharactersRequest {
  GetCharactersRequest({required this.hash, required this.ts});

  String apikey = publicKey;
  String hash;
  String ts;

  Map<String, dynamic> toJson() => {
        "apikey": apikey,
        "hash": hash,
        "ts": ts,
      };
}
