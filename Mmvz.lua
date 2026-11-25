-- ==========================================================
-- THE MMVZ - MURDER MYSTERY 2 (TOP ESP LINE - NO LOADSTRING)
-- ==========================================================
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")

local localPlayer = Players.LocalPlayer
if not localPlayer then
    repeat task.wait() until Players.LocalPlayer
    localPlayer = Players.LocalPlayer
end

local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui") or localPlayer:WaitForChild("PlayerGui", 15)
if not playerGui then return end

pcall(function()
    local old = playerGui:FindFirstChild("TheMMVZ_Gui")
    if old then old:Destroy() end
end)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TheMMVZ_Gui"
screenGui.ResetOnSpawn = false
screenGui.IgnoreGuiInset = true
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

local espStorage = Instance.new("Folder")
espStorage.Name = "TheMMVZ_ESP"
espStorage.Parent = screenGui

local visualLayer = Instance.new("Frame")
visualLayer.Name = "VisualLayer"
visualLayer.Size = UDim2.new(1, 0, 1, 0)
visualLayer.BackgroundTransparency = 1
visualLayer.ZIndex = 2
visualLayer.Parent = screenGui

local BG_MAIN = Color3.fromRGB(15, 14, 24)
local BG_HEADER = Color3.fromRGB(24, 21, 38)
local BG_CARD = Color3.fromRGB(23, 21, 36)
local ACCENT_PURPLE = Color3.fromRGB(138, 75, 255)
local ACCENT_CYAN = Color3.fromRGB(45, 212, 235)
local TEXT_LIGHT = Color3.fromRGB(242, 242, 250)
local TEXT_MUTED = Color3.fromRGB(155, 152, 180)

local fovCircle = Instance.new("Frame")
fovCircle.Name = "RainbowFOVCircle"
fovCircle.AnchorPoint = Vector2.new(0.5, 0.5)
fovCircle.Position = UDim2.new(0.5, 0, 0.5, 0)
fovCircle.Size = UDim2.new(0, 260, 0, 260)
fovCircle.BackgroundTransparency = 1
fovCircle.Visible = false
fovCircle.ZIndex = 3
fovCircle.Parent = visualLayer

local fovCorner = Instance.new("UICorner")
fovCorner.CornerRadius = UDim.new(1, 0)
fovCorner.Parent = fovCircle

local fovStroke = Instance.new("UIStroke")
fovStroke.Color = Color3.fromRGB(255, 255, 255)
fovStroke.Thickness = 2.2
fovStroke.Parent = fovCircle

local fovGradient = Instance.new("UIGradient")
fovGradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 60)),
    ColorSequenceKeypoint.new(0.17, Color3.fromRGB(255, 136, 0)),
    ColorSequenceKeypoint.new(0.34, Color3.fromRGB(255, 238, 0)),
    ColorSequenceKeypoint.new(0.51, Color3.fromRGB(0, 235, 110)),
    ColorSequenceKeypoint.new(0.68, Color3.fromRGB(0, 170, 255)),
    ColorSequenceKeypoint.new(0.85, Color3.fromRGB(145, 65, 255)),
    ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 150))
})
fovGradient.Parent = fovStroke

local grabCircleBtn = Instance.new("TextButton")
grabCircleBtn.Name = "GrabGunCircleButton"
grabCircleBtn.Size = UDim2.new(0, 66, 0, 66)
grabCircleBtn.Position = UDim2.new(0.82, 0, 0.62, 0)
grabCircleBtn.BackgroundColor3 = Color3.fromRGB(22, 20, 36)
grabCircleBtn.BorderSizePixel = 0
grabCircleBtn.Text = "garb gun"
grabCircleBtn.TextColor3 = ACCENT_CYAN
grabCircleBtn.TextSize = 11
grabCircleBtn.Font = Enum.Font.GothamBlack
grabCircleBtn.TextWrapped = true
grabCircleBtn.Active = true
grabCircleBtn.Draggable = true
grabCircleBtn.Visible = false
grabCircleBtn.ZIndex = 25
grabCircleBtn.Parent = screenGui

local grabCircleCorner = Instance.new("UICorner")
grabCircleCorner.CornerRadius = UDim.new(1, 0)
grabCircleCorner.Parent = grabCircleBtn

