nclProject2014
==============


API

Para pegar todos os jogadores fazer Request ["jogadores"]
Exemplo de retorno:
jogadores = { { id = 1, name = Julio Cesar, status = titular, time = Brasil } ,{ id = 2, name = Julio Cesar, status = titular, time = Brasil } ,{ id = 3, name = Jefferson, status = reserva, time = Brasil } ,{ id = 4, name = Daniel Alves, status = titular, time = Brasil } ,{ id = 5, name = Dante, status = titular, time = Brasil } ,{ id = 6, name = David Luiz, status = titular, time = Brasil } ,{ id = 7, name = Marcelo, status = titular, time = Brasil } ,{ id = 8, name = Paulinho, status = titular, time = Brasil } ,{ id = 9, name = Hernanes, status = titular, time = Brasil } ,{ id = 10, name = Oscar, status = titular, time = Brasil } ,{ id = 11, name = Ramires, status = titular, time = Brasil } ,{ id = 12, name = Neymar, status = titular, time = Brasil } ,{ id = 13, name = Fred, status = titular, time = Brasil } ,{ id = 14, name = Hulk, status = reserva, time = Brasil } ,{ id = 15, name = Bernard, status = reserva, time = Brasil } ,{ id = 16, name = Willian, status = reserva, time = Brasil } ,{ id = 17, name = Luiz Gustavo, status = reserva, time = Brasil } ,{ id = 18, name = Maicon, status = reserva, time = Brasil } ,{ id = 19, name = Maxwell, status = reserva, time = Brasil } ,{ id = 20, name = Thiago Silva, status = reserva, time = Brasil } ,{ id = 21, name = Henrique, status = reserva, time = Brasil } ,{ id = 22, name = Romero, status = titular, time = Argentina } ,{ id = 23, name = Zabaleta, status = titular, time = Argentina } ,{ id = 24, name = Basanta, status = titular, time = Argentina } ,{ id = 25, name = Fernandez, status = titular, time = Argentina } ,{ id = 26, name = Rojo, status = titular, time = Argentina } ,{ id = 27, name = Mascherano, status = titular, time = Argentina } ,{ id = 28, name = Gago, status = titular, time = Argentina } ,{ id = 29, name = di Maria, status = titular, time = Argentina } ,{ id = 30, name = Messi, status = titular, time = Argentina } ,{ id = 31, name = Aguero, status = titular, time = Argentina } ,{ id = 32, name = Higuain, status = titular, time = Argentina } ,{ id = 33, name = Biglia, status = titular, time = Argentina } ,{ id = 34, name = Palacio, status = reserva, time = Argentina } ,{ id = 35, name = Lavezzi, status = reserva, time = Argentina } ,{ id = 36, name = Rodriguez, status = reserva, time = Argentina } }


Para fazer votação request ["voto"] passando os seguintes parametros

$_REQUEST["id_jog_entra"];
$_REQUEST["id_jog_entra"];
$_REQUEST["time"];

Será retornado o mais votado seguindo o seguinte formato
jogadores = { { nome_entra = Julio Cesar, time_entra = Brasil, camisa_entra = 1, nome_sai = Julio Cesar, time_sai = Brasil, camisa_sai = 1 } }

