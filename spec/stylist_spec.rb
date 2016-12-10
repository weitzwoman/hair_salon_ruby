require('spec_helper')

describe(Stylist) do
  before() do
    @stylist = Stylist.new({:name => 'Wacky Wanda', id: => nil})
  end

  describe('#name') do
    it('returns the name of a stylist') do
      expect(@stylist.name()).to(eq('Wacky Wanda'))
    end
  end

  describe('#id') do
    it('set its ID when you save it') do
      @stylist.save()
      expect(@stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('saves stylist with name') do
      @stylist.save()
      expect(Stylist.all()).to(eq([@stylist]))
    end
  end

  describe('#==') do
    it('is the same stylist if the names of stylists are the same text') do
      new_stylist = Stylist.new({:name => 'Wacky Wanda', :id => nil})
      expect(@stylist).to(eq(new_stylist))
    end
  end

  describe('.search') do
      it('returns an stylist name that you searched for') do
        @stylist.save()
        expect(Stylist.search(@stylist.name())).to(eq([@stylist]))
      end
    end

  describe('#update') do
    it('lets you update stylists in the database') do
      stylist = Stylist.new({:name => "Curly Shirley", :id => nil})
      stylist.save()
      stylist.update({:name => "Perma Polly"})
      expect(stylist.name()).to(eq("Perma Polly"))
    end
    it('lets you add a client to an stylist') do
      client = Client.new({:name => 'Overdo Dawn', :id => nil})
      client.save()
      stylist = Stylist.new({:name => 'Curly Shirley', :id => nil})
      stylist.save()
      stylist.update({:client_ids => [client.id()]})
      expect(stylist.clients()).to(eq([client]))
    end
  end

  describe('#clients') do
    it('returns all the clients of a stylist') do
      client = Client.new({:name => 'Overdo Dawn', :id => nil})
      client.save()
      client2 = Client.new({:name => 'Dreaded Olive', :id => nil})
      client2.save()
      stylist = Stylist.new({:name => 'Wacky Wanda', :id => nil})
      stylist.save()
      # not sure about :client_ids - see library
      stylist.update(:client_ids => [client.id()])
      stylist.update(:client_ids => [client2.id()])
      expect(stylist.clients()).to(eq([client, client2]))
    end
  end

  describe('#delete') do
    it('lets you delete an stylist from the database') do
      stylist = Stylist.new({:name => "Herman Melville", :id => nil})
      stylist.save()
      stylist2 = Stylist.new({:name => 'Jules Verne', :id => nil})
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end
  end

end
