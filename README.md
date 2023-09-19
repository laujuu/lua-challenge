# lua-challenge

## referencias
#### [Lua Beginners Guide](https://github.com/pohka/Lua-Beginners-Guide)
#### [lua resty prettycjson](https://github.com/bungle/lua-resty-prettycjson)
#### [lua docs](http://www.lua.org/manual/5.4/)
#### [Pairs and iPairs](https://www.youtube.com/watch?v=iaJOA47qYGE&ab_channel=BurtonsMediaGroup)
#### [crash course](https://www.youtube.com/watch?v=1srFmjt1Ib0&t=9603s&ab_channel=Steve%27steacher)

## Desafio

Apesar das diferenças, a lógica da linguagem em sí tem semelhanças na estrutura com outras linguagens, temos loops, condicionais, de uma certa forma objetos e arrays, dai vem a similiaridade.

### Exemplos

```
// em lua
for groupName, groupData in pairs(queue) do
// em js
for (const groupName in queue)
``` 
```
// em lua
if #blueTeam.players < 5 and #redTeam.players < 5 then
// em js
if (blueTeam.players.length < 5 && redTeam.players.length < 5) { }
```

```
// em lua
table.insert(blueTeam.players, {
     id = player.id,
     name = player.name,
     group = groupName
})
// em js
blueTeam.players.push({
   id: player.id,
   name: player.name,
   group: groupName,
});

```

## Estrutura
```
.
├── controller
│   ├── model
│       └── Queue.lua
│   └── TeamMatcher.lua  
└── README.md
```

## Abordagem

A princípio, no começo, pensei em criar uma API REST e consumi-la em um front básico, porém não tinha muita certeza em relação ao tempo. 
Então, resolvi usar uma biblioteca para o output ficar em um formato JSON formatado, dando assim a entender que a função estaria pronta para ser consumida em outro lugar.


## Output alcançado:

```
{
        "blue": {
                "players": [
                        {
                                "id": 2,
                                "name": "BlazeGamer",
                                "group": "group_4"
                        },
                        {
                                "id": 4,
                                "name": "ShadowNinja",
                                "group": "group_4"
                        },
                        {
                                "id": 1,
                                "name": "ViperGT",
                                "group": "group_1"
                        },
                        {
                                "id": 9,
                                "name": "DriftKing",
                                "group": "group_9"
                        },
                        {
                                "id": 6,
                                "name": "ThunderBolt",
                                "group": "group_6"
                        }
                ]
        },
        "red": {
                "players": [
                        {
                                "id": 3,
                                "name": "SpeedRacer",
                                "group": "group_4"
                        },
                        {
                                "id": 5,
                                "name": "PhoenixFire",
                                "group": "group_4"
                        },
                        {
                                "id": 8,
                                "name": "NeonSpectre",
                                "group": "group_9"
                        },
                        {
                                "id": 10,
                                "name": "MidnightWolf",
                                "group": "group_10"
                        }
                ]
        }
}

```

-
