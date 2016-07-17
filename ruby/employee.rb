class Employee
	attr_accessor :free, :busy, :name, :my_boss

	def initialize(name, my_boss=nil)
		@name = name
		@my_boss = my_boss
	end

	def accept
		puts "Hi! This is #{name}"
	end

	def acceptable?
		raise 'NotImprementedError'
	end

	def call
		if acceptable?
  		accept
		else
		  my_boss.call
		end
	end
end

class Acceptor < Employee
	def acceptable?
		free?
	end

	def free?
		@free
	end
end

class Manageer < Employee
	def acceptable?
		free? && busy?
	end

	def free?
		@free
	end

	def busy?
		@busy
	end
end

class Director < Employee
	def acceptable?
		free? && busy?
	end

	def free?
		@free
	end

	def busy?
		@busy
	end

	def call
		if acceptable?
  		accept
		else
			raise NotResourceError
		end
	end
end

director  = Director.new('jeel')
manager   = Manageer.new('Emi',  director)
acceptor1 = Acceptor.new('ken',  manager)
acceptor2 = Acceptor.new('miki', manager)

# acceptor2.free = true
manager.free = false
manager.busy = false
director.free = true
director.busy = true

def dispatch_call(acceptors)
	free_employee = acceptors.find {|acceptor| acceptor.acceptable?}
	if free_employee
  	free_employee.call
	else
		acceptors.first.call
	end
end

dispatch_call([acceptor1, acceptor2])