local grabCircleStroke = Instance.new("UIStroke")
grabCircleStroke.Color = ACCENT_CYAN
grabCircleStroke.Thickness = 2
grabCircleStroke.Parent = grabCircleBtn

local mainWindow = Instance.new("Frame")
mainWindow.Name = "MainWindow"
mainWindow.Size = UDim2.new(0, 326, 0, 378)
mainWindow.Position = UDim2.new(0.5, -163, 0.5, -189)
mainWindow.BackgroundColor3 = BG_MAIN
mainWindow.BorderSizePixel = 0
mainWindow.Active = true
mainWindow.Draggable = true
mainWindow.ZIndex = 10
mainWindow.Parent = screenGui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 12)
mainCorner.Parent = mainWindow

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = ACCENT_PURPLE
mainStroke.Thickness = 2
mainStroke.Parent = mainWindow

local header = Instance.new("Frame")
header.Size = UDim2.new(1, 0, 0, 38)
header.BackgroundColor3 = BG_HEADER
header.BorderSizePixel = 0
header.ZIndex = 11
header.Parent = mainWindow

local headerCorner = Instance.new("UICorner")
headerCorner.CornerRadius = UDim.new(0, 12)
headerCorner.Parent = header

local headerMask = Instance.new("Frame")
headerMask.Size = UDim2.new(1, 0, 0, 12)
headerMask.Position = UDim2.new(0, 0, 1, -12)
headerMask.BackgroundColor3 = BG_HEADER
headerMask.BorderSizePixel = 0
headerMask.ZIndex = 11
headerMask.Parent = header

local brandBadge = Instance.new("Frame")
brandBadge.Size = UDim2.new(0, 8, 0, 18)
brandBadge.Position = UDim2.new(0, 12, 0.5, -9)
brandBadge.BackgroundColor3 = ACCENT_CYAN
brandBadge.BorderSizePixel = 0
brandBadge.ZIndex = 12
brandBadge.Parent = header

local badgeCorner = Instance.new("UICorner")
badgeCorner.CornerRadius = UDim.new(0, 4)
badgeCorner.Parent = brandBadge

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, -96, 1, 0)
titleLabel.Position = UDim2.new(0, 26, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "the MMVZ"
titleLabel.TextColor3 = TEXT_LIGHT
titleLabel.TextSize = 14
titleLabel.Font = Enum.Font.GothamBlack
titleLabel.TextXAlignment = Enum.TextXAlignment.Left
titleLabel.ZIndex = 12
titleLabel.Parent = header

local collapseBtn = Instance.new("TextButton")
collapseBtn.Size = UDim2.new(0, 26, 0, 24)
collapseBtn.Position = UDim2.new(1, -60, 0.5, -12)
collapseBtn.BackgroundColor3 = Color3.fromRGB(38, 34, 58)
collapseBtn.BorderSizePixel = 0
collapseBtn.Text = "—"
collapseBtn.TextColor3 = ACCENT_CYAN
collapseBtn.TextSize = 12
collapseBtn.Font = Enum.Font.GothamBold
collapseBtn.ZIndex = 12
collapseBtn.Parent = header

local colCorner = Instance.new("UICorner")
colCorner.CornerRadius = UDim.new(0, 6)
colCorner.Parent = collapseBtn

local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 26, 0, 24)
closeBtn.Position = UDim2.new(1, -30, 0.5, -12)
closeBtn.BackgroundColor3 = Color3.fromRGB(190, 45, 65)
closeBtn.BorderSizePixel = 0
closeBtn.Text = "×"
closeBtn.TextColor3 = TEXT_LIGHT
closeBtn.TextSize = 14
closeBtn.Font = Enum.Font.GothamBold
closeBtn.ZIndex = 12
closeBtn.Parent = header

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 6)
closeCorner.Parent = closeBtn

local bodyFrame = Instance.new("Frame")
bodyFrame.Size = UDim2.new(1, 0, 1, -38)
bodyFrame.Position = UDim2.new(0, 0, 0, 38)
bodyFrame.BackgroundTransparency = 1
bodyFrame.ZIndex = 11
bodyFrame.Parent = mainWindow

