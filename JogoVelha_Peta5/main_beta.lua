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

local img = canvas:new('media/juan.jpg')
	local dx, dy = img:attrSize()
	local monkey = { img=img, x=10, y=10, dx=dx, dy=dy }
-- Funcao de tratamento de eventos <br>
-- Responsavel pelas acoes vindas do controle remoto
-- @param evt Evento recebido do formatador NCL
function handler (evt)

	
	canvas:compose(monkey.x, monkey.y, monkey.img)
	event.post {
            class  = 'ncl',
            type   = 'presentation',
            action = 'start',
        }
	
-- 
end
event.register(handler)