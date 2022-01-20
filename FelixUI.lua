local library = {}

local default_theme = {
    ["Topbar"] = {
        ["Color"] = Color3.fromRGB(26, 26, 26);
        ["Transparency"] = 0;
    };
    ["MainFrame"] = {
        ["Color"] = Color3.fromRGB(36, 36, 36);
        ["Transparency"] = 0;
    };
    ["TextColor"] = Color3.fromRGB(255, 255, 255);
    ["ItemBackgroundColor"] = Color3.fromRGB(38, 0, 255);
    ["ItemTransparency"] = 0.4;
}

local currentTheme = {}

function library:Include(theme)

    if theme then
        currentTheme = theme
    else
        currentTheme = default_theme
    end

    local window = {}

    function window:Window(title)

        local UwU = Instance.new("ScreenGui")
        local MainFrame = Instance.new("Frame")
        local Topbar = Instance.new("Frame")

        UwU.Name = "UwU"
        UwU.Parent = game.CoreGui
        UwU.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

        MainFrame.Name = "MainFrame"
        MainFrame.Parent = UwU
        MainFrame.BackgroundColor3 = currentTheme["MainFrame"]["Color"]
        MainFrame.BorderSizePixel = 0
        MainFrame.Position = UDim2.new(0.737226248, 0, 0.0667701885, 0)
        MainFrame.Size = UDim2.new(0, 314, 0, 568)
        MainFrame.BackgroundTransparency = currentTheme["MainFrame"]["Transparency"]

        Topbar.Name = "Topbar"
        Topbar.Parent = MainFrame
        Topbar.BackgroundColor3 = currentTheme["Topbar"]["Color"]
        Topbar.BorderSizePixel = 0
        Topbar.Size = UDim2.new(0, 314, 0, 45)
        Topbar.BackgroundTransparency = currentTheme["Topbar"]["Transparency"]

        local TextLabel = Instance.new("TextLabel")
        local UIListLayout = Instance.new("UIListLayout")
      
        TextLabel.Parent = Topbar
        TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        TextLabel.BackgroundTransparency = 1.000
        TextLabel.Size = UDim2.new(0, 225, 0, 45)
        TextLabel.Font = Enum.Font.GothamSemibold
        TextLabel.Text = title
        TextLabel.TextColor3 = currentTheme["TextColor"]
        TextLabel.TextSize = 14.000

        UIListLayout.Parent = MainFrame
        UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
        UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        UIListLayout.Padding = UDim.new(0, 5)

        local frame = {}

        function frame:Button(title, callback)

            callback = callback or function() end

            local TestButton = Instance.new("TextButton")

            TestButton.Name = title
            TestButton.Parent = MainFrame
            TestButton.BackgroundColor3 = currentTheme["ItemBackgroundColor"]
            TestButton.BackgroundTransparency = currentTheme["ItemTransparency"]
            TestButton.BorderSizePixel = 0
            TestButton.Position = UDim2.new(0.105095543, 0, 0.0880281702, 0)
            TestButton.Size = UDim2.new(0, 236, 0, 50)
            TestButton.Font = Enum.Font.GothamSemibold
            TestButton.TextColor3 = currentTheme["TextColor"]
            TestButton.TextSize = 14.000
            TestButton.Text = title

            TestButton.MouseButton1Click:Connect(function()

                pcall(callback)
                
            end)

        end

        function frame:TextBox(title, display, callback)
            callback = callback or function(x) end

            local TextBox = Instance.new("TextBox")

            TextBox.Name = title

            TextBox.Parent = MainFrame
            TextBox.BackgroundColor3 = currentTheme["ItemBackgroundColor"]
            TextBox.BackgroundTransparency = currentTheme["ItemTransparency"]
            TextBox.BorderSizePixel = 0
            TextBox.Position = UDim2.new(0.0286624208, 0, 0.184859157, 0)
            TextBox.Size = UDim2.new(0, 236, 0, 50)
            TextBox.Font = Enum.Font.GothamSemibold
            TextBox.PlaceholderText = display
            TextBox.Text = ""
            TextBox.TextColor3 = currentTheme["TextColor"]
            TextBox.TextSize = 14.000

            TextBox.FocusLost:Connect(function()
                pcall(callback)
            end)

        end

        function frame:Label(title)

            local Lable = Instance.new("TextLabel")

            Lable.Name = title
            Lable.Parent = MainFrame
            Lable.BackgroundColor3 = currentTheme["ItemBackgroundColor"]
            Lable.BackgroundTransparency = currentTheme["ItemTransparency"]
            Lable.Size = UDim2.new(0, 236, 0, 50)
            Lable.Font = Enum.Font.GothamSemibold
            Lable.Text = title
            Lable.TextColor3 = currentTheme["TextColor"]
            Lable.TextSize = 14.000

        end

        return frame

    end

    return window

end

return library