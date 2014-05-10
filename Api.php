<?php

function GetJogadores()
{
	$con=mysqli_connect("127.0.0.1","root","","redesmm");
	// Check connection
	if (mysqli_connect_errno()) {
	  echo "Failed to connect to MySQL: " . mysqli_connect_error();	}

	//mysqli_query($con,"INSERT INTO substituicao (id_jog_entra, id_jog_sai, id_partida)
	//VALUES ('1', '12',1)");	
	
	$result = mysqli_query($con,"SELECT * FROM jogador");
	$cont = 0;
	print("jogadores = { \n");
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
		print(" time =" . $row['time']."  \n");
		print("} \n");		
	}
	print("}\n");  
	mysqli_close($con);
	//echo "ola";
}

function SetVotes($id_jog_entra, $id_jog_sai)
{
	$con=mysqli_connect("127.0.0.1","root","","redesmm");
	// Check connection
	if (mysqli_connect_errno()) {
	  echo "Failed to connect to MySQL: " . mysqli_connect_error();	}

	mysqli_query($con,"INSERT INTO substituicao (id_jog_entra, id_jog_sai, id_partida)
	VALUES ($id_jog_entra, $id_jog_sai,1)");
	
	mysqli_close($con);
	
}
	//SetVotes(1,2);
	//GetJogadores();
	if(isset($_REQUEST["jogadores"])) 
	{
		GetJogadores();
	}
	
	if(isset($_REQUEST["voto"])) 
	{
		//voto = strtolower($_REQUEST["voto"]);
		$id_jog_entra = $_REQUEST["id_jog_entra"];
		$id_jog_sai = $_REQUEST["id_jog_entra"];
		
		SetVotes($id_jog_entra, $id_jog_sai);
	}
	
?>