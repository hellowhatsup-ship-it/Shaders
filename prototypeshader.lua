-- HOW TO USE: Users must be reading this when using the shader to understand that this creates a ReShade-style UI for adjusting glossy shader effects in real-time. Place in ReplicatedStorage, require it from a LocalScript, and call Initialize() to create the UI and apply effects.

local a1,a2,a3,a4,a5,a6,a7,a8,a9=game,Instance,Vector2,UDim2,Color3,math,table,string,task
local b1,b2,b3,b4=a1:GetService("Players"),a1:GetService("Lighting"),a1:GetService("TweenService"),a1:GetService("UserInputService")
local c1,c2,c3,c4,c5=b1.LocalPlayer,b1.LocalPlayer:WaitForChild("PlayerGui"),a6.clamp,a6.floor,a6.abs
local d1,d2,d3={},{},{}
local e1={f1=0.233,f2=0.08,f3=0.15,f4=0.2,f5=0.6,f6=28,f7=0.5,f8=0.25,f9=0.35,f10=2,f11=110,f12=110,f13=110,f14=3,f15=0.5}
local e2,e3,e4,e5={f1=0.233,f2=0.08,f3=0.15,f4=0.2,f5=0.6,f6=28,f7=0.5,f8=0.25,f9=0.35,f10=2},{f1=0.4,f2=0.15,f3=0.25,f4=0.3,f5=0.8,f6=35,f7=0.4,f8=0.35,f9=0.5,f10=3},{f1=0.5,f2=0.2,f3=0.3,f4=0.5,f5=1,f6=40,f7=0.3,f8=0.4,f9=0.6,f10=1},{f1=0.15,f2=0.05,f3=0.1,f4=0.15,f5=0.4,f6=20,f7=0.6,f8=0.15,f9=0.25,f10=1}
local g1,g2,g3,g4,g5,g6,g7,g8,g9,g10=false,nil,nil,nil,nil,nil,nil,nil,nil,nil

local function h1(h2)
	local h3=a2.new("Frame")
	h3.BackgroundColor3=a5.fromRGB(20,20,25)
	h3.BorderSizePixel=0
	h3.Size=a4.new(0,450,0,600)
	h3.Position=a4.new(0.5,-225,0.5,-300)
	h3.Parent=h2
	h3.Active=true
	h3.Draggable=true
	local h4=a2.new("UICorner")
	h4.CornerRadius=UDim.new(0,8)
	h4.Parent=h3
	local h5=a2.new("Frame")
	h5.BackgroundColor3=a5.fromRGB(15,15,20)
	h5.BorderSizePixel=0
	h5.Size=a4.new(1,0,0,40)
	h5.Parent=h3
	local h6=a2.new("UICorner")
	h6.CornerRadius=UDim.new(0,8)
	h6.Parent=h5
	local h7=a2.new("TextLabel")
	h7.BackgroundTransparency=1
	h7.Position=a4.new(0,15,0,0)
	h7.Size=a4.new(0,200,1,0)
	h7.Font=Enum.Font.GothamBold
	h7.Text="ReShade FX"
	h7.TextColor3=a5.fromRGB(255,255,255)
	h7.TextSize=16
	h7.TextXAlignment=Enum.TextXAlignment.Left
	h7.Parent=h5
	local h8=a2.new("TextButton")
	h8.BackgroundTransparency=1
	h8.Position=a4.new(1,-35,0,5)
	h8.Size=a4.new(0,30,0,30)
	h8.Text="X"
	h8.Font=Enum.Font.GothamBold
	h8.TextColor3=a5.fromRGB(255,100,100)
	h8.TextSize=18
	h8.Parent=h5
	h8.MouseButton1Click:Connect(function()
		h3.Visible=false
	end)
	local h9=a2.new("ScrollingFrame")
	h9.BackgroundTransparency=1
	h9.BorderSizePixel=0
	h9.Position=a4.new(0,0,0,50)
	h9.Size=a4.new(1,0,1,-60)
	h9.CanvasSize=a4.new(0,0,0,0)
	h9.ScrollBarThickness=6
	h9.ScrollBarImageColor3=a5.fromRGB(60,60,70)
	h9.Parent=h3
	local h10=a2.new("UIListLayout")
	h10.Padding=UDim.new(0,10)
	h10.Parent=h9
	h10:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		h9.CanvasSize=a4.new(0,0,0,h10.AbsoluteContentSize.Y+20)
	end)
	return h3,h9
end

