<?php

define("TODOS_JOGADORES", 0);
define("RANKING_VOTES", 1);
function _FetchJogadores($result, $mode)
{	
	$cont = 0;
	print("jogadores = { \n");
	if($mode == 0 )
	{
		while($row = mysqli_fetch_array($result)) 
		{
			//echo $row['nome'];
			if($cont == 0)
			{
				print("{ \n");
				$cont++;
			}
			else
				print(",{ \n");
			print(" id = " . $row['id'] . ", \n");
			print(" name = " . $row['nome'] . ", \n");
			print(" status = " .$row['status'] .",  \n");
			print(" time = " . $row['time'].",  \n");
			print(" foto_path = " . $row['foto_path']."  \n");
			print("} \n");		
		}
	}
	else
	{
		while($row = mysqli_fetch_array($result)) 
		{
			//echo $row['nome'];
			if($cont == 0)
			{
				print("{ \n");
				$cont++;
			}
			else
				print(",{ \n");
			print(" nome_entra = " . $row['nome_entra'] . ", \n");
			print(" time_entra = " . $row['time_entra'] . ", \n");
			print(" camisa_entra = " .$row['camisa_entra'] .",  \n");
			print(" foto_path_entra = " . $row['foto_path_entra'].",  \n");
			print(" nome_sai = " . $row['nome_sai'] . ", \n");
			print(" time_sai = " . $row['time_sai'] . ", \n");
			print(" camisa_sai = " .$row['camisa_sai'] ."  \n");
			print(" foto_path_sai = " . $row['foto_path_sai']."  \n");
			print("} \n");		
		}
	}
	print("}\n");  
	
}

function GetJogadores()
{
	$con=mysqli_connect("127.0.0.1","root","","redesmm");
	// Check connection
	if (mysqli_connect_errno()) {
	  echo "Failed to connect to MySQL: " . mysqli_connect_error();	}

	//mysqli_query($con,"INSERT INTO substituicao (id_jog_entra, id_jog_sai, id_partida)
	//VALUES ('1', '12',1)");	
	_FetchJogadores(mysqli_query($con,"SELECT * FROM jogador "), TODOS_JOGADORES);
	
	mysqli_close($con);
	//echo "ola";
}

function SetVotes($id_jog_entra, $id_jog_sai, $time)
{

	$con=mysqli_connect("127.0.0.1","root","","redesmm");
	// Check connection
	if (mysqli_connect_errno()) {
	  echo "Failed to connect to MySQL: " . mysqli_connect_error();	
	  }

	mysqli_query($con,"INSERT INTO substituicao (id_jog_entra, id_jog_sai, id_partida)
	VALUES ($id_jog_entra, $id_jog_sai,1)");

	//mysqli_query($con,"SELECT *, Count(id) soma FROM `substituicao` WHERE id_partida = 1 group by id_jog_entra, id_jog_sai order by soma desc limit 1");	
	_FetchJogadores(mysqli_query($con,"SELECT jog.nome as 'nome_entra', jog.time as 'time_entra', jog.camisa as 'camisa_entra', jog.foto_path as 'foto_path_entra',jog2.nome as 'nome_sai', 
jog2.time as 'time_sai', jog2.camisa as 'camisa_sai', jog2.foto_path as 'foto_path_sai',Count(sub.id) soma 
FROM `substituicao` as sub inner join `jogador` as jog on jog.id = sub.id_jog_entra inner join `jogador` as jog2 on jog2.id = sub.id_jog_sai WHERE id_partida = 1 group by id_jog_entra, id_jog_sai order by soma desc limit 1"), RANKING_VOTES);	

	mysqli_close($con);
	
}
	SetVotes(1,2, "Brasil");
	
	//GetJogadores();
	if(isset($_REQUEST["jogadores"])) 
	{
		GetJogadores("");
	}
	
	if(isset($_REQUEST["voto"])) 
	{
		//voto = strtolower($_REQUEST["voto"]);
		$id_jog_entra = $_REQUEST["id_jog_entra"];
		$id_jog_sai = $_REQUEST["id_jog_entra"];
		$time = $_REQUEST["time"];
		
		SetVotes($id_jog_entra, $id_jog_sai, $time);
	}
	
?>