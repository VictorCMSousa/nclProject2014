----------------
-- CLASSES: Inclusao das classes
----------------
require 'constantes-ctes' -- constantes do jog
require 'jogador-class'
require 'tabuleiro-class' -- classe tabuleiro
require 'controle-class' -- classe de controle do jogo
require 'image-class' -- classe para desenho na tela
require 'tcp'

-- MONKEY: guarda a imagem, posicao inicial e dimensoes
local img = canvas:new('media/juan.jpg')
local dx, dy = img:attrSize()
local monkey = { img=img, x=10, y=10, dx=dx, dy=dy }

local img2 = canvas:new('media/julio_cesar.jpg')
local dx2, dy2 = img2:attrSize()
local monkey2 = { img=img2, x=10, y=110, dx=dx2, dy=dy2 }

controle = Controle:new()
image = Image:new()

local fundo = image:newPicture('media/fundo.jpg',0,0)
local cursor = image:newPicture('media/cursor.png',390,280) -- Cursor
local jogadoresImg = {}
local jogadoresIds = {}

function setLuaPropertie(propName, propValue)
    local evt = {
        class = 'key',
        type  = 'attribution',
        name  = propName,
        value = propValue, 
    }
    
    --Para que o documento NCL perceba a atribuição
    --de um valor a uma propriedade do nó lua,
    --deve-se disparar o evento dando um start
    --e depois um stop. Isto só é necessário
    --em casos de atribuição. 
    evt.action = 'start'; event.post(evt)
    evt.action = 'stop' ; event.post(evt)
end 

function serverRequest(params, mode)
	
	local host = "192.168.1.104"
	tcp.execute(
        function ()
           
            tcp.connect(host, 80)
           	--canvas:drawText(10, 380, 'teste')
            print("Conectado a "..host)
            
            local url = "GET http://"..host.."/Api.php?"..params.."\n"
            print("URL: "..url)
            --envia uma requisição HTTP para gravar voto no servidor remoto
            tcp.send(url)
           
           	--obtém todo o conteúdo da página acessada
            local result = tcp.receive("*a")
            if result then
            			    	
		        f = loadstring(result)
		       
				if f then 
				   f()
				   print("antes criar")
				   print("result " ..jogadoress[1]["name"])
				   --tabuleiro = Tabuleiro:new(4,3,jogadoress)
					
				   --writeResult(votos, mode)
			       
			       	local k = 1
					for i=1,4 do 
						jogadoresImg[i] = {}  
						jogadoresIds[i] = {}   -- cria uma nova linha
						for j=1,3 do
							jogadoresImg[i][j] = image:newPicture(''..jogadoress[k]["foto_path"],0,0)
							jogadoresImg[i][j].x = j*95 -80
							jogadoresImg[i][j].y = i*106 - 90
							canvas:compose(jogadoresImg[i][j].x, jogadoresImg[i][j].y, jogadoresImg[i][j].img)
							jogadoresIds[i][j] = jogadoress[k]["id"]
							k = k + 1							
							--canvas:drawText(j*95 + 10, i*108 + 10, ""..tabuleiro[i][j].getNome())				
						end
					end
					--image:drawStart(fundo,jogadoresImg,TEXTO[1])
					canvas:flush()
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
local count = 0

function handler (evt)
	if evt.class == 'ncl' and evt.type == 'presentation' and evt.action == 'start' then        
		--canvas:compose(monkey.x, monkey.y, monkey.img)
		--canvas:compose(monkey2.x, monkey2.y, monkey2.img)
		canvas:attrColor(255,255,255,0)
	   
	   	canvas:attrFont("vera", 24)
	  	--canvas:drawText(count + 10, 370, 'teste')
	   	--count = count + 5
	   	serverRequest('jogadores=1',1)
	   	canvas:compose(cursor.x,cursor.y,cursor.img)
	  	canvas:flush()
    end
    if (evt.class == 'key') and (evt.type == 'press') 	then
   		print('entro')
		if not IGNORE then
			-- movimento do cursor
			-- apenas as setas movem o cursor
			print('entro')
			if evt.key == 'CURSOR_UP' then
				if cursor.y > 185 then
					cursor.y = cursor.y - 106
				end
			elseif evt.key == 'CURSOR_DOWN' then
				if cursor.y < 375 then
					cursor.y = cursor.y + 106
				end
			elseif evt.key == 'CURSOR_LEFT' then
				if cursor.x > 245 then
					cursor.x = cursor.x - 95
				end
			elseif evt.key == 'CURSOR_RIGHT' then
				if cursor.x < 535 then
					cursor.x = cursor.x + 95
				end
			end
		end
		image:reDraw(fundo, jogadoresImg, cursor, 'chuchu')
	end

    --if evt.class ~= 'ncl' or evt.type ~= 'attribution' or evt.action ~= 'start' or evt.name ~= 'jogadoress' then 
      -- return 
    --end
   
			
	
end

event.register(handler)