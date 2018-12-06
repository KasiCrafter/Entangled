IM_WorldMenu = {}

function IM_WorldMenu:create(screen, uiRoot)
	--Ui.new(self)
	local pane = Ui()
		:widthpx(400)
		:decorate({ DecoFrame() })
		:addTo(uiRoot)

	pane.draw = function(self, screen)
		self.visible = IM_WorldMenu.visible or false
		--if sdlext.isMainMenu then self.visible = false end
		Ui.draw(self, screen)
	end

	pane:decorate({ DecoFrameHeader(), DecoFrame() })

	LOG("boi")

	return pane

end


return IM_WorldMenu