local isCollapsed = false
collapseBtn.MouseButton1Click:Connect(function()
    isCollapsed = not isCollapsed
    bodyFrame.Visible = not isCollapsed
    headerMask.Visible = not isCollapsed
    if isCollapsed then
        mainWindow.Size = UDim2.new(0, 326, 0, 38)
        collapseBtn.Text = "+"
    else
        mainWindow.Size = UDim2.new(0, 326, 0, 378)
        collapseBtn.Text = "—"
    end
end)

local walkSpeedVal = 26
local jumpPowerVal = 55
local fovRadiusVal = 130

local speedActive = false
local jumpActive = false
local roleEspActive = false
local gunEspActive = false
local fovActive = false
local aimbotMurderActive = false
local showGrabGunActive = false

local roleHighlights = {}
local gunHighlights = {}
local esp2DVisuals = {}

local COLOR_MURDER = Color3.fromRGB(255, 55, 75)
local COLOR_SHERIFF = Color3.fromRGB(55, 160, 255)
local COLOR_INNOCENT = Color3.fromRGB(50, 225, 145)
local COLOR_GUN = Color3.fromRGB(255, 215, 65)

local function getChar()
    return localPlayer.Character
end

local function getHum()
    local c = getChar()
    return c and c:FindFirstChildOfClass("Humanoid")
end

local function getRoot()
    local c = getChar()
    return c and c:FindFirstChild("HumanoidRootPart")
end

local function clearTable(tbl)
    for k, hl in pairs(tbl) do
        pcall(function()
            if hl then hl:Destroy() end
        end)
        tbl[k] = nil
    end
end

local function clear2DVisuals()
    for plr, vis in pairs(esp2DVisuals) do
        pcall(function()
            if vis.box then vis.box:Destroy() end
            if vis.line then vis.line:Destroy() end
        end)
        esp2DVisuals[plr] = nil
    end
end

local function cleanupAll()
    speedActive = false
    jumpActive = false
    roleEspActive = false
    gunEspActive = false
    fovActive = false
    aimbotMurderActive = false
    showGrabGunActive = false
    fovCircle.Visible = false
    grabCircleBtn.Visible = false
    clearTable(roleHighlights)
    clearTable(gunHighlights)
    clear2DVisuals()
    for _, obj in ipairs(espStorage:GetChildren()) do
        pcall(function() obj:Destroy() end)
    end
end

closeBtn.MouseButton1Click:Connect(function()
    cleanupAll()
    screenGui:Destroy()
end)

local infoBar = Instance.new("TextLabel")
infoBar.Size = UDim2.new(1, -24, 0, 22)
infoBar.Position = UDim2.new(0, 12, 1, -24)
infoBar.BackgroundTransparency = 1
infoBar.Text = "the MMVZ sẵn sàng"
infoBar.TextColor3 = TEXT_MUTED
infoBar.TextSize = 10
infoBar.Font = Enum.Font.GothamBold
infoBar.TextXAlignment = Enum.TextXAlignment.Left
infoBar.ZIndex = 12
infoBar.Parent = bodyFrame

local function setStatus(msg, color)
    infoBar.Text = msg
    infoBar.TextColor3 = color or TEXT_MUTED
end

