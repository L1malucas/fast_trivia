GET    /questionario/1                           -> Recuperar o questionário com ID 1
GET    /questionario/1/tema                      -> Recuperar o tema do questionário com ID 1
GET    /questionario/1/questoes                  -> Recuperar todas as questões do questionário com ID 1
GET    /questionario/1/questoes/1                -> Recuperar a questão com ID 1 do questionário com ID 1

modo adm
POST   /questionario/1/questoes                  -> Adicionar uma nova questão ao questionário com ID 1
PUT    /questionario/1/questoes/1                -> Editar a questão com ID 1 do questionário com ID 1
PATCH  /questionario/1/questoes/1                -> Editar parcialmente a questão com ID 1 do questionário com ID 1
DELETE /questionario/1/questoes/1                -> Deletar a questão com ID 1 do questionário com ID 1
