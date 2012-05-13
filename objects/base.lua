--[[------------------------------------------------
	-- L�VE Frames --
	-- By Nikolai Resokav --
--]]------------------------------------------------

-- base object
base = class("base")
base:include(loveframes.templates.default)

--[[---------------------------------------------------------
	- func: initialize()
	- desc: intializes the element
--]]---------------------------------------------------------
function base:initialize()
	
	-- width and height of the window
	local w, h = love.graphics.getWidth(), love.graphics.getHeight()
	
	self.type 		= "base"
	self.width 		= w
	self.height 	= h
	self.internal	= true
	self.children 	= {}

end

--[[---------------------------------------------------------
	- func: update(deltatime)
	- desc: updates the object
--]]---------------------------------------------------------
function base:update(dt)
	
	for k, v in ipairs(self.children) do
		v:update(dt)
	end

end

--[[---------------------------------------------------------
	- func: draw()
	- desc: draws the object
--]]---------------------------------------------------------
function base:draw()

	loveframes.drawcount = loveframes.drawcount + 1
	self.draworder = loveframes.drawcount
	
	for k, v in ipairs(self.children) do
		v:draw()
	end

end

--[[---------------------------------------------------------
	- func: mousepressed(x, y, button)
	- desc: called when the player presses a mouse button
--]]---------------------------------------------------------
function base:mousepressed(x, y, button)

	if self.visible == false then
		return
	end
	
	if self.children then
		for k, v in ipairs(self.children) do
			v:mousepressed(x, y, button)
		end
	end
	
	if self.internals then
		for k, v in ipairs(self.internals) do
			v:mousepressed(x, y, button)
		end
	end

end

--[[---------------------------------------------------------
	- func: mousereleased(x, y, button)
	- desc: called when the player releases a mouse button
--]]---------------------------------------------------------
function base:mousereleased(x, y, button)

	if self.visible == false then
		return
	end
	
	if self.children then
		for k, v in ipairs(self.children) do
			v:mousereleased(x, y, button)
		end
	end
	
	if self.internals then
		for k, v in ipairs(self.internals) do
			v:mousereleased(x, y, button)
		end
	end

end

--[[---------------------------------------------------------
	- func: keypressed(key)
	- desc: called when the player presses a key
--]]---------------------------------------------------------
function base:keypressed(key, unicode)

	if self.visible == false then
		return
	end
	
	if self.children then
		for k, v in ipairs(self.children) do
			v:keypressed(key, unicode)
		end
	end
	
	if self.internals then
		for k, v in ipairs(self.internals) do
			v:keypressed(key, unicode)
		end
	end

end

--[[---------------------------------------------------------
	- func: keyreleased(key)
	- desc: called when the player releases a key
--]]---------------------------------------------------------
function base:keyreleased(key)

	if self.visible == false then
		return
	end
	
	if self.children then
		for k, v in ipairs(self.children) do
			v:keyreleased(key)
		end
	end
	
	if self.internals then
		for k, v in ipairs(self.internals) do
			v:keyreleased(key)
		end
	end

end



--[[---------------------------------------------------------
	- func: SetPos(x, y)
	- desc: sets the object's position
--]]---------------------------------------------------------
function base:SetPos(x, y)

	local parent = self.parent
	
	if parent == loveframes.base then
		self.x = x
		self.y = y
	else
		self.staticx = x
		self.staticy = y
	end
	
end

--[[---------------------------------------------------------
	- func: SetX(x)
	- desc: sets the object's x position
--]]---------------------------------------------------------
function base:SetX(x)

	local parent = self.parent
	
	if parent == loveframes.base then
		self.x = x
	else
		self.staticx = x
	end

end

--[[---------------------------------------------------------
	- func: SetY(y)
	- desc: sets the object's y position
--]]---------------------------------------------------------
function base:SetY(y)

	local parent = self.parent
	
	if parent == loveframes.base then
		self.y = y
	else
		self.staticy = y
	end
	
end

