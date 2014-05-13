<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="ex1" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">

<head>
	
	<regionBase>
		<region id="rg_video" left="0" top="0" width="100%" height="100%" zIndex="1">
			<region id="rg_button" left="5%" top="95%" width="186px" height="93px" zIndex="2"/>
		</region>
		<region id="rg_vote" left="0" top="0" width="100%" height="100%" zIndex="1">
				<region id="rg_danielAlves" left="5%" top="5%" width="90px" height="106px" zIndex="3"/>
				<region id="rg_doni" left="5%" top="95%" width="90px" height="106px" zIndex="3"/>
				<region id="rg_elano" left="5%" top="95%" width="90px" height="106px" zIndex="3"/>
				<region id="rg_felipeMelo" left="5%" top="95%" width="90px" height="106px" zIndex="3"/>
				<region id="rg_gilberto" left="5%" top="95%" width="90px" height="106px" zIndex="3"/>
				<region id="rg_gilbertoSilva" left="5%" top="95%" width="90px" height="106px" zIndex="3"/>
				<region id="rg_gomes" left="5%" top="95%" width="90px" height="106px" zIndex="3"/>
				<region id="rg_grafite" left="5%" top="95%" width="90px" height="106px" zIndex="3"/>
				<region id="rg_josue" left="5%" top="95%" width="90px" height="106px" zIndex="3"/>
				<region id="rg_juan" left="5%" top="95%" width="90px" height="106px" zIndex="3"/>
				<region id="rg_julioBaptista" left="5%" top="95%" width="90px" height="106px" zIndex="3"/>
				<region id="rg_julioCesar" left="5%" top="95%" width="90px" height="106px" zIndex="3"/>
				<region id="rg_kaka" left="5%" top="95%" width="90px" height="106px" zIndex="3"/>
				<region id="rg_kleberson" left="5%" top="95%" width="90px" height="106px" zIndex="3"/>
				<region id="rg_lucio" left="5%" top="95%" width="90px" height="106px" zIndex="3"/>
				<region id="rg_luisao" left="5%" top="95%" width="90px" height="106px" zIndex="3"/>
				<region id="rg_luisFabiano" left="5%" top="95%" width="90px" height="106px" zIndex="3"/>
				<region id="rg_maicon" left="5%" top="95%" width="90px" height="106px" zIndex="3"/>
				<region id="rg_michelBastos" left="5%" top="95%" width="90px" height="106px" zIndex="3"/>
				<region id="rg_nilmar" left="5%" top="95%" width="90px" height="106px" zIndex="3"/>
				<region id="rg_ramires" left="5%" top="95%" width="90px" height="106px" zIndex="3"/>
				<region id="rg_robinho" left="5%" top="95%" width="90px" height="106px" zIndex="3"/>
				<region id="rg_thiagoSilva" left="5%" top="95%" width="90px" height="106px" zIndex="3"/>
		</region>
	</regionBase>
	
	<descriptorBase>
		<descriptor id="dp_video" region="rg_video"/>
		<descriptor id="dp_button" region="rg_button" focusIndex="0"/>
		<descriptor id="dp_vote" region="rg_vote"/>
		<descriptor id="dp_danielAlves" region="rg_danielAlves" focusIndex="0"/>
		<descriptor id="dp_doni" region="rg_doni"/>
		<descriptor id="dp_elano" region="rg_elano"/>
		<descriptor id="dp_felipeMelo" region="rg_felipeMelo"/>
		<descriptor id="dp_gilberto" region="rg_gilberto"/>
		<descriptor id="dp_gilbertoSilva" region="rg_gilbertoSilva"/>
		<descriptor id="dp_gomes" region="rg_gomes"/>
		<descriptor id="dp_grafite" region="rg_grafite"/>
		<descriptor id="dp_josue" region="rg_josue"/>
		<descriptor id="dp_juan" region="rg_juan"/>
		<descriptor id="dp_julioBaptista" region="rg_julioBaptista"/>
		<descriptor id="dp_julioCesar" region="rg_julioCesar"/>
		<descriptor id="dp_kaka" region="rg_kaka"/>
		<descriptor id="dp_kleberson" region="rg_kleberson"/>
		<descriptor id="dp_lucio" region="rg_lucio"/>
		<descriptor id="dp_luisao" region="rg_luisao"/>
		<descriptor id="dp_luisFabiano" region="rg_luisFabiano"/>
		<descriptor id="dp_maicon" region="rg_maicon"/>
		<descriptor id="dp_michelBastos" region="rg_michelBastos"/>
		<descriptor id="dp_nilmar" region="rg_nilmar"/>
		<descriptor id="dp_ramires" region="rg_ramires"/>
		<descriptor id="dp_robinho" region="rg_robinho"/>
		<descriptor id="dp_thiagoSilva" region="rg_thiagoSilva"/>
	</descriptorBase>
	
	<connectorBase>
		<causalConnector id="onBeginStart">
			<simpleCondition role="onBegin"/>
			<simpleAction role="start"/>
		</causalConnector>
		
		<causalConnector id="onBeginDelayStart">
			<simpleCondition role="onBegin"/>
			<simpleAction role="start"/>
		</causalConnector>
		

		<causalConnector id="onBeginStartN">
			<simpleCondition role="onBegin" />
			<simpleAction role="start" max="unbounded" qualifier="par" />
		</causalConnector>

		<causalConnector id="onEndStop">
			<simpleCondition role="onEnd"/>
			<simpleAction role="stop"/>
		</causalConnector>
		
		<causalConnector id="onEndStart">
			<simpleCondition role="onEnd"/>
			<simpleAction role="start"/>
		</causalConnector>
		
		<causalConnector id="onKeySelectionStop">
			<connectorParam name="aTecla"/>
			<simpleCondition role="onSelection" key="$aTecla"/>
			<simpleAction role="stop"/>
		</causalConnector>
		
		<causalConnector id="onKeySelectionStopDoc">
			<simpleCondition role="onSelection"/>
			<simpleAction role="stop"/>
		</causalConnector>
		
		<causalConnector id="onKeySelectionStartStop">
			<connectorParam name="aTecla"/>
			<simpleCondition role="onSelection" key="$aTecla"/>
			<compoundAction operator="par">
				<simpleAction role="start" max="unbounded" qualifier="par"/>
				<simpleAction role="stop"/>
			</compoundAction>
		</causalConnector>
		<causalConnector id="onKeySelectionStopSet">
			<connectorParam name="oValor"/>
			<simpleCondition role="onSelection"/>
			<compoundAction operator="par">
				<simpleAction role="stop"/>
				<simpleAction role="set" value="$oValor"/>
			</compoundAction>
		</causalConnector>
		<causalConnector id="onKeySelectionStart">
			<simpleCondition role="onSelection"/>
			<simpleAction role="start"/>
		</causalConnector>
		<causalConnector id="onBeginSet">
			<connectorParam name="oValor"/>
			<simpleCondition role="onBegin"/>
			<simpleAction role="set" value="$oValor"/>
		</causalConnector>
		<causalConnector id="onKeySelectionStartN">
			<simpleCondition role="onSelection" />
			<simpleAction role="start" max="unbounded" qualifier="par"/>
		</causalConnector>
	</connectorBase>
	
