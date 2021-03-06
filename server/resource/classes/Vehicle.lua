Vehicle = inherit(DbClass,"Vehicle")

Vehicle.tableName = "vehicle"

Vehicle:int("model")
Vehicle:position()
Vehicle:rotation()
Vehicle:foreign("owner")

function Vehicle:dataConstructor(success)
	if success then
		self:createElement()
	else
		outputDebugString("Failed to load vehicle")
	end
end

function Vehicle:newConstructor(model,x,y,z,rx,ry,rz)
	self.model = model
	self.x, self.y, self.z = x, y, z
	self.rx, self.ry, self.rz = rx, ry, rz
	self:createElement()
end

function Vehicle:destructor()
	self.x, self.y, self.z = getElementPosition(self.element)
	self.rx, self.ry, self.rz = getElementRotation(self.element)
	self.model = getElementModel(self.element)
	self:save()
	destroyElement(self.element)
end

function Vehicle:createElement()
	self.element = createVehicle(self.model,self.x,self.y,self.z,self.rx,self.ry,self.rz)
end