--[[---------------------------------------------------------
	- func: GetPos()
	- desc: gets the object's position
--]]---------------------------------------------------------
function base:GetPos()

	return self.x, self.y
	
end

--[[---------------------------------------------------------
	- func: GetX()
	- desc: gets the object's x position
--]]---------------------------------------------------------
function base:GetX()

	return self.x
	
end

--[[---------------------------------------------------------
	- func: GetY()
	- desc: gets the object's y position
--]]---------------------------------------------------------
function base:GetY()

	return self.y
	
end

--[[---------------------------------------------------------
	- func: GetStaticPos()
	- desc: gets the object's static position
--]]---------------------------------------------------------
function base:GetStaticPos()

	return self.staticx, self.staticy
	
end

--[[---------------------------------------------------------
	- func: GetStaticX()
	- desc: gets the object's static x position
--]]---------------------------------------------------------
function base:GetStaticX()

	return self.staticx
	
end

--[[---------------------------------------------------------
	- func: GetStaticY()
	- desc: gets the object's static y position
--]]---------------------------------------------------------
function base:GetStaticY()

	return self.staticy
	
end

--[[---------------------------------------------------------
	- func: Center()
	- desc: centers the object in the game window or in
			it's parent if it has one
--]]---------------------------------------------------------
function base:Center()

	local parent = self.parent
	
	if parent == loveframes.base then
		local width = love.graphics.getWidth()
		local height = love.graphics.getHeight()
		
		self.x = width/2 - self.width/2
		self.y = height/2 - self.height/2
	else
		local width = parent.width
		local height = parent.height
		
		self.staticx = width/2 - self.width/2
		self.staticy = height/2 - self.height/2
	end
	
end

--[[---------------------------------------------------------
	- func: SetSize(width, height)
	- desc: sets the object's size
--]]---------------------------------------------------------
function base:SetSize(width, height)

	self.width = width
	self.height = height
	
end

--[[---------------------------------------------------------
	- func: SetWidth(width)
	- desc: sets the object's width
--]]---------------------------------------------------------
function base:SetWidth(width)

	self.width = width
	
end

--[[---------------------------------------------------------
	- func: SetHeight(height)
	- desc: sets the object's height
--]]---------------------------------------------------------
function base:SetHeight(height)

	self.height = height
	
end

--[[---------------------------------------------------------
	- func: GetSize()
	- desc: gets the object's size
--]]---------------------------------------------------------
function base:GetSize()

	return self.width, self.height
	
end

--[[---------------------------------------------------------
	- func: GetWidth()
	- desc: gets the object's width
--]]---------------------------------------------------------
function base:GetWidth()

	return self.width
	
end

--[[---------------------------------------------------------
	- func: GetHeight()
	- desc: gets the object's height
--]]---------------------------------------------------------
function base:GetHeight()

	return self.height
	
end

--[[---------------------------------------------------------
	- func: SetVisible(bool)
	- desc: sets the object's visibility
--]]---------------------------------------------------------
function base:SetVisible(bool)

	local children = self.children
	local internals = self.internals
	
	self.visible = bool

	if children then
		
		for k, v in ipairs(children) do
			v:SetVisible(bool)
		end
		
	end
	
	if internals then
		
		for k, v in ipairs(internals) do
			v:SetVisible(bool)
		end
		
	end
	
end

--[[---------------------------------------------------------
	- func: GetVisible()
	- desc: gets the object's visibility
--]]---------------------------------------------------------
function base:GetVisible()

	return self.visible
	
end

--[[---------------------------------------------------------
	- func: SetParent(parent)
	- desc: sets the object's parent
--]]---------------------------------------------------------
function base:SetParent(parent)

	local tparent = parent
	local cparent = self.parent
	local ptype = tparent.type
	local stype = self.type
	
	if ptype ~= "frame" and ptype ~= "panel" and ptype ~= "list" then
		return
	end
	
	if stype == "frame" then
		return
	end
	
	self:Remove()
	self.parent = tparent
	
	table.insert(tparent.children, self)

end

