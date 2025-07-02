--------------------------------------------------------------------------------
-- Example
--------------------------------------------------------------------------------

local function example()
    hs.eventtap.leftClick({x = 100, y = 150})
    hs.timer.usleep(200000) -- 200ms
    hs.eventtap.keyStrokes("Hello from Hammerspoon!")
end

-- hs.hotkey.bind({"ctrl", "alt", "cmd"}, "W", example)

--------------------------------------------------------------------------------
-- Recording and replay
--     Start/Stop recording with Ctrl + Alt + Cmd + S
--     Replay recorded events with Ctrl + Alt + Cmd + R
--------------------------------------------------------------------------------

local isRecording = false
local cooldownUntil = 0
local cooldownSeconds = 0.1
local recordedEvents = {}

local eventTypes = {
    [hs.eventtap.event.types.leftMouseDown] = "leftMouseDown",
    [hs.eventtap.event.types.leftMouseUp] = "leftMouseUp",
    [hs.eventtap.event.types.rightMouseDown] = "rightMouseDown",
    [hs.eventtap.event.types.rightMouseUp] = "rightMouseUp",
    [hs.eventtap.event.types.keyDown] = "keyDown",
    [hs.eventtap.event.types.keyUp] = "keyUp",
}

local eventTypeKeys = {}
for k, _ in pairs(eventTypes) do
    table.insert(eventTypeKeys, k)
end

local eventWatcher = hs.eventtap.new(eventTypeKeys, function(event)
    local eventType = event:getType()
    local typeName = eventTypes[eventType] or tostring(eventType)
    local position = event:location()
    local keyCode = event:getKeyCode()
    local characters = event:getCharacters()
    local flags = event:getFlags() or {}

    local modifiers = {}
    for mod, enabled in pairs(flags) do
        if enabled then table.insert(modifiers, mod) end
    end

    table.insert(recordedEvents, {
        type = typeName,
        x = position.x,
        y = position.y,
        keyCode = keyCode,
        characters = characters,
        modifiers = modifiers,
    })

    return false -- Pass through event
end)

local function printRecordedEvents()
    print("-- === Recorded Macro ===")
    print("local events = {")
    for _, e in ipairs(recordedEvents) do
        if e.type:find("Mouse") then
            print(string.format("  {type=%q, action='mouse', x=%.0f, y=%.0f},", e.type, e.x, e.y))
        elseif e.type:find("key") then
            local quotedMods = {}
            for _, mod in ipairs(e.modifiers) do
                table.insert(quotedMods, string.format("%q", mod))
            end
            local modsStr = "{" .. table.concat(quotedMods, ", ") .. "}"
            print(string.format("  {type=%q, action='key', keyCode=%d, chars=%q, mods=%s},", e.type, e.keyCode or -1, e.characters or "", modsStr))
        end
    end
    print("}\n")
    print([[
-- Playback function
for _, e in ipairs(events) do
    local t = hs.eventtap.event.types
    if e.action == 'mouse' then
        hs.eventtap.event.newMouseEvent(t[e.type], {x = e.x, y = e.y}):post()
    elseif e.action == 'key' then
        hs.eventtap.event.newKeyEvent(e.mods, e.chars, t[e.type] == t.keyDown):post()
    end
    hs.timer.usleep(10000)
end
]])
    print("-- === End Macro ===")
end

local function replayEvents()
    local t = hs.eventtap.event.types
    for _, e in ipairs(recordedEvents) do
        if e.type:find("Mouse") then
            hs.eventtap.event.newMouseEvent(t[e.type], {x = e.x, y = e.y}):post()
        elseif e.type == "keyDown" or e.type == "keyUp" then
            hs.eventtap.event.newKeyEvent(e.modifiers or {}, e.keyCode or 0, t[e.type] == t.keyDown):post()
        end
        hs.timer.usleep(10000) -- 10ms
    end
end

-- Toggle recording on Ctrl + Alt + Cmd + S
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "S", function()
    if isRecording then
        eventWatcher:stop()
        isRecording = false

        -- Remove first and last events (usually the toggle hotkey)
        if #recordedEvents >= 2 then
            table.remove(recordedEvents, 1)               -- Remove first
            table.remove(recordedEvents, #recordedEvents) -- Remove last
        end

        hs.alert("Recording stopped")
        printRecordedEvents()
    else
        recordedEvents = {}
        eventWatcher:start()
        isRecording = true
        hs.alert("Recording started")
    end
end)

-- Replay on Ctrl + Alt + Cmd + R
hs.hotkey.bind({"ctrl", "alt", "cmd"}, "R", function()
    if isRecording then
        return
    end

    local now = hs.timer.secondsSinceEpoch()
    if now < cooldownUntil then
        hs.alert(string.format("Replay on cooldown (%.1fs)", cooldownUntil - now))
        return
    end

    if #recordedEvents == 0 then
        hs.alert("No recorded events to replay")
        return
    end

    replayEvents()
    cooldownUntil = hs.timer.secondsSinceEpoch() + cooldownSeconds
end)
