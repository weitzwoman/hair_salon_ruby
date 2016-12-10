class Client
  attr_reader(:name, :id, :stylist_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients_array = []
    returned_clients.each() do |client|
      name = client.fetch('name')
      id = client.fetch('id').to_i
      stylist_id = client.fetch('stylist_id').to_i
      clients_array.push(Client.new({:name => name, :id => id, :stylist_id => stylist_id}))
    end
    clients_array
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name()).&(self.id().==(another_client.id())).&(self.stylist_id().==(another_client.stylist_id()))
  end

  define_singleton_method(:find) do |client_id|
    client_id_found = nil
    Client.all().each() do |client|
      if client.id() == client_id
        client_id_found = client
      end
    end
    client_id_found
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name)
    DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{self.id()};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  end

end
