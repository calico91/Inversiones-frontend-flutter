class UrlPaths {
  const UrlPaths._();

  static const String url = 'https://inversiones.up.railway.app';
  static const String signIn = '/login';
  static const String allClients = '/cliente/consultarClientes';
  static const String loadClient = '/cliente/consultarClientePorCedula';
  static const String addClient = '/cliente';
  static const String addCredit = '/credito';
  static const String updateClient = '/cliente/actualizarCliente';
  static const String infoClientesCuotaCredito =
      '/cliente/infoClientesCuotaCredito';
  static const String infoPayFee = '/cuotaCredito/infoCuotaCreditoCliente';
  static const String getUser = '/user/getUser';
  static const String pagarCuota = '/cuotaCredito/pagarCuota';
  static const String infoCreditosActivos = '/credito/infoCreditosActivos';
  static const String infoCreditoySaldo = '/cuotaCredito/infoCreditoySaldo';
  static const String modimodificarFechaCuota = '/cuotaCredito/modificarFechaPago';
}