--[[---------------------------------------------------------
	- func: GetParent()
	- desc: gets the object's parent
--]]---------------------------------------------------------
function base:GetParent()

	local parent = self.parent
	
	return parent
	
end

--[[---------------------------------------------------------
	- func: Remove()
	- desc: removes the object
--]]---------------------------------------------------------
function base:Remove()
	
	if self.parent.internals then
	
		for k, v in ipairs(self.parent.internals) do
			if v == self then
				table.remove(self.parent.internals, k)
			end
		end
		
	end
	
	for k, v in ipairs(self.parent.children) do
		if v == self then
			table.remove(self.parent.children, k)
		end
	end
	
end

--[[---------------------------------------------------------
	- func: SetClickBounds(x, y, width, height)
	- desc: sets a boundary box for the object's collision
			detection
--]]---------------------------------------------------------
function base:SetClickBounds(x, y, width, height)

	self.clickbounds = {x = x, y = y, width = width, height = height}
	
	if self.internals then
		for k, v in ipairs(self.internals) do
			v:SetClickBounds(x, y, width, height)
		end
	end
	
	if self.children then
		for k, v in ipairs(self.children) do
			v:SetClickBounds(x, y, width, height)
		end
	end
	
end

--[[---------------------------------------------------------
	- func: GetClickBounds()
	- desc: gets the boundary box for the object's collision
			detection
--]]---------------------------------------------------------
function base:GetClickBounds()

	return self.clickbounds
	
end

--[[---------------------------------------------------------
	- func: RemoveClickBounds()
	- desc: removes the collision detection boundary for the 
			object 
--]]---------------------------------------------------------
function base:RemoveClickBounds()

	self.clickbounds = nil
	
	if self.internals then
		for k, v in ipairs(self.internals) do
			v:RemoveClickBounds()
		end
	end
	
	if self.children then
		for k, v in ipairs(self.children) do
			v:RemoveClickBounds()
		end
	end
	
end

--[[---------------------------------------------------------
	- func: InClickBounds()
	- desc: checks if the mouse is inside the object's
			collision detection boundaries
--]]---------------------------------------------------------
function base:InClickBounds()

	local x, y = love.mouse.getPosition()
	local bounds = self.clickbounds
	
	if bounds then
	
		local col = loveframes.util.BoundingBox(x, bounds.x, y, bounds.y, 1, bounds.width, 1, bounds.height)
		return col
		
	else
		
		return false
	
	end
	
end

--[[---------------------------------------------------------
	- func: IsTopCollision()
	- desc: checks if the object the top most object in a
			collision table
--]]---------------------------------------------------------
function base:IsTopCollision()

	local cols = loveframes.util.GetCollisions()
	local draworder = self.draworder
	local top = true
	
	-- loop through the object's parent's children
	for k, v in ipairs(cols) do
		
		if v.draworder > draworder then
			top = false
		end
			
	end
	
	return top
		
end

