local built_lifetime = ((settings.startup["eb-built-overlay-seconds"]
    and settings.startup["eb-built-overlay-seconds"].value) or 10) * 60
local selected_lifetime = ((settings.startup["eb-selected-overlay-seconds"]
    and settings.startup["eb-selected-overlay-seconds"].value) or 3) * 60

local function is_entangled_underground_belt(entity)
    return entity
        and entity.valid
        and entity.type == "underground-belt"
        and entity.name
        and string.sub(entity.name, 1, 3) == "eb-"
end

local function draw_overlay(entity, ttl, players)
    return rendering.draw_sprite {
        sprite = "eb-white-shuffle",
        surface = entity.surface,
        target = { entity = entity },
        x_scale = 0.5,
        y_scale = 0.5,
        time_to_live = ttl,
        players = players
    }
end

if built_lifetime > 0 then
    script.on_event(defines.events.on_built_entity, function(event)
        local entity = event.entity
        if not is_entangled_underground_belt(entity) then return end

        local players = nil
        if event.player_index then
            players = { event.player_index }
        end

        draw_overlay(entity, built_lifetime, players)
    end)
end

if selected_lifetime > 0 then
    script.on_event(defines.events.on_selected_entity_changed, function(event)
        local player = game.get_player(event.player_index)
        if not (player and player.valid) then return end

        local entity = player.selected
        if not entity or not is_entangled_underground_belt(entity) then return end

        draw_overlay(entity, selected_lifetime, { player.index })

        local mate = entity.neighbours
        if is_entangled_underground_belt(mate) then
            draw_overlay(mate, selected_lifetime, { player.index })
        end
    end)
end
