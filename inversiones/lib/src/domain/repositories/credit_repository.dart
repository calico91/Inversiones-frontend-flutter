import 'package:inversiones/src/domain/request/add_credit_request.dart';
import 'package:inversiones/src/domain/request/pagar_cuota_request.dart';
import 'package:inversiones/src/domain/responses/creditos/add_credit_response.dart';
import 'package:inversiones/src/domain/responses/creditos/info_creditos_activos.dart';
import 'package:inversiones/src/domain/responses/cuota_credito/pay_fee_response.dart';
import 'package:inversiones/src/domain/responses/generico_response.dart';

abstract class CreditRepository {
  const CreditRepository();

  Future<AddCreditResponse> addCredit(AddCreditRequest addCreditRequest);
  Future<PayFeeResponse> infoPayFee(int idCliente);
  Future<GenericoResponse> pagarCuota(PagarCuotaRequest pagarCuotaRequest);
  Future<InfoCreditosActivosResponse>
      infoCreditosActivos();
}
