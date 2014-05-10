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
	print("jogadores = [ \n");
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
		print(" name = " . $row['nome'] . ", \n");
		print(" status = " .$row['status'] .",  \n");
		print(" time =" . $row['time']."  \n");
		print("} \n");		
	}
	print("]\n");  
	mysqli_close($con);
	//echo "ola";
}
	GetJogadores();
	if(isset($_REQUEST["jogadores"])) 
	{
		GetJogadores();
	}
	
?>