local function i1(i2,i3,i4,i5,i6,i7)
	local i8=a2.new("Frame")
	i8.BackgroundColor3=a5.fromRGB(25,25,30)
	i8.BorderSizePixel=0
	i8.Size=a4.new(1,-30,0,70)
	i8.Parent=i2
	local i9=a2.new("UICorner")
	i9.CornerRadius=UDim.new(0,6)
	i9.Parent=i8
	local i10=a2.new("TextLabel")
	i10.BackgroundTransparency=1
	i10.Position=a4.new(0,15,0,5)
	i10.Size=a4.new(1,-30,0,20)
	i10.Font=Enum.Font.Gotham
	i10.Text=i3
	i10.TextColor3=a5.fromRGB(220,220,220)
	i10.TextSize=14
	i10.TextXAlignment=Enum.TextXAlignment.Left
	i10.Parent=i8
	local i11=a2.new("TextLabel")
	i11.BackgroundTransparency=1
	i11.Position=a4.new(1,-60,0,5)
	i11.Size=a4.new(0,50,0,20)
	i11.Font=Enum.Font.GothamBold
	i11.Text=a8.format("%.2f",i4)
	i11.TextColor3=a5.fromRGB(100,200,255)
	i11.TextSize=13
	i11.TextXAlignment=Enum.TextXAlignment.Right
	i11.Parent=i8
	local i12=a2.new("Frame")
	i12.BackgroundColor3=a5.fromRGB(40,40,50)
	i12.BorderSizePixel=0
	i12.Position=a4.new(0,15,0,35)
	i12.Size=a4.new(1,-30,0,20)
	i12.Parent=i8
	local i13=a2.new("UICorner")
	i13.CornerRadius=UDim.new(0,10)
	i13.Parent=i12
	local i14=a2.new("Frame")
	i14.BackgroundColor3=a5.fromRGB(100,200,255)
	i14.BorderSizePixel=0
	i14.Position=a4.new(0,0,0,0)
	i14.Size=a4.new((i4-i5)/(i6-i5),0,1,0)
	i14.Parent=i12
	local i15=a2.new("UICorner")
	i15.CornerRadius=UDim.new(0,10)
	i15.Parent=i14
	local i16=a2.new("TextButton")
	i16.BackgroundTransparency=1
	i16.Size=a4.new(1,0,1,0)
	i16.Text=""
	i16.Parent=i12
	local i17=false
	i16.InputBegan:Connect(function(i18)
		if i18.UserInputType==Enum.UserInputType.MouseButton1 then
			i17=true
			local function i19()
				local i20=b4:GetMouseLocation()
				local i21=i12.AbsolutePosition
				local i22=i12.AbsoluteSize
				local i23=c3((i20.X-i21.X)/i22.X,0,1)
				local i24=i5+i23*(i6-i5)
				i7(i24)
				i11.Text=a8.format("%.2f",i24)
				i14.Size=a4.new(i23,0,1,0)
			end
			while i17 do
				i19()
				a9.wait(0.03)
			end
		end
	end)
	i16.InputEnded:Connect(function(i18)
		if i18.UserInputType==Enum.UserInputType.MouseButton1 then
			i17=false
		end
	end)
	return i8
end

local function j1(j2,j3,j4)
	local j5=a2.new("Frame")
	j5.BackgroundColor3=a5.fromRGB(25,25,30)
	j5.BorderSizePixel=0
	j5.Size=a4.new(1,-30,0,50)
	j5.Parent=j2
	local j6=a2.new("UICorner")
	j6.CornerRadius=UDim.new(0,6)
	j6.Parent=j5
	local j7=a2.new("TextButton")
	j7.BackgroundColor3=a5.fromRGB(60,120,200)
	j7.BorderSizePixel=0
	j7.Position=a4.new(0,15,0,10)
	j7.Size=a4.new(1,-30,0,30)
	j7.Font=Enum.Font.GothamBold
	j7.Text=j3
	j7.TextColor3=a5.fromRGB(255,255,255)
	j7.TextSize=14
	j7.Parent=j5
	local j8=a2.new("UICorner")
	j8.CornerRadius=UDim.new(0,6)
	j8.Parent=j7
	j7.MouseButton1Click:Connect(j4)
	j7.MouseEnter:Connect(function()
		j7.BackgroundColor3=a5.fromRGB(80,140,220)
	end)
	j7.MouseLeave:Connect(function()
		j7.BackgroundColor3=a5.fromRGB(60,120,200)
	end)
	return j5
end

local function k1()
	if not c1.Character then return end
	for _,k2 in pairs(c1.Character:GetDescendants())do
		if k2:IsA("BasePart")then
			d3[k2]=true
		end
	end
end

