require('spec_helper')

# describe(Client) do
#   before() do
#     @client = Client.new({:name => 'Harry Potter', :id => nil})
#   end
#
#   describe('#name') do
#     it('returns the name of the client') do
#       expect(@client.name()).to(eq('Harry Potter'))
#     end
#   end
#
#   describe('#id') do
#     it("sets its ID when you save it") do
#       @client.save()
#       expect(@client.id()).to(be_an_instance_of(Fixnum))
#     end
#   end
#
#   describe('.all') do
#     it('is empty at first') do
#       expect(Client.all()).to(eq([]))
#     end
#   end
#
#   describe('#save') do
#     it('saves client with a name') do
#       @client.save()
#       expect(Client.all()).to(eq([@client]))
#     end
#   end
#
#   describe('#==') do
#     it('is the same client if the names are the same text') do
#       new_client = Client.new({:name => 'Harry Potter', :id => nil})
#       expect(@client).to(eq(new_client))
#     end
#   end
#
#   describe('#delete') do
#     it('lets you delete a client in the database') do
#       new_client = Client.new({:name => 'Ron Weasley', :id => nil})
#       new_client.save()
#       @client.save()
#       @client.delete()
#       expect(Client.all()).to(eq([new_client]))
#     end
#   end
#
#   describe('.find') do
#     it('lets you find the client by id') do
#       @client.save()
#       expect(Client.find(@client.id())).to(eq(@client))
#     end
#   end
#
#   describe('.search') do
#     it('returns a client that you searched for') do
#       @client.save()
#       expect(Client.search(@client.name())).to(eq([@client]))
#     end
#   end
#
#   describe('#update') do
#     it('lets you update clients in the database') do
#       @client.save()
#       @client.update({:name => 'Ron Weasley', :id => nil})
#       expect(@client.name()).to(eq('Ron Weasley'))
#     end
#   end

# end