local function createStatRow(labelText, defaultNum, minVal, maxVal, posY, onChange)
    local card = Instance.new("Frame")
    card.Size = UDim2.new(1, -24, 0, 36)
    card.Position = UDim2.new(0, 12, 0, posY)
    card.BackgroundColor3 = BG_CARD
    card.BorderSizePixel = 0
    card.ZIndex = 12
    card.Parent = bodyFrame

    local cCorner = Instance.new("UICorner")
    cCorner.CornerRadius = UDim.new(0, 8)
    cCorner.Parent = card

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(0.46, 0, 1, 0)
    lbl.Position = UDim2.new(0, 12, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = labelText
    lbl.TextColor3 = TEXT_LIGHT
    lbl.TextSize = 11
    lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 13
    lbl.Parent = card

    local box = Instance.new("TextBox")
    box.Size = UDim2.new(0, 52, 0, 22)
    box.Position = UDim2.new(1, -118, 0.5, -11)
    box.BackgroundColor3 = Color3.fromRGB(32, 29, 50)
    box.BorderSizePixel = 0
    box.Text = tostring(defaultNum)
    box.TextColor3 = ACCENT_CYAN
    box.TextSize = 11
    box.Font = Enum.Font.GothamBold
    box.ClearTextOnFocus = false
    box.ZIndex = 13
    box.Parent = card

    local bCorner = Instance.new("UICorner")
    bCorner.CornerRadius = UDim.new(0, 6)
    bCorner.Parent = box

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 50, 0, 22)
    btn.Position = UDim2.new(1, -60, 0.5, -11)
    btn.BackgroundColor3 = Color3.fromRGB(45, 42, 68)
    btn.BorderSizePixel = 0
    btn.Text = "TẮT"
    btn.TextColor3 = TEXT_MUTED
    btn.TextSize = 10
    btn.Font = Enum.Font.GothamBold
    btn.ZIndex = 13
    btn.Parent = card

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn

    local enabled = false
    local currentVal = defaultNum

    box.FocusLost:Connect(function()
        local num = tonumber(box.Text)
        if num and num >= minVal and num <= maxVal then
            currentVal = num
            box.Text = tostring(currentVal)
            pcall(onChange, enabled, currentVal)
        else
            box.Text = tostring(currentVal)
        end
    end)

    btn.MouseButton1Click:Connect(function()
        local num = tonumber(box.Text)
        if num and num >= minVal and num <= maxVal then
            currentVal = num
        end
        enabled = not enabled
        if enabled then
            btn.BackgroundColor3 = ACCENT_PURPLE
            btn.Text = "BẬT"
            btn.TextColor3 = TEXT_LIGHT
        else
            btn.BackgroundColor3 = Color3.fromRGB(45, 42, 68)
            btn.Text = "TẮT"
            btn.TextColor3 = TEXT_MUTED
        end
        pcall(onChange, enabled, currentVal)
    end)
end

local function createSwitchRow(labelText, posY, onToggle)
    local card = Instance.new("Frame")
    card.Size = UDim2.new(1, -24, 0, 36)
    card.Position = UDim2.new(0, 12, 0, posY)
    card.BackgroundColor3 = BG_CARD
    card.BorderSizePixel = 0
    card.ZIndex = 12
    card.Parent = bodyFrame

    local cCorner = Instance.new("UICorner")
    cCorner.CornerRadius = UDim.new(0, 8)
    cCorner.Parent = card

    local lbl = Instance.new("TextLabel")
    lbl.Size = UDim2.new(1, -74, 1, 0)
    lbl.Position = UDim2.new(0, 12, 0, 0)
    lbl.BackgroundTransparency = 1
    lbl.Text = labelText
    lbl.TextColor3 = TEXT_LIGHT
    lbl.TextSize = 11
    lbl.Font = Enum.Font.GothamBold
    lbl.TextXAlignment = Enum.TextXAlignment.Left
    lbl.ZIndex = 13
    lbl.Parent = card

    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0, 50, 0, 22)
    btn.Position = UDim2.new(1, -60, 0.5, -11)
    btn.BackgroundColor3 = Color3.fromRGB(45, 42, 68)
    btn.BorderSizePixel = 0
    btn.Text = "TẮT"
    btn.TextColor3 = TEXT_MUTED
    btn.TextSize = 10
    btn.Font = Enum.Font.GothamBold
    btn.ZIndex = 13
    btn.Parent = card

    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn

    local enabled = false
    btn.MouseButton1Click:Connect(function()
        enabled = not enabled
        if enabled then
            btn.BackgroundColor3 = ACCENT_PURPLE
            btn.Text = "BẬT"
            btn.TextColor3 = TEXT_LIGHT
        else
            btn.BackgroundColor3 = Color3.fromRGB(45, 42, 68)
            btn.Text = "TẮT"
            btn.TextColor3 = TEXT_MUTED
        end
        pcall(onToggle, enabled)
    end)
end

createStatRow("Tốc Độ Chạy (Speed)", walkSpeedVal, 1, 150, 8, function(state, val)
    speedActive = state
    walkSpeedVal = val
    local hum = getHum()
    if hum then
        pcall(function() hum.WalkSpeed = state and walkSpeedVal or 16 end)
    end
    setStatus(state and ("Đã bật Speed: " .. walkSpeedVal) or "Đã tắt Speed", ACCENT_CYAN)
end)