--[[---------------------------------------------------------
	- func: GetBaseParent(object, t)
	- desc: finds the object's base parent
--]]---------------------------------------------------------
function base:GetBaseParent(t)
	
	local t = t or {}
	local parent
	
	if self.parent ~= loveframes.base then
		table.insert(t, self.parent)
		self.parent:GetBaseParent(t)
	end
	
	return t[#t]
	
end

--[[---------------------------------------------------------
	- func: CheckHover()
	- desc: checks to see if the object should be in a
			hover state
--]]---------------------------------------------------------
function base:CheckHover()
	
	local x, y = love.mouse.getPosition()
	local selfcol = loveframes.util.BoundingBox(x, self.x, y, self.y, 1, self.width, 1, self.height)
	local hoverobject = loveframes.hoverobject
	
	-- is the mouse inside the object?
	if selfcol == true then
		
		local top = self:IsTopCollision()
		
		if top == true then
			if hoverobject == false then
				self.hover = true
			else
				if hoverobject == self then
					self.hover = true
				else
					self.hover = false
				end
			end
		else
			self.hover = false
		end
	
		if self.clickbounds then
			if self:InClickBounds() == false then
				self.hover = false
			end
		end
	
	else
		
		self.hover = false
		
	end
	
	-- this chunk of code handles mouse enter and exit
	if self.hover == true then
	
		if self.calledmousefunc == false then
		
			if self.OnMouseEnter ~= nil then
				self.OnMouseEnter(self)
				self.calledmousefunc = true
			else
				self.calledmousefunc = true
			end
		
		end
		
	else
	
		if self.calledmousefunc == true then
			
			if self.OnMouseExit ~= nil then
				self.OnMouseExit(self)
				self.calledmousefunc = false
			else
				self.calledmousefunc = false
			end
			
		end
		
	end
	
end

--[[---------------------------------------------------------
	- func: GetHover()
	- desc: return if the object is in a hover state or not
--]]---------------------------------------------------------
function base:GetHover()

	return self.hover

end

--[[---------------------------------------------------------
	- func: GetChildren()
	- desc: returns the object's children
--]]---------------------------------------------------------
function base:GetChildren()

	if self.children then
		return self.children
	end
	
end

--[[---------------------------------------------------------
	- func: IsTopList()
	- desc: returns true if the object is the top most list
			object or false if not
--]]---------------------------------------------------------
function base:IsTopList()

	local cols = loveframes.util.GetCollisions()
	local children = self:GetChildren()
	local order = self.draworder
	local top = true
	local found = false
	
	local function IsChild(object)
	
		for k, v in ipairs(children) do
			if v == object then
				return true
			end
		end
		
		return false
	end
	
	for k, v in ipairs(cols) do
		if v == self then
			found = true
		else
			if v.draworder > order then
				if IsChild(v) ~= true then
					top = false
					break
				end
			end
		end
	end
	
	if found == false then
		top = false
	end
	
	return top
	
end

--[[---------------------------------------------------------
	- func: IsTopChild()
	- desc: returns true if the object is the top most child
			in it's parent's children table or false if not
--]]---------------------------------------------------------
function base:IsTopChild()

	local children = self.parent.children
	local num = #children
	
	if children[num] == self then
		return true
	else
		return false
	end
	
end

--[[---------------------------------------------------------
	- func: MoveToTop()
	- desc: moves the object to the top of it's parent's
			children table
--]]---------------------------------------------------------
function base:MoveToTop()

	self:Remove()
	table.insert(self.parent.children, self)
	
end

--[[---------------------------------------------------------
	- func: SetSkin(name)
	- desc: sets the object's skin
--]]---------------------------------------------------------
function base:SetSkin(name)

	self.skin = name
	
	if self.children then
	
		for k, v in ipairs(self.children) do
			v:SetSkin(name)
		end
		
	end
	
	if self.internals then
	
		for k, v in ipairs(self.internals) do
			v:SetSkin(name)
		end
		
	end
	
end

--[[---------------------------------------------------------
	- func: GetSkin(name)
	- desc: gets the object's skin
--]]---------------------------------------------------------
function base:GetSkin(name)

	return self.skin
	
end

--[[---------------------------------------------------------
	- func: SetAlwaysUpdate(bool)
	- desc: sets the object's skin
--]]---------------------------------------------------------
function base:SetAlwaysUpdate(bool)

	self.alwaysupdate = bool

end

--[[---------------------------------------------------------
	- func: GetAlwaysUpdate()
	- desc: gets whether or not the object will always update
--]]---------------------------------------------------------
function base:GetAlwaysUpdate()

	return self.alwaysupdate

end

--[[---------------------------------------------------------
	- func: SetRetainSize(bool)
	- desc: sets whether or not the object should retain it's
			size when another object tries to resize it
--]]---------------------------------------------------------
function base:SetRetainSize(bool)

	self.retainsize = bool
	
end

--[[---------------------------------------------------------
	- func: GetRetainSize()
	- desc: gets whether or not the object should retain it's
			size when another object tries to resize it
--]]---------------------------------------------------------
function base:GetRetainSize()
	
	return self.retainsize
	
end