local queue = require("model/Queue")
local pretty = require "resty.prettycjson"

function TeamMatcher(queue)
    -- cria as tabelas de times passando um campo vazio
    local blueTeam = { players = {} }
    local redTeam = { players = {} }
    
    -- iterando os grupos da fila
    for groupName, groupData in pairs(queue) do
        -- pega lista de jogadores no grupo atual
        local players = groupData.players
        
        -- iterando sobre os jogares do grupo atual
        for _, player in ipairs(players) do
            -- aqui estamos verificando se ele atingiu o limite de 5 pessoa
            if #blueTeam.players < 5 and #redTeam.players < 5 then
                -- agora verifica se tem mais jogares no time azul ou a mesma quantia que o time vermelho
                if #blueTeam.players <= #redTeam.players then
                    -- então, insere o jogador no time azul
                    table.insert(blueTeam.players, {
                        id = player.id,
                        name = player.name,
                        group = groupName
                    })
                    -- apenas para depuração
                    -- for i, p in ipairs(blueTeam.players) do print("blue team:  ", p.id, p.name, p.group) end
                else
                    -- caso contrário insere jogador no time vermelho
                    table.insert(redTeam.players, {
                        id = player.id,
                        name = player.name,
                        group = groupName
                    })
                    -- apenas para depuração
                    -- for i, p in ipairs(redTeam.players) do print("red team:  ", p.id, p.name, p.group) end
                end
            else
                -- Se alguma equipe tiver cheia enterrompe
                break 
            end
        end
    end

    -- cria uma tabela que contém as tabelas blue e red
    local teams = {
        ["blue"] = blueTeam,
        ["red"] = redTeam
    }

    -- usa a biblioteca prettycjson para converter a tabela teams em um json
    local result = pretty(teams)
    print(result)

end

TeamMatcher(queue)