createStatRow("Nhảy Cao (Jump)", jumpPowerVal, 10, 200, 50, function(state, val)
    jumpActive = state
    jumpPowerVal = val
    local hum = getHum()
    if hum then
        pcall(function()
            hum.UseJumpPower = true
            hum.JumpPower = state and jumpPowerVal or 50
        end)
    end
    setStatus(state and ("Đã bật Jump: " .. jumpPowerVal) or "Đã tắt Jump", ACCENT_CYAN)
end)

createStatRow("Vòng FOV Cầu Vồng", fovRadiusVal, 30, 500, 92, function(state, val)
    fovActive = state
    fovRadiusVal = val
    local diameter = fovRadiusVal * 2
    fovCircle.Size = UDim2.new(0, diameter, 0, diameter)
    fovCircle.Visible = state
    setStatus(state and ("FOV Cầu Vồng: " .. fovRadiusVal) or "Đã tắt vòng FOV", ACCENT_CYAN)
end)

createSwitchRow("ESP Role (Box + Line)", 134, function(state)
    roleEspActive = state
    if not state then
        clearTable(roleHighlights)
        clear2DVisuals()
    end
    setStatus(state and "Đang bật ESP Role + Box + Line" or "Đã tắt ESP Role", ACCENT_CYAN)
end)

createSwitchRow("Soi Súng Rơi (Viền Vàng)", 176, function(state)
    gunEspActive = state
    if not state then
        clearTable(gunHighlights)
    end
    setStatus(state and "Đang soi súng rơi" or "Đã tắt soi súng rơi", ACCENT_CYAN)
end)

createSwitchRow("Aimbot Murder", 218, function(state)
    aimbotMurderActive = state
    setStatus(state and "Đã bật Aimbot Murder" or "Đã tắt Aimbot Murder", ACCENT_CYAN)
end)

createSwitchRow("Show Grab Gun", 260, function(state)
    showGrabGunActive = state
    grabCircleBtn.Visible = state
    setStatus(state and "Đã hiện nút tròn garb gun" or "Đã ẩn nút garb gun", ACCENT_CYAN)
end)

local function playerHasTool(plr, char, keywords)
    local containers = {}
    if plr and plr:FindFirstChild("Backpack") then
        table.insert(containers, plr.Backpack)
    end
    if char then
        table.insert(containers, char)
    end

    for _, box in ipairs(containers) do
        for _, item in ipairs(box:GetChildren()) do
            if item:IsA("Tool") then
                local low = item.Name:lower()
                for _, kw in ipairs(keywords) do
                    if low:find(kw) then
                        return true
                    end
                end
            end
        end
    end
    return false
end

local function isPlayerMurder(plr, char)
    return playerHasTool(plr, char, {"knife", "blade", "scythe", "cleaver", "axe", "dagger", "murder"})
end

local function detectPlayerRoleColor(plr, char)
    if isPlayerMurder(plr, char) then
        return COLOR_MURDER
    end
    if playerHasTool(plr, char, {"gun", "revolver", "pistol", "sheriff", "deagle", "raygun"}) then
        return COLOR_SHERIFF
    end
    return COLOR_INNOCENT
end

local function applyHighlight(tbl, key, target, color)
    local existing = tbl[key]
    if existing and existing.Parent then
        existing.Adornee = target
        existing.FillColor = color
        existing.OutlineColor = color
        return
    end

    local hl = Instance.new("Highlight")
    hl.Name = "MMVZ_HL"
    hl.Adornee = target
    hl.FillColor = color
    hl.FillTransparency = 0.72
    hl.OutlineColor = color
    hl.OutlineTransparency = 0
    hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    hl.Parent = espStorage
    tbl[key] = hl
end

