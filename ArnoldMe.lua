-- List of sound files
local soundFiles = {
    "Interface/AddOns/ArnoldMe/sounds/Astalavista.ogg",
    "Interface/AddOns/ArnoldMe/sounds/Bastard.ogg",
    "Interface/AddOns/ArnoldMe/sounds/Bleeds.ogg",
    "Interface/AddOns/ArnoldMe/sounds/ComeWithMe.ogg",
    "Interface/AddOns/ArnoldMe/sounds/Crush.ogg",
    "Interface/AddOns/ArnoldMe/sounds/DontKnow.ogg",
    "Interface/AddOns/ArnoldMe/sounds/Fired.ogg",
    "Interface/AddOns/ArnoldMe/sounds/GetToTheChoppa.ogg",
    "Interface/AddOns/ArnoldMe/sounds/IllBeBack.ogg",
    "Interface/AddOns/ArnoldMe/sounds/Laugh.ogg",
    "Interface/AddOns/ArnoldMe/sounds/NoProblemo.ogg",
    "Interface/AddOns/ArnoldMe/sounds/RealQuaid.ogg",
    "Interface/AddOns/ArnoldMe/sounds/SkyNet.ogg",
    "Interface/AddOns/ArnoldMe/sounds/Spine.ogg",
    "Interface/AddOns/ArnoldMe/sounds/StopWhining.ogg",
    "Interface/AddOns/ArnoldMe/sounds/SubZero.ogg",
    "Interface/AddOns/ArnoldMe/sounds/Trees.ogg",
    "Interface/AddOns/ArnoldMe/sounds/Vacation.ogg",
    "Interface/AddOns/ArnoldMe/sounds/Victor.ogg",
    "Interface/AddOns/ArnoldMe/sounds/Wizard.ogg"
}

-- Function to play a random sound
local function ArnoldMe_PlayRandom()
    local sound = soundFiles[math.random(#soundFiles)]
    PlaySoundFile(sound, "Master") -- Plays on master sound channel
end

-- Create UI Button
local button = CreateFrame("Button", "ArnoldMeButton", UIParent, "UIPanelButtonTemplate")
button:SetSize(100, 40)
button:SetText("Arnold me!")
button:SetPoint("CENTER")
button:SetMovable(true)
button:EnableMouse(true)
button:RegisterForDrag("LeftButton")
button:SetScript("OnDragStart", button.StartMoving)
button:SetScript("OnDragStop", button.StopMovingOrSizing)
button:SetScript("OnClick", ArnoldMe_PlayRandom)

-- Slash command to toggle the button visibility
SLASH_ARNOLDME1, SLASH_ARNOLDME2 = "/ArnoldMe", "/tam"
SlashCmdList["ARNOLDME"] = function()
    if button:IsShown() then
        button:Hide()
    else
        button:Show()
    end
end