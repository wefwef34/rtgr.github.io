local Library = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()

if not game:IsLoaded() then
    repeat task.wait() until game:IsLoaded()
end

if game.PlaceId == 1234 then
    Library:Notify({
        Title = "RINGTA",
        Content = "Get into a game first!",
        Icon = "star",
        Duration = 5
    })
    return
elseif game.PlaceId == 99567941238278 then

    local Services = {
        HttpService = game:GetService("HttpService"),
        Players = game:GetService("Players")
    }
    
    local Window = Library:CreateWindow({
        Title = "RINGTA",
        Author = "Ink Game",
        Icon = "star",
        Folder = "RINGTA",
        Theme = "Dark",
        Transparent = false,
        Size = UDim2.fromOffset(500, 350),
        HasOutline = false,
        ScrollBarEnabled = true
    })

    Window:EditOpenButton({
        Title = "Open RINGTA",
        Icon = "star",
        CornerRadius = UDim.new(0, 6),
        StrokeThickness = 2,
        Color = ColorSequence.new(Color3.fromRGB(200, 0, 255), Color3.fromRGB(0, 200, 255)),
        Draggable = true,
    })

    Window:DisableTopbarButtons({ "Fullscreen" })

    local Sections = {
        Base = Window:Section({
            Title = "Base",
            Opened = true,
        }),
        Games = Window:Section({
            Title = "Games",
            Opened = true,
        })
    }

    local Tabs = {
        Home = Sections.Base:Tab({
            Title = "Home",
            Icon = "house",
            Desc = "Set Up",
            ShowTabTitle = true 
        }),
        Updates = Sections.Base:Tab({
            Title = "Updates",
            Icon = "clipboard-list",
            Desc = "Latest Changes",
            ShowTabTitle = true 
        }),

        RedLightGreenLight = Sections.Games:Tab({
            Title = "Red Light Green Light",
            Icon = "traffic-cone",
            Desc = "First Game",
            ShowTabTitle = true 
        }),
        Honeycomb = Sections.Games:Tab({
            Title = "Honeycomb",
            Icon = "cookie",
            Desc = "Second Game",
            ShowTabTitle = true 
        }),
        LightsOut = Sections.Games:Tab({
            Title = "Lights Out",
            Icon = "utensils-crossed",
            Desc = "Third Game",
            ShowTabTitle = true 
        }),
        TugOfWar = Sections.Games:Tab({
            Title = "Tug Of War",
            Icon = "shell",
            Desc = "Fourth Game",
            ShowTabTitle = true 
        }),
        HideAndSeek = Sections.Games:Tab({
            Title = "Hide And Seek",
            Icon = "eye-off",
            Desc = "Fourth Game",
            ShowTabTitle = true 
        }),
        JumpRope = Sections.Games:Tab({
            Title = "Jump Rope",
            Icon = "wind",
            Desc = "Fifth Game",
            ShowTabTitle = true 
        }),
        GlassBridge = Sections.Games:Tab({
            Title = "Glass Bridge",
            Icon = "tally-4",
            Desc = "Sixth Game",
            ShowTabTitle = true 
        }),
        Rebel = Sections.Games:Tab({
            Title = "Rebel",
            Icon = "skull",
            Desc = "Rebel Ending",
            ShowTabTitle = true 
        }),
        Mingle = Sections.Games:Tab({
            Title = "Mingle",
            Icon = "tent",
            Desc = "Seventh Game",
            ShowTabTitle = true 
        }),
        Finale = Sections.Games:Tab({
            Title = "Finale",
            Icon = "swords",
            Desc = "The Finale",
            ShowTabTitle = true 
        })
    }

    local Response = Services.HttpService:JSONDecode(Library.Creator.Request({
        Url = "https://discord.com/api/v10/invites/ringta?with_counts=true&with_expiration=true",
        Method = "GET",
        Headers = {
            ["User-Agent"] = "RobloxBot/1.0",
            ["Accept"] = "application/json"
        }
    }).Body)

    if Response and Response.guild then
        Tabs.Home:Paragraph({
            Title = Response.guild.name,
            Desc = 
                '<font color="#52525b">•</font> Members: ' .. tostring(Response.approximate_member_count) .. 
                '\n<font color="#16a34a">•</font> Online: ' .. tostring(Response.approximate_presence_count)
            ,
            Thumbnail = "rbxassetid://7557127871",
            ImageSize = 42,
            Buttons = {
                {
                    Title = "Discord",
                    Icon = "message-circle",
                    Callback = function()
                        setclipboard("discord.gg/ringta")

                        Library:Notify({
                            Title = "Invite Copied",
                            Content = "Discord Invite has been copied to your clipboard!",
                            Icon = "square-arrow-out-up-right",
                            Duration = 10
                        })
                    end,
                },
                {
                    Title = "Youtube",
                    Icon = "youtube",
                    Callback = function()
                        setclipboard("https://www.youtube.com/@RINGTASCRIPTS")

                        Library:Notify({
                            Title = "Link Copied",
                            Content = "Youtube Link has been copied to your clipboard!",
                            Icon = "square-arrow-out-up-right",
                            Duration = 10
                        })
                    end,
                }
            }
        })
    end

    Tabs.Home:Section({
        Title = "Window",
        TextXAlignment = "Left",
        TextSize = 17,
        Icon = "app-window-mac"
    })

    local Themes = {}

    for Name, _ in pairs(Library:GetThemes()) do
        table.insert(Themes, Name)
    end

    Tabs.Home:Dropdown({
        Title = "Theme",
        Multi = false,
        AllowNone = false,
        Value = "Dark",
        Values = Themes,
        Callback = function(v)
            Library:SetTheme(v)
        end
    })

    Tabs.Home:Toggle({
        Title = "Transparency",
        Icon = "palette",
        Value = Library:GetTransparency(),
        Callback = function(v)
            Window:ToggleTransparency(v)
        end
    })

    Tabs.Home:Keybind({
        Title = "Toggle",
        Value = "G",
        Callback = function(v)
            Window:SetToggleKey(Enum.KeyCode[v])
        end
    })

    Tabs.RedLightGreenLight:Section({
        Title = "Teleport",
        TextXAlignment = "Left",
        TextSize = 17,
        Icon = "move"
    })

    Tabs.RedLightGreenLight:Button({
        Title = "Bring To The End",
        Desc = "Brings everyone or the selected player to the end.",
        Callback = function()
            
        end
    })

    Tabs.RedLightGreenLight:Button({
        Title = "Bring Back To Start",
        Desc = "Brings everyone or the selected player back to the start.",
        Callback = function()
            
        end
    })

    local Players = {}
    for _, Player in pairs(Services.Players:GetPlayers()) do
        table.insert(Players, Player.Name)
    end

    Tabs.RedLightGreenLight:Dropdown({
        Title = "Players",
        Multi = true,
        AllowNone = true,
        Values = Players,
        Callback = function(v)
            print(v)
        end
    })

    Tabs.RedLightGreenLight:Button({
        Title = "Teleport To The End",
        Desc = "Teleports you to the end.",
        Callback = function()
            
        end
    })

else
    Library:Notify({
        Title = "RINGTA",
        Content = "Your experience isn't supported!",
        Icon = "star",
        Duration = 5
    })
    return
end
