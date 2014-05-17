-- Jogo da Velha-OO
-- Constantes do jogo
-- @author Rafael Carvalho
-- @version 3.0
-- @Images Logos Crystal Clear (http://commons.wikimedia.org/wiki/Crystal_Clear)

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

-- identificacao das pecas
VAZIO = -1

-- flag para sinalizar o final do jogo 
IGNORE = false

-- falas da velha :-)
-- pode-se adicionar mais falas sem problemas
MENSAGEM = {}
MENSAGEM[1] = "Jogue bem. Eu quero Vencer!"
MENSAGEM[2] = "Tome cuidado com sua jogada."
MENSAGEM[3] = "Fique sempre alerta..."
MENSAGEM[4] = "Boa jogada. Continue assim."
MENSAGEM[5] = "Eu sei que voce pode melhorar."
MENSAGEM[6] = "Mantenha a calma, cuidado."
MENSAGEM[7] = "Assim voce vai longe!"
MENSAGEM[8] = "O que aconteceu com voce?"
MENSAGEM[9] = "Treine mais. Meu neto eh melhor."
MENSAGEM[10] = "Casa preenchida. Tente outra."
MENSAGEM[11] = "Jogador foi selecionado"
-- avisos de orientacao para os jogadores