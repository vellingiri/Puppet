restrict /\/events\/api\/v1\/.*/ do
  method :get do
    roles :read
  end
end
