-- Kebab mod Copyright (C) 2017 Gabriel Pérez-Cerezo
--
--
-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU Affero General Public License as
-- published by the Free Software Foundation, either version 3 of the
-- License, or (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU Affero General Public License for more details.

-- You should have received a copy of the GNU Affero General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.


kebab = {}
minetest.register_craftitem("kebab:kebab_meat", {
	description = "Kebab Meat",
	inventory_image = "kebab_meat.png",
})
minetest.register_craftitem("kebab:doner_kebab", {
	description = "Kebab Sandwich",
	inventory_image = "kebab_doener.png",
	on_use = minetest.item_eat(8),
})
kebab.cut_kebab = function (pos)
   local node = minetest.get_node(pos)
   number = node.name:match("%d")
   if tonumber(number) > 1 then
      node.name = "kebab:kebab_"..number-1
      minetest.swap_node(pos, node)
      return "kebab:kebab_meat"
   elseif tonumber(number) == 1 then
      minetest.set_node(pos, {name="air"})
      return "kebab:kebab_meat"
   end
end

local function player_cut_kebab(pos, node, player)
   if player:get_wielded_item():get_name():match("sword") and player:get_inventory():room_for_item("main", "kebab:kebab_meat") then
      player:get_inventory():add_item("main", kebab.cut_kebab(pos))
   end

end


minetest.register_node("kebab:kebab_4", {
	tiles = {
		"kebab_kebab.png",
		"kebab_kebab.png",
		"kebab_kebab.png",
		"kebab_kebab.png",
		"kebab_kebab.png",
		"kebab_kebab.png"
	},
	description = "Kebab rotisserie",
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}, -- NodeBox1
			{-0.1875, -0.375, -0.1875, 0.1875, 0.375, 0.1875}, -- NodeBox2
			{-0.3125, -0.0625, -0.3125, 0.3125, 0.375, 0.3125}, -- NodeBox3
			{-0.25, -0.25, -0.25, 0.25, 0.375, 0.25}, -- NodeBox4
		}
	},
	on_punch = player_cut_kebab,
})
minetest.register_node("kebab:kebab_3", {
	tiles = {
		"kebab_kebab.png",
		"kebab_kebab.png",
		"kebab_kebab.png",
		"kebab_kebab.png",
		"kebab_kebab.png",
		"kebab_kebab.png"
	},
	drawtype = "nodebox",
	description = "Kebab rotisserie",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}, -- NodeBox1
			{-0.1875, -0.375, -0.1875, 0.1875, 0.375, 0.1875}, -- NodeBox2
--			{-0.3125, -0.0625, -0.3125, 0.3125, 0.375, 0.3125}, -- NodeBox3
			{-0.25, -0.25, -0.25, 0.25, 0.375, 0.25}, -- NodeBox4
		}
	},
	on_punch = player_cut_kebab,
})
minetest.register_node("kebab:kebab_2", {
	tiles = {
		"kebab_kebab.png",
		"kebab_kebab.png",
		"kebab_kebab.png",
		"kebab_kebab.png",
		"kebab_kebab.png",
		"kebab_kebab.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	description = "Kebab rotisserie",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}, -- NodeBox1
			{-0.1875, -0.25, -0.1875, 0.1875, 0.375, 0.1875}, -- NodeBox2
			{-0.125, -0.375, -0.125, 0.125, 0.375, 0.125}, -- NodeBox2
--			{-0.3125, -0.0625, -0.3125, 0.3125, 0.375, 0.3125}, -- NodeBox3
--			{-0.25, -0.25, -0.25, 0.25, 0.375, 0.25}, -- NodeBox4
		}
	},
	on_punch = player_cut_kebab,
})
minetest.register_node("kebab:kebab_1", {
	tiles = {
		"kebab_kebab.png",
		"kebab_kebab.png",
		"kebab_kebab.png",
		"kebab_kebab.png",
		"kebab_kebab.png",
		"kebab_kebab.png"
	},
	drawtype = "nodebox",
	description = "Kebab rotisserie",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, -0.5, -0.0625, 0.0625, 0.5, 0.0625}, -- NodeBox1
			{-0.125, -0.375, -0.125, 0.125, 0.375, 0.125}, -- NodeBox2
--			{-0.3125, -0.0625, -0.3125, 0.3125, 0.375, 0.3125}, -- NodeBox3
--			{-0.25, -0.25, -0.25, 0.25, 0.375, 0.25}, -- NodeBox4
		}
	},
	on_punch = player_cut_kebab,
})

minetest.register_craft({
      output = "kebab:doner_kebab",
      type = "shapeless",
      recipe = {"kebab:kebab_meat", "farming:bread"}

})
minetest.register_craft({
      output = "kebab:kebab_4",
      recipe = {{"", "default:stick", ""},
	 {"", "mobs:meat", ""},
	 {"", "default:stick", ""}}

})
