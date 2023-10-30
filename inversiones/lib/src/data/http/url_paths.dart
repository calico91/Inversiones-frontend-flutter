class UrlPaths {
  const UrlPaths._();

  static const String url = 'http://10.102.1.13:8091';
  static const String signIn = '/login';
  static const String allClients = '/cliente/consultarClientes';
  static const String loadClient = '/cliente/consultarClientePorCedula';
  static const String addClient = '/cliente';
  static const String addCredit = '/credito';
  static const String updateClient = '/cliente/actualizarCliente';
  static const String infoClientesCuotaCredito =
      '/cliente/infoClientesCuotaCredito';
  static const String infoPayFee = '/credito/infoCuotaCreditoCliente';
  static const String getUser = '/user/getUser';
}
