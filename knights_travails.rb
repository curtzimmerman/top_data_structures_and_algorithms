class Square
	attr_accessor :location, :parent
	def initialize ( args = {} )
		@location = args.fetch(:location, [0,0])
		@parent = args.fetch(:parent, nil)
	end

	def parents
		list_of_moves = []
		target = self
		while target.parent do
			list_of_moves << target.location
			target = target.parent
		end
		list_of_moves << target.location
		return list_of_moves.reverse
	end
end

def knight_moves( begin_loc, end_loc )
	begin_square = Square.new(location: begin_loc)
	queue = [begin_square]
	while queue.empty? == false do
		target = queue.shift
		return target.parents if end_loc == target.location
		queue = queue + valid_moves(target)
	end
end

def valid_moves ( square )
	moves = [ [1,2], [1,-2], [2,1], [2,-1], [-1,2], [-1,-2], [-2, 1], [-2, -1] ]
	possible_moves = []
	moves.each do |move|
		new_square = Square.new(location: [square.location[0] + move[0], square.location[1] + move[1]])
		if within_range(new_square.location[0]) && within_range(new_square.location[1])
			new_square.parent = square
			possible_moves << new_square
		end
	end
	return possible_moves
end

def within_range ( num )
	return false if num >= 8
	return false if num < 0
	return true

end

puts knight_moves([2,3], [7,4]).inspect

