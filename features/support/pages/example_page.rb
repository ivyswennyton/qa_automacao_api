# classe para metodos
class ServicoTest
  include HTTParty
  base_uri CONFIG['url_base']

  def initialize () end

  def token_generate
    self.class.headers 'Content-Type' => 'application/json'
    self.class.post('/api/token', body: {  "grant_type": "test", "id": "test", "pass": "test123", "scope": "read" }.to_json)
  end

  def register_create(email, password)
    body = {}
    body['email']    = email
    body['password'] = password

    self.class.headers 'Content-Type' => 'application/json'
    self.class.post('/api/register', body: body.to_json)
  end

  def user_create(name, job)
    body = {}
    body['name'] = name
    body['job'] = job

    self.class.headers 'Content-Type' => 'application/json'
    self.class.post('/api/users', body: body.to_json)
  end
  
  def user_delete(id)
    self.class.delete("/api/users/#{id}")
  end

  def user_consult(id)
    self.class.get("/api/users/#{id}")
  end

end
