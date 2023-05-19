import 'package:dio/dio.dart';

import '../../utils/logger.dart';

/// Implementación de [Dio] para realizar peticiones HTTP
///
/// Se agregan interceptores a [Dio] para el manejo de peticiones,
/// respuestas y errores de las peticiones HTTP.
///
/// Configura el baseUrl y el Bearer token al momento de hacer la
/// petición.
///
/// Se encarga de devolver siempre una respuesta en el formato de
/// ResponseModel, modificando la peticion para que esta siempre
/// contenga el status code, status message y el cuerpo de la respuesta
/// de la siguiente manera.
///
/// ```json
/// {
///   code: 200,
///   message: "ok",
///   data: {}
/// }
/// ```
///
/// En caso de error se maneja la exepción creando un "Fake Response" con
/// el mismo formato del ResponseModel pero con el data vacío de esta forma
/// es mas facil manejar los errores en la parte de la lógica de la aplicación.
class NetworkRepository {
  late Dio _network;
  final BaseOptions _options = BaseOptions(
    connectTimeout: const Duration(milliseconds: 5000),
  );

  NetworkRepository() {
    // Creamos nuestra instancia de DIO
    _network = Dio(_options);

    /// Establecemos las propiedades a la instancia de DIO
    _network.interceptors.add(
      InterceptorsWrapper(
          onRequest: _onRequest, onResponse: _onResponse, onError: _onError),
    );
  }

  /// Manejador de peticiones HTTP
  ///
  /// Configura los encabezados de la peticion, agregando el Bearer token
  /// y tambien configura la base_url
  void _onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    List<String> endpointsApiNasa = ['/asset/', '/search'];

    // Si el path incluye alguno de los endpoints de la api de nasa cambiamos el baseUrl
    if (endpointsApiNasa.any((element) => options.path.contains(element))) {
      logger.i('images-api');
      options.baseUrl = 'https://images-api.nasa.gov';
    } else {
      options.baseUrl = 'https://images-assets.nasa.gov';
    }

    return handler.next(options);
  }

  /// Manejador de respuestas HTTP
  ///
  /// Cuando se realiza una peticion http exitosa esta funcion intercepta
  /// la respuesta y cambia su estructura para darle el formato de un
  /// ResponseModel agregando el codigo de la respuesta el mensaje y la data
  /// de la siguiente manera.
  ///
  /// ```json
  /// {
  ///   code: 200,
  ///   message: "ok",
  ///   data: object
  /// }
  /// ```
  ///
  /// De esta forma se maneja un formato de datos mas estandarizado que
  /// facilita el manejo de respuestas en la aplicación.
  void _onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    Map<String, dynamic> data = <String, dynamic>{};

    logger.i("RESPONSE: ${response.statusCode}");

    data = {
      "code": response.statusCode ?? 500,
      "message": response.statusMessage ?? "",
      "data": response.data
    };

    Response<dynamic> newResponse = response;

    newResponse.data = data;

    return handler.next(newResponse);
  }

  /// Manejador de errores HTTP
  ///
  /// Captura el error al momento de hacer una petición ya sea por una
  /// respuesta de el servidor, error en el servidor o porque no se pudo
  /// realizar la petición.
  ///
  /// En caso de que sea una respuesta del servidor con un mensaje de error
  /// la captura y le da el formato de un ResponseModel para que sea mas
  /// facil manejar el error desde la logica de la aplicación.
  ///
  /// En caso de no resivir respuesta ya sea por error en el servidor o porque
  /// no se pudo realizar la petición se crea una respuesta falsa para que la
  /// aplicación pueda continuar funcionando sin romperse.
  void _onError(DioError error, ErrorInterceptorHandler handler) async {
    // Almacenara nuestro "fake response"
    Response<dynamic> response;

    // Si el error es por una respuesta del servidor
    if (error.type == DioErrorType.badResponse) {
      logger.e("BAD RESPONSE ERROR: ${error.response!.statusCode}");

      // Si el token ya expiro se redirecciona al login
      if (error.response!.statusCode == 401) {
        // TODO: Redireccionar al login
      }

      response = Response(requestOptions: error.requestOptions, data: {
        "code": error.response!.statusCode ?? 500,
        "message":
            error.response!.statusMessage ?? "Could not establish connection"
      });
    } else {
      // Si el error es por un error en el servidor o porque no se pudo realizar la petición
      logger.e("SERVER ERROR");
      logger.v(error);
      response = Response(
          requestOptions: error.requestOptions,
          data: {"code": 500, "message": "Internal Server Error"});
    }
    logger.e(error.message);
    logger.v(error.response);

    return handler.resolve(response);
  }

  /// Retorna la instancia de [Dio] configurada
  Dio get instance => _network;
}
