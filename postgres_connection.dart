import 'package:postgres/postgres.dart';

//Para funcionar instale o pacote flutter pub add postgres

PostgreSQLConnection? _conexaoPostGre;

String host = '172.30.22.209';
String dataBaseName = "acervo";
int port = 5432;
String userName = 'postgres';
String password = 'tads2022.';

Future<PostgreSQLConnection> getConexaoPostgre() async {
  if (_conexaoPostGre == null || _conexaoPostGre!.isClosed) {
    _conexaoPostGre = PostgreSQLConnection(host, port, dataBaseName,
        username: userName, password: password, useSSL: false);

    try {
      await _conexaoPostGre!.open();
      await _conexaoPostGre!.execute("SET client_encoding = 'UTF8';");
      await _conexaoPostGre!.execute("set timezone = 'America/Sao_Paulo';");
      await _conexaoPostGre!.execute("set standard_conforming_strings = off;");
      await _conexaoPostGre!.execute("set tcp_keepalives_idle = 30;");
      await _conexaoPostGre!.execute("set tcp_keepalives_interval = 15");
      await _conexaoPostGre!.execute("set tcp_keepalives_count = 10");
      print('Conectado');
    } catch (e) {
      print('error');
      print(e.toString());
    }
  }

  return _conexaoPostGre!;
}
