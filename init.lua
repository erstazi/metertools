local version = "0.2"

function print_pos(pos)
  return "("..pos.x..","..pos.y..","..pos.z..")"
end


function photometer_handler(item, player, pointed_thing)
  if pointed_thing ~= nil then
    local pos = pointed_thing.above

    if pos ~= nil then
      local current_light = minetest.get_node_light(pos)

      local player_name = player.get_player_name(player)

      minetest.chat_send_player(player_name, print_pos(pos) .. " - Light Level: " .. current_light)
    end
  end

  return false
end

minetest.register_tool("metertools:photometer", {
  description = "Photometer",
  inventory_image = "photometer.png",
  wield_image = "photometer.png",
  on_use = function(itemstack, player_name, pointed_thing)
    photometer_handler(itemstack, player_name, pointed_thing)
  end,
})

minetest.register_craft({
  output = "metertools:photometer",
  recipe = {
    {"", "default:obsidian_glass", ""},
    {"", "default:diamond", ""},
    {"", "default:stick", ""}
  },
})

print("Loaded mod metertools version: " .. version)
