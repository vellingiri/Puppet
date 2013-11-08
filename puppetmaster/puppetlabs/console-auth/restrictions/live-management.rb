restrict '/live-management/lm/mc_agents' do
  method :get do
    roles :read
  end
end

restrict '/live-management/lm/mc_run' do
  method :post do
    roles :read, :write
  end
end

restrict '/live-management/lm/nodes' do
  method :get do
    roles :read
  end
end

restrict /\/live\-management\/lm\/resources\/.*/ do
  method :get do
    roles :read
  end
end

restrict /\/live\-management\/lm\/clone\/.*/ do
  method :post, :get do
    roles :read, :write
  end
end

restrict '/live-management/lm/resource_types' do
  method :get do
    roles :read
  end
end

restrict '/live-management/lm/nodeset' do
  method :get, :post do
    roles :read
  end
end
