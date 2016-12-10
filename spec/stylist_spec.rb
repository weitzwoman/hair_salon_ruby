require('spec_helper')

describe(Stylist) do

  describe('#initialize') do
    it('returns the name of a stylist') do
      test_stylist = Stylist.new({:name => 'Wacky Wanda', :id => nil})
      expect(test_stylist.name()).to(eq('Wacky Wanda'))
    end
  end

  describe('#save') do
    it('saves stylist with name') do
      test_stylist = Stylist.new({:name => 'Wacky Wanda', :id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe('#==') do
    it('is the same stylist if the names of stylists are the same text') do
      test_stylist = Stylist.new({:name => 'Wacky Wanda', :id => nil})
      new_stylist = Stylist.new({:name => 'Wacky Wanda', :id => nil})
      expect(test_stylist).to(eq(new_stylist))
    end
  end

  describe('.find') do
    it('returns a stylist based on their unique id value') do
      test_stylist = Stylist.new({:name => 'Wacky Wanda', :id => nil})
      test_stylist.save()
      expect(Stylist.find(test_stylist.id())).to(eq(test_stylist))
    end
  end

  describe('#update') do
    it('lets you update stylists by name in the database') do
      test_stylist = Stylist.new({:name => "Curly Shirley", :id => nil})
      test_stylist.save()
      test_stylist.update({:name => "Perma Polly"})
      expect(test_stylist.name()).to(eq("Perma Polly"))
    end
  end

  # describe('#clients') do
  #   it('returns all the clients of a stylist') do
  #     client = Client.new({:name => 'Overdo Dawn', :id => nil})
  #     client.save()
  #     client2 = Client.new({:name => 'Dreaded Olive', :id => nil})
  #     client2.save()
  #     stylist = Stylist.new({:name => 'Wacky Wanda', :id => nil})
  #     stylist.save()
  #     # not sure about :client_ids - see library
  #     stylist.update(:client_ids => [client.id()])
  #     stylist.update(:client_ids => [client2.id()])
  #     expect(stylist.clients()).to(eq([client, client2]))
  #   end
  # end
  #
  # describe('#delete') do
  #   it('lets you delete an stylist from the database') do
  #     stylist = Stylist.new({:name => "Herman Melville", :id => nil})
  #     stylist.save()
  #     stylist2 = Stylist.new({:name => 'Jules Verne', :id => nil})
  #     stylist2.save()
  #     stylist.delete()
  #     expect(Stylist.all()).to(eq([stylist2]))
  #   end
  # end

end
