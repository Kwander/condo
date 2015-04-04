require_relative "item"

class Todo
  
  def initialize()
    @items = []
  end
  
  def load_items()
    if File.file?("todo.txt")
      file = File.open("todo.txt")
    else
      target = open("todo.txt", 'w')
      target.close()
      file = File.open("todo.txt")
    end
      
    
    file.each do |line|
      line.slice! "\n"
      item = Item.new(line)
      @items.push(item)
    end
    
  end
  
  def get_item_desc_by_id(id)
    @items[id].desc
  end
  
  def show_items()
   puts "----------------"
   puts "      ITEMS     "
   puts "----------------"
   puts "ID  | Description"
   puts "\n"
   @items.each.with_index { |item, index| puts "[#{index+1}] | #{item.desc}" }
   puts "----------------"
  end
  
  def add_item(desc)
    item = Item.new(desc)
    @items.push(item)
    save_items()
  end
  
  def remove_item(index)
    @items.slice!(index - 1)
    save_items()
  end
  
  def save_items()
    target = open("todo.txt", 'w')
    target.truncate(0)
    puts "Writing changes"
    
    @items.each.with_index do |item, index|
      target.write(item.desc)
      target.write("\n")
    end
    
    target.close()
    
  end
  
end