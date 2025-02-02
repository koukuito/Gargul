---@type GL
local _, GL = ...;

local Overview = GL.Interface.Settings.Overview; ---@type SettingsOverview

---@class GeneralSettings
GL.Interface.Settings.General = {
    description = "Gargul is a utility add-on that ads quality of life features for raiders, master looters and raid leaders. Gargul can be used together with SoftRes (softres.it) and TMB (thatsmybis.com) to create a hassle free raiding experience.\n\nCheck the various sections on the left-hand side of this window or visit our Wiki/Discord to get started!",
    wikiUrl = "https://github.com/papa-smurf/Gargul/wiki",
};
local General = GL.Interface.Settings.General; ---@type GeneralSettings

---@return void
function General:draw(Parent)
    GL:debug("GeneralSettings:draw");

    local MoreInfoLabel = GL.AceGUI:Create("Label");
    MoreInfoLabel:SetText("For personal support or getting involved be sure to check out our Discord as well:\n");
    MoreInfoLabel:SetFontObject(_G["GameFontNormal"]);
    MoreInfoLabel:SetFullWidth(true);
    Parent:AddChild(MoreInfoLabel);

    local WikiUrlBox = GL.AceGUI:Create("EditBox");
    WikiUrlBox:DisableButton(true);
    WikiUrlBox:SetHeight(20);
    WikiUrlBox:SetFullWidth(true);
    WikiUrlBox:SetText("https://discord.gg/D3mDhYPVzf");
    Parent:AddChild(WikiUrlBox);

    local HorizontalSpacer = GL.AceGUI:Create("SimpleGroup");
    HorizontalSpacer:SetLayout("FILL");
    HorizontalSpacer:SetFullWidth(true);
    HorizontalSpacer:SetHeight(20);
    Parent:AddChild(HorizontalSpacer);

    local Checkboxes = {
        {
            label = "Welcome message",
            description = "Enable or disable the Gargul welcome message",
            setting = "welcomeMessage",
        },
        {
            label = "Fix master looter UI",
            description = "The master loot window in the native Blizzard UI generates an error that prevents you from right-clicking target frames etc. This fixes that! (Discovered by Kirsia-Dalaran here https://bit.ly/3tc8nvw)",
            setting = "fixMasterLootWindow",
        },
        {
            label = "No sounds",
            description = "Checking this will make sure that Gargul will never play any sounds",
            setting = "noSounds",
        },
        {
            label = "No messages",
            description = "Checking this will make sure that Gargul will never post any messages in the various chat channels. Keep in mind that you will still see debug messages, warnings or other messages that are solely visible to you",
            setting = "noMessages",
        },
        {
            label = "Enable Minimap Icon",
            description = "This setting enables the minimap icon that allows quick access to Gargul or the Gargul importer",
            setting = "showMinimapButton",
            callback = function()
                GL.MinimapButton:drawOrHide();
            end,
        },
        {
            label = "Experimental: enable debug mode",
            description = "Checking this will enable debug mode, showing debug info in your chatbox. This is only meant for developers actively working on the Gargul add-on",
            setting = "debugModeEnabled",
        },
    };

    Overview:drawCheckboxes(Checkboxes, Parent);
end

GL:debug("Interface/Settings/General.lua");