local function getOrCreate2DVisual(plr)
    local entry = esp2DVisuals[plr]
    if entry and entry.box and entry.line then
        return entry
    end

    local box = Instance.new("Frame")
    box.Name = "MMVZ_Box"
    box.BackgroundTransparency = 1
    box.BorderSizePixel = 0
    box.Visible = false
    box.ZIndex = 4
    box.Parent = visualLayer

    local stroke = Instance.new("UIStroke")
    stroke.Thickness = 1.6
    stroke.Color = COLOR_INNOCENT
    stroke.Parent = box

    local line = Instance.new("Frame")
    line.Name = "MMVZ_Line"
    line.AnchorPoint = Vector2.new(0.5, 0.5)
    line.BorderSizePixel = 0
    line.BackgroundColor3 = COLOR_INNOCENT
    line.Visible = false
    line.ZIndex = 4
    line.Parent = visualLayer

    entry = { box = box, stroke = stroke, line = line }
    esp2DVisuals[plr] = entry
    return entry
end

local function findDroppedGunParts()
    local list = {}
    for _, obj in ipairs(Workspace:GetDescendants()) do
        local isCharPart = false
        local p = obj
        while p and p ~= Workspace do
            if p:IsA("Model") and p:FindFirstChildOfClass("Humanoid") then
                isCharPart = true
                break
            end
            p = p.Parent
        end

        if not isCharPart then
            local low = obj.Name:lower()
            if obj:IsA("Tool") and (low:find("gun") or low:find("revolver") or low:find("pistol") or low:find("deagle")) then
                local handle = obj:FindFirstChild("Handle") or obj:FindFirstChildWhichIsA("BasePart")
                if handle then
                    table.insert(list, { adornee = obj, part = handle })
                end
            elseif low == "gundrop" or low == "gunrop" or low:find("gundrop") then
                local part = obj:IsA("BasePart") and obj or obj:FindFirstChildWhichIsA("BasePart")
                if part then
                    table.insert(list, { adornee = obj, part = part })
                end
            end
        end
    end
    return list
end

grabCircleBtn.MouseButton1Click:Connect(function()
    local root = getRoot()
    if not root then return end

    local guns = findDroppedGunParts()
    if #guns == 0 then
        setStatus("Chưa có súng rơi trên map", Color3.fromRGB(255, 200, 80))
        return
    end

    local savedCFrame = root.CFrame
    local targetPart = guns[1].part
    pcall(function()
        root.CFrame = targetPart.CFrame + Vector3.new(0, 2, 0)
    end)
    task.wait(0.18)
    pcall(function()
        if root and root.Parent then
            root.CFrame = savedCFrame
        end
    end)
    setStatus("Đã dịch chuyển nhặt súng & quay về!", COLOR_INNOCENT)
end)

local function findMurderTargetPart(cam)
    local vp = cam.ViewportSize
    local screenCenter = Vector2.new(vp.X * 0.5, vp.Y * 0.5)
    local bestPart = nil
    local bestScore = math.huge

    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= localPlayer and plr.Character and plr.Character.Parent then
            local char = plr.Character
            local hum = char:FindFirstChildOfClass("Humanoid")
            local targetPart = char:FindFirstChild("Head") or char:FindFirstChild("HumanoidRootPart")
            if hum and hum.Health > 0 and targetPart and isPlayerMurder(plr, char) then
                local screenPos, onScreen = cam:WorldToViewportPoint(targetPart.Position)
                local dist2D = (Vector2.new(screenPos.X, screenPos.Y) - screenCenter).Magnitude
                if not fovActive or (onScreen and dist2D <= fovRadiusVal) then
                    if dist2D < bestScore then
                        bestScore = dist2D
                        bestPart = targetPart
                    end
                end
            end
        end
    end

    return bestPart
end

