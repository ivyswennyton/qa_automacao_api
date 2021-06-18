#language: pt
Funcionalidade: Criacao fachada cliente

Contexto:
	# Dado que o token foi gerado corretamente
  # se exister token pode deixar no contexto para reutiliza-lo nos demais steps

@registro
Cenario: Criar resgistro test sem email
	Quando criar resgistro test "" com senha "pistol123"
	Entao a API deve retornar o codigo 400
@registro
Cenario: Criar resgistro test
	Quando criar resgistro test "eve.holt@reqres.in" com senha "pistol"
	Entao a API deve retornar o codigo 200
@usuario
Cenario: Delterar user test
	Quando criar user test "ivys" com emprego "qa"
	E a API deve retornar o codigo 201
  Quando deletar o user criado
 	E a API deve retornar o codigo 204
  Entao deve nao encontrar o user criado