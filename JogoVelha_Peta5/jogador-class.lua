Jogador = {}

-- Construtor<br>
-- Cria um novo Jogador
-- @param param Tipo da peca criada. Neste caso: VAZIO, XIS ou BOLA<br>
function Jogador:new(id,nome,status,selecao, caminho_foto)
 	local temp = {_id = id, _nome = nome, _status = status, _selecao = selecao, _caminho_foto = caminho_foto}
 
 	local function getId()
  		return ''..temp._id
	end

 	local function getNome()
  		return temp._nome
 	end 

 	local function getStatus()
  		return temp._status
 	end

	local function getSelecao()
	  	return temp._selecao
	end

 	local function getCaminhoFoto()
  		return temp._caminho_foto
	end
 
 --metodos publicos para acesso aos atributos
 	obj = {getId=getId, getNome=getNome, getStatus=getStatus, getSelecao=getSelecao, getCaminhoFoto=getCaminhoFoto} 
 
 -- heranca 
 	setmetatable(obj,self)
 	self.__index = self
 
	return obj 
end