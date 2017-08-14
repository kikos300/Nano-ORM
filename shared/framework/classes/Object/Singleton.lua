Singleton = inherit(Object)

function Singleton:new()
	if self.instance then
		return self.instance
	end
	-- set instance to true to prevent stack overflow
	local instance = newSingleton(self)
	self.instance = instance
	callConstructors(instance,self)
	return instance
end

function Singleton:delete()
	self.class.instance = nil
	delete(self)

end