local function k3(k4)
	if not k4 or not k4:IsA("BasePart")then return end
	if d1[k4]or d3[k4]then return end
	if k4:IsDescendantOf(c1.Character or a1)then
		d3[k4]=true
		return
	end
	d2[k4]={f1=k4.Reflectance,f2=k4.Material,f3=k4.Transparency}
	k4.Reflectance=e1.f1
	k4.Material=Enum.Material.SmoothPlastic
	if k4.Transparency<0.5 then
		k4.Transparency=0
	end
	d1[k4]=true
end

local function k5()
	g2=b2:FindFirstChild("_gCC")or a2.new("ColorCorrectionEffect")
	g2.Name="_gCC"
	g2.Brightness=e1.f2
	g2.Contrast=e1.f3
	g2.Saturation=e1.f4
	g2.TintColor=a5.fromRGB(255,255,255)
	g2.Enabled=g1
	g2.Parent=b2
	g3=b2:FindFirstChild("_gBl")or a2.new("BloomEffect")
	g3.Name="_gBl"
	g3.Intensity=e1.f5
	g3.Size=e1.f6
	g3.Threshold=e1.f7
	g3.Enabled=g1
	g3.Parent=b2
	g4=b2:FindFirstChild("_gSR")or a2.new("SunRaysEffect")
	g4.Name="_gSR"
	g4.Intensity=e1.f8
	g4.Spread=e1.f9
	g4.Enabled=g1
	g4.Parent=b2
	g5=b2:FindFirstChild("_gBr")or a2.new("BlurEffect")
	g5.Name="_gBr"
	g5.Size=e1.f10
	g5.Enabled=g1
	g5.Parent=b2
	g6=b2:FindFirstChild("_gDF")or a2.new("DepthOfFieldEffect")
	g6.Name="_gDF"
	g6.FarIntensity=0.1
	g6.FocusDistance=50
	g6.InFocusRadius=30
	g6.NearIntensity=0.2
	g6.Enabled=g1
	g6.Parent=b2
	b2.Ambient=a5.fromRGB(e1.f11,e1.f12,e1.f13)
	b2.Brightness=e1.f14
	b2.EnvironmentDiffuseScale=0.6
	b2.EnvironmentSpecularScale=1
	b2.GlobalShadows=true
	b2.OutdoorAmbient=a5.fromRGB(140,140,140)
	b2.ShadowSoftness=e1.f15
end

local function k6()
	if g1 then
		for _,k7 in pairs(workspace:GetDescendants())do
			if k7:IsA("BasePart")and not d1[k7]and not d3[k7]then
				k3(k7)
			end
		end
	end
end

local function k8(k9)
	for k10,k11 in pairs(k9)do
		if e1[k10]then
			e1[k10]=k11
		end
	end
	if g1 then
		k5()
		for k12,_ in pairs(d1)do
			if k12 and k12.Parent then
				k12.Reflectance=e1.f1
			end
		end
	end
end

