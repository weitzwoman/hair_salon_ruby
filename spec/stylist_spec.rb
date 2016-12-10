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

  describe('#clients') do
    it('returns all the clients of a stylist') do
      test_stylist = Stylist.new({:name => 'Wacky Wanda', :id => nil})
      test_stylist.save()
      test_client = Client.new({:name => 'Overdo Dawn', :id => nil, :stylist_id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:name => 'Dreaded Olive', :id => nil, :stylist_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client, test_client2]))
    end
  end

  describe('#delete') do
    it('lets you delete a stylist from the database') do
      test_stylist = Stylist.new({:name => "Herman Melville", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => 'Jules Verne', :id => nil})
      test_stylist2.save()
      test_stylist.delete()
      expect(Stylist.all()).to(eq([test_stylist2]))
    end
  end

end
