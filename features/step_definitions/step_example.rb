Dado("que o token foi gerado corretamente") do
  @token = @page.token_generate
end

Quando("criar resgistro test {string} com senha {string}") do |email, pass|
  @result = @page.register_create(email, pass)
end

Entao("a API deve retornar o codigo {int}") do |code|
  expect(@result.code).to eq(code)
end

Quando('criar user test {string} com emprego {string}') do |name, job|
  @result = @page.user_create(name, job)
  @id = @result['id']
end

Quando('deletar o user criado') do
  @result = @page.user_delete(@id)
end

Entao('deve nao encontrar o user criado') do
  result = @page.user_consult(@id)
  
  expect(result.code).to eq(404)
end