RunService.RenderStepped:Connect(function(dt)
    if not screenGui.Parent then return end

    if fovActive then
        pcall(function()
            fovGradient.Rotation = (fovGradient.Rotation + dt * 110) % 360
        end)
    end

    local hum = getHum()
    if hum and hum.Health > 0 then
        if speedActive then
            pcall(function() hum.WalkSpeed = walkSpeedVal end)
        end
        if jumpActive then
            pcall(function()
                hum.UseJumpPower = true
                hum.JumpPower = jumpPowerVal
            end)
        end
    end

    local cam = Workspace.CurrentCamera
    if not cam then return end

    if aimbotMurderActive then
        local murderPart = findMurderTargetPart(cam)
        if murderPart then
            pcall(function()
                cam.CFrame = CFrame.lookAt(cam.CFrame.Position, murderPart.Position)
            end)
        end
    end

    if roleEspActive then
        local vp = cam.ViewportSize
        local origin = Vector2.new(vp.X * 0.5, 0) -- Thanh chỉ xuất phát từ trên màn hình
        local seenPlayers = {}

        for _, plr in ipairs(Players:GetPlayers()) do
            if plr ~= localPlayer and plr.Character and plr.Character.Parent then
                local char = plr.Character
                local pHum = char:FindFirstChildOfClass("Humanoid")
                local pRoot = char:FindFirstChild("HumanoidRootPart")
                local pHead = char:FindFirstChild("Head")

                if pHum and pHum.Health > 0 and pRoot then
                    seenPlayers[plr] = true
                    local vis = getOrCreate2DVisual(plr)
                    local roleColor = detectPlayerRoleColor(plr, char)

                    local topWorld = pHead and (pHead.Position + Vector3.new(0, 0.7, 0)) or (pRoot.Position + Vector3.new(0, 2.6, 0))
                    local botWorld = pRoot.Position - Vector3.new(0, 3.0, 0)

                    local top2D, onTop = cam:WorldToViewportPoint(topWorld)
                    local bot2D, onBot = cam:WorldToViewportPoint(botWorld)

                    if (onTop or onBot) and top2D.Z > 0 and bot2D.Z > 0 then
                        local height = math.max(18, math.abs(bot2D.Y - top2D.Y))
                        local width = height * 0.58
                        local centerX = (top2D.X + bot2D.X) * 0.5
                        local topY = math.min(top2D.Y, bot2D.Y)

                        vis.box.Position = UDim2.new(0, centerX - width * 0.5, 0, topY)
                        vis.box.Size = UDim2.new(0, width, 0, height)
                        vis.stroke.Color = roleColor
                        vis.box.Visible = true

                        local target2D = Vector2.new(centerX, topY)
                        local diff = target2D - origin
                        local length = diff.Magnitude
                        local mid = (origin + target2D) * 0.5
                        local angle = math.deg(math.atan2(diff.Y, diff.X))

                        vis.line.Position = UDim2.new(0, mid.X, 0, mid.Y)
                        vis.line.Size = UDim2.new(0, length, 0, 1.5)
                        vis.line.Rotation = angle
                        vis.line.BackgroundColor3 = roleColor
                        vis.line.Visible = true
                    else
                        vis.box.Visible = false
                        vis.line.Visible = false
                    end
                end
            end
        end

        for plr, vis in pairs(esp2DVisuals) do
            if not seenPlayers[plr] then
                pcall(function()
                    if vis.box then vis.box:Destroy() end
                    if vis.line then vis.line:Destroy() end
                end)
                esp2DVisuals[plr] = nil
            end
        end
    end
end)

task.spawn(function()
    while screenGui.Parent do
        task.wait(0.55)

        if roleEspActive then
            local activeChars = {}
            for _, plr in ipairs(Players:GetPlayers()) do
                if plr ~= localPlayer and plr.Character and plr.Character.Parent then
                    local char = plr.Character
                    local hum = char:FindFirstChildOfClass("Humanoid")
                    if hum and hum.Health > 0 then
                        activeChars[char] = true
                        local color = detectPlayerRoleColor(plr, char)
                        pcall(function()
                            applyHighlight(roleHighlights, char, char, color)
                        end)
                    end
                end
            end
            for char, hl in pairs(roleHighlights) do
                if not activeChars[char] or not char.Parent then
                    pcall(function() if hl then hl:Destroy() end end)
                    roleHighlights[char] = nil
                end
            end
        end

        if gunEspActive then
            local activeGuns = {}
            for _, item in ipairs(findDroppedGunParts()) do
                activeGuns[item.adornee] = true
                pcall(function()
                    applyHighlight(gunHighlights, item.adornee, item.adornee, COLOR_GUN)
                end)
            end
            for obj, hl in pairs(gunHighlights) do
                if not activeGuns[obj] or not obj.Parent then
                    pcall(function() if hl then hl:Destroy() end end)
                    gunHighlights[obj] = nil
                end
            end
        end
    end
end)

print("the MMVZ Top Line Loaded")