local function l1()
	local l2,l3=h1(c2)
	local l4=a2.new("Frame")
	l4.BackgroundColor3=a5.fromRGB(30,30,35)
	l4.BorderSizePixel=0
	l4.Position=a4.new(0,15,0,0)
	l4.Size=a4.new(1,-30,0,60)
	l4.Parent=l3
	local l5=a2.new("UICorner")
	l5.CornerRadius=UDim.new(0,6)
	l5.Parent=l4
	local l6=a2.new("TextLabel")
	l6.BackgroundTransparency=1
	l6.Position=a4.new(0,15,0,5)
	l6.Size=a4.new(1,-30,0,20)
	l6.Font=Enum.Font.GothamBold
	l6.Text="Shader Status"
	l6.TextColor3=a5.fromRGB(255,255,255)
	l6.TextSize=15
	l6.TextXAlignment=Enum.TextXAlignment.Left
	l6.Parent=l4
	local l7=a2.new("TextButton")
	l7.BackgroundColor3=g1 and a5.fromRGB(100,200,100)or a5.fromRGB(200,100,100)
	l7.BorderSizePixel=0
	l7.Position=a4.new(0,15,0,30)
	l7.Size=a4.new(1,-30,0,25)
	l7.Font=Enum.Font.GothamBold
	l7.Text=g1 and"Enabled"or"Disabled"
	l7.TextColor3=a5.fromRGB(255,255,255)
	l7.TextSize=13
	l7.Parent=l4
	local l8=a2.new("UICorner")
	l8.CornerRadius=UDim.new(0,6)
	l8.Parent=l7
	l7.MouseButton1Click:Connect(function()
		g1=not g1
		l7.Text=g1 and"Enabled"or"Disabled"
		l7.BackgroundColor3=g1 and a5.fromRGB(100,200,100)or a5.fromRGB(200,100,100)
		if g1 then
			k1()
			k5()
			k6()
		else
			if g2 then g2.Enabled=false end
			if g3 then g3.Enabled=false end
			if g4 then g4.Enabled=false end
			if g5 then g5.Enabled=false end
			if g6 then g6.Enabled=false end
			for l9,l10 in pairs(d1)do
				if l9 and l9.Parent and d2[l9]then
					l9.Reflectance=d2[l9].f1
					l9.Material=d2[l9].f2
					l9.Transparency=d2[l9].f3
				end
			end
			d1,d2={},{}
		end
	end)
	i1(l3,"Reflectance",e1.f1,0,1,function(m1)e1.f1=m1 if g1 then for m2,_ in pairs(d1)do if m2 and m2.Parent then m2.Reflectance=m1 end end end end)
	i1(l3,"Brightness",e1.f2,-0.5,0.5,function(m1)e1.f2=m1 if g1 and g2 then g2.Brightness=m1 end end)
	i1(l3,"Contrast",e1.f3,-0.5,0.5,function(m1)e1.f3=m1 if g1 and g2 then g2.Contrast=m1 end end)
	i1(l3,"Saturation",e1.f4,-0.5,0.5,function(m1)e1.f4=m1 if g1 and g2 then g2.Saturation=m1 end end)
	i1(l3,"Bloom Intensity",e1.f5,0,2,function(m1)e1.f5=m1 if g1 and g3 then g3.Intensity=m1 end end)
	i1(l3,"Bloom Size",e1.f6,0,56,function(m1)e1.f6=m1 if g1 and g3 then g3.Size=m1 end end)
	i1(l3,"Bloom Threshold",e1.f7,0,1,function(m1)e1.f7=m1 if g1 and g3 then g3.Threshold=m1 end end)
	i1(l3,"Sun Rays Intensity",e1.f8,0,1,function(m1)e1.f8=m1 if g1 and g4 then g4.Intensity=m1 end end)
	i1(l3,"Sun Rays Spread",e1.f9,0,1,function(m1)e1.f9=m1 if g1 and g4 then g4.Spread=m1 end end)
	i1(l3,"Blur Size",e1.f10,0,10,function(m1)e1.f10=m1 if g1 and g5 then g5.Size=m1 end end)
	local m3=a2.new("Frame")
	m3.BackgroundColor3=a5.fromRGB(30,30,35)
	m3.BorderSizePixel=0
	m3.Size=a4.new(1,-30,0,40)
	m3.Parent=l3
	local m4=a2.new("UICorner")
	m4.CornerRadius=UDim.new(0,6)
	m4.Parent=m3
	local m5=a2.new("TextLabel")
	m5.BackgroundTransparency=1
	m5.Position=a4.new(0,15,0,0)
	m5.Size=a4.new(1,-30,1,0)
	m5.Font=Enum.Font.GothamBold
	m5.Text="Presets"
	m5.TextColor3=a5.fromRGB(255,255,255)
	m5.TextSize=15
	m5.TextXAlignment=Enum.TextXAlignment.Left
	m5.Parent=m3
	j1(l3,"Default Preset",function()k8(e2)end)
	j1(l3,"Cinematic Preset",function()k8(e3)end)
	j1(l3,"Vibrant Preset",function()k8(e4)end)
	j1(l3,"Subtle Preset",function()k8(e5)end)
	local m6=a2.new("ScreenGui")
	m6.Name="_gUI"
	m6.ResetOnSpawn=false
	m6.ZIndexBehavior=Enum.ZIndexBehavior.Sibling
	m6.Parent=c2
	local m7=a2.new("TextButton")
	m7.BackgroundColor3=a5.fromRGB(20,20,25)
	m7.BorderSizePixel=0
	m7.Position=a4.new(0,10,0.5,-25)
	m7.Size=a4.new(0,50,0,50)
	m7.Font=Enum.Font.GothamBold
	m7.Text="FX"
	m7.TextColor3=a5.fromRGB(255,255,255)
	m7.TextSize=16
	m7.Parent=m6
	local m8=a2.new("UICorner")
	m8.CornerRadius=UDim.new(0,8)
	m8.Parent=m7
	m7.MouseButton1Click:Connect(function()
		l2.Visible=not l2.Visible
	end)
	l2.Parent=m6
	a9.spawn(function()
		while a9.wait(2)do
			if g1 then
				k6()
			end
		end
	end)
end

local m9={}
function m9.Initialize()
	k1()
	l1()
end
return m9
