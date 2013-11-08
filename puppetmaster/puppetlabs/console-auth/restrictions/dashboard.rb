restrict "/nodes/new" do
  method :get do
    roles :read, :write
  end
end

restrict /\/nodes\/\d+\/edit/ do
  method :get do
    roles :read, :write
  end
end

restrict /\/nodes\/\d+$/ do
  method :put, :delete do
    roles :read, :write
  end

  method :get do
    roles :read
  end
end

restrict /\/nodes\/(?!\d+$)(?!new$)(?!.\/).+/ do
  method :put, :post, :delete do
    roles :read, :write
  end

  method :get do
    allow_unauthenticated
    roles :read
  end
end

restrict /\/reports\/upload/ do
  method :post do
    allow_unauthenticated
    roles :read, :write
  end
end

restrict /\/reports\/\d+/ do
  method :put, :delete do
    roles :read, :write
  end

  method :get do
    roles :read
  end
end

restrict "/node_classes/select" do
  method :get do
    roles :read, :write
  end
end

%w{node_groups node_class_memberships node_group_class_memberships}.each do |path|
  restrict "/#{path}/new" do
    method :get do
      roles :read, :write
    end
  end
end

%w{node_groups node_classes node_class_memberships node_group_class_memberships}.each do |path|
  restrict /\/#{path}\/\d+\/edit/ do
    method :get do
      roles :read, :write
    end
  end

  restrict /\/#{path}(\/(\d)+)?/ do
    method :put, :post, :delete do
      roles :read, :write
    end

    method :get do
      roles :read
    end
  end
end
