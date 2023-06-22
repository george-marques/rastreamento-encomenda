# rastrear_encomenda

Flutter project.

## Minha encomenda

O objetivo desse aplicativo é ajudar os usuários a acompanhar a localização e o status de suas entregas, nessa primeira versão do app está sendo consumido os status de entrega de uma api própria feita no json server, e também consultar da api apartir do código de rastreio, permitindo aos usuários inserir um código de rastreamento e obter informações sobre o progresso da entrega.

## Instruções de consumo de api

Estou consumindo os dados vindos dessas 2 apis:
- db.json
- rastreio.json

Execute os comandos a seguir no terminal:

json-server --watch db.json
json-server --watch rastreio.json --port 4000

