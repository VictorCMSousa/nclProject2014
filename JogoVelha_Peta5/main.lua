-- Jogo da Velha-OO
-- Arquivo Principal
-- @author Rafael Carvalho
-- @version 3.0
-- @Images Logos Crystal Clear (http://commons.wikimedia.org/wiki/Crystal_Clear)
-- @TODO melhorar inicializacao das jogadores

-- Copyright (C) 2009 Peta5 - Telecomunicacoes e Software Livre (www.peta5.com.br)
--
-- This Game is free software; you can redistribute it and/or
-- modify it under the terms of the GNU Lesser General Public
-- License as published by the Free Software Foundation; either
-- version 2 of the License.
--
-- This Game is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-- Lesser General Public License for more details.
--
-- You should have received a copy of the GNU Lesser General Public
-- License along with this Game; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA


----------------
-- CLASSES: Inclusao das classes
----------------
require 'constantes-ctes' -- constantes do jogo
require 'peca-class' -- classe peca
require 'tabuleiro-class' -- classe tabuleiro
require 'controle-class' -- classe de controle do jogo
require 'image-class' -- classe para desenho na tela
require 'intelligence-class' -- classe de inteligencia artificial
require 'tcp'

----------------
-- OBJETOS: Instanciacao dos objetos
----------------
tabuleiro = Tabuleiro:new(4,3)
controle = Controle:new()
image = Image:new()

----------------
-- IMAGENS: desenho das imagens
----------------
local fundo = image:newPicture('media/background.jpg',0,0) -- Plano de fundo
local cursor = image:newPicture('media/cursor.gif',390,280) -- Cursor

-- jogadores. inicia as posicoes das jogadores
jogadores = {}
for i=1,3 do 
	jogadores[i] = {}     -- cria uma nova linha
	for j=1,3 do
		jogadores[i][j] =  image:newPicture(tabuleiro[i][j].getCaminhoFoto(),0,0) 
	end
end

--inicializacao das posicoes das jogadores. Melhorar rotina depois
jogadores[1][1].x = 211
jogadores[1][1].y = 142
jogadores[1][2].x = 351
jogadores[1][2].y = 142
jogadores[1][3].x = 490
jogadores[1][3].y = 142
jogadores[2][1].x = 211
jogadores[2][1].y = 237
jogadores[2][2].x = 352
jogadores[2][2].y = 237
jogadores[2][3].x = 490
jogadores[3][1].x = 211
jogadores[3][1].y = 328
jogadores[3][2].x = 352
jogadores[3][2].y = 328
jogadores[3][3].x = 490
jogadores[3][3].y = 328

--url = "GET http://"..host.."/api.php?". params


-- desenha tela de abertura do jogo
image:drawStart(fundo,peca_saudacao,AVISO[2],AVISO[3],VEZ)

function writeResult(jogadores) 
   canvas:attrColor(255,255,255,0)
   canvas:clear()
   
   canvas:attrFont("vera", 24)
   canvas:drawText(10, 5, "Entra: "..jogadores.nome_entra)
   canvas:drawText(10, 30, "Camisa:: "..jogadores.camisa_entra)
   canvas:drawText(10, 55, "N de votos: "..jogadores.count_votos)
   canvas:drawText(10, 75, "Entra: "..jogadores.nome_sai)
   canvas:drawText(10, 100, "Camisa:: "..jogadores.camisa_sai)
   canvas:drawText(10, 130, "N de votos: "..jogadores.count_sai)
   
   canvas:flush()
end

function serverRequest(params)
	local host = "ip do host"
	tcp.execute(
        function ()
            writeText("Obtendo resultado. Por favor, aguarde...")
            tcp.connect(host, 80)
            --conecta no servidor
            print("Conectado a "..host)
            
            local url = "GET http://"..host.."/Api.php?"..params.."\n"
            print("URL: "..url)
            --envia uma requisição HTTP para gravar voto no servidor remoto
            tcp.send(url)
           	
           	--obtém todo o conteúdo da página acessada
            local result = tcp.receive("*a")
            if result then
            	print("Dados da conexao TCP recebidos")
            	--obtem o resultado da página php acessada,
            	--que retorna um código lua contendo
            	--a criação de uma tabela com o
            	--resultado da votação		    	
		        f = loadstring(result)
		        --se o código lua retornado pela página php foi
		        --compilado, executa o mesmo. Neste momento,
		        --a tabela votos = { sim, nao, url } será criada
		        --contados o total de votos sim, o total de não
		        --e o domínio do meu site   
				if f then 
				   f()
				   writeResult(votos)
			       
			       --Após ter sido feito a requisição para contabilizar o voto
			       --e exibido o resultado,
			       --deve-se notificar o documento NCL para que ele
			       --interrompa o nó lua para que o resultado não  
			       --seja mais apresentado.
			       --Para isso, é gerado um evento do tipo
			       --atributtion, atribuindo um valor qualquer
			       --à propriedade result do nó lua atual.
			       setLuaPropertie("result", 1)
				end
		    else
            	print("Erro ao receber dados da conexao TCP")
            	if evt.error ~= nil then 
		        	result = 'error: ' .. evt.error
		        end
	        end
	        
            tcp.disconnect()
        end
    )
end

-- Funcao de tratamento de eventos <br>
-- Responsavel pelas acoes vindas do controle remoto
-- @param evt Evento recebido do formatador NCL
function handler (evt)
	
-- apenas eventos do teclado interessam para o jogo
	if (evt.class == 'key') and (evt.type == 'press') 	then
		if not IGNORE then
			-- movimento do cursor
			-- apenas as setas movem o cursor
			if evt.key == 'CURSOR_UP' then
				if cursor.y > 185 then
					cursor.y = cursor.y - 95
				end
			elseif evt.key == 'CURSOR_DOWN' then
				if cursor.y < 375 then
					cursor.y = cursor.y + 95
				end
			elseif evt.key == 'CURSOR_LEFT' then
				if cursor.x > 245 then
					cursor.x = cursor.x - 145
				end
			elseif evt.key == 'CURSOR_RIGHT' then
				if cursor.x < 535 then
					cursor.x = cursor.x + 145
				end
			end

			-- a cada movimento do cursor redesenha toda a tela
			image:reDraw(fundo,jogadores,peca_saudacao,cursor,MENSAGEM[aleatoria],AVISO[1],tabuleiro,VEZ)

			-- testa se o cursor foi precionado em cima do alvo = Jogador efetuou jogada
			if evt.key == 'ENTER' then
				local count = 0
				for i=1,4 do
					for j=1,3 do
						if count == 2
							IGNORE = true
						end
						--se houve um jogador selecionado
						else if controle:collide(cursor,jogadores[i][j]) then
							image:reDraw(fundo, jogadores, cursor,MENSAGEM[11])
							count = count + 1
						end -- END do if collide
					end
				end				
			end -- END do if do 'ENTER'
		-- ao termino do jogo, posta eventos que serao responsaveis por reiniciar o jogo
		elseif IGNORE then
			-- a maquina virtual (0.10.1) esta com um bug que nao permite que as teclas F1, F2, F3 e F4 sejam mapeadas nas teclas coloridas
			-- por isso alterei a tecla de voltar. O correto seria "YELLOW"				
			if evt.key == '1' then  
				event.post{class='ncl', type='attribution', name='nivel',action='stop'}
				event.post{class='ncl', type='presentation', label='ReStart',action='start'}
				event.post{class='ncl', type='presentation', label='ReStart',action='stop'}
				event.post{class='ncl', type='presentation', action='stop'}
			end
		end			
	end
end
event.register(handler)