class Stylist
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:name, nil)
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylist_array = []
    returned_stylists.each() do |stylist|
      current_stylist = Stylist.new(:name => stylist.fetch('name'), :id => stylist.fetch('id'))
      stylists_array.push(current_stylist)
    end
    stylists_array
  end

  # define_method(:==) do |another_stylist|
  #   self.name().==(another_stylist._name()).&
  # end

  define_singleton_method(:find) do |stylist_id|
    stylist_id_found = DB.exec("SELECT * FROM stylists WHERE id = '#{stylist_id}';").first()
    found_stylist = Stylist.new(:name => stylist_id_found.fetch('name'), :id => stylist_id_found.fetch('id'))
    found_stylist
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name)
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{self.id()};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
  end

end
