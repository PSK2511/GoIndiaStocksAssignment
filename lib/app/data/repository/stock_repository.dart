import 'package:stocks/app/data/models/dto/response.dart';
import 'package:stocks/app/data/models/request/StockRequest.dart';
import 'package:stocks/app/data/models/response/stocks_response.dart';
import 'package:stocks/app/data/values/urls.dart';
import 'package:stocks/base/base_reposiotry.dart';
import 'package:stocks/utils/helper/exception_handler.dart';

class StockRepository extends BaseRepository {
  Future<RepoResponse<StocksResponse>> receiveStocks(StockRequest query) async {
    final response =
        await controller.get(path: URLs.bulkBlockURL, query: query.toJson());

    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: StocksResponse.fromJson(response));
  }
}
