class Client
  # attr_reader(:name, :id, :stylist_id)
  #
  # define_method(:initialize) do |attributes|
  #   @name = attributes.fetch(:name)
  #   @id = attributes.fetch(:id)
  #   @stylist_id = attributes.fetch(:stylist_id)
  # end
  #
  # define_method(:save) do
  #   result = DB.exec("INSERT INTO clients (name, stylist_id) VALUES ('#{@name}', #{@stylist_id}) RETURNING id;")
  #   @id = result.first().fetch("id").to_i()
  # end
  #
  # define_singleton_method(:all) do
  #   returned_clients = DB.exec('SELECT * FROM clients')
  #   client_array = []
  #   returned_clients.each() do |client|
  #     current_client = Client.new(:name => client.fetch('name'), :stylist_id => client.fetch('stylist_id'))
  #     client_array.push(current_client)
  #   end
  #   client_array
  # end
  #
  # define_method(:==) do |another_client|
  #   self.name().==(another_client.name()).&(self.id().==(another_client.id()))
  # end
  #
  # define_singleton_method(:find) do |client_id|
  #
  # end
  #
  # define_method(:update) do |attributes|
  #   @name = attributes.fetch(:name)
  #   DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{self.id()};")
  # end
  #
  # define_method(:delete) do
  #   DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  # end

end
