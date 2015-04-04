require_relative 'todo'

class Console
  
  def initialize()
    @todo = Todo.new()
  end
  
  def wait()
    @todo.load_items()
    @todo.show_items()
    
    while true
	commands_text = %q(
Commands:
 - Show
 - Add
 - Remove
			)
      
	puts commands_text
	cmd = gets.chomp.downcase
    
	if cmd == "show"
	  @todo.show_items()
	elsif cmd == "add"
	  add_item_dialog()
	elsif cmd == "remove"
	  remove_item_dialog()
	end
    end

  end
  
  def add_item_dialog()
    puts "Enter item's description"
    desc = gets.chomp
    @todo.add_item(desc)
    puts "#{desc} added to your to-do list"
  end
  
  def remove_item_dialog()
    @todo.show_items()
    puts "Enter the ID of the item you want to remove"
    id = gets.chomp
    id = Integer(id)
    desc = @todo.get_item_desc_by_id(id - 1)
    @todo.remove_item(id)
    puts "Item '#{desc}' has been removed"
  end

  

end

console = Console.new()
console.wait()