</head>

<body id="documento">
	<!-- Inicio do DOcumento -->
	<port id="pVideoAbertura" component="idVideo"/>
	
	<media id="idVideo" src="media/Wanna_Work_Together_-_Creative_Commons.avi" descriptor="dp_video"/>
	<media id="idBotao" src="media/botao_interatividade.png" descriptor="dp_button"/>
	<media id="idVote" src="media/fundo_vote.png" descriptor="dp_vote" />
	<media id="danielAlves" src="media/daniel_alves.jpg" descriptor="dp_danielAlves" />
	<media id="doni" src="media/doni.jpg" descriptor="dp_doni" />
	<media id="elano" src="media/elano.jpg" descriptor="dp_elano" />
	<media id="felipeMelo" src="media/felipe_melo.jpg" descriptor="dp_felipeMelo" />
	<media id="gilberto" src="media/gilberto.jpg" descriptor="dp_gilberto" />
	<media id="gilbertoSilva" src="media/gilberto_silva.jpg" descriptor="dp_gilbertoSilva" />
	<media id="gomes" src="media/gomes.jpg" descriptor="dp_gomes" />
	<media id="grafite" src="media/grafite.jpg" descriptor="dp_grafite" />
	<media id="josue" src="media/josue.jpg" descriptor="dp_josue" />
	<media id="juan" src="media/juan.jpg" descriptor="dp_juan" />
	<media id="julioBaptista" src="media/julio_baptista.jpg" descriptor="dp_julioBaptista" />
	<media id="julioCesar" src="media/julio_cesar.jpg" descriptor="dp_julioCesar" />
	<media id="kaka" src="media/kaka.jpg" descriptor="dp_kaka" />
	<media id="kleberson" src="media/kleberson.jpg" descriptor="dp_kleberson" />
	<media id="lucio" src="media/lucio.jpg" descriptor="dp_lucio" />
	<media id="luisao" src="media/luisao.jpg" descriptor="dp_luisao" />
	<media id="luisFabiano" src="media/luis_fabiano.jpg" descriptor="dp_luisFabiano" />
	<media id="maicon" src="media/maicon.jpg" descriptor="dp_maicon" />
	<media id="michelBastos" src="media/michel_bastos.jpg" descriptor="dp_michelBastos" />
	<media id="nilmar" src="media/nilmar.jpg" descriptor="dp_nilmar" />
	<media id="ramires" src="media/ramires.jpg" descriptor="dp_ramires" />
	<media id="robinho" src="media/robinho.jpg" descriptor="dp_robinho" />
	<media id="thiagoSilva" src="media/thiago_silva.jpg" descriptor="dp_thiagoSilva" />
	
	<link xconnector="onBeginStartN">
		<bind component="idVideo" role="onBegin" />
		<bind component="idBotao" role="start" />
	</link>

	<link xconnector="onEndStart">
		<bind component="idVideo" role="onEnd"/>
		<bind component="idVideo" role="start"/>
	</link>

	<link xconnector="onKeySelectionStart">
		<bind component="idBotao" role="onSelection">
			<bindParam name="keyCode" value="BLUE" />
		</bind>
		<bind component="idVote" role="start" />
		
  	</link>

</body>

</ncl>