restrict /\/auth\/activate\/.*$/ do
  method :get do
    allow_unauthenticated
    roles :read
  end
end

restrict /\/auth\/activation\/.*$/ do
  method :get, :post do
    allow_unauthenticated
    roles :read
  end
end

restrict '/auth/reset_password' do
  method :post do
    roles :read
  end
end

restrict '/auth/account' do
  method :get do
    roles :read
  end
end

restrict /\/auth\/.*/ do
  method :get, :post, :put, :delete do
    roles :admin
  end
end
