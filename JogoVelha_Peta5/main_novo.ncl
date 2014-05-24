<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="ex1" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">

<head>
	
	<regionBase>	
		
		
		<region id="rgFundo" zIndex="0">
			<region id="rgTelaInteira" zIndex="1"/>
			<region id="rgBotao" right="5%" bottom="5%" width="200" height="45" zIndex="2"/>
			<region id="rgBotaoFacil" right="50%" bottom="5%" width="200" height="45" zIndex="2"/>
			<region id="rgLua" top="0%" left="0%" width="100%" height="100%" zIndex="2"/>
		</region>
		
	</regionBase>
	
	<descriptorBase>
		<descriptor id="descRgFundo" region="rgFundo"/>
		<descriptor id="descRgTelaInteira" region="rgTelaInteira"/>
		<descriptor id="descRgBotao" region="rgBotao" focusIndex="0"/>
		<descriptor id="descRgFacil" region="rgBotaoFacil"/>
		<descriptor id="descRgLua" region="rgLua" focusIndex="luaIdx"/>
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
			<connectorParam name="aTecla"/>
			<simpleCondition role="onSelection" key="$aTecla"/>
			<simpleAction role="start"/>
		</causalConnector>

		<causalConnector id="onKeySelectionStartN">
			<connectorParam name="aTecla"/>
			<simpleCondition role="onSelection" key="$aTecla"/>
			<simpleAction role="start" max="unbounded" qualifier="par"/>
		</causalConnector>
		
		<causalConnector id="onBeginSet">
			<connectorParam name="oValor"/>
			<simpleCondition role="onBegin"/>
			<simpleAction role="set" value="$oValor"/>
		</causalConnector>
		
		<causalConnector id="onEndAttributionDelayedStop">
				<simpleCondition role="onEndAttribution"/>
				<simpleAction role="stop" delay="10s"/>
		</causalConnector>
		
	</connectorBase>
	
</head>

<body id="documento">

	<port id="pVideoAbertura" component="videoAbertura"/>
	
	
	<media id="videoAbertura" src="media/Wanna_Work_Together_-_Creative_Commons.avi" descriptor="descRgTelaInteira">
		<property name="bounds"/>
	</media>
	<media id="imgFundo" src="media/fundo_vote.png" descriptor="descRgFundo"/>
	<media id="imgBotao" src="media/botao_interatividade.png" descriptor="descRgBotao"/>
	<media id="imgTeste" src="media/botao_facil.jpg" descriptor="descRgFacil"/>
	<media type="application/x-ginga-settings" id="programSettings">
        <property name="service.currentKeyMaster" value="luaIdx"/>
	</media>

    <media id="lua" src="main.lua" descriptor="descRgLua">
		<property name="jogadoress"/>
		<property name="result"/>
    </media>
	
	
	<link xconnector="onBeginStartN">
		<bind component="videoAbertura" role="onBegin" />
		<bind component="imgBotao" role="start" />
	</link>
	
	<link xconnector="onKeySelectionStartN">
		<bind component="imgBotao" role="onSelection">
			<bindParam name="keyCode" value="BLUE" />
		</bind>
		<bind component="imgFundo" role="start" />
		<bind component="lua" role="start" />
	</link>
	
	<link xconnector="onBeginSet">
		<bind component="imgFundo" role="onBegin"/>
		<bind component="videoAbertura" interface="bounds" role="set">
			<bindParam name="oValor" value="50%,25%,65%,40%"/>
		</bind>
	</link>
	
	<link xconnector="onEndAttributionDelayedStop">
			<bind component="lua" role="onEndAttribution" interface="result" />
			<bind component="lua" role="stop" />
	</link>	

	</body>

</ncl>