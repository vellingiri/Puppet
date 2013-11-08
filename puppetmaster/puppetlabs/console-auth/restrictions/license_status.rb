restrict '/console/services/licenses/api/v1/license' do
  method :get do
    #allow_unauthenticated
    roles :read
  end
end

restrict '/console/services/licenses/api/v1/license_count' do
  method :get do
    #allow_unauthenticated
    roles :read
  end
end

restrict '/console/services/licenses/api/v1/node_count' do
  method :get do
    #allow_unauthenticated
    roles :read
  end
end
