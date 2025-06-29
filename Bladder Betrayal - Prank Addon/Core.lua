-- Function to send a custom emote message in chat
local function SendCustomEmote()
    -- Replace "YOUR_CUSTOM_EMOTE_HERE" with your desired emote text
    local customEmoteText = "suddenly crosses their legs and starts to do a frantic little dance. But it's too late... they've had an accident. A dark stain spreads as they blush bright red, realizing they've just peed their pants in public."
    
    -- Play a custom sound file (place your sound file in the addon's Sounds folder)
    PlaySoundFile("Interface\\AddOns\\Bladder Betrayal - Prank Addon\\Sounds\\pee-shamesound.ogg")
    
    -- Send the emote message to the emote channel
    SendChatMessage(customEmoteText, "EMOTE")
end

-- Timer variables
local emoteTimer = nil
local EMOTE_INTERVAL = 600 -- 10 minutes in seconds

-- Function to start the repeating timer
local function StartEmoteTimer()
    -- Create a new repeating timer that triggers every 10 minutes
    emoteTimer = C_Timer.NewTicker(EMOTE_INTERVAL, function()
        SendCustomEmote()
    end)
end

-- Auto-start the timer when addon loads
local frame = CreateFrame("Frame")
frame:RegisterEvent("PLAYER_LOGIN")
frame:SetScript("OnEvent", function(self, event)
    if event == "PLAYER_LOGIN" then
        -- Wait 5 seconds after login to start the timer
        C_Timer.After(5, function()
            StartEmoteTimer()
        end)
    end
end)
