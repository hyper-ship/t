local PR = {}
PR.scriptv=function(func)
func('getgenv')().loadstring = func('loadstring')
local a a={cache={}, load=function(b)if not a.cache[b]then a.cache[b]={c=a[b]()}end return a.cache[b].c end}do function a.a()


local b=game:GetService"RunService"local c=
b.Heartbeat
local d=game:GetService"UserInputService"
local e=game:GetService"TweenService"

local f=func('loadstring')(game:HttpGetAsync"https://raw.githubusercontent.com/Footagesus/Icons/main/Main.lua")()
f.SetIconsType"lucide"

local g={
Font="rbxassetid://12187365364",
CanDraggable=true,
Theme=nil,
Themes=nil,
Objects={},
FontObjects={},
Request=func('request'),
DefaultProperties={
ScreenGui={
ResetOnSpawn=false,
ZIndexBehavior="Sibling",
},
CanvasGroup={
BorderSizePixel=0,
BackgroundColor3=Color3.new(1,1,1),
},
Frame={
BorderSizePixel=0,
BackgroundColor3=Color3.new(1,1,1),
},
TextLabel={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
Text="",
RichText=true,
TextColor3=Color3.new(1,1,1),
TextSize=14,
},TextButton={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
Text="",
AutoButtonColor=false,
TextColor3=Color3.new(1,1,1),
TextSize=14,
},
TextBox={
BackgroundColor3=Color3.new(1,1,1),
BorderColor3=Color3.new(0,0,0),
ClearTextOnFocus=false,
Text="",
TextColor3=Color3.new(0,0,0),
TextSize=14,
},
ImageLabel={
BackgroundTransparency=1,
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
},
ImageButton={
BackgroundColor3=Color3.new(1,1,1),
BorderSizePixel=0,
AutoButtonColor=false,
},
UIListLayout={
SortOrder="LayoutOrder",
}
},
Colors={
Red="#e53935",
Orange="#f57c00",
Green="#43a047",
Blue="#039be5",
White="#ffffff",
Grey="#484848",
}
}

function g.SetTheme(h)
g.Theme=h
g.UpdateTheme(nil,true)
end

function g.AddFontObject(h)
table.insert(g.FontObjects,h)
g.UpdateFont(g.Font)
end

function g.UpdateFont(h)
g.Font=h
for i,j in next,g.FontObjects do
j.FontFace=Font.new(h,j.FontFace.Weight,j.FontFace.Style)
end
end

function g.GetThemeProperty(h,i)
return i[h]or g.Themes.Dark[h]
end

function g.AddThemeObject(h,i)
g.Objects[h]={Object=h,Properties=i}
g.UpdateTheme(h)
return h
end

function g.UpdateTheme(h,i)
local function ApplyTheme(j)
for k,l in pairs(j.Properties or{})do
local m=g.GetThemeProperty(l,g.Theme)
if m then
if not i then
j.Object[k]=Color3.fromHex(m)
else
g.Tween(j.Object,0.08,{[k]=Color3.fromHex(m)}):Play()
end
end
end
end

if h then
local j=g.Objects[h]
if j then
ApplyTheme(j)
end
else
for j,k in pairs(g.Objects)do
ApplyTheme(k)
end
end
end

function g.Icon(h)
return f.Icon(h)
end

function g.New(h,i,j)
local k=Instance.new(h)

for l,m in next,g.DefaultProperties[h]or{}do
k[l]=m
end

for n,o in next,i or{}do
if n~="ThemeTag"then
k[n]=o
end
end

for p,q in next,j or{}do
q.Parent=k
end

if i and i.ThemeTag then
g.AddThemeObject(k,i.ThemeTag)
end
if i and i.FontFace then
g.AddFontObject(k)
end
return k
end

function g.Tween(h,i,j,...)
return e:Create(h,TweenInfo.new(i,...),j)
end

function g.NewRoundFrame(h,i,j,k,n)






local o=g.New(n and"ImageButton"or"ImageLabel",{
Image=i=="Squircle"and"rbxassetid://80999662900595"
or i=="SquircleOutline"and"rbxassetid://117788349049947"
or i=="Shadow-sm"and"rbxassetid://84825982946844"
or i=="Squircle-TL-TR"and"rbxassetid://73569156276236",
ScaleType="Slice",
SliceCenter=i~="Shadow-sm"and Rect.new(256
,256
,256
,256

)or Rect.new(512,512,512,512),
SliceScale=1,
BackgroundTransparency=1,
ThemeTag=j.ThemeTag and j.ThemeTag
},k)

for p,q in pairs(j or{})do
if p~="ThemeTag"then
o[p]=q
end
end

local function UpdateSliceScale(r)
local s=i~="Shadow-sm"and(r/(256))or(r/512)
o.SliceScale=s
end

UpdateSliceScale(h)

return o
end

local h=g.New local i=
g.Tween

function g.SetDraggable(j)
g.CanDraggable=j
end

function g.Drag(j,k,n)
local o
local p,q,r,s
local t={
CanDraggable=true
}

if not k or type(k)~="table"then
k={j}
end

local function update(u)
local v=u.Position-r
g.Tween(j,0.02,{Position=UDim2.new(
s.X.Scale,s.X.Offset+v.X,
s.Y.Scale,s.Y.Offset+v.Y
)}):Play()
end

for u,v in pairs(k)do
v.InputBegan:Connect(function(w)
if(w.UserInputType==Enum.UserInputType.MouseButton1 or w.UserInputType==Enum.UserInputType.Touch)and t.CanDraggable then
if o==nil then
o=v
p=true
r=w.Position
s=j.Position

if n and type(n)=="function"then
n(true,o)
end

w.Changed:Connect(function()
if w.UserInputState==Enum.UserInputState.End then
p=false
o=nil

if n and type(n)=="function"then
n(false,o)
end
end
end)
end
end
end)

v.InputChanged:Connect(function(w)
if o==v and p then
if w.UserInputType==Enum.UserInputType.MouseMovement or w.UserInputType==Enum.UserInputType.Touch then
q=w
end
end
end)
end

d.InputChanged:Connect(function(w)
if w==q and p and o~=nil then
if t.CanDraggable then
update(w)
end
end
end)

function t.Set(w,x)
t.CanDraggable=x
end

return t
end

function g.Image(j,k,n,o,p,q)






local r=h("Frame",{
Size=UDim2.new(0,0,0,0),

BackgroundTransparency=1,
},{
h("ImageLabel",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ScaleType="Crop",
ThemeTag=g.Icon(j)and{
ImageColor3=q and"Text"
}or nil,
},{
h("UICorner",{
CornerRadius=UDim.new(0,n)
})
})
})
if g.Icon(j)then
r.ImageLabel.Image=g.Icon(j)[1]
r.ImageLabel.ImageRectOffset=g.Icon(j)[2].ImageRectPosition
r.ImageLabel.ImageRectSize=g.Icon(j)[2].ImageRectSize
end
if string.find(j,"http")then
local s="WindUI/"..o.."/Assets/."..p.."-"..k..".png"
local t,u=pcall(function()
if not func('isfile')(s)then
local t=g.Request{
Url=j,
Method="GET",
}.Body

writefile(s,t)
end
r.ImageLabel.Image=getcustomasset(s)
end)
if not t then
r:Destroy()

warn("[ WindUI.Creator ]  '"..identifyexecutor().."' doesnt support the URL Images. Error: "..u)
end
elseif string.find(j,"rbxassetid")then
r.ImageLabel.Image=j
end

return r
end

return g end function a.b()
return{
Dark={
Name="Dark",
Accent="#18181b",
Outline="#FFFFFF",
Text="#FFFFFF",
Placeholder="#999999",
Background="#0e0e10",
Button="#52525b",
Icon="#a1a1aa",
},
Light={
Name="Light",
Accent="#FFFFFF",
Outline="#09090b",
Text="#000000",
Placeholder="#777777",
Background="#e4e4e7",
Button="#18181b",
Icon="#a1a1aa",
},
Rose={
Name="Rose",
Accent="#881337",
Outline="#FFFFFF",
Text="#FFFFFF",
Placeholder="#6B7280",
Background="#4c0519",
Button="#52525b",
Icon="#a1a1aa",
},
Plant={
Name="Plant",
Accent="#365314",
Outline="#FFFFFF",
Text="#e6ffe5",
Placeholder="#7d977d",
Background="#1a2e05",
Button="#52525b",
Icon="#a1a1aa",
},
Red={
Name="Red",
Accent="#7f1d1d",
Outline="#FFFFFF",
Text="#ffeded",
Placeholder="#977d7d",
Background="#450a0a",
Button="#52525b",
Icon="#a1a1aa",
},
Indigo={
Name="Indigo",
Accent="#312e81",
Outline="#FFFFFF",
Text="#ffeded",
Placeholder="#977d7d",
Background="#1e1b4b",
Button="#52525b",
Icon="#a1a1aa",
},

}end function a.c()






local b={}
local d={
lua={
"and","break","or","else","elseif","if","then","until","repeat","while","do","for","in","end",
"local","return","function","export",
},
rbx={
"game","workspace","script","math","string","table","task","wait","select","next","Enum",
"tick","assert","shared","loadstring","tonumber","tostring","type",
"typeof","unpack","Instance","CFrame","Vector3","Vector2","Color3","UDim","UDim2","Ray","BrickColor",
"OverlapParams","RaycastParams","Axes","Random","Region3","Rect","TweenInfo",
"collectgarbage","not","utf8","pcall","xpcall","_G","setmetatable","getmetatable","os","pairs","ipairs"
},
operators={
"#","+","-","*","%","/","^","=","~","=","<",">",
}
}

local e={
numbers=Color3.fromHex"#FAB387",
boolean=Color3.fromHex"#FAB387",
operator=Color3.fromHex"#94E2D5",
lua=Color3.fromHex"#CBA6F7",
rbx=Color3.fromHex"#F38BA8",
str=Color3.fromHex"#A6E3A1",
comment=Color3.fromHex"#9399B2",
null=Color3.fromHex"#F38BA8",
call=Color3.fromHex"#89B4FA",
self_call=Color3.fromHex"#89B4FA",
local_property=Color3.fromHex"#CBA6F7",
}

local function createKeywordSet(f)
local g={}
for h,i in ipairs(f)do
g[i]=true
end
return g
end

local f=createKeywordSet(d.lua)
local g=createKeywordSet(d.rbx)
local h=createKeywordSet(d.operators)

local function getHighlight(i,j)
local k=i[j]

if e[k.."_color"]then
return e[k.."_color"]
end

if tonumber(k)then
return e.numbers
elseif k=="nil"then
return e.null
elseif k:sub(1,2)=="--"then
return e.comment
elseif h[k]then
return e.operator
elseif f[k]then
return e.lua
elseif g[k]then
return e.rbx
elseif k:sub(1,1)=="\""or k:sub(1,1)=="\'"then
return e.str
elseif k=="true"or k=="false"then
return e.boolean
end

if i[j+1]=="("then
if i[j-1]==":"then
return e.self_call
end

return e.call
end

if i[j-1]=="."then
if i[j-2]=="Enum"then
return e.rbx
end

return e.local_property
end
end

function b.run(i)
local j={}
local k=""

local n=false
local o=false
local p=false

for q=1,#i do
local r=i:sub(q,q)

if o then
if r=="\n"and not p then
table.insert(j,k)
table.insert(j,r)
k=""

o=false
elseif i:sub(q-1,q)=="]]"and p then
k="]"

table.insert(j,k)
k=""

o=false
p=false
else
k=k..r
end
elseif n then
if r==n and i:sub(q-1,q-1)~="\\"or r=="\n"then
k=k..r
n=false
else
k=k..r
end
else
if i:sub(q,q+1)=="--"then
table.insert(j,k)
k="-"
o=true
p=i:sub(q+2,q+3)=="[["
elseif r=="\""or r=="\'"then
table.insert(j,k)
k=r
n=r
elseif h[r]then
table.insert(j,k)
table.insert(j,r)
k=""
elseif r:match"[%w_]"then
k=k..r
else
table.insert(j,k)
table.insert(j,r)
k=""
end
end
end

table.insert(j,k)

local q={}

for r,s in ipairs(j)do
local t=getHighlight(j,r)

if t then
local u=string.format("<font color = \"#%s\">%s</font>",t:ToHex(),s:gsub("<","&lt;"):gsub(">","&gt;"))

table.insert(q,u)
else
table.insert(q,s)
end
end

return table.concat(q)
end

return b end function a.d()
local b=game:GetService"UserInputService"
game:GetService"TweenService"

local d=a.load'c'
local e={}

local f=a.load'a'
local g=f.New
local h=f.Tween

function e.Button(i,j,k,n,o,p)
n=n or"Primary"
local q=10
local r
if j and j~=""then
r=g("ImageLabel",{
Image=f.Icon(j)[1],
ImageRectSize=f.Icon(j)[2].ImageRectSize,
ImageRectOffset=f.Icon(j)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
}
})
end

local s=g("TextButton",{
Size=UDim2.new(0,0,1,0),
AutomaticSize="X",
Parent=o,
BackgroundTransparency=1
},{
f.NewRoundFrame(q,"Squircle",{
ThemeTag={
ImageColor3=n~="White"and"Button"or nil,
},
ImageColor3=n=="White"and Color3.new(1,1,1)or nil,
Size=UDim2.new(1,0,1,0),
Name="Squircle",
ImageTransparency=n=="Primary"and 0 or n=="White"and 0 or 1
}),

f.NewRoundFrame(q,"Squircle",{



ImageColor3=Color3.new(1,1,1),
Size=UDim2.new(1,0,1,0),
Name="Special",
ImageTransparency=n=="Secondary"and 0.95 or 1
}),

f.NewRoundFrame(q,"Shadow-sm",{



ImageColor3=Color3.new(0,0,0),
Size=UDim2.new(1,3,1,3),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Shadow",
ImageTransparency=n=="Secondary"and 0 or 1
}),

f.NewRoundFrame(q,"SquircleOutline",{
ThemeTag={
ImageColor3=n~="White"and"Outline"or nil,
},
Size=UDim2.new(1,0,1,0),
ImageColor3=n=="White"and Color3.new(0,0,0)or nil,
ImageTransparency=n=="Primary"and.95 or.85,
}),

f.NewRoundFrame(q,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ThemeTag={
ImageColor3=n~="White"and"Text"or nil
},
ImageColor3=n=="White"and Color3.new(0,0,0)or nil,
ImageTransparency=1
},{
g("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}),
g("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
r,
g("TextLabel",{
BackgroundTransparency=1,
FontFace=Font.new(f.Font,Enum.FontWeight.SemiBold),
Text=i or"Button",
ThemeTag={
TextColor3=(n~="Primary"and n~="White")and"Text",
},
TextColor3=n=="Primary"and Color3.new(1,1,1)or n=="White"and Color3.new(0,0,0)or nil,
AutomaticSize="XY",
TextSize=18,
})
})
})

s.MouseEnter:Connect(function()
h(s.Frame,.047,{ImageTransparency=.95}):Play()
end)
s.MouseLeave:Connect(function()
h(s.Frame,.047,{ImageTransparency=1}):Play()
end)
s.MouseButton1Up:Connect(function()
if p then
p:Close()()
end
if k then
k()
end
end)

return s
end

function e.Input(i,j,k,n)
local o=10
local p
if j and j~=""then
p=g("ImageLabel",{
Image=f.Icon(j)[1],
ImageRectSize=f.Icon(j)[2].ImageRectSize,
ImageRectOffset=f.Icon(j)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
}
})
end

local q=g("TextBox",{
BackgroundTransparency=1,
TextSize=18,
FontFace=Font.new(f.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,p and-29 or 0,1,0),
PlaceholderText=i,
ClearTextOnFocus=false,
ClipsDescendants=true,
MultiLine=false,
TextXAlignment="Left",

ThemeTag={
PlaceholderColor3="PlaceholderText",
TextColor3="Text",
},
})

local r=g("Frame",{
Size=UDim2.new(1,0,0,42),
Parent=k,
BackgroundTransparency=1
},{
g("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
f.NewRoundFrame(o,"Squircle",{
ThemeTag={
ImageColor3="Accent",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.45,
}),
f.NewRoundFrame(o,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.9,
}),
f.NewRoundFrame(o,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=.95
},{
g("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}),
g("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
p,
q,
})
})
})










q.FocusLost:Connect(function()
if n then
n(q.Text)
end
end)

return r
end

function e.Label(i,j,k)
local n=10
local o
if j and j~=""then
o=g("ImageLabel",{
Image=f.Icon(j)[1],
ImageRectSize=f.Icon(j)[2].ImageRectSize,
ImageRectOffset=f.Icon(j)[2].ImageRectPosition,
Size=UDim2.new(0,21,0,21),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Icon",
}
})
end

local p=g("TextLabel",{
BackgroundTransparency=1,
TextSize=18,
FontFace=Font.new(f.Font,Enum.FontWeight.Regular),
Size=UDim2.new(1,o and-29 or 0,1,0),
TextXAlignment="Left",
ThemeTag={
TextColor3="Text",
},
Text=i,
})

local q=g("TextButton",{
Size=UDim2.new(1,0,0,42),
Parent=k,
BackgroundTransparency=1,
Text="",
},{
g("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
f.NewRoundFrame(n,"Squircle",{
ThemeTag={
ImageColor3="Accent",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.45,
}),
f.NewRoundFrame(n,"SquircleOutline",{
ThemeTag={
ImageColor3="Outline",
},
Size=UDim2.new(1,0,1,0),
ImageTransparency=.9,
}),
f.NewRoundFrame(n,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Frame",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=.95
},{
g("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}),
g("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,8),
VerticalAlignment="Center",
HorizontalAlignment="Left",
}),
o,
p,
})
})
})

return q
end

function e.Toggle(i,j,k,n)
local o={}


local p=13
local q
if j and j~=""then
q=g("ImageLabel",{
Size=UDim2.new(1,-7,1,-7),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Image=f.Icon(j)[1],
ImageRectOffset=f.Icon(j)[2].ImageRectPosition,
ImageRectSize=f.Icon(j)[2].ImageRectSize,
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
})
end

local r=f.NewRoundFrame(p,"Squircle",{
ImageTransparency=.95,
ThemeTag={
ImageColor3="Text"
},
Parent=k,
Size=UDim2.new(0,42,0,26),
},{
f.NewRoundFrame(p,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={
ImageColor3="Button",
},
ImageTransparency=1,
}),
f.NewRoundFrame(p,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
Name="Stroke",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=1,
},{
g("UIGradient",{
Rotation=90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
}
})
}),


f.NewRoundFrame(p,"Squircle",{
Size=UDim2.new(0,18,0,18),
Position=UDim2.new(0,3,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
ImageTransparency=0,
ImageColor3=Color3.new(1,1,1),
Name="Frame",
},{
q,
})
})

function o.Set(s,t)
if t then
h(r.Frame,0.1,{
Position=UDim2.new(1,-22,0.5,0),

},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
h(r.Layer,0.1,{
ImageTransparency=0,
}):Play()
h(r.Stroke,0.1,{
ImageTransparency=0.95,
}):Play()

if q then
h(q,0.1,{
ImageTransparency=0,
}):Play()
end
else
h(r.Frame,0.1,{
Position=UDim2.new(0,4,0.5,0),
Size=UDim2.new(0,18,0,18),
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
h(r.Layer,0.1,{
ImageTransparency=1,
}):Play()
h(r.Stroke,0.1,{
ImageTransparency=1,
}):Play()

if q then
h(q,0.1,{
ImageTransparency=1,
}):Play()
end
end

task.spawn(function()
if n then
n(t)
end
end)


end

return r,o
end

function e.Checkbox(i,j,k,n)
local o={}

j=j or"check"

local p=10
local q=g("ImageLabel",{
Size=UDim2.new(1,-10,1,-10),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Image=f.Icon(j)[1],
ImageRectOffset=f.Icon(j)[2].ImageRectPosition,
ImageRectSize=f.Icon(j)[2].ImageRectSize,
ImageTransparency=1,
ImageColor3=Color3.new(1,1,1),
})

local r=f.NewRoundFrame(p,"Squircle",{
ImageTransparency=.95,
ThemeTag={
ImageColor3="Text"
},
Parent=k,
Size=UDim2.new(0,27,0,27),
},{
f.NewRoundFrame(p,"Squircle",{
Size=UDim2.new(1,0,1,0),
Name="Layer",
ThemeTag={
ImageColor3="Button",
},
ImageTransparency=1,
}),
f.NewRoundFrame(p,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
Name="Stroke",
ImageColor3=Color3.new(1,1,1),
ImageTransparency=1,
},{
g("UIGradient",{
Rotation=90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
}
})
}),

q,
})

function o.Set(s,t)
if t then
h(r.Layer,0.06,{
ImageTransparency=0,
}):Play()
h(r.Stroke,0.06,{
ImageTransparency=0.95,
}):Play()
h(q,0.06,{
ImageTransparency=0,
}):Play()
else
h(r.Layer,0.05,{
ImageTransparency=1,
}):Play()
h(r.Stroke,0.05,{
ImageTransparency=1,
}):Play()
h(q,0.06,{
ImageTransparency=1,
}):Play()
end

task.spawn(function()
if n then
n(t)
end
end)
end

return r,o
end

function e.ScrollSlider(i,j,k,n)
local o=g("Frame",{
Size=UDim2.new(0,n,1,-k.UIPadding*2),
BackgroundTransparency=1,
Position=UDim2.new(1,-k.UIPadding/3,0,k.UIPadding),
AnchorPoint=Vector2.new(1,0),
Parent=j,
ZIndex=999,
Active=true,
})

local p=f.NewRoundFrame(n/2,"Squircle",{
Size=UDim2.new(1,0,0,0),
ImageTransparency=0.85,
ThemeTag={ImageColor3="Text"},
Parent=o,
})

local q=g("Frame",{
Size=UDim2.new(1,12,1,12),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Active=true,
ZIndex=999,
Parent=p,
})

local function updateSliderSize()
local r=i
local s=r.AbsoluteCanvasSize.Y
local t=r.AbsoluteWindowSize.Y

local u=math.clamp(t/math.max(s,1),0,1)

p.Size=UDim2.new(1,0,u,0)
p.Visible=u<1 and s>t
end

local function updateScrollingFramePosition()
local r=p.Position.Y.Scale
local s=math.max(i.AbsoluteCanvasSize.Y-i.AbsoluteWindowSize.Y,1)

local t=1-p.Size.Y.Scale
local u=r/t

i.CanvasPosition=Vector2.new(
i.CanvasPosition.X,
u*s
)
end

local function updateThumbPosition()
local r=i.CanvasPosition.Y
local s=math.max(i.AbsoluteCanvasSize.Y-i.AbsoluteWindowSize.Y,1)
local t=r/s

local u=1-p.Size.Y.Scale
t=math.clamp(t,0,u)

p.Position=UDim2.new(0,0,t,0)
end

o.InputBegan:Connect(function(r)
if(r.UserInputType==Enum.UserInputType.MouseButton1 or r.UserInputType==Enum.UserInputType.Touch)
and not(r.Position.Y>=p.AbsolutePosition.Y and r.Position.Y<=p.AbsolutePosition.Y+p.AbsoluteSize.Y)then

local s=o.AbsoluteSize.Y-p.AbsoluteSize.Y
local t=o.AbsolutePosition.Y
local u=p.AbsoluteSize.Y/2

local v=(r.Position.Y-t-u)/s

local w=1-p.Size.Y.Scale
v=math.clamp(v,0,w)

p.Position=UDim2.new(0,0,v,0)
updateScrollingFramePosition()
end
end)

q.InputBegan:Connect(function(r)
if r.UserInputType==Enum.UserInputType.MouseButton1 or r.UserInputType==Enum.UserInputType.Touch then
local s=r.Position.Y-p.AbsolutePosition.Y
local t

t=b.InputChanged:Connect(function(u)
if u.UserInputType==Enum.UserInputType.MouseMovement or u.UserInputType==Enum.UserInputType.Touch then
local v=o.AbsoluteSize.Y-p.AbsoluteSize.Y
local w=o.AbsolutePosition.Y

local x=(u.Position.Y-w-s)/v

local y=1-p.Size.Y.Scale
x=math.clamp(x,0,y)

p.Position=UDim2.new(0,0,x,0)
updateScrollingFramePosition()
end
end)

local u
u=b.InputEnded:Connect(function(v)
if v.UserInputType==Enum.UserInputType.MouseButton1 or v.UserInputType==Enum.UserInputType.Touch then
if t then t:Disconnect()end
if u then u:Disconnect()end
end
end)
end
end)

i:GetPropertyChangedSignal"AbsoluteWindowSize":Connect(updateSliderSize)

updateSliderSize()
updateThumbPosition()

i:GetPropertyChangedSignal"CanvasPosition":Connect(function()
updateThumbPosition()
end)

return o
end

function e.ToolTip(i,j)
local k={
Container=nil,
ToolTipSize=16,
}

local n=g("TextLabel",{
AutomaticSize="XY",
TextWrapped=true,
BackgroundTransparency=1,
FontFace=Font.new(f.Font,Enum.FontWeight.Medium),
Text=i,
TextSize=17,
ThemeTag={
TextColor3="Text",
}
})

local o=g("UIScale",{
Scale=.9
})

local p=g("CanvasGroup",{
AnchorPoint=Vector2.new(0.5,0),
AutomaticSize="XY",
BackgroundTransparency=1,
Parent=j,
GroupTransparency=1,
Visible=false
},{
g("UISizeConstraint",{
MaxSize=Vector2.new(400,math.huge)
}),
g("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
LayoutOrder=99,
Visible=false
},{
g("ImageLabel",{
Size=UDim2.new(0,k.ToolTipSize,0,k.ToolTipSize/2),
BackgroundTransparency=1,
Rotation=180,
Image="rbxassetid://89524607682719",
ThemeTag={
ImageColor3="Accent",
},
},{
g("ImageLabel",{
Size=UDim2.new(0,k.ToolTipSize,0,k.ToolTipSize/2),
BackgroundTransparency=1,
LayoutOrder=99,
ImageTransparency=.9,
Image="rbxassetid://89524607682719",
ThemeTag={
ImageColor3="Text",
},
}),
}),
}),
g("Frame",{
AutomaticSize="XY",
ThemeTag={
BackgroundColor3="Accent",
},

},{
g("UICorner",{
CornerRadius=UDim.new(0,16),
}),
g("Frame",{
ThemeTag={
BackgroundColor3="Text",
},
AutomaticSize="XY",
BackgroundTransparency=.9,
},{
g("UICorner",{
CornerRadius=UDim.new(0,16),
}),
g("UIListLayout",{
Padding=UDim.new(0,12),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),

n,
g("UIPadding",{
PaddingTop=UDim.new(0,12),
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
PaddingBottom=UDim.new(0,12),
}),
})
}),
o,
g("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
VerticalAlignment="Center",
HorizontalAlignment="Center",
}),
})
k.Container=p

function k.Open(q)
p.Visible=true

h(p,.16,{GroupTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
h(o,.18,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

function k.Close(q)
h(p,.2,{GroupTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
h(o,.2,{Scale=.9},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.wait(.25)

p.Visible=false
p:Destroy()
end

return k
end

function e.Code(i,j,k,n)
local o={
Radius=12,
Padding=10
}

local p=g("TextLabel",{
Text="",
TextColor3=Color3.fromHex"#CDD6F4",
TextTransparency=0,
TextSize=14,
TextWrapped=false,
LineHeight=1.15,
RichText=true,
TextXAlignment="Left",
Size=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
AutomaticSize="XY",
},{
g("UIPadding",{
PaddingTop=UDim.new(0,o.Padding+3),
PaddingLeft=UDim.new(0,o.Padding+3),
PaddingRight=UDim.new(0,o.Padding+3),
PaddingBottom=UDim.new(0,o.Padding+3),
})
})
p.Font="Code"

local q=g("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
AutomaticCanvasSize="X",
ScrollingDirection="X",
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
ScrollBarThickness=0,
},{
p
})

local r=g("TextButton",{
BackgroundTransparency=1,
Size=UDim2.new(0,30,0,30),
Position=UDim2.new(1,-o.Padding/2,0,o.Padding/2),
AnchorPoint=Vector2.new(1,0),
Visible=n and true or false,
},{
f.NewRoundFrame(o.Radius-4,"Squircle",{



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Button",
},{
g("UIScale",{
Scale=1,
}),
g("ImageLabel",{
Image=f.Icon"copy"[1],
ImageRectSize=f.Icon"copy"[2].ImageRectSize,
ImageRectOffset=f.Icon"copy"[2].ImageRectPosition,
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Size=UDim2.new(0,12,0,12),



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.1,
})
})
})

r.MouseEnter:Connect(function()
h(r.Button,.05,{ImageTransparency=.95}):Play()
h(r.Button.UIScale,.05,{Scale=.9}):Play()
end)
r.InputEnded:Connect(function()
h(r.Button,.08,{ImageTransparency=1}):Play()
h(r.Button.UIScale,.08,{Scale=1}):Play()
end)

f.NewRoundFrame(o.Radius,"Squircle",{



ImageColor3=Color3.fromHex"#212121",
ImageTransparency=.035,
Size=UDim2.new(1,0,0,20+(o.Padding*2)),
AutomaticSize="Y",
Parent=k,
},{
f.NewRoundFrame(o.Radius,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.955,
}),
g("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
},{
f.NewRoundFrame(o.Radius,"Squircle-TL-TR",{



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.96,
Size=UDim2.new(1,0,0,20+(o.Padding*2)),
Visible=j and true or false
},{
g("ImageLabel",{
Size=UDim2.new(0,18,0,18),
BackgroundTransparency=1,
Image="rbxassetid://132464694294269",



ImageColor3=Color3.fromHex"#ffffff",
ImageTransparency=.2,
}),
g("TextLabel",{
Text=j,



TextColor3=Color3.fromHex"#ffffff",
TextTransparency=.2,
TextSize=16,
AutomaticSize="Y",
FontFace=Font.new(f.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
BackgroundTransparency=1,
TextTruncate="AtEnd",
Size=UDim2.new(1,r and-20-(o.Padding*2),0,0)
}),
g("UIPadding",{

PaddingLeft=UDim.new(0,o.Padding+3),
PaddingRight=UDim.new(0,o.Padding+3),

}),
g("UIListLayout",{
Padding=UDim.new(0,o.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
})
}),
q,
g("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
})
}),
r,
})

p:GetPropertyChangedSignal"TextBounds":Connect(function()
q.Size=UDim2.new(1,0,0,p.TextBounds.Y+((o.Padding+3)*2))
end)

function o.Set(s)
p.Text=d.run(s)
end

o.Set(i)

r.MouseButton1Click:Connect(function()
if n then
n()
local s=f.Icon"check"
r.Button.ImageLabel.Image=s[1]
r.Button.ImageLabel.ImageRectSize=s[2].ImageRectSize
r.Button.ImageLabel.ImageRectOffset=s[2].ImageRectPosition
end
end)
return o
end

return e end function a.e()
local b=a.load'a'
local d=b.New
local e=b.Tween

local f={
UICorner=14,
UIPadding=12,
Holder=nil,
Window=nil,
}

function f.Init(g)
f.Window=g
return f
end

function f.Create(g)
local h={
UICorner=19,
UIPadding=16,
UIElements={}
}

if g then h.UIPadding=0 end
if g then h.UICorner=22 end

if not g then
h.UIElements.FullScreen=d("Frame",{
ZIndex=999,
BackgroundTransparency=1,
BackgroundColor3=Color3.fromHex"#2a2a2a",
Size=UDim2.new(1,0,1,0),
Active=false,
Visible=false,
Parent=g and f.Window or f.Window.UIElements.Main.Main
},{
d("UICorner",{
CornerRadius=UDim.new(0,f.Window.UICorner)
})
})
end

h.UIElements.Main=d("Frame",{

ThemeTag={
BackgroundColor3="Accent",
},
AutomaticSize="XY",
BackgroundTransparency=1,
Visible=false,
ZIndex=99999,
},{
d("UIPadding",{
PaddingTop=UDim.new(0,h.UIPadding),
PaddingLeft=UDim.new(0,h.UIPadding),
PaddingRight=UDim.new(0,h.UIPadding),
PaddingBottom=UDim.new(0,h.UIPadding),
})
})

h.UIElements.MainContainer=b.NewRoundFrame(h.UICorner,"Squircle",{
Visible=false,

ImageTransparency=g and 0.15 or 0,
Parent=g and f.Window or h.UIElements.FullScreen,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
AutomaticSize="XY",
ThemeTag={
ImageColor3="Accent"
},
ZIndex=9999,
},{
h.UIElements.Main,
d("UIScale",{
Scale=.9
}),
b.NewRoundFrame(h.UICorner,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=.9,
ThemeTag={
ImageColor3="Outline",
},
},{
d("UIGradient",{
Rotation=90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
}
})
})
})

function h.Open(i)
if not g then
h.UIElements.FullScreen.Visible=true
h.UIElements.FullScreen.Active=true
end

task.spawn(function()
h.UIElements.MainContainer.Visible=true

if not g then
e(h.UIElements.FullScreen,0.1,{BackgroundTransparency=.5}):Play()
end
e(h.UIElements.MainContainer,0.1,{ImageTransparency=0}):Play()
e(h.UIElements.MainContainer.UIScale,0.1,{Scale=1}):Play()

task.spawn(function()
task.wait(0.05)
h.UIElements.Main.Visible=true
end)
end)
end
function h.Close(i)
if not g then
e(h.UIElements.FullScreen,0.1,{BackgroundTransparency=1}):Play()
h.UIElements.FullScreen.Active=false
task.spawn(function()
task.wait(.1)
h.UIElements.FullScreen.Visible=false
end)
end
h.UIElements.Main.Visible=false

e(h.UIElements.MainContainer,0.1,{ImageTransparency=1}):Play()
e(h.UIElements.MainContainer.UIScale,0.1,{Scale=.9}):Play()


task.spawn(function()
task.wait(.1)
if not g then
h.UIElements.FullScreen:Destroy()
else
h.UIElements.MainContainer:Destroy()
end
end)

return function()end
end


return h
end

return f end function a.f()
local b={}


local d=a.load'a'
local e=d.New
local f=d.Tween

local g=a.load'd'
local h=g.Button
local i=g.Input

function b.new(j,k,n)
local o=a.load'e'.Init(j.WindUI.ScreenGui.KeySystem)
local p=o.Create(true)


local q

local r=200

local s=430
if j.KeySystem.Thumbnail and j.KeySystem.Thumbnail.Image then
s=430+(r/2)
end

p.UIElements.Main.AutomaticSize="Y"
p.UIElements.Main.Size=UDim2.new(0,s,0,0)

local t

if j.Icon then
local u={ImageColor3="Text"}

if string.find(j.Icon,"rbxassetid://")or not d.Icon(tostring(j.Icon))[1]then
u=nil
end
t=e("ImageLabel",{
Size=UDim2.new(0,24,0,24),
BackgroundTransparency=1,
LayoutOrder=-1,
ThemeTag=u
})
if string.find(j.Icon,"rbxassetid://")or string.find(j.Icon,"http://www.roblox.com/asset/?id=")then
t.Image=j.Icon
elseif string.find(j.Icon,"http")then
local v,w=pcall(function()
if not func('isfile')("WindUI/"..Window.Folder.."/Assets/.Icon.png")then
local v=func'request'{
Url=j.Icon,
Method="GET",
}.Body
writefile("WindUI/"..Window.Folder.."/Assets/.Icon.png",v)
end
t.Image=getcustomasset("WindUI/"..Window.Folder.."/Assets/.Icon.png")
end)
if not v then
t:Destroy()

warn("[ WindUI ]  '"..identifyexecutor().."' doesnt support the URL Images. Error: "..w)
end
else
if d.Icon(tostring(j.Icon))[1]then
t.Image=d.Icon(j.Icon)[1]
t.ImageRectOffset=d.Icon(j.Icon)[2].ImageRectPosition
t.ImageRectSize=d.Icon(j.Icon)[2].ImageRectSize
end
end
end

local u=e("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text=j.Title,
FontFace=Font.new(d.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
TextSize=20
})
local v=e("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text="Key System",
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,0,0.5,0),
TextTransparency=1,
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
},
TextSize=16
})

local w=e("Frame",{
BackgroundTransparency=1,
AutomaticSize="XY",
},{
e("UIListLayout",{
Padding=UDim.new(0,14),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),
t,u
})

local x=e("Frame",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
},{





w,v,
})






















local y=i("Enter Key","key",nil,function(y)
q=y
end)

local z
if j.KeySystem.Note and j.KeySystem.Note~=""then
z=e("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Text=j.KeySystem.Note,
TextSize=18,
TextTransparency=.4,
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
RichText=true
})
end

local A=e("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
},{
e("Frame",{
BackgroundTransparency=1,
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
},{
e("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
})
})
})


local B
if j.KeySystem.Thumbnail and j.KeySystem.Thumbnail.Image then
local C
if j.KeySystem.Thumbnail.Title then
C=e("TextLabel",{
Text=j.KeySystem.Thumbnail.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})
end
B=e("ImageLabel",{
Image=j.KeySystem.Thumbnail.Image,
BackgroundTransparency=1,
Size=UDim2.new(0,r,1,0),
Parent=p.UIElements.Main,
ScaleType="Crop"
},{
C,
e("UICorner",{
CornerRadius=UDim.new(0,0),
})
})
end

e("Frame",{

Size=UDim2.new(1,B and-r or 0,1,0),
Position=UDim2.new(0,B and r or 0,0,0),
BackgroundTransparency=1,
Parent=p.UIElements.Main
},{
e("Frame",{

Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
e("UIListLayout",{
Padding=UDim.new(0,18),
FillDirection="Vertical",
}),
x,
z,
y,
A,
e("UIPadding",{
PaddingTop=UDim.new(0,16),
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
PaddingBottom=UDim.new(0,16),
})
}),
})





local C=h("Exit","log-out",function()
p:Close()()
end,"Tertiary",A.Frame)

if B then
C.Parent=B
C.Size=UDim2.new(0,0,0,42)
C.Position=UDim2.new(0,16,1,-16)
C.AnchorPoint=Vector2.new(0,1)
end

if j.KeySystem.URL then
h("Get key","key",function()
setclipboard(j.KeySystem.URL)
end,"Secondary",A.Frame)
end

local D=h("Submit","arrow-right",function()
local D=q
local E=tostring(j.KeySystem.Key)==tostring(D)
if type(j.KeySystem.Key)=="table"then
E=func('table.find')(j.KeySystem.Key,tostring(D))
end

if E then
p:Close()()

if j.KeySystem.SaveKey then
local F=j.Folder or j.Title
writefile(F.."/"..k..".key",tostring(D))
end

task.wait(.4)
n(true)
else
local F=TextBoxHolder.UIStroke.Color
local G=TextBoxHolder.BackgroundColor3
f(TextBoxHolder.UIStroke,0.1,{Color=Color3.fromHex"#ff1e1e",Transparency=.65}):Play()
f(TextBoxHolder,0.1,{BackgroundColor3=Color3.fromHex"#ff1e1e",Transparency=.8}):Play()

task.wait(.5)

f(TextBoxHolder.UIStroke,0.15,{Color=F,Transparency=.9}):Play()
f(TextBoxHolder,0.15,{BackgroundColor3=G,Transparency=.95}):Play()
end
end,"Primary",A)

D.AnchorPoint=Vector2.new(1,0.5)
D.Position=UDim2.new(1,0,0.5,0)










p:Open()
end

return b end function a.g()
local b=a.load'a'
local d=b.New
local e=b.Tween

local f={
Size=UDim2.new(0,300,1,-156),
SizeLower=UDim2.new(0,300,1,-56),
UICorner=16,
UIPadding=14,
ButtonPadding=9,
Holder=nil,
NotificationIndex=0,
Notifications={}
}

function f.Init(g)
local h={
Lower=false
}

function h.SetLower(i)
h.Lower=i
h.Frame.Size=i and f.SizeLower or f.Size
end

h.Frame=d("Frame",{
Position=UDim2.new(1,-29,0,56),
AnchorPoint=Vector2.new(1,0),
Size=f.Size,
Parent=g,
BackgroundTransparency=1,




},{
d("UIListLayout",{
HorizontalAlignment="Center",
SortOrder="LayoutOrder",
VerticalAlignment="Bottom",
Padding=UDim.new(0,8),
}),
d("UIPadding",{
PaddingBottom=UDim.new(0,29)
})
})
return h
end

function f.New(g)
local h={
Title=g.Title or"Notification",
Content=g.Content or nil,
Icon=g.Icon or nil,
Background=g.Background,
Duration=g.Duration or 5,
Buttons=g.Buttons or{},
CanClose=true,
UIElements={},
Closed=false,
}
if h.CanClose==nil then
h.CanClose=true
end
f.NotificationIndex=f.NotificationIndex+1
f.Notifications[f.NotificationIndex]=h

local i=d("UICorner",{
CornerRadius=UDim.new(0,f.UICorner),
})

local j=d("UIStroke",{
ThemeTag={
Color="Text"
},
Transparency=1,
Thickness=.6,
})

local k

if h.Icon then
if b.Icon(h.Icon)and b.Icon(h.Icon)[2]then
k=d("ImageLabel",{
Size=UDim2.new(0,26,0,26),
Position=UDim2.new(0,f.UIPadding,0,f.UIPadding),
BackgroundTransparency=1,
Image=b.Icon(h.Icon)[1],
ImageRectSize=b.Icon(h.Icon)[2].ImageRectSize,
ImageRectOffset=b.Icon(h.Icon)[2].ImageRectPosition,
ThemeTag={
ImageColor3="Text"
}
})
elseif string.find(h.Icon,"rbxassetid")then
k=d("ImageLabel",{
Size=UDim2.new(0,26,0,26),
BackgroundTransparency=1,
Position=UDim2.new(0,f.UIPadding,0,f.UIPadding),
Image=h.Icon
})
end
end

local n
if h.CanClose then
n=d("ImageButton",{
Image=b.Icon"x"[1],
ImageRectSize=b.Icon"x"[2].ImageRectSize,
ImageRectOffset=b.Icon"x"[2].ImageRectPosition,
BackgroundTransparency=1,
Size=UDim2.new(0,16,0,16),
Position=UDim2.new(1,-f.UIPadding,0,f.UIPadding),
AnchorPoint=Vector2.new(1,0),
ThemeTag={
ImageColor3="Text"
}
},{
d("TextButton",{
Size=UDim2.new(1,8,1,8),
BackgroundTransparency=1,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Text="",
})
})
end

local o=d("Frame",{
Size=UDim2.new(1,0,0,3),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text",
},

})

local p=d("Frame",{
Size=UDim2.new(1,
h.Icon and-28-f.UIPadding or 0,
1,0),
Position=UDim2.new(1,0,0,0),
AnchorPoint=Vector2.new(1,0),
BackgroundTransparency=1,
AutomaticSize="Y",
},{
d("UIPadding",{
PaddingTop=UDim.new(0,f.UIPadding),
PaddingLeft=UDim.new(0,f.UIPadding),
PaddingRight=UDim.new(0,f.UIPadding),
PaddingBottom=UDim.new(0,f.UIPadding),
}),
d("TextLabel",{
AutomaticSize="Y",
Size=UDim2.new(1,-30-f.UIPadding,0,0),
TextWrapped=true,
TextXAlignment="Left",
RichText=true,
BackgroundTransparency=1,
TextSize=16,
ThemeTag={
TextColor3="Text"
},
Text=h.Title,
FontFace=Font.new(b.Font,Enum.FontWeight.SemiBold)
}),
d("UIListLayout",{
Padding=UDim.new(0,f.UIPadding/3)
})
})

if h.Content then
d("TextLabel",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
TextWrapped=true,
TextXAlignment="Left",
RichText=true,
BackgroundTransparency=1,
TextTransparency=.4,
TextSize=15,
ThemeTag={
TextColor3="Text"
},
Text=h.Content,
FontFace=Font.new(b.Font,Enum.FontWeight.Medium),
Parent=p
})
end





















































local q=d("CanvasGroup",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(2,0,1,0),
AnchorPoint=Vector2.new(0,1),
AutomaticSize="Y",
BackgroundTransparency=.25,
ThemeTag={
BackgroundColor3="Accent"
},

},{
d("ImageLabel",{
Name="Background",
Image=h.Background,
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
ScaleType="Crop",

}),

j,i,
p,
k,n,
o,

})

local r=d("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,0,0),
Parent=g.Holder
},{
q
})

function h.Close(s)
if not h.Closed then
h.Closed=true
e(r,0.45,{Size=UDim2.new(1,0,0,-8)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
e(q,0.55,{Position=UDim2.new(2,0,1,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
task.wait(.45)
r:Destroy()
end
end

task.spawn(function()
task.wait()
e(r,0.45,{Size=UDim2.new(
1,
0,
0,
q.AbsoluteSize.Y
)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
e(q,0.45,{Position=UDim2.new(0,0,1,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if h.Duration then
e(o,h.Duration,{Size=UDim2.new(0,0,0,3)},Enum.EasingStyle.Linear,Enum.EasingDirection.InOut):Play()
task.wait(h.Duration)
h:Close()
end
end)

if n then
n.TextButton.MouseButton1Click:Connect(function()
h:Close()
end)
end


return h
end

return f end function a.h()
local b={}

local d=a.load'a'
local e=d.New local f=
d.Tween


function b.new(g)
local h={
Title=g.Title or"Dialog",
Content=g.Content,
Icon=g.Icon,
Thumbnail=g.Thumbnail,
Buttons=g.Buttons
}

local i=a.load'e'.Init(g.WindUI.ScreenGui.Popups)
local j=i.Create(true)

local k=200

local n=430
if h.Thumbnail and h.Thumbnail.Image then
n=430+(k/2)
end

j.UIElements.Main.AutomaticSize="Y"
j.UIElements.Main.Size=UDim2.new(0,n,0,0)



local o

if h.Icon then





































o=d.Image(
h.Icon,
h.Title,
j.UICorner-4,
g.WindUI.Window,
"Popup"
)
o.Size=UDim2.new(0,24,0,24)
o.LayoutOrder=-1
end


local p=e("TextLabel",{
AutomaticSize="XY",
BackgroundTransparency=1,
Text=h.Title,
FontFace=Font.new(d.Font,Enum.FontWeight.SemiBold),
ThemeTag={
TextColor3="Text",
},
TextSize=20
})

local q=e("Frame",{
BackgroundTransparency=1,
AutomaticSize="XY",
},{
e("UIListLayout",{
Padding=UDim.new(0,14),
FillDirection="Horizontal",
VerticalAlignment="Center"
}),
o,p
})

local r=e("Frame",{
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
BackgroundTransparency=1,
},{





q,
})

local s
if h.Content and h.Content~=""then
s=e("TextLabel",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Text=h.Content,
TextSize=18,
TextTransparency=.2,
ThemeTag={
TextColor3="Text",
},
BackgroundTransparency=1,
RichText=true
})
end

local t=e("Frame",{
Size=UDim2.new(1,0,0,42),
BackgroundTransparency=1,
},{
e("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
HorizontalAlignment="Right"
})
})

local u
if h.Thumbnail and h.Thumbnail.Image then
local v
if h.Thumbnail.Title then
v=e("TextLabel",{
Text=h.Thumbnail.Title,
ThemeTag={
TextColor3="Text",
},
TextSize=18,
FontFace=Font.new(d.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
})
end
u=e("ImageLabel",{
Image=h.Thumbnail.Image,
BackgroundTransparency=1,
Size=UDim2.new(0,k,1,0),
Parent=j.UIElements.Main,
ScaleType="Crop"
},{
v,
e("UICorner",{
CornerRadius=UDim.new(0,0),
})
})
end

e("Frame",{

Size=UDim2.new(1,u and-k or 0,1,0),
Position=UDim2.new(0,u and k or 0,0,0),
BackgroundTransparency=1,
Parent=j.UIElements.Main
},{
e("Frame",{

Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
e("UIListLayout",{
Padding=UDim.new(0,18),
FillDirection="Vertical",
}),
r,
s,
t,
e("UIPadding",{
PaddingTop=UDim.new(0,16),
PaddingLeft=UDim.new(0,16),
PaddingRight=UDim.new(0,16),
PaddingBottom=UDim.new(0,16),
})
}),
})

local v=a.load'd'.Button

for w,x in next,h.Buttons do
v(x.Title,x.Icon,x.Callback,x.Variant,t,j)
end

j:Open()
end

return b end function a.i()
local b=a.load'a'
local d=b.New
local e=b.NewRoundFrame
local f=b.Tween

game:GetService"UserInputService"




return function(g)
local h={
Title=g.Title,
Desc=g.Desc or nil,
Hover=g.Hover,
Thumbnail=g.Thumbnail,
ThumbnailSize=g.ThumbnailSize or 80,
Image=g.Image,
ImageSize=g.ImageSize or 22,
Color=g.Color,
Scalable=g.Scalable,
UIPadding=12,
UICorner=12,
UIElements={}
}

local i=h.ImageSize
local j=h.ThumbnailSize
local k=true
local n=false

local o
local p
if h.Thumbnail then
o=b.Image(
h.Thumbnail,
h.Title,
h.UICorner-5,
g.Window.Folder,
"Thumbnail",
false
)
o.Size=UDim2.new(1,0,0,j)
end
if h.Image then
p=b.Image(
h.Image,
h.Title,
h.UICorner-5,
g.Window.Folder,
"Image",
h.Color~="White"
)
if h.Color=="White"then
p.ImageLabel.ImageColor3=Color3.new(0,0,0)
end
p.Size=UDim2.new(0,i,0,i)
p.Position=UDim2.new(
0,
h.UIPadding/2,
0,
o and j+(h.UIPadding*1.5)or h.UIPadding/2)
end

h.UIElements.Main=d("TextButton",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Visible=false,
BackgroundTransparency=1,
},{
d("UIScale",{
Scale=.98,
}),
p,
o,
d("Frame",{
Size=UDim2.new(1,h.Image and-(i+h.UIPadding),0,0),
AutomaticSize="Y",
AnchorPoint=Vector2.new(0,0),
Position=UDim2.new(
0,
p and i+h.UIPadding or 0,
0,
o and j+h.UIPadding or 0
),
BackgroundTransparency=1,
Name="Title"
},{
d("UIListLayout",{
Padding=UDim.new(0,7),

}),
d("TextLabel",{
Text=h.Title,
ThemeTag={
TextColor3=not h.Color and"Text"or nil
},
TextColor3=h.Color and(h.Color=="White"and Color3.new(0,0,0)or Color3.new(1,1,1)),
TextSize=16,
TextWrapped=true,
RichText=true,
LayoutOrder=0,
Name="Title",
TextXAlignment="Left",
Size=UDim2.new(1,-g.TextOffset,0,0),
FontFace=Font.new(b.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="Y"
}),
d("UIPadding",{
PaddingTop=UDim.new(0,(h.UIPadding/2)+2),
PaddingLeft=UDim.new(0,h.UIPadding/2),
PaddingRight=UDim.new(0,h.UIPadding/2),
PaddingBottom=UDim.new(0,(h.UIPadding/2)+2),
}),
}),
e(h.UICorner,"Squircle",{
Size=UDim2.new(1,h.UIPadding,1,h.UIPadding),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Name="MainBG",
ThemeTag={
ImageColor3=not h.Color and"Text"or nil
},
ImageTransparency=not h.Color and 0.95 or 0.1,
ImageColor3=h.Color and Color3.fromHex(b.Colors[h.Color]),
ZIndex=-1,
}),
e(h.UICorner,"Squircle",{
Size=UDim2.new(1,h.UIPadding,1,h.UIPadding),
ThemeTag={
ImageColor3="Text"
},
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=1,
Name="Highlight",
ZIndex=-1,
}),
e(h.UICorner,"SquircleOutline",{
Size=UDim2.new(1,h.UIPadding,1,h.UIPadding),
ThemeTag={
ImageColor3="Text"
},
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=h.Color=="White"and 0 or.95,
Name="Outline",
ZIndex=-1,
},{
d("UIGradient",{
Rotation=90,
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
}
})
}),
d("Frame",{
Size=UDim2.new(1,h.UIPadding,1,h.UIPadding),
BackgroundColor3=Color3.new(0,0,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
ZIndex=999999,
Name="Lock"
},{
d("UICorner",{
CornerRadius=UDim.new(0,11),
}),
d("ImageLabel",{
Image=b.Icon"lock"[1],
ImageRectOffset=b.Icon"lock"[2].ImageRectPosition,
ImageRectSize=b.Icon"lock"[2].ImageRectSize,


Size=UDim2.new(0,22,0,22),
ImageTransparency=1,
BackgroundTransparency=1,
Active=false,
}),
d("TextLabel",{
BackgroundTransparency=1,
Text="Locked",
TextTransparency=1,
AutomaticSize="XY",
FontFace=Font.new(b.Font,Enum.FontWeight.SemiBold),
TextSize=16,
Active=false,
TextColor3=Color3.new(1,1,1),
}),
d("UIListLayout",{
Padding=UDim.new(0,h.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
HorizontalAlignment="Center",
})
}),
d("UIPadding",{
PaddingTop=UDim.new(0,h.UIPadding/2),
PaddingLeft=UDim.new(0,h.UIPadding/2),
PaddingRight=UDim.new(0,h.UIPadding/2),
PaddingBottom=UDim.new(0,h.UIPadding/2),
}),
})

h.UIElements.MainContainer=d("Frame",{
Size=UDim2.new(1,0,0,h.UIElements.Main.AbsoluteSize.Y),

BackgroundTransparency=1,
Parent=g.Parent,

},{
h.UIElements.Main,
})

local q=d("TextLabel",{
Text=h.Desc,
ThemeTag={
TextColor3=not h.Color and"Text"or nil
},
TextColor3=h.Color and(h.Color=="White"and Color3.new(0,0,0)or Color3.new(1,1,1)),
TextTransparency=0.2,
TextSize=15,
TextWrapped=true,
LayoutOrder=9999,
Name="Desc",
TextXAlignment="Left",
Size=UDim2.new(1,-g.TextOffset,0,0),
FontFace=Font.new(b.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="Y",
})

if h.Desc then
q.Parent=h.UIElements.Main.Title




end

if h.Hover then
h.UIElements.Main.MouseEnter:Connect(function()
if k then
f(h.UIElements.Main.Highlight,0.047,{ImageTransparency=0.975}):Play()
end
end)

h.UIElements.Main.MouseButton1Down:Connect(function()
if k then
n=true
if h.Scalable then
f(h.UIElements.Main.UIScale,0.07,{Scale=.985},Enum.EasingStyle.Exponential,Enum.EasingDirection.Out):Play()
end
end
end)

h.UIElements.Main.InputEnded:Connect(function()
if k then
f(h.UIElements.Main.Highlight,0.066,{ImageTransparency=1}):Play()
if h.Scalable then
f(h.UIElements.Main.UIScale,0.175,{Scale=1},Enum.EasingStyle.Back,Enum.EasingDirection.Out):Play()
end
task.wait(.16)
n=false
end
end)
end

local r=h.UIElements.Main:GetPropertyChangedSignal"AbsoluteSize":Connect(function()
if not n then
h.UIElements.MainContainer.Size=UDim2.new(1,0,0,h.UIElements.Main.AbsoluteSize.Y)
end
end)

function h.SetTitle(s,t)
h.UIElements.Main.Title.Title.Text=t
end
function h.SetDesc(s,t)
q.Text=t
h.Desc=t
if not q.Parent then
q.Parent=h.UIElements.Main.Title



end
end

function h.Show(s)
h.UIElements.Main.Visible=true
f(h.UIElements.Main.UIScale,.1,{Scale=1}):Play()
end
function h.Destroy(s)
f(h.UIElements.Main.UIScale,.15,{Scale=.98}):Play()

r:Disconnect()
h.UIElements.MainContainer.AutomaticSize="None"
task.wait(.1)
h.UIElements.Main.Visible=false
f(h.UIElements.MainContainer,.18,{Size=UDim2.new(1,0,0,-6)},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
task.wait(.23)
h.UIElements.MainContainer:Destroy()
end

function h.Lock(s)
f(h.UIElements.Main.Lock,.08,{BackgroundTransparency=.6}):Play()
f(h.UIElements.Main.Lock.ImageLabel,.08,{ImageTransparency=0}):Play()
f(h.UIElements.Main.Lock.TextLabel,.08,{TextTransparency=0}):Play()
h.UIElements.Main.Lock.Active=true
k=false
end
function h.Unlock(s)
f(h.UIElements.Main.Lock,.08,{BackgroundTransparency=1}):Play()
f(h.UIElements.Main.Lock.ImageLabel,.08,{ImageTransparency=1}):Play()
f(h.UIElements.Main.Lock.TextLabel,.08,{TextTransparency=1}):Play()
h.UIElements.Main.Lock.Active=false
k=true
end



h:Show()

return h
end end function a.j()
local b=a.load'a'
local d=b.New

local e={}

function e.New(f,g)
local h={
__type="Button",
Title=g.Title or"Button",
Desc=g.Desc or nil,
Locked=g.Locked or false,
Callback=g.Callback or function()end,
UIElements={}
}

local i=true

h.ButtonFrame=a.load'i'{
Title=h.Title,
Desc=h.Desc,
Parent=g.Parent,




Window=g.Window,
TextOffset=20,
Hover=true,
Scalable=true,
}

h.UIElements.ButtonIcon=d("ImageLabel",{
Image=b.Icon"mouse-pointer-click"[1],
ImageRectOffset=b.Icon"mouse-pointer-click"[2].ImageRectPosition,
ImageRectSize=b.Icon"mouse-pointer-click"[2].ImageRectSize,
BackgroundTransparency=1,
Parent=h.ButtonFrame.UIElements.Main,
Size=UDim2.new(0,20,0,20),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-h.ButtonFrame.UIPadding/2,0.5,0),
ThemeTag={
ImageColor3="Text"
}
})

function h.Lock(j)
i=false
return h.ButtonFrame:Lock()
end
function h.Unlock(j)
i=true
return h.ButtonFrame:Unlock()
end

if h.Locked then
h:Lock()
end

h.ButtonFrame.UIElements.Main.MouseButton1Click:Connect(function()
if i then
task.spawn(function()
h.Callback()
end)
end
end)
return h.__type,h
end

return e end function a.k()
local b=a.load'a'local d=
b.New local e=
b.Tween

local f=a.load'd'
local g=f.Toggle
local h=f.Checkbox

local i={}

function i.New(j,k)
local n={
__type="Toggle",
Title=k.Title or"Toggle",
Desc=k.Desc or nil,
Value=k.Value,
Icon=k.Icon or nil,
Type=k.Type or"Toggle",
Callback=k.Callback or function()end,
UIElements={}
}
n.ToggleFrame=a.load'i'{
Title=n.Title,
Desc=n.Desc,




Window=k.Window,
Parent=k.Parent,
TextOffset=44,
Hover=false,
}

local o=true

if n.Value==nil then
n.Value=false
end



function n.Lock(p)
o=false
return n.ToggleFrame:Lock()
end
function n.Unlock(p)
o=true
return n.ToggleFrame:Unlock()
end

if n.Locked then
n:Lock()
end

local p=n.Value

local q,r
if n.Type=="Toggle"then
q,r=g(p,n.Icon,n.ToggleFrame.UIElements.Main,n.Callback)
elseif n.Type=="Checkbox"then
q,r=h(p,n.Icon,n.ToggleFrame.UIElements.Main,n.Callback)
else
error("Unknown Toggle Type: "..tostring(n.Type))
end

q.AnchorPoint=Vector2.new(1,0.5)
q.Position=UDim2.new(1,-n.ToggleFrame.UIPadding/2,0.5,0)

function n.Set(s,t)
if o then
r:Set(t)
p=t
end
end

n:Set(p)

n.ToggleFrame.UIElements.Main.MouseButton1Click:Connect(function()
n:Set(not p)
end)

return n.__type,n
end

return i end function a.l()
local b=a.load'a'
local e=b.New
local f=b.Tween

local g={}

local h=false

function g.New(i,j)
local k={
__type="Slider",
Title=j.Title or"Slider",
Desc=j.Desc or nil,
Locked=j.Locked or nil,
Value=j.Value or{},
Step=j.Step or 1,
Callback=j.Callback or function()end,
UIElements={},
IsFocusing=false,
}
local n
local o
local p
local q=k.Value.Default or k.Value.Min or 0

local r=q
local s=(q-(k.Value.Min or 0))/((k.Value.Max or 100)-(k.Value.Min or 0))

local t=true

k.SliderFrame=a.load'i'{
Title=k.Title,
Desc=k.Desc,
Parent=j.Parent,
TextOffset=160,
Hover=false,
}

k.UIElements.SliderIcon=b.NewRoundFrame(99,"Squircle",{
ImageTransparency=.95,
Size=UDim2.new(0,126,0,4),
Name="Frame",
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
ImageColor3="Text",
},
},{
b.NewRoundFrame(99,"Squircle",{
Name="Frame",
Size=UDim2.new(s,0,1,0),
ImageTransparency=.1,
ThemeTag={
ImageColor3="Button",
},
},{
b.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,13,0,13),
Position=UDim2.new(1,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ThemeTag={
ImageColor3="Text",
},
})
})
})

k.UIElements.SliderContainer=e("Frame",{
Size=UDim2.new(0,0,0,0),
AutomaticSize="XY",
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-k.SliderFrame.UIPadding/2,0.5,0),
BackgroundTransparency=1,
Parent=k.SliderFrame.UIElements.Main,
},{
e("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
k.UIElements.SliderIcon,
e("TextBox",{
Size=UDim2.new(0,60,0,0),
TextXAlignment="Right",
Text=tostring(q),
ThemeTag={
TextColor3="Text"
},
TextTransparency=.4,
AutomaticSize="Y",
TextSize=15,
FontFace=Font.new(b.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
LayoutOrder=-1,
})
})

function k.Lock(u)
t=false
return k.SliderFrame:Lock()
end
function k.Unlock(u)
t=true
return k.SliderFrame:Unlock()
end

if k.Locked then
k:Lock()
end

function k.Set(u,v,w)
if t then
if not k.IsFocusing and not h and(not w or(w.UserInputType==Enum.UserInputType.MouseButton1 or w.UserInputType==Enum.UserInputType.Touch))then
v=math.clamp(v,k.Value.Min or 0,k.Value.Max or 100)

local x=math.clamp((v-(k.Value.Min or 0))/((k.Value.Max or 100)-(k.Value.Min or 0)),0,1)
v=math.floor((k.Value.Min+x*(k.Value.Max-k.Value.Min))/k.Step+0.5)*k.Step

if v~=r then
f(k.UIElements.SliderIcon.Frame,0.08,{Size=UDim2.new(x,0,1,0)}):Play()

k.UIElements.SliderContainer.TextBox.Text=tostring(v)
r=v
k.Callback(v)
end

if w then
n=(w.UserInputType==Enum.UserInputType.Touch)
k.SliderFrame.UIElements.Main.Parent.Parent.ScrollingEnabled=false
h=true
o=game:GetService"RunService".RenderStepped:Connect(function()
local y=n and w.Position.X or game:GetService"UserInputService":GetMouseLocation().X
local z=math.clamp((y-k.UIElements.SliderIcon.AbsolutePosition.X)/k.UIElements.SliderIcon.Size.X.Offset,0,1)
v=math.floor((k.Value.Min+z*(k.Value.Max-k.Value.Min))/k.Step+0.5)*k.Step

if v~=r then
f(k.UIElements.SliderIcon.Frame,0.08,{Size=UDim2.new(z,0,1,0)}):Play()

k.UIElements.SliderContainer.TextBox.Text=tostring(v)
r=v
k.Callback(v)
end
end)
p=game:GetService"UserInputService".InputEnded:Connect(function(y)
if(y.UserInputType==Enum.UserInputType.MouseButton1 or y.UserInputType==Enum.UserInputType.Touch)and w==y then
o:Disconnect()
p:Disconnect()
h=false
k.SliderFrame.UIElements.Main.Parent.Parent.ScrollingEnabled=true
end
end)
end
end
end
end

k.UIElements.SliderContainer.TextBox.FocusLost:Connect(function(u)
if u then
local v=tonumber(k.UIElements.SliderContainer.TextBox.Text)
if v then
k:Set(v)
else
k.UIElements.SliderContainer.TextBox.Text=tostring(r)
end
end
end)

k.UIElements.SliderContainer.InputBegan:Connect(function(u)
k:Set(q,u)
end)

return k.__type,k
end

return g end function a.m()
local b=game:GetService"UserInputService"

local e=a.load'a'
local f=e.New local g=
e.Tween

local h={
UICorner=6,
UIPadding=8,
}

local i=a.load'd'
local j=i.Label

function h.New(k,n)
local o={
__type="Keybind",
Title=n.Title or"Keybind",
Desc=n.Desc or nil,
Locked=n.Locked or false,
Value=n.Value or"F",
Callback=n.Callback or function()end,
CanChange=n.CanChange or true,
Picking=false,
UIElements={},
}

local p=true

o.KeybindFrame=a.load'i'{
Title=o.Title,
Desc=o.Desc,
Parent=n.Parent,
TextOffset=85,
Hover=o.CanChange,
}

o.UIElements.Keybind=j(o.Value,nil,o.KeybindFrame.UIElements.Main)

o.UIElements.Keybind.Size=UDim2.new(
0,24
+o.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,
0,
42
)
o.UIElements.Keybind.AnchorPoint=Vector2.new(1,0.5)
o.UIElements.Keybind.Position=UDim2.new(1,-o.KeybindFrame.UIPadding/2,0.5,0)

f("UIScale",{
Parent=o.UIElements.Keybind,
Scale=.85,
})

o.UIElements.Keybind.Frame.Frame.TextLabel:GetPropertyChangedSignal"TextBounds":Connect(function()
o.UIElements.Keybind.Size=UDim2.new(
0,24
+o.UIElements.Keybind.Frame.Frame.TextLabel.TextBounds.X,
0,
42
)
end)

function o.Lock(q)
p=false
return o.KeybindFrame:Lock()
end
function o.Unlock(q)
p=true
return o.KeybindFrame:Unlock()
end

if o.Locked then
o:Lock()
end

o.KeybindFrame.UIElements.Main.MouseButton1Click:Connect(function()
if p then
if o.CanChange then
o.Picking=true
o.UIElements.Keybind.Frame.Frame.TextLabel.Text="..."

task.wait(0.2)

local q
q=b.InputBegan:Connect(function(r)
local s

if r.UserInputType==Enum.UserInputType.Keyboard then
s=r.KeyCode.Name
elseif r.UserInputType==Enum.UserInputType.MouseButton1 then
s="MouseLeft"
elseif r.UserInputType==Enum.UserInputType.MouseButton2 then
s="MouseRight"
end

local t
t=b.InputEnded:Connect(function(u)
if u.KeyCode.Name==s or s=="MouseLeft"and u.UserInputType==Enum.UserInputType.MouseButton1 or s=="MouseRight"and u.UserInputType==Enum.UserInputType.MouseButton2 then
o.Picking=false

o.UIElements.Keybind.Frame.Frame.TextLabel.Text=s
o.Value=s

q:Disconnect()
t:Disconnect()
end
end)
end)
end
end
end)
b.InputBegan:Connect(function(q)
if p then
if q.KeyCode.Name==o.Value then
o.Callback(q.KeyCode.Name)
end
end
end)
return o.__type,o
end

return h end function a.n()
local b=a.load'a'
local e=b.New local f=
b.Tween

local g={
UICorner=8,
UIPadding=8,
}


local h=a.load'd'local i=
h.Button
local j=h.Input

function g.New(k,n)
local o={
__type="Input",
Title=n.Title or"Input",
Desc=n.Desc or nil,
Locked=n.Locked or false,
InputIcon=n.InputIcon or false,
PlaceholderText=n.Placeholder or"Enter Text...",
Value=n.Value or"",
Callback=n.Callback or function()end,
ClearTextOnFocus=n.ClearTextOnFocus or false,
UIElements={},
}

local p=true

o.InputFrame=a.load'i'{
Title=o.Title,
Desc=o.Desc,
Parent=n.Parent,
TextOffset=190,
Hover=false,
}

local q=j(o.PlaceholderText,o.InputIcon,o.InputFrame.UIElements.Main,function(q)
o:Set(q)
end)
q.Size=UDim2.new(0,180,0,42)
q.AnchorPoint=Vector2.new(1,0.5)
q.Position=UDim2.new(1,-o.InputFrame.UIPadding/2,0.5,0)

e("UIScale",{
Parent=q,
Scale=.85,
})

function o.Lock(r)
p=false
return o.InputFrame:Lock()
end
function o.Unlock(r)
p=true
return o.InputFrame:Unlock()
end


function o.Set(r,s)
if p then
o.Callback(s)

q.Frame.Frame.TextBox.Text=s
o.Value=s
end
end

o:Set(o.Value)

if o.Locked then
o:Lock()
end

return o.__type,o
end

return g end function a.o()
local b=game:GetService"UserInputService"
local e=game:GetService"Players".LocalPlayer:GetMouse()
local g=game:GetService"Workspace".CurrentCamera

local h=a.load'a'
local i=h.New
local j=h.Tween

local k=a.load'd'
local n=k.Label

local o={
UICorner=10,
UIPadding=12,
MenuCorner=14,
MenuPadding=5,
TabPadding=6,
}

function o.New(p,q)
local r={
__type="Dropdown",
Title=q.Title or"Dropdown",
Desc=q.Desc or nil,
Locked=q.Locked or false,
Values=q.Values or{},
Value=q.Value,
AllowNone=q.AllowNone,
Multi=q.Multi,
Callback=q.Callback or function()end,

UIElements={},

Opened=false,
Tabs={}
}

local s=true

r.DropdownFrame=a.load'i'{
Title=r.Title,
Desc=r.Desc,
Parent=q.Parent,
TextOffset=190,
Hover=false,
}


r.UIElements.Dropdown=n("",nil,r.DropdownFrame.UIElements.Main)

r.UIElements.Dropdown.Frame.Frame.TextLabel.TextTruncate="AtEnd"
r.UIElements.Dropdown.Frame.Frame.TextLabel.Size=UDim2.new(1,r.UIElements.Dropdown.Frame.Frame.TextLabel.Size.X.Offset-18-12-12,0,0)

r.UIElements.Dropdown.Size=UDim2.new(0,180,0,42)
r.UIElements.Dropdown.AnchorPoint=Vector2.new(1,0.5)
r.UIElements.Dropdown.Position=UDim2.new(1,-r.DropdownFrame.UIPadding/2,0.5,0)

i("UIScale",{
Parent=r.UIElements.Dropdown,
Scale=.85,
})

local t=i("ImageLabel",{
Image=h.Icon"chevron-down"[1],
ImageRectOffset=h.Icon"chevron-down"[2].ImageRectPosition,
ImageRectSize=h.Icon"chevron-down"[2].ImageRectSize,
Size=UDim2.new(0,18,0,18),
Position=UDim2.new(1,-12,0.5,0),
ThemeTag={
ImageColor3="Text"
},
AnchorPoint=Vector2.new(1,0.5),
Parent=r.UIElements.Dropdown.Frame
})

r.UIElements.UIListLayout=i("UIListLayout",{
Padding=UDim.new(0,o.MenuPadding/1.5),
FillDirection="Vertical"
})

r.UIElements.Menu=i("Frame",{
ThemeTag={
BackgroundColor3="Accent",
},
BackgroundTransparency=0.15,
Size=UDim2.new(1,0,1,0)
},{



i("UICorner",{
CornerRadius=UDim.new(0,o.MenuCorner)
}),
i("UIStroke",{
Thickness=1,
Transparency=1,
ThemeTag={
Color="Text"
}
}),
i("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Name="CanvasGroup",
ClipsDescendants=true
},{
i("UIPadding",{
PaddingTop=UDim.new(0,o.MenuPadding),
PaddingLeft=UDim.new(0,o.MenuPadding),
PaddingRight=UDim.new(0,o.MenuPadding),
PaddingBottom=UDim.new(0,o.MenuPadding),
}),
i("ScrollingFrame",{
Size=UDim2.new(1,0,1,0),
ScrollBarThickness=0,
ScrollingDirection="Y",
AutomaticCanvasSize="Y",
CanvasSize=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
},{
r.UIElements.UIListLayout,
})
})
})

r.UIElements.MenuCanvas=i("CanvasGroup",{
Size=UDim2.new(0,190,0,300),
BackgroundTransparency=1,
Position=UDim2.new(-10,0,-10,0),
Visible=false,
Active=false,
GroupTransparency=1,
Parent=q.Window.SuperParent.Parent.Dropdowns,
AnchorPoint=Vector2.new(1,0),
},{
r.UIElements.Menu,
i("UIPadding",{
PaddingTop=UDim.new(0,1),
PaddingLeft=UDim.new(0,1),
PaddingRight=UDim.new(0,1),
PaddingBottom=UDim.new(0,1),
}),
i("UISizeConstraint",{
MinSize=Vector2.new(190,0)
})
})

function r.Lock(u)
s=false
return r.DropdownFrame:Lock()
end
function r.Unlock(u)
s=true
return r.DropdownFrame:Unlock()
end

if r.Locked then
r:Lock()
end

local function RecalculateCanvasSize()
r.UIElements.Menu.CanvasGroup.ScrollingFrame.CanvasSize=UDim2.fromOffset(0,r.UIElements.UIListLayout.AbsoluteContentSize.Y)
end

local function RecalculateListSize()
if#r.Values>10 then
r.UIElements.MenuCanvas.Size=UDim2.fromOffset(r.UIElements.UIListLayout.AbsoluteContentSize.X,392)
else
r.UIElements.MenuCanvas.Size=UDim2.fromOffset(r.UIElements.UIListLayout.AbsoluteContentSize.X,r.UIElements.UIListLayout.AbsoluteContentSize.Y+o.MenuPadding*2+2)
end
end

function UpdatePosition()
local u=-r.UIElements.Dropdown.AbsoluteSize.Y
if g.ViewportSize.Y-r.UIElements.Dropdown.AbsolutePosition.Y-r.UIElements.Dropdown.AbsoluteSize.Y+u<r.UIElements.MenuCanvas.AbsoluteSize.Y+10 then
u=r.UIElements.MenuCanvas.AbsoluteSize.Y
-(g.ViewportSize.Y-r.UIElements.Dropdown.AbsolutePosition.Y)
+10
end
r.UIElements.MenuCanvas.Position=UDim2.new(0,r.UIElements.Dropdown.AbsolutePosition.X+r.UIElements.Dropdown.AbsoluteSize.X+1,0,r.UIElements.Dropdown.AbsolutePosition.Y+r.UIElements.Dropdown.AbsoluteSize.Y-u)
end

function r.Display(u)
local v=r.Values
local w=""

if r.Multi then
for x,y in next,v do
if func('table.find')(r.Value,y)then
w=w..y..", "
end
end
w=w:sub(1,#w-2)
else
w=r.Value or""
end

r.UIElements.Dropdown.Frame.Frame.TextLabel.Text=(w==""and"--"or w)
end

function r.Refresh(u,v)
for w,x in next,r.UIElements.Menu.CanvasGroup.ScrollingFrame:GetChildren()do
if not x:IsA"UIListLayout"then
x:Destroy()
end
end

r.Tabs={}

for y,z in next,v do

local A={
Name=z,
Selected=false,
UIElements={},
}
A.UIElements.TabItem=i("TextButton",{
Size=UDim2.new(1,0,0,34),

BackgroundTransparency=1,
Parent=r.UIElements.Menu.CanvasGroup.ScrollingFrame,
Text="",

},{
i("UIPadding",{
PaddingTop=UDim.new(0,o.TabPadding),
PaddingLeft=UDim.new(0,o.TabPadding),
PaddingRight=UDim.new(0,o.TabPadding),
PaddingBottom=UDim.new(0,o.TabPadding),
}),
i("UICorner",{
CornerRadius=UDim.new(0,o.MenuCorner-o.MenuPadding)
}),
i("ImageLabel",{
Image=h.Icon"check"[1],
ImageRectSize=h.Icon"check"[2].ImageRectSize,
ImageRectOffset=h.Icon"check"[2].ImageRectPosition,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Size=UDim2.new(0,18,0,18),
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,0,0.5,0),
BackgroundTransparency=1,
}),
i("TextLabel",{
Text=z,
TextXAlignment="Left",
FontFace=Font.new(h.Font,Enum.FontWeight.Medium),
ThemeTag={
TextColor3="Text",
BackgroundColor3="Text"
},
TextSize=15,
BackgroundTransparency=1,
TextTransparency=.4,
AutomaticSize="Y",
TextTruncate="AtEnd",
Size=UDim2.new(1,-18-o.TabPadding*3,0,0),
AnchorPoint=Vector2.new(0,0.5),
Position=UDim2.new(0,0,0.5,0),
})
})


if r.Multi then
A.Selected=func('table.find')(r.Value or{},A.Name)
else
A.Selected=r.Value==A.Name
end

if A.Selected then
A.UIElements.TabItem.BackgroundTransparency=.93
A.UIElements.TabItem.ImageLabel.ImageTransparency=.1
A.UIElements.TabItem.TextLabel.Position=UDim2.new(0,18+o.TabPadding,0.5,0)
A.UIElements.TabItem.TextLabel.TextTransparency=0
end

r.Tabs[y]=A

r:Display()

local function Callback()
r:Display()
task.spawn(function()
r.Callback(r.Value)
end)
end

A.UIElements.TabItem.MouseButton1Click:Connect(function()
if r.Multi then
if not A.Selected then
A.Selected=true
j(A.UIElements.TabItem,0.1,{BackgroundTransparency=.93}):Play()
j(A.UIElements.TabItem.ImageLabel,0.1,{ImageTransparency=.1}):Play()
j(A.UIElements.TabItem.TextLabel,0.1,{Position=UDim2.new(0,18+o.TabPadding,0.5,0),TextTransparency=0}):Play()
table.insert(r.Value,A.Name)
else
if not r.AllowNone and#r.Value==1 then
return
end
A.Selected=false
j(A.UIElements.TabItem,0.1,{BackgroundTransparency=1}):Play()
j(A.UIElements.TabItem.ImageLabel,0.1,{ImageTransparency=1}):Play()
j(A.UIElements.TabItem.TextLabel,0.1,{Position=UDim2.new(0,0,0.5,0),TextTransparency=.4}):Play()
for B,C in ipairs(r.Value)do
if C==A.Name then
table.remove(r.Value,B)
break
end
end
end
else
for B,C in next,r.Tabs do

j(C.UIElements.TabItem,0.1,{BackgroundTransparency=1}):Play()
j(C.UIElements.TabItem.ImageLabel,0.1,{ImageTransparency=1}):Play()
j(C.UIElements.TabItem.TextLabel,0.1,{Position=UDim2.new(0,0,0.5,0),TextTransparency=.4}):Play()
C.Selected=false
end
A.Selected=true
j(A.UIElements.TabItem,0.1,{BackgroundTransparency=.93}):Play()
j(A.UIElements.TabItem.ImageLabel,0.1,{ImageTransparency=.1}):Play()
j(A.UIElements.TabItem.TextLabel,0.1,{Position=UDim2.new(0,18+o.TabPadding,0.5,0),TextTransparency=0}):Play()
r.Value=A.Name
end
Callback()
end)

RecalculateCanvasSize()
RecalculateListSize()
end
end

r:Refresh(r.Values)

function r.Select(u,v)
if v then
r.Value=v
end
r:Refresh(r.Values)
end


RecalculateListSize()

function r.Open(u)
r.Opened=true
r.UIElements.MenuCanvas.Visible=true
r.UIElements.MenuCanvas.Active=true
r.UIElements.Menu.Size=UDim2.new(
1,0,
0,0
)
j(r.UIElements.Menu,0.1,{
Size=UDim2.new(
1,0,
1,0
)
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()

j(t,.15,{Rotation=180}):Play()
j(r.UIElements.MenuCanvas,.15,{GroupTransparency=0}):Play()

UpdatePosition()
end
function r.Close(u)
r.Opened=false

j(r.UIElements.Menu,0.1,{
Size=UDim2.new(
1,0,
0.8,0
)
},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()
j(t,.15,{Rotation=0}):Play()
j(r.UIElements.MenuCanvas,.15,{GroupTransparency=1}):Play()
task.wait(.1)
r.UIElements.MenuCanvas.Visible=false
r.UIElements.MenuCanvas.Active=false
end

r.UIElements.Dropdown.MouseButton1Click:Connect(function()
if s then
r:Open()
end
end)

b.InputBegan:Connect(function(u)
if
u.UserInputType==Enum.UserInputType.MouseButton1
or u.UserInputType==Enum.UserInputType.Touch
then
local v,w=r.UIElements.MenuCanvas.AbsolutePosition,r.UIElements.MenuCanvas.AbsoluteSize
if
q.Window.CanDropdown
and(e.X<v.X
or e.X>v.X+w.X
or e.Y<(v.Y-20-1)
or e.Y>v.Y+w.Y)
then
r:Close()
end
end
end)

r.UIElements.Dropdown:GetPropertyChangedSignal"AbsolutePosition":Connect(UpdatePosition)

return r.__type,r
end

return o end function a.p()
local b=a.load'a'local e=
b.New


local g=a.load'd'

local h={}

function h.New(i,j)
local k={
__type="Code",
Title=j.Title,
Code=j.Code,
UIElements={}
}

local n=not k.Locked











local o=g.Code(k.Code,k.Title,j.Parent,function()
if n then
local o=k.Title or"code"
local p,q=pcall(function()
toclipboard(k.Code)
end)
if p then
j.WindUI:Notify{
Title="Success",
Content="The "..o.." copied to your clipboard.",
Icon="check",
Duration=5,
}
else
j.WindUI:Notify{
Title="Error",
Content="The "..o.." is not copied. Error: "..q,
Icon="x",
Duration=5,
}
end
end
end)

function k.SetCode(p,q)
o.Set(q)
end

return k.__type,k
end

return h end function a.q()
local b=a.load'a'
local e=b.New local g=
b.Tween

local h=game:GetService"UserInputService"
game:GetService"TouchInputService"
local i=game:GetService"RunService"
local j=game:GetService"Players"

local k=i.RenderStepped
local n=j.LocalPlayer
local o=n:GetMouse()

local p=a.load'd'
local q=p.Button
local r=p.Input

local s={
UICorner=8,
UIPadding=8
}

function s.Colorpicker(t,u,v)
local w={
__type="Colorpicker",
Title=u.Title,
Desc=u.Desc,
Default=u.Default,
Callback=u.Callback,
Transparency=u.Transparency,
UIElements=u.UIElements,
}

function w.SetHSVFromRGB(x,y)
local z,A,B=Color3.toHSV(y)
w.Hue=z
w.Sat=A
w.Vib=B
end

w:SetHSVFromRGB(w.Default)

local x=a.load'e'.Init(u.Window)
local y=x.Create()

w.ColorpickerFrame=y



local z,A,B=w.Hue,w.Sat,w.Vib

w.UIElements.Title=e("TextLabel",{
Text=w.Title,
TextSize=20,
FontFace=Font.new(b.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text"
},
BackgroundTransparency=1,
Parent=y.UIElements.Main
})





local C=e("ImageLabel",{
Size=UDim2.new(0,18,0,18),
ScaleType=Enum.ScaleType.Fit,
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Image="http://www.roblox.com/asset/?id=4805639000",
})

w.UIElements.SatVibMap=e("ImageLabel",{
Size=UDim2.fromOffset(160,158),
Position=UDim2.fromOffset(0,40),
Image="rbxassetid://4155801252",
BackgroundColor3=Color3.fromHSV(z,1,1),
BackgroundTransparency=0,
Parent=y.UIElements.Main,
},{
e("UICorner",{
CornerRadius=UDim.new(0,8),
}),
e("UIStroke",{
Thickness=.6,
ThemeTag={
Color="Text"
},
Transparency=.8,
}),
C,
})

w.UIElements.Inputs=e("Frame",{
AutomaticSize="XY",
Size=UDim2.new(0,0,0,0),
Position=UDim2.fromOffset(w.Transparency and 240 or 210,40),
BackgroundTransparency=1,
Parent=y.UIElements.Main
},{
e("UIListLayout",{
Padding=UDim.new(0,5),
FillDirection="Vertical",
})
})





local D=e("Frame",{
BackgroundColor3=w.Default,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=w.Transparency,
},{
e("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

e("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(85,208),
Size=UDim2.fromOffset(75,24),
Parent=y.UIElements.Main,
},{
e("UICorner",{
CornerRadius=UDim.new(0,8),
}),
e("UIStroke",{
Thickness=1,
Transparency=0.8,
ThemeTag={
Color="Text"
}
}),
D,
})

local E=e("Frame",{
BackgroundColor3=w.Default,
Size=UDim2.fromScale(1,1),
BackgroundTransparency=0,
ZIndex=9,
},{
e("UICorner",{
CornerRadius=UDim.new(0,8),
}),
})

e("ImageLabel",{
Image="http://www.roblox.com/asset/?id=14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Position=UDim2.fromOffset(0,208),
Size=UDim2.fromOffset(75,24),
Parent=y.UIElements.Main,
},{
e("UICorner",{
CornerRadius=UDim.new(0,8),
}),
e("UIStroke",{
Thickness=1,
Transparency=0.8,
ThemeTag={
Color="Text"
}
}),
E,
})

local F={}

for G=0,1,0.1 do
table.insert(F,ColorSequenceKeypoint.new(G,Color3.fromHSV(G,1,1)))
end

local G=e("UIGradient",{
Color=ColorSequence.new(F),
Rotation=90,
})

local H=e("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
})

local I=e("Frame",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
Parent=H,


BackgroundColor3=w.Default
},{
e("UIStroke",{
Thickness=2,
Transparency=.1,
ThemeTag={
Color="Text",
},
}),
e("UICorner",{
CornerRadius=UDim.new(1,0),
})
})

local J=e("Frame",{
Size=UDim2.fromOffset(10,192),
Position=UDim2.fromOffset(180,40),
Parent=y.UIElements.Main,
},{
e("UICorner",{
CornerRadius=UDim.new(1,0),
}),
G,
H,
})


function CreateNewInput(K,L)
local M=r(K,nil,w.UIElements.Inputs)

e("TextLabel",{
BackgroundTransparency=1,
TextTransparency=.4,
TextSize=17,
FontFace=Font.new(b.Font,Enum.FontWeight.Regular),
AutomaticSize="XY",
ThemeTag={
TextColor3="Placeholder",
},
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-12,0.5,0),
Parent=M.Frame,
Text=K,
})

e("UIScale",{
Parent=M,
Scale=.85,
})

M.Frame.Frame.TextBox.Text=L
M.Size=UDim2.new(0,150,0,42)

return M
end

local function ToRGB(K)
return{
R=math.floor(K.R*255),
G=math.floor(K.G*255),
B=math.floor(K.B*255)
}
end

local K=CreateNewInput("Hex","#"..w.Default:ToHex())

local L=CreateNewInput("Red",ToRGB(w.Default).R)
local M=CreateNewInput("Green",ToRGB(w.Default).G)
local N=CreateNewInput("Blue",ToRGB(w.Default).B)
local O
if w.Transparency then
O=CreateNewInput("Alpha",((1-w.Transparency)*100).."%")
end

local P=e("Frame",{
Size=UDim2.new(1,0,0,40),
AutomaticSize="Y",
Position=UDim2.new(0,0,0,254),
BackgroundTransparency=1,
Parent=y.UIElements.Main,
LayoutOrder=4,
},{
e("UIListLayout",{
Padding=UDim.new(0,8),
FillDirection="Horizontal",
HorizontalAlignment="Right",
}),
})

local Q={
{
Title="Cancel",
Variant="Secondary",
Callback=function()end
},
{
Title="Apply",
Icon="chevron-right",
Variant="Primary",
Callback=function()v(Color3.fromHSV(w.Hue,w.Sat,w.Vib),w.Transparency)end
}
}

for R,S in next,Q do
q(S.Title,S.Icon,S.Callback,S.Variant,P,y)
end


























































local T,U,V
if w.Transparency then
local W=e("Frame",{
Size=UDim2.new(1,0,1,0),
Position=UDim2.fromOffset(0,0),
BackgroundTransparency=1,
})

U=e("ImageLabel",{
Size=UDim2.new(0,14,0,14),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0,0),
ThemeTag={
BackgroundColor3="Text",
},
Parent=W,

},{
e("UIStroke",{
Thickness=2,
Transparency=.1,
ThemeTag={
Color="Text",
},
}),
e("UICorner",{
CornerRadius=UDim.new(1,0),
})

})

V=e("Frame",{
Size=UDim2.fromScale(1,1),
},{
e("UIGradient",{
Transparency=NumberSequence.new{
NumberSequenceKeypoint.new(0,0),
NumberSequenceKeypoint.new(1,1),
},
Rotation=270,
}),
e("UICorner",{
CornerRadius=UDim.new(0,6),
}),
})

T=e("Frame",{
Size=UDim2.fromOffset(10,192),
Position=UDim2.fromOffset(210,40),
Parent=y.UIElements.Main,
BackgroundTransparency=1,
},{
e("UICorner",{
CornerRadius=UDim.new(1,0),
}),
e("ImageLabel",{
Image="rbxassetid://14204231522",
ImageTransparency=0.45,
ScaleType=Enum.ScaleType.Tile,
TileSize=UDim2.fromOffset(40,40),
BackgroundTransparency=1,
Size=UDim2.fromScale(1,1),
},{
e("UICorner",{
CornerRadius=UDim.new(1,0),
}),
}),
V,
W,
})
end

function w.Round(W,X,Y)
if Y==0 then
return math.floor(X)
end
X=tostring(X)
return X:find"%."and tonumber(X:sub(1,X:find"%."+Y))or X
end


function w.Update(W,X,Y)
if X then z,A,B=Color3.toHSV(X)else z,A,B=w.Hue,w.Sat,w.Vib end

w.UIElements.SatVibMap.BackgroundColor3=Color3.fromHSV(z,1,1)
C.Position=UDim2.new(A,0,1-B,0)
E.BackgroundColor3=Color3.fromHSV(z,A,B)
I.BackgroundColor3=Color3.fromHSV(z,1,1)
I.Position=UDim2.new(0.5,0,z,0)

K.Frame.Frame.TextBox.Text="#"..Color3.fromHSV(z,A,B):ToHex()
L.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(z,A,B)).R
M.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(z,A,B)).G
N.Frame.Frame.TextBox.Text=ToRGB(Color3.fromHSV(z,A,B)).B

if Y or w.Transparency then
E.BackgroundTransparency=w.Transparency or Y
V.BackgroundColor3=Color3.fromHSV(z,A,B)
U.BackgroundColor3=Color3.fromHSV(z,A,B)
U.BackgroundTransparency=w.Transparency or Y
U.Position=UDim2.new(0.5,0,1-w.Transparency or Y,0)
O.Frame.Frame.TextBox.Text=w:Round((1-w.Transparency or Y)*100,0).."%"
end
end

w:Update(w.Default,w.Transparency)




local function GetRGB()
local W=Color3.fromHSV(w.Hue,w.Sat,w.Vib)
return{R=math.floor(W.r*255),G=math.floor(W.g*255),B=math.floor(W.b*255)}
end



local function clamp(W,X,Y)
return math.clamp(tonumber(W)or 0,X,Y)
end

K.Frame.Frame.TextBox.FocusLost:Connect(function(W)
if W then
local X=K.Frame.Frame.TextBox.Text:gsub("#","")
local Y,Z=pcall(Color3.fromHex,X)
if Y and typeof(Z)=="Color3"then
w.Hue,w.Sat,w.Vib=Color3.toHSV(Z)
w:Update()
w.Default=Z
end
end
end)

local function updateColorFromInput(W,X)
W.Frame.Frame.TextBox.FocusLost:Connect(function(Y)
if Y then
local Z=W.Frame.Frame.TextBox
local _=GetRGB()
local aa=clamp(Z.Text,0,255)
Z.Text=tostring(aa)

_[X]=aa
local ab=Color3.fromRGB(_.R,_.G,_.B)
w.Hue,w.Sat,w.Vib=Color3.toHSV(ab)
w:Update()
end
end)
end

updateColorFromInput(L,"R")
updateColorFromInput(M,"G")
updateColorFromInput(N,"B")

if w.Transparency then
O.Frame.Frame.TextBox.FocusLost:Connect(function(aa)
if aa then
local ab=O.Frame.Frame.TextBox
local W=clamp(ab.Text,0,100)
ab.Text=tostring(W)

w.Transparency=1-W*0.01
w:Update(nil,w.Transparency)
end
end)
end



local aa=w.UIElements.SatVibMap
aa.InputBegan:Connect(function(ab)
if ab.UserInputType==Enum.UserInputType.MouseButton1 or ab.UserInputType==Enum.UserInputType.Touch then
while h:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
local W=aa.AbsolutePosition.X
local X=W+aa.AbsoluteSize.X
local Y=math.clamp(o.X,W,X)

local Z=aa.AbsolutePosition.Y
local _=Z+aa.AbsoluteSize.Y
local ac=math.clamp(o.Y,Z,_)

w.Sat=(Y-W)/(X-W)
w.Vib=1-((ac-Z)/(_-Z))
w:Update()

k:Wait()
end
end
end)

J.InputBegan:Connect(function(ab)
if ab.UserInputType==Enum.UserInputType.MouseButton1 or ab.UserInputType==Enum.UserInputType.Touch then
while h:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
local ac=J.AbsolutePosition.Y
local W=ac+J.AbsoluteSize.Y
local X=math.clamp(o.Y,ac,W)

w.Hue=((X-ac)/(W-ac))
w:Update()

k:Wait()
end
end
end)

if w.Transparency then
T.InputBegan:Connect(function(ab)
if ab.UserInputType==Enum.UserInputType.MouseButton1 or ab.UserInputType==Enum.UserInputType.Touch then
while h:IsMouseButtonPressed(Enum.UserInputType.MouseButton1)do
local ac=T.AbsolutePosition.Y
local W=ac+T.AbsoluteSize.Y
local X=math.clamp(o.Y,ac,W)

w.Transparency=1-((X-ac)/(W-ac))
w:Update()

k:Wait()
end
end
end)
end

return w
end

function s.New(aa,ab)
local ac={
__type="Colorpicker",
Title=ab.Title or"Colorpicker",
Desc=ab.Desc or nil,
Locked=ab.Locked or false,
Default=ab.Default or Color3.new(1,1,1),
Callback=ab.Callback or function()end,
Window=ab.Window,
Transparency=ab.Transparency,
UIElements={}
}

local t=true


ac.ColorpickerFrame=a.load'i'{
Title=ac.Title,
Desc=ac.Desc,
Parent=ab.Parent,
TextOffset=40,
Hover=false,
}

ac.UIElements.Colorpicker=b.NewRoundFrame(s.UICorner,"Squircle",{
ImageTransparency=0,
Active=true,
ImageColor3=ac.Default,
Parent=ac.ColorpickerFrame.UIElements.Main,
Size=UDim2.new(0,30,0,30),
AnchorPoint=Vector2.new(1,0.5),
Position=UDim2.new(1,-ac.ColorpickerFrame.UIPadding/2,0.5,0),
ZIndex=2
},nil,true)


function ac.Lock(u)
t=false
return ac.ColorpickerFrame:Lock()
end
function ac.Unlock(u)
t=true
return ac.ColorpickerFrame:Unlock()
end

if ac.Locked then
ac:Lock()
end


function ac.Update(u,v,w)
ac.UIElements.Colorpicker.BackgroundTransparency=w or 0
ac.UIElements.Colorpicker.BackgroundColor3=v
ac.Default=v
if w then
ac.Transparency=w
end
end


ac.UIElements.Colorpicker.MouseButton1Click:Connect(function()
if t then
s:Colorpicker(ac,function(u,v)
if t then
ac:Update(u,v)
ac.Default=u
ac.Transparency=v
ac.Callback(u,v)
end
end).ColorpickerFrame:Open()
end
end)

return ac.__type,ac
end

return s end function a.r()
local aa=a.load'a'
local ab=aa.New
local ac=aa.Tween

local b={}

function b.New(e,g)
local h={
__type="Section",
Title=g.Title or"Section",
TextXAlignment=g.TextXAlignment or"Left",
TextSize=g.TextSize or 19,
UIElements={},
}

h.UIElements.Main=ab("TextLabel",{
BackgroundTransparency=1,
TextXAlignment=h.TextXAlignment,
AutomaticSize="Y",
TextSize=h.TextSize,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(aa.Font,Enum.FontWeight.SemiBold),
Parent=g.Parent,
Size=UDim2.new(1,0,0,0),
Text=h.Title,
},{
ab("UIPadding",{
PaddingTop=UDim.new(0,4),
PaddingBottom=UDim.new(0,2),
})
})





function h.SetTitle(i,j)
h.UIElements.Main.Text=j
end
function h.Destroy(i)
h.UIElements.Main.AutomaticSize="None"
h.UIElements.Main.Size=UDim2.new(1,0,0,h.UIElements.Main.TextBounds.Y)

ac(h.UIElements.Main,.1,{TextTransparency=1}):Play()
task.wait(.1)
ac(h.UIElements.Main,.15,{Size=UDim2.new(1,0,0,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()
end

return h.__type,h
end

return b end function a.s()
game:GetService"UserInputService"
local aa=game:GetService('Players').LocalPlayer:GetMouse()

local ab=a.load'a'
local ac=ab.New
local b=ab.Tween

local e=a.load'd'
local g=e.Button local h=
e.ScrollSlider


local i={
Window=nil,
WindUI=nil,
Tabs={},
Containers={},
SelectedTab=nil,
TabCount=0,
ToolTipParent=nil,
TabHighlight=nil,

OnChangeFunc=function(i)end
}

function i.Init(j,k,n,o)
i.Window=j
i.WindUI=k
i.ToolTipParent=n
i.TabHighlight=o
return i
end

function i.New(j)
local k={
Title=j.Title or"Tab",
Desc=j.Desc,
Icon=j.Icon,
Locked=j.Locked,
ShowTabTitle=j.ShowTabTitle,
Selected=false,
Index=nil,
Parent=j.Parent,
UIElements={},
Elements={},
ContainerFrame=nil,
}

local n=i.Window
local o=i.WindUI

i.TabCount=i.TabCount+1
local p=i.TabCount
k.Index=p

k.UIElements.Main=ac("TextButton",{
BackgroundTransparency=1,
Size=UDim2.new(1,-7,0,0),
AutomaticSize="Y",
Parent=j.Parent
},{
ac("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ac("TextLabel",{
Text=k.Title,
ThemeTag={
TextColor3="Text"
},
TextTransparency=not k.Locked and 0.4 or.7,
TextSize=15,
Size=UDim2.new(1,0,0,0),
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
TextWrapped=true,
RichText=true,
AutomaticSize="Y",
LayoutOrder=2,
TextXAlignment="Left",
BackgroundTransparency=1,
}),
ac("UIPadding",{
PaddingTop=UDim.new(0,6),
PaddingBottom=UDim.new(0,6),
})
})

local q=0
local r






if k.Icon and ab.Icon(k.Icon)then
r=ac("ImageLabel",{
ImageTransparency=not k.Locked and 0.5 or.7,
Image=ab.Icon(k.Icon)[1],
ImageRectOffset=ab.Icon(k.Icon)[2].ImageRectPosition,
ImageRectSize=ab.Icon(k.Icon)[2].ImageRectSize,
Size=UDim2.new(0,18,0,18),
LayoutOrder=1,
ThemeTag={
ImageColor3="Text"
},
BackgroundTransparency=1,
Parent=k.UIElements.Main,
})
k.UIElements.Main.TextLabel.Size=UDim2.new(1,-30,0,0)
q=-30
elseif k.Icon and string.find(k.Icon,"rbxassetid://")then
r=ac("ImageLabel",{
ImageTransparency=not k.Locked and 0.5 or.7,
Image=k.Icon,
Size=UDim2.new(0,18,0,18),
LayoutOrder=1,
ThemeTag={
ImageColor3="Text"
},
BackgroundTransparency=1,
Parent=k.UIElements.Main,
})
k.UIElements.Main.TextLabel.Size=UDim2.new(1,-30,0,0)
q=-30
end

k.UIElements.ContainerFrame=ac("ScrollingFrame",{
Size=UDim2.new(1,0,1,k.ShowTabTitle and-((n.UIPadding*2.4)+12)or 0),
BackgroundTransparency=1,
ScrollBarThickness=0,
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
AnchorPoint=Vector2.new(0,1),
Position=UDim2.new(0,0,1,0),
AutomaticCanvasSize="Y",

ScrollingDirection="Y",
},{
ac("UIPadding",{
PaddingTop=UDim.new(0,n.UIPadding*1.2),
PaddingLeft=UDim.new(0,n.UIPadding*1.2),
PaddingRight=UDim.new(0,n.UIPadding*1.2),
PaddingBottom=UDim.new(0,n.UIPadding*1.2),
}),
ac("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,6)
})
})





k.UIElements.ContainerFrameCanvas=ac("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Visible=false,
Parent=n.UIElements.MainBar,
ZIndex=5,
},{
k.UIElements.ContainerFrame,
ac("Frame",{
Size=UDim2.new(1,0,0,((n.UIPadding*2.4)+12)),
BackgroundTransparency=1,
Visible=k.ShowTabTitle or false,
Name="TabTitle"
},{
r and r:Clone(),
ac("TextLabel",{
Text=k.Title,
ThemeTag={
TextColor3="Text"
},
TextSize=20,
TextTransparency=.1,
Size=UDim2.new(1,0,1,0),
FontFace=Font.new(ab.Font,Enum.FontWeight.SemiBold),
TextTruncate="AtEnd",
RichText=true,
LayoutOrder=2,
TextXAlignment="Left",
BackgroundTransparency=1,
}),
ac("UIPadding",{
PaddingTop=UDim.new(0,n.UIPadding*1.2),
PaddingLeft=UDim.new(0,n.UIPadding*1.2),
PaddingRight=UDim.new(0,n.UIPadding*1.2),
PaddingBottom=UDim.new(0,n.UIPadding*1.2),
}),
ac("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,10),
FillDirection="Horizontal",
VerticalAlignment="Center",
})
}),
ac("Frame",{
Size=UDim2.new(1,0,0,1),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
},
Position=UDim2.new(0,0,0,((n.UIPadding*2.4)+12)),
Visible=k.ShowTabTitle or false,
})
})

i.Containers[p]=k.UIElements.ContainerFrameCanvas
i.Tabs[p]=k

k.ContainerFrame=ContainerFrameCanvas

k.UIElements.Main.MouseButton1Click:Connect(function()
if not k.Locked then
i:SelectTab(p)
end
end)






if k.Desc then
local s
local t
local u
local v=false

local function removeToolTip()
v=false
if t then
task.cancel(t)
t=nil
end
if u then
u:Disconnect()
u=nil
end
if s then
s:Close()
s=nil
end
end

k.UIElements.Main.InputBegan:Connect(function()
v=true
t=task.spawn(function()
task.wait(0.35)
if v and not s then
s=e.ToolTip(k.Desc,i.ToolTipParent)

local function updatePosition()
if s then
s.Container.Position=UDim2.new(0,aa.X,0,aa.Y-20)
end
end

updatePosition()
u=aa.Move:Connect(updatePosition)
s:Open()
end
end)
end)

k.UIElements.Main.InputEnded:Connect(removeToolTip)
end


local s={
Button=a.load'j',
Toggle=a.load'k',
Slider=a.load'l',
Keybind=a.load'm',
Input=a.load'n',
Dropdown=a.load'o',
Code=a.load'p',
Colorpicker=a.load'q',
Section=a.load'r',
}

function k.Paragraph(t,u)
u.Parent=k.UIElements.ContainerFrame
u.Window=n
u.Hover=false

u.TextOffset=0
u.IsButtons=u.Buttons and#u.Buttons>0 and true or false

local v={
__type="Paragraph",
Title=u.Title or"Paragraph",
Desc=u.Desc or nil,

Locked=u.Locked or false,
}
local w=a.load'i'(u)

v.ParagraphFrame=w
if u.Buttons and#u.Buttons>0 then
local x=ac("Frame",{
Size=UDim2.new(1,0,0,38),
BackgroundTransparency=1,
Position=UDim2.new(0,0,0,
u.Image
and w.ImageSize>w.UIElements.Main.Title.AbsoluteSize.Y
and w.ImageSize+w.UIPadding
or w.UIElements.Main.Title.AbsoluteSize.Y+w.UIPadding+(u.ThumbnailSize or 0)
),
Parent=w.UIElements.Main
},{
ac("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Vertical",
})
})


for y,z in next,u.Buttons do
local A=g(z.Title,z.Icon,z.Callback,"White",x)
A.Size=UDim2.new(1,0,0,38)
A.AutomaticSize="None"
end
end

function v.SetTitle(x,y)
v.ParagraphFrame:SetTitle(y)
end
function v.SetDesc(x,y)
v.ParagraphFrame:SetDesc(y)
end
function v.Destroy(x)
v.ParagraphFrame:Destroy()
end

table.insert(k.Elements,v)
return v
end

for t,u in pairs(s)do
k[t]=function(v,w)
w.Parent=v.UIElements.ContainerFrame
w.Window=n
w.WindUI=o local

x, y=u:New(w)
table.insert(v.Elements,y)

local z
for A,B in pairs(y)do
if typeof(B)=="table"and A:match"Frame$"then
z=B
break
end
end

if z then
function y.SetTitle(C,D)
z:SetTitle(D)
end
function y.SetDesc(C,D)
z:SetDesc(D)
end
function y.Destroy(C)
z:Destroy()
end
end
return y
end
end


task.spawn(function()
local v=ac("Frame",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,-n.UIElements.Main.Main.Topbar.AbsoluteSize.Y),
Parent=k.UIElements.ContainerFrame
},{
ac("UIListLayout",{
Padding=UDim.new(0,8),
SortOrder="LayoutOrder",
VerticalAlignment="Center",
HorizontalAlignment="Center",
FillDirection="Vertical",
}),
ac("ImageLabel",{
Size=UDim2.new(0,48,0,48),
Image=ab.Icon"frown"[1],
ImageRectOffset=ab.Icon"frown"[2].ImageRectPosition,
ImageRectSize=ab.Icon"frown"[2].ImageRectSize,
ThemeTag={
ImageColor3="Text"
},
BackgroundTransparency=1,
ImageTransparency=.4,
}),
ac("TextLabel",{
AutomaticSize="XY",
Text="This tab is empty",
ThemeTag={
TextColor3="Text"
},
TextSize=18,
TextTransparency=.4,
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
})
})





k.UIElements.ContainerFrame.ChildAdded:Connect(function()
v.Visible=false
end)
end)

return k
end

function i.OnChange(j,k)
i.OnChangeFunc=k
end

function i.SelectTab(j,k)
if not i.Tabs[k].Locked then
i.SelectedTab=k

for n,o in next,i.Tabs do
if not o.Locked then
b(o.UIElements.Main.TextLabel,0.15,{TextTransparency=0.45}):Play()
if o.Icon and ab.Icon(o.Icon)then
b(o.UIElements.Main.ImageLabel,0.15,{ImageTransparency=0.5}):Play()
end
o.Selected=false
end
end
b(i.Tabs[k].UIElements.Main.TextLabel,0.15,{TextTransparency=0}):Play()
if i.Tabs[k].Icon and ab.Icon(i.Tabs[k].Icon)then
b(i.Tabs[k].UIElements.Main.ImageLabel,0.15,{ImageTransparency=0.15}):Play()
end
i.Tabs[k].Selected=true

b(i.TabHighlight,.25,{Position=UDim2.new(
0,
0,
0,
i.Tabs[k].UIElements.Main.AbsolutePosition.Y-i.Tabs[k].Parent.AbsolutePosition.Y
),
Size=UDim2.new(1,-7,0,i.Tabs[k].UIElements.Main.AbsoluteSize.Y)
},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.spawn(function()
for p,q in next,i.Containers do
q.AnchorPoint=Vector2.new(0,0.05)
q.Visible=false
end
i.Containers[k].Visible=true
b(i.Containers[k],0.15,{AnchorPoint=Vector2.new(0,0)},Enum.EasingStyle.Quart,Enum.EasingDirection.Out):Play()
end)

i.OnChangeFunc(k)
end
end

return i end function a.t()
game:GetService"UserInputService"

local aa={
Margin=8,
Padding=9,
}


local ab=a.load'a'
local ac=ab.New
local b=ab.Tween


function aa.new(e,g,h)
local i={
IconSize=14,
Padding=14,
Radius=15,
Width=400,
MaxHeight=380,

Icons={
Tab="table-of-contents",
Paragraph="type",
Button="square-mouse-pointer",
Toggle="toggle-right",
Slider="sliders-horizontal",
Keybind="command",
Input="text-cursor-input",
Dropdown="chevrons-up-down",
Code="terminal",
Colorpicker="palette",
}
}


local j=ac("TextBox",{
Text="",
PlaceholderText="Search...",
ThemeTag={
PlaceholderColor3="Placeholder",
TextColor3="Text",
},
Size=UDim2.new(
1,
-((i.IconSize*2)+(i.Padding*2)),
0,
0
),
AutomaticSize="Y",
ClipsDescendants=true,
ClearTextOnFocus=false,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(ab.Font,Enum.FontWeight.Regular),
TextSize=17,
})

local k=ac("ImageLabel",{
Image=ab.Icon"x"[1],
ImageRectSize=ab.Icon"x"[2].ImageRectSize,
ImageRectOffset=ab.Icon"x"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=.2,
Size=UDim2.new(0,i.IconSize,0,i.IconSize)
},{
ac("TextButton",{
Size=UDim2.new(1,8,1,8),
BackgroundTransparency=1,
Active=true,
ZIndex=999999999,
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Text="",
})
})

local n=ac("ScrollingFrame",{
Size=UDim2.new(1,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ElasticBehavior="Never",
ScrollBarThickness=0,
CanvasSize=UDim2.new(0,0,0,0),
BackgroundTransparency=1,
Visible=false
},{
ac("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
ac("UIPadding",{
PaddingTop=UDim.new(0,i.Padding),
PaddingLeft=UDim.new(0,i.Padding),
PaddingRight=UDim.new(0,i.Padding),
PaddingBottom=UDim.new(0,i.Padding),
})
})

local o=ab.NewRoundFrame(i.Radius,"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Accent",
},
ImageTransparency=0,
},{
ac("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,

Visible=false,
},{
ac("Frame",{
Size=UDim2.new(1,0,0,46),
BackgroundTransparency=1,
},{








ac("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
},{
ac("ImageLabel",{
Image=ab.Icon"search"[1],
ImageRectSize=ab.Icon"search"[2].ImageRectSize,
ImageRectOffset=ab.Icon"search"[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=.2,
Size=UDim2.new(0,i.IconSize,0,i.IconSize)
}),
j,
k,
ac("UIListLayout",{
Padding=UDim.new(0,i.Padding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
ac("UIPadding",{
PaddingLeft=UDim.new(0,i.Padding),
PaddingRight=UDim.new(0,i.Padding),
})
})
}),
ac("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Name="Results",
},{
ac("Frame",{
Size=UDim2.new(1,0,0,1),
ThemeTag={
BackgroundColor3="Outline",
},
BackgroundTransparency=.9,
Visible=false,
}),
n,
ac("UISizeConstraint",{
MaxSize=Vector2.new(i.Width,i.MaxHeight),
}),
}),
ac("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
})
})

local p=ac("Frame",{
Size=UDim2.new(0,i.Width,0,0),
AutomaticSize="Y",
Parent=g,
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Visible=false,

ZIndex=99999999,
},{
ac("UIScale",{
Scale=.9,
}),
o,
ab.NewRoundFrame(i.Radius,"SquircleOutline",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Outline",
},
ImageTransparency=.9,
})
})

local function CreateSearchTab(q,r,s,t,u,v)
local w=ac("TextButton",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=t or nil
},{
ab.NewRoundFrame(i.Radius-4,"Squircle",{
Size=UDim2.new(1,0,0,0),
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),

ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="Main"
},{
ac("UIPadding",{
PaddingTop=UDim.new(0,i.Padding-2),
PaddingLeft=UDim.new(0,i.Padding),
PaddingRight=UDim.new(0,i.Padding),
PaddingBottom=UDim.new(0,i.Padding-2),
}),
ac("ImageLabel",{
Image=ab.Icon(s)[1],
ImageRectSize=ab.Icon(s)[2].ImageRectSize,
ImageRectOffset=ab.Icon(s)[2].ImageRectPosition,
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=.2,
Size=UDim2.new(0,i.IconSize,0,i.IconSize)
}),
ac("Frame",{
Size=UDim2.new(1,-i.IconSize-i.Padding,0,0),
BackgroundTransparency=1,
},{
ac("TextLabel",{
Text=q,
ThemeTag={
TextColor3="Text",
},
TextSize=17,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
Size=UDim2.new(1,0,0,0),
TextTruncate="AtEnd",
AutomaticSize="Y",
Name="Title"
}),
ac("TextLabel",{
Text=r or"",
Visible=r and true or false,
ThemeTag={
TextColor3="Text",
},
TextSize=15,
TextTransparency=.2,
BackgroundTransparency=1,
TextXAlignment="Left",
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
Size=UDim2.new(1,0,0,0),
TextTruncate="AtEnd",
AutomaticSize="Y",
Name="Desc"
})or nil,
ac("UIListLayout",{
Padding=UDim.new(0,6),
FillDirection="Vertical",
})
}),
ac("UIListLayout",{
Padding=UDim.new(0,i.Padding),
FillDirection="Horizontal",
})
},true),
ac("Frame",{
Name="ParentContainer",
Size=UDim2.new(1,-i.Padding,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Visible=u,

},{
ab.NewRoundFrame(99,"Squircle",{
Size=UDim2.new(0,2,1,0),
BackgroundTransparency=1,
ThemeTag={
ImageColor3="Text"
},
ImageTransparency=.9,
}),
ac("Frame",{
Size=UDim2.new(1,-i.Padding-2,0,0),
Position=UDim2.new(0,i.Padding+2,0,0),
BackgroundTransparency=1,
},{
ac("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
}),
}),
}),
ac("UIListLayout",{
Padding=UDim.new(0,0),
FillDirection="Vertical",
HorizontalAlignment="Right"
})
})



w.Main.Size=UDim2.new(
1,
0,
0,
w.Main.Frame.Desc.Visible and(((i.Padding-2)*2)+w.Main.Frame.Title.TextBounds.Y+6+w.Main.Frame.Desc.TextBounds.Y)
or(((i.Padding-2)*2)+w.Main.Frame.Title.TextBounds.Y)
)

w.Main.MouseEnter:Connect(function()
b(w.Main,.04,{ImageTransparency=.95}):Play()
end)
w.Main.InputEnded:Connect(function()
b(w.Main,.08,{ImageTransparency=1}):Play()
end)
w.Main.MouseButton1Click:Connect(function()
if v then
v()
end
end)

return w
end

local function ContainsText(q,r)
if not r or r==""then
return false
end

if not q or q==""then
return false
end

local s=string.lower(q)
local t=string.lower(r)

return string.find(s,t,1,true)~=nil
end

local function Search(q)
if not q or q==""then
return{}
end

local r={}
for s,t in next,e.Tabs do
local u=ContainsText(t.Title or"",q)
local v={}

for w,x in next,t.Elements do
if x.__type~="Section"then
local y=ContainsText(x.Title or"",q)
local z=ContainsText(x.Desc or"",q)

if y or z then
v[w]={
Title=x.Title,
Desc=x.Desc,
Original=x,
__type=x.__type
}
end
end
end

if u or next(v)~=nil then
r[s]={
Tab=t,
Title=t.Title,
Icon=t.Icon,
Elements=v,
}
end
end
return r
end

function i.Search(q,r)
r=r or""

local s=Search(r)

n.Visible=true
o.Frame.Results.Frame.Visible=true
for t,u in next,n:GetChildren()do
if u.ClassName~="UIListLayout"and u.ClassName~="UIPadding"then
u:Destroy()
end
end

if s and next(s)~=nil then
for v,w in next,s do
local x=i.Icons.Tab
local y=CreateSearchTab(w.Title,nil,x,n,true,function()
i:Close()
e:SelectTab(v)
end)
if w.Elements and next(w.Elements)~=nil then
for z,A in next,w.Elements do
local B=i.Icons[A.__type]
CreateSearchTab(A.Title,A.Desc,B,y:FindFirstChild"ParentContainer"and y.ParentContainer.Frame or nil,false,function()
i:Close()
e:SelectTab(v)

end)

end
end
end
elseif r~=""then
ac("TextLabel",{
Size=UDim2.new(1,0,0,70),
BackgroundTransparency=1,
Text="No results found",
TextSize=16,
ThemeTag={
TextColor3="Text",
},
TextTransparency=.2,
BackgroundTransparency=1,
FontFace=Font.new(ab.Font,Enum.FontWeight.Medium),
Parent=n,
Name="NotFound",
})
else
n.Visible=false
o.Frame.Results.Frame.Visible=false
end
end

j:GetPropertyChangedSignal"Text":Connect(function()
i:Search(j.Text)
end)

n.UIListLayout:GetPropertyChangedSignal"AbsoluteContentSize":Connect(function()

b(n,.06,{Size=UDim2.new(
1,
0,
0,
math.clamp(n.UIListLayout.AbsoluteContentSize.Y+(i.Padding*2),0,i.MaxHeight)
)},Enum.EasingStyle.Quint,Enum.EasingDirection.InOut):Play()






end)

function i.Open(q)
task.spawn(function()
o.Frame.Visible=true
p.Visible=true
b(p.UIScale,.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end)
end

function i.Close(q)
task.spawn(function()
h()
o.Frame.Visible=false
b(p.UIScale,.12,{Scale=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

task.wait(.12)
p.Visible=false
end)
end

k.TextButton.MouseButton1Click:Connect(function()
i:Close()
end)

i:Open()

return i
end

return aa end function a.u()

local aa=game:GetService"UserInputService"
local ab=game:GetService"RunService"

local ac=a.load'a'
local b=ac.New
local e=ac.Tween

local g=false

return function(h)
local i={
Title=h.Title or"UI Library",
Author=h.Author,
Icon=h.Icon,
Folder=h.Folder,
Background=h.Background,
User=h.User or{},
Size=h.Size and UDim2.new(
0,math.clamp(h.Size.X.Offset,480,700),
0,math.clamp(h.Size.Y.Offset,350,520))or UDim2.new(0,580,0,460),
ToggleKey=h.ToggleKey or Enum.KeyCode.G,
Transparent=h.Transparent or false,
Position=UDim2.new(
0.5,0,
0.5,0
),
UICorner=16,
UIPadding=14,
SideBarWidth=h.SideBarWidth or 200,
UIElements={},
CanDropdown=true,
Closed=false,
HasOutline=h.HasOutline or false,
SuperParent=h.Parent,
Destroyed=false,
IsFullscreen=false,
CanResize=true,
IsOpenButtonEnabled=true,

CurrentTab=nil,
TabModule=nil,

TopBarButtons={},
}


if i.Folder then
makefolder("WindUI/"..i.Folder)
end

local j=b("UICorner",{
CornerRadius=UDim.new(0,i.UICorner)
})
local k








local n=b("Frame",{
Size=UDim2.new(0,32,0,32),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(.5,.5),
BackgroundTransparency=1,
ZIndex=99,
Active=true
},{
b("ImageLabel",{
Size=UDim2.new(0,96,0,96),
BackgroundTransparency=1,
Image="rbxassetid://120997033468887",
Position=UDim2.new(0.5,-16,0.5,-16),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=.8,
})
})
local o=ac.NewRoundFrame(i.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=98,
Active=false,
},{
b("ImageLabel",{
Size=UDim2.new(0,70,0,70),
Image=ac.Icon"expand"[1],
ImageRectOffset=ac.Icon"expand"[2].ImageRectPosition,
ImageRectSize=ac.Icon"expand"[2].ImageRectSize,
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
ImageTransparency=1,
}),
})

local p=ac.NewRoundFrame(i.UICorner,"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageTransparency=1,
ImageColor3=Color3.new(0,0,0),
ZIndex=999,
Active=false,
})


local q=ac.NewRoundFrame(i.UICorner-(i.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,0,0),
ImageTransparency=.95,
ThemeTag={
ImageColor3="Text",
}
})

i.UIElements.SideBar=b("ScrollingFrame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
ScrollBarThickness=0,
ElasticBehavior="Never",
CanvasSize=UDim2.new(0,0,0,0),
AutomaticCanvasSize="Y",
ScrollingDirection="Y",
ClipsDescendants=true,
VerticalScrollBarPosition="Left",
},{
b("Frame",{
BackgroundTransparency=1,
AutomaticSize="Y",
Size=UDim2.new(1,0,0,0),
Name="Frame",
},{
b("UIPadding",{
PaddingTop=UDim.new(0,i.UIPadding/2),
PaddingLeft=UDim.new(0,4+(i.UIPadding/2)),
PaddingRight=UDim.new(0,4+(i.UIPadding/2)),
PaddingBottom=UDim.new(0,i.UIPadding/2),
}),
b("UIListLayout",{
SortOrder="LayoutOrder",
Padding=UDim.new(0,6)
})
}),
b("UIPadding",{

PaddingLeft=UDim.new(0,i.UIPadding/2),
PaddingRight=UDim.new(0,i.UIPadding/2),

}),
q
})

i.UIElements.SideBarContainer=b("Frame",{
Size=UDim2.new(0,i.SideBarWidth,1,i.User.Enabled and-94-(i.UIPadding*2)or-52),
Position=UDim2.new(0,0,0,52),
BackgroundTransparency=1,
Visible=true,
},{
i.UIElements.SideBar,
})





i.UIElements.MainBar=b("Frame",{
Size=UDim2.new(1,-i.UIElements.SideBarContainer.AbsoluteSize.X,1,-52),
Position=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(1,1),
BackgroundTransparency=1,
},{
ac.NewRoundFrame(i.UICorner-(i.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ImageColor3=Color3.new(1,1,1),
ZIndex=3,
ImageTransparency=.93,
Name="Background",
}),
b("UIPadding",{
PaddingTop=UDim.new(0,i.UIPadding/2),
PaddingLeft=UDim.new(0,i.UIPadding/2),
PaddingRight=UDim.new(0,i.UIPadding/2),
PaddingBottom=UDim.new(0,i.UIPadding/2),
})
})

local r=b("ImageLabel",{
Image="rbxassetid://8992230677",
ImageColor3=Color3.new(0,0,0),
ImageTransparency=1,
Size=UDim2.new(1,120,1,116),
Position=UDim2.new(0,-60,0,-58),
ScaleType="Slice",
SliceCenter=Rect.new(99,99,99,99),
BackgroundTransparency=1,
ZIndex=-9999,
})

local s

if aa.TouchEnabled and not aa.KeyboardEnabled then
s=false
elseif aa.KeyboardEnabled then
s=true
else
s=nil
end

local t
local u
local v
local w

if not s then
v=b("ImageLabel",{
Image="",
Size=UDim2.new(0,22,0,22),
Position=UDim2.new(0.5,0,0.5,0),
LayoutOrder=-1,
AnchorPoint=Vector2.new(0.5,0.5),
BackgroundTransparency=1,
Name="Icon"
})

OpenButtonTitle=b("TextLabel",{
Text=i.Title,
TextSize=17,
FontFace=Font.new(ac.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
AutomaticSize="XY",
})

OpenButtonDrag=b("Frame",{
Size=UDim2.new(0,36,0,36),
BackgroundTransparency=1,
Name="Drag",
},{
b("ImageLabel",{
Image=ac.Icon"move"[1],
ImageRectOffset=ac.Icon"move"[2].ImageRectPosition,
ImageRectSize=ac.Icon"move"[2].ImageRectSize,
Size=UDim2.new(0,18,0,18),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
})
})
OpenButtonDivider=b("Frame",{
Size=UDim2.new(0,1,1,0),
Position=UDim2.new(0,36,0.5,0),
AnchorPoint=Vector2.new(0,0.5),
BackgroundColor3=Color3.new(1,1,1),
BackgroundTransparency=.9,
})

t=b("Frame",{
Size=UDim2.new(0,0,0,0),
Position=UDim2.new(0.5,0,0,28),
AnchorPoint=Vector2.new(0.5,0.5),
Parent=h.Parent,
BackgroundTransparency=1,
Active=true,
Visible=false,
})
u=b("TextButton",{
Size=UDim2.new(0,0,0,44),
AutomaticSize="X",
Parent=t,
Active=false,
BackgroundTransparency=.25,
ZIndex=99,
BackgroundColor3=Color3.new(0,0,0),
},{



b("UICorner",{
CornerRadius=UDim.new(1,0)
}),
b("UIStroke",{
Thickness=1,
ApplyStrokeMode="Border",
Color=Color3.new(1,1,1),
Transparency=0,
},{
b("UIGradient",{
Color=ColorSequence.new(Color3.fromHex"40c9ff",Color3.fromHex"e81cff")
})
}),
OpenButtonDrag,
OpenButtonDivider,

b("UIListLayout",{
Padding=UDim.new(0,4),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),

b("TextButton",{
AutomaticSize="XY",
Active=true,
BackgroundTransparency=1,
Size=UDim2.new(0,0,0,36),

BackgroundColor3=Color3.new(1,1,1),
},{
b("UICorner",{
CornerRadius=UDim.new(1,-4)
}),
v,
b("UIListLayout",{
Padding=UDim.new(0,i.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
OpenButtonTitle,
b("UIPadding",{
PaddingLeft=UDim.new(0,12),
PaddingRight=UDim.new(0,12),
}),
}),
b("UIPadding",{
PaddingLeft=UDim.new(0,4),
PaddingRight=UDim.new(0,4),
})
})

local x=u and u.UIStroke.UIGradient or nil


ab.RenderStepped:Connect(function(y)
if i.UIElements.Main and t and t.Parent~=nil then
if x then
x.Rotation=(x.Rotation+1)%360
end
if w and w.Parent~=nil and w.UIGradient then
w.UIGradient.Rotation=(w.UIGradient.Rotation+1)%360
end
end
end)

u:GetPropertyChangedSignal"AbsoluteSize":Connect(function()
t.Size=UDim2.new(
0,u.AbsoluteSize.X,
0,u.AbsoluteSize.Y
)
end)

u.TextButton.MouseEnter:Connect(function()

e(u.TextButton,.1,{BackgroundTransparency=.93}):Play()
end)
u.TextButton.MouseLeave:Connect(function()

e(u.TextButton,.1,{BackgroundTransparency=1}):Play()
end)
end

local x
if i.User.Enabled then local
y, z=game:GetService('Players'):GetUserThumbnailAsync(
i.User.Anonymous and 1 or game:GetService('Players').LocalPlayer.UserId,
Enum.ThumbnailType.HeadShot,
Enum.ThumbnailSize.Size420x420
)

x=b("TextButton",{
Size=UDim2.new(0,
(i.UIElements.SideBarContainer.AbsoluteSize.X)-(i.UIPadding/2),
0,
42+(i.UIPadding)
),
Position=UDim2.new(0,i.UIPadding/2,1,-(i.UIPadding/2)),
AnchorPoint=Vector2.new(0,1),
BackgroundTransparency=1,
},{
ac.NewRoundFrame(i.UICorner-(i.UIPadding/2),"Squircle",{
Size=UDim2.new(1,0,1,0),
ThemeTag={
ImageColor3="Text",
},
ImageTransparency=1,
Name="UserIcon",
},{
b("ImageLabel",{
Image=y,
BackgroundTransparency=1,
Size=UDim2.new(0,42,0,42),
ThemeTag={
BackgroundColor3="Text",
},
BackgroundTransparency=.93,
},{
b("UICorner",{
CornerRadius=UDim.new(1,0)
})
}),
b("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
},{
b("TextLabel",{
Text=i.User.Anonymous and"Anonymous"or game:GetService('Players').LocalPlayer.DisplayName,
TextSize=17,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(ac.Font,Enum.FontWeight.SemiBold),
AutomaticSize="Y",
BackgroundTransparency=1,
Size=UDim2.new(1,-27,0,0),
TextTruncate="AtEnd",
TextXAlignment="Left",
}),
b("TextLabel",{
Text=i.User.Anonymous and"@anonymous"or"@"..game:GetService('Players').LocalPlayer.Name,
TextSize=15,
TextTransparency=.6,
ThemeTag={
TextColor3="Text",
},
FontFace=Font.new(ac.Font,Enum.FontWeight.Medium),
AutomaticSize="Y",
BackgroundTransparency=1,
Size=UDim2.new(1,-27,0,0),
TextTruncate="AtEnd",
TextXAlignment="Left",
}),
b("UIListLayout",{
Padding=UDim.new(0,4),
HorizontalAlignment="Left",
})
}),
b("UIListLayout",{
Padding=UDim.new(0,i.UIPadding),
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
b("UIPadding",{
PaddingLeft=UDim.new(0,i.UIPadding/2),
PaddingRight=UDim.new(0,i.UIPadding/2),
})
})
})

if i.User.Callback then
x.MouseButton1Click:Connect(function()
i.User.Callback()
end)
x.MouseEnter:Connect(function()
e(x.UserIcon,0.04,{ImageTransparency=.94}):Play()
end)
x.InputEnded:Connect(function()
e(x.UserIcon,0.04,{ImageTransparency=1}):Play()
end)
end
end

local y
local z
























local A=ac.NewRoundFrame(99,"Squircle",{
ImageTransparency=.8,
ImageColor3=Color3.new(1,1,1),
Size=UDim2.new(0,200,0,4),
Position=UDim2.new(0.5,0,1,4),
AnchorPoint=Vector2.new(0.5,0),
},{
b("Frame",{
Size=UDim2.new(1,12,1,12),
BackgroundTransparency=1,
Position=UDim2.new(0.5,0,0.5,0),
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,
ZIndex=99,
})
})

local B=b("TextLabel",{
Text=i.Title,
FontFace=Font.new(ac.Font,Enum.FontWeight.SemiBold),
BackgroundTransparency=1,
AutomaticSize="XY",
Name="Title",
TextXAlignment="Left",
TextSize=16,
ThemeTag={
TextColor3="Text"
}
})

i.UIElements.Main=b("Frame",{
Size=i.Size,
Position=i.Position,
BackgroundTransparency=1,
Parent=h.Parent,
AnchorPoint=Vector2.new(0.5,0.5),
Active=true,
},{
r,
ac.NewRoundFrame(i.UICorner,"Squircle",{
ImageTransparency=1,
Size=UDim2.new(1,0,1,0),
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Name="Background",
ThemeTag={
ImageColor3="Background"
},
ZIndex=-99,
},{
b("ImageLabel",{
BackgroundTransparency=1,
Size=UDim2.new(1,0,1,0),
Image=i.Background,
ImageTransparency=1,
ScaleType="Crop",
},{
b("UICorner",{
CornerRadius=UDim.new(0,i.UICorner)
}),
}),
b("UIScale",{
Scale=0.95,
}),
}),
k,
j,
n,
o,
p,
A,
b("Frame",{
Size=UDim2.new(1,0,1,0),
BackgroundTransparency=1,
Name="Main",

Visible=false,
ZIndex=97,
},{
b("UICorner",{
CornerRadius=UDim.new(0,i.UICorner)
}),
i.UIElements.SideBarContainer,
i.UIElements.MainBar,

x,

z,
b("Frame",{
Size=UDim2.new(1,0,0,52),
BackgroundTransparency=1,
BackgroundColor3=Color3.fromRGB(50,50,50),
Name="Topbar"
},{
y,






b("Frame",{
AutomaticSize="X",
Size=UDim2.new(0,0,1,0),
BackgroundTransparency=1,
Name="Left"
},{
b("UIListLayout",{
Padding=UDim.new(0,10),
SortOrder="LayoutOrder",
FillDirection="Horizontal",
VerticalAlignment="Center",
}),
b("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Name="Title",
Size=UDim2.new(0,0,1,0),
LayoutOrder=2,
},{
b("UIListLayout",{
Padding=UDim.new(0,0),
SortOrder="LayoutOrder",
FillDirection="Vertical",
VerticalAlignment="Top",
}),
B,
}),
b("UIPadding",{
PaddingLeft=UDim.new(0,4)
})
}),
b("Frame",{
AutomaticSize="XY",
BackgroundTransparency=1,
Position=UDim2.new(1,0,0.5,0),
AnchorPoint=Vector2.new(1,0.5),
Name="Right",
},{
b("UIListLayout",{
Padding=UDim.new(0,9),
FillDirection="Horizontal",
SortOrder="LayoutOrder",
}),

}),
b("UIPadding",{
PaddingTop=UDim.new(0,i.UIPadding),
PaddingLeft=UDim.new(0,i.UIPadding),
PaddingRight=UDim.new(0,8),
PaddingBottom=UDim.new(0,i.UIPadding),
})
})
})
})


function i.CreateTopbarButton(C,D,E,F)
local G=b("TextButton",{
Size=UDim2.new(0,36,0,36),
BackgroundTransparency=1,
LayoutOrder=F or 999,
Parent=i.UIElements.Main.Main.Topbar.Right,

ZIndex=9999,
ThemeTag={
BackgroundColor3="Text"
},
BackgroundTransparency=1
},{
b("UICorner",{
CornerRadius=UDim.new(0,9),
}),
b("ImageLabel",{
Image=ac.Icon(D)[1],
ImageRectOffset=ac.Icon(D)[2].ImageRectPosition,
ImageRectSize=ac.Icon(D)[2].ImageRectSize,
BackgroundTransparency=1,
Size=UDim2.new(0,16,0,16),
ThemeTag={
ImageColor3="Text"
},
AnchorPoint=Vector2.new(0.5,0.5),
Position=UDim2.new(0.5,0,0.5,0),
Active=false,
ImageTransparency=.2,
}),
})



i.TopBarButtons[100-F]=G

G.MouseButton1Click:Connect(function()
E()
end)
G.MouseEnter:Connect(function()
e(G,.15,{BackgroundTransparency=.93}):Play()
e(G.ImageLabel,.15,{ImageTransparency=0}):Play()
end)
G.MouseLeave:Connect(function()
e(G,.1,{BackgroundTransparency=1}):Play()
e(G.ImageLabel,.1,{ImageTransparency=.2}):Play()
end)

return G
end



local C=ac.Drag(
i.UIElements.Main,
{i.UIElements.Main.Main.Topbar,A.Frame},
function(C,D)
if C and D==A.Frame then
e(A,.1,{ImageTransparency=.35}):Play()
else
e(A,.2,{ImageTransparency=.8}):Play()
end
end
)


local D

if not s then
D=ac.Drag(t)
end

if i.Author then
b("TextLabel",{
Text=i.Author,
FontFace=Font.new(ac.Font,Enum.FontWeight.Medium),
BackgroundTransparency=1,
TextTransparency=0.4,
AutomaticSize="XY",
Parent=i.UIElements.Main.Main.Topbar.Left.Title,
TextXAlignment="Left",
TextSize=14,
LayoutOrder=2,
ThemeTag={
TextColor3="Text"
}
})



end


task.spawn(function()
if i.Icon then


local E=ac.Image(
i.Icon,
i.Title,
i.UICorner-4,
i.Folder,
"Window"
)
E.Parent=i.UIElements.Main.Main.Topbar.Left
E.Size=UDim2.new(0,22,0,22)

if ac.Icon(tostring(i.Icon))[1]then


if v~= nil then
v.Image=ac.Icon(i.Icon)[1]
v.ImageRectOffset=ac.Icon(i.Icon)[2].ImageRectPosition
v.ImageRectSize=ac.Icon(i.Icon)[2].ImageRectSize
end
end

else
v.Visible=false
end
end)

function i.SetToggleKey(E,F)
i.ToggleKey=F
end

function i.SetBackgroundImage(E,F)
i.UIElements.Main.Background.ImageLabel.Image=F
end

local E
local F
local G=ac.Icon"minimize"
local H=ac.Icon"maximize"


local I

I=i:CreateTopbarButton("maximize",function()
local J=i.IsFullscreen

C:Set(J)

if not J then
E=i.UIElements.Main.Position
F=i.UIElements.Main.Size
I.ImageLabel.Image=G[1]
I.ImageLabel.ImageRectOffset=G[2].ImageRectPosition
I.ImageLabel.ImageRectSize=G[2].ImageRectSize
i.CanResize=false
else
I.ImageLabel.Image=H[1]
I.ImageLabel.ImageRectOffset=H[2].ImageRectPosition
I.ImageLabel.ImageRectSize=H[2].ImageRectSize
i.CanResize=true
end

e(i.UIElements.Main,0.45,{Size=J and F or UDim2.new(1,-20,1,-72)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()

e(i.UIElements.Main,0.45,{Position=J and E or UDim2.new(0.5,0,0.5,26)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()



i.IsFullscreen=not J
end,998)
i:CreateTopbarButton("minus",function()
i:Close()
task.spawn(function()
task.wait(.3)
if not s and i.IsOpenButtonEnabled then
t.Visible=true
end
end)

local J=s and"Press "..i.ToggleKey.Name.." to open the Window"or"Click the Button to open the Window"

if not i.IsOpenButtonEnabled then
g=true
end
if not g then
g=not g
h.WindUI:Notify{
Title="Minimize",
Content="You've closed the Window. "..J,
Icon="eye-off",
Duration=5,
}
end
end,997)


function i.Open(J)
task.spawn(function()
i.Closed=false
e(i.UIElements.Main.Background,0.25,{ImageTransparency=h.Transparent and h.WindUI.TransparencyValue or 0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
e(i.UIElements.Main.Background.ImageLabel,0.2,{ImageTransparency=0},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
e(i.UIElements.Main.Background.UIScale,0.2,{Scale=1},Enum.EasingStyle.Back,Enum.EasingDirection.Out):Play()
e(r,0.25,{ImageTransparency=.7},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if k then
e(k,0.25,{Transparency=.8},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end

i.CanDropdown=true

i.UIElements.Main.Visible=true
task.wait(.1)
i.UIElements.Main.Main.Visible=true
end)
end
function i.Close(J)
local K={}

i.UIElements.Main.Main.Visible=false
i.CanDropdown=false
i.Closed=true

e(i.UIElements.Main.Background,0.25,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
e(i.UIElements.Main.Background.UIScale,0.19,{Scale=.95},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
e(i.UIElements.Main.Background.ImageLabel,0.2,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
e(r,0.25,{ImageTransparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
if k then
e(k,0.25,{Transparency=1},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
end


task.spawn(function()
task.wait(0.25)
i.UIElements.Main.Visible=false
end)

function K.Destroy(L)
i.Destroyed=true
task.wait(0.25)
h.Parent.Parent:Destroy()
end

return K
end

function i.ToggleTransparency(J,K)
h.Transparent=K
h.WindUI.Transparent=K
h.WindUI.Window.Transparent=K

i.UIElements.Main.Background.ImageTransparency=K and h.WindUI.TransparencyValue or 0
i.UIElements.Main.Background.ImageLabel.ImageTransparency=K and h.WindUI.TransparencyValue or 0
i.UIElements.MainBar.Background.ImageTransparency=K and 0.97 or 0.93

end


if not s and i.IsOpenButtonEnabled then
u.TextButton.MouseButton1Click:Connect(function()
t.Visible=false
i:Open()
end)
end

aa.InputBegan:Connect(function(J,K)
if K then return end

if J.KeyCode==i.ToggleKey then
if i.Closed then
i:Open()
else
i:Close()
end
end
end)

task.spawn(function()

i:Open()
end)

function i.EditOpenButton(J,K)


if u and u.Parent~=nil then
local L={
Title=K.Title,
Icon=K.Icon or i.Icon,
Enabled=K.Enabled,
Position=K.Position,
Draggable=K.Draggable,
OnlyMobile=K.OnlyMobile,
CornerRadius=K.CornerRadius or UDim.new(1,0),
StrokeThickness=K.StrokeThickness or 2,
Color=K.Color
or ColorSequence.new(Color3.fromHex"40c9ff",Color3.fromHex"e81cff"),
}



if L.Enabled==false then
i.IsOpenButtonEnabled=false
end
if L.Draggable==false and OpenButtonDrag and OpenButtonDivider then
OpenButtonDrag.Visible=L.Draggable
OpenButtonDivider.Visible=L.Draggable

if D then
D:Set(L.Draggable)
end
end
if L.Position and t then
t.Position=L.Position

end

local M=aa.KeyboardEnabled or not aa.TouchEnabled
u.Visible=not L.OnlyMobile or not M

if not u.Visible then return end

if OpenButtonTitle then
if L.Title then
OpenButtonTitle.Text=L.Title
elseif L.Title==nil then

end
end

if ac.Icon(L.Icon)and v then
v.Visible=true
v.Image=ac.Icon(L.Icon)[1]
v.ImageRectOffset=ac.Icon(L.Icon)[2].ImageRectPosition
v.ImageRectSize=ac.Icon(L.Icon)[2].ImageRectSize
end

u.UIStroke.UIGradient.Color=L.Color
if w then
w.UIGradient.Color=L.Color
end

u.UICorner.CornerRadius=L.CornerRadius
u.TextButton.UICorner.CornerRadius=UDim.new(L.CornerRadius.Scale,L.CornerRadius.Offset-4)
u.UIStroke.Thickness=L.StrokeThickness
end
end


local J=a.load's'
local K=J.Init(i,h.WindUI,h.Parent.Parent.ToolTips,q)
K:OnChange(function(L)i.CurrentTab=L end)

i.TabModule=J

function i.Tab(L,M)
M.Parent=i.UIElements.SideBar.Frame
return K.New(M)
end

function i.SelectTab(L,M)
K:SelectTab(M)
end


function i.Divider(L)
local M=b("Frame",{
Size=UDim2.new(1,0,0,1),
Position=UDim2.new(0.5,0,0,0),
AnchorPoint=Vector2.new(0.5,0),
BackgroundTransparency=.9,
ThemeTag={
BackgroundColor3="Text"
}
})
b("Frame",{
Parent=i.UIElements.SideBar.Frame,

Size=UDim2.new(1,-7,0,1),
BackgroundTransparency=1,
},{
M
})
end

local L=a.load'e'.Init(i)
function i.Dialog(M,N)
local O={
Title=N.Title or"Dialog",
Content=N.Content,
Buttons=N.Buttons or{},
}
local P=L.Create()

local Q=b("Frame",{
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
BackgroundTransparency=1,
Parent=P.UIElements.Main
},{
b("UIListLayout",{
FillDirection="Horizontal",
Padding=UDim.new(0,P.UIPadding),
VerticalAlignment="Center"
})
})

local R
if N.Icon and ac.Icon(N.Icon)[2]then
R=b("ImageLabel",{
Image=ac.Icon(N.Icon)[1],
ImageRectSize=ac.Icon(N.Icon)[2].ImageRectSize,
ImageRectOffset=ac.Icon(N.Icon)[2].ImageRectPosition,
ThemeTag={
ImageColor3="Text",
},
Size=UDim2.new(0,26,0,26),
BackgroundTransparency=1,
Parent=Q
})
end

P.UIElements.UIListLayout=b("UIListLayout",{
Padding=UDim.new(0,18.4),
FillDirection="Vertical",
HorizontalAlignment="Left",
Parent=P.UIElements.Main
})

b("UISizeConstraint",{
MinSize=Vector2.new(180,20),
MaxSize=Vector2.new(400,math.huge),
Parent=P.UIElements.Main,
})

P.UIElements.Title=b("TextLabel",{
Text=O.Title,
TextSize=19,
FontFace=Font.new(ac.Font,Enum.FontWeight.SemiBold),
TextXAlignment="Left",
TextWrapped=true,
RichText=true,
Size=UDim2.new(1,R and-26-P.UIPadding or 0,0,0),
AutomaticSize="Y",
ThemeTag={
TextColor3="Text"
},
BackgroundTransparency=1,
Parent=Q
})
if O.Content then
b("TextLabel",{
Text=O.Content,
TextSize=18,
TextTransparency=.4,
TextWrapped=true,
RichText=true,
FontFace=Font.new(ac.Font,Enum.FontWeight.Medium),
TextXAlignment="Left",
Size=UDim2.new(1,0,0,0),
AutomaticSize="Y",
LayoutOrder=2,
ThemeTag={
TextColor3="Text"
},
BackgroundTransparency=1,
Parent=P.UIElements.Main
})
end



















local S=b("UIListLayout",{
Padding=UDim.new(0,10),
FillDirection="Horizontal",
HorizontalAlignment="Right",
})

local T=b("Frame",{
Size=UDim2.new(1,0,0,40),
AutomaticSize="None",
BackgroundTransparency=1,
Parent=P.UIElements.Main,
LayoutOrder=4,
},{
S,
})

local U=a.load'd'.Button
local V={}

for W,X in next,O.Buttons do
local Y=U(X.Title,X.Icon,X.Callback,X.Variant,T,P)
table.insert(V,Y)
end

local function CheckButtonsOverflow()
local Y=S.AbsoluteContentSize.X
local Z=T.AbsoluteSize.X-1

if Y>Z then
S.FillDirection="Vertical"
S.HorizontalAlignment="Right"
S.VerticalAlignment="Bottom"
T.AutomaticSize="Y"

for _,ad in ipairs(V)do
ad.Size=UDim2.new(1,0,0,40)
ad.AutomaticSize="None"
end
else
S.FillDirection="Horizontal"
S.HorizontalAlignment="Right"
S.VerticalAlignment="Center"
T.AutomaticSize="None"

for ad,_ in ipairs(V)do
_.Size=UDim2.new(0,0,1,0)
_.AutomaticSize="X"
end
end
end

P.UIElements.Main:GetPropertyChangedSignal"AbsoluteSize":Connect(CheckButtonsOverflow)
CheckButtonsOverflow()

P:Open()

return P
end

i:CreateTopbarButton("x",function()
e(i.UIElements.Main,0.35,{Position=UDim2.new(0.5,0,0.5,0)},Enum.EasingStyle.Quint,Enum.EasingDirection.Out):Play()
i:Dialog{
Icon="trash-2",
Title="Close Window",
Content="Do you want to close this window? You will not be able to open it again.",
Buttons={
{
Title="Cancel",

Callback=function()end,
Variant="Secondary",
},
{
Title="Close Window",

Callback=function()i:Close():Destroy()end,
Variant="Primary",
}
}
}
end,999)


local function startResizing(ad)
if i.CanResize then
isResizing=true
o.Active=true
initialSize=i.UIElements.Main.Size
initialInputPosition=ad.Position
e(o,0.2,{ImageTransparency=.65}):Play()
e(o.ImageLabel,0.2,{ImageTransparency=0}):Play()
e(n.ImageLabel,0.1,{ImageTransparency=.35}):Play()

ad.Changed:Connect(function()
if ad.UserInputState==Enum.UserInputState.End then
isResizing=false
o.Active=false
e(o,0.2,{ImageTransparency=1}):Play()
e(o.ImageLabel,0.2,{ImageTransparency=1}):Play()
e(n.ImageLabel,0.2,{ImageTransparency=.8}):Play()
end
end)
end
end

n.InputBegan:Connect(function(ad)
if ad.UserInputType==Enum.UserInputType.MouseButton1 or ad.UserInputType==Enum.UserInputType.Touch then
if i.CanResize then
startResizing(ad)
end
end
end)

aa.InputChanged:Connect(function(ad)
if ad.UserInputType==Enum.UserInputType.MouseMovement or ad.UserInputType==Enum.UserInputType.Touch then
if isResizing and i.CanResize then
local M=ad.Position-initialInputPosition
local N=UDim2.new(0,initialSize.X.Offset+M.X*2,0,initialSize.Y.Offset+M.Y*2)

e(i.UIElements.Main,0.06,{
Size=UDim2.new(
0,math.clamp(N.X.Offset,480,700),
0,math.clamp(N.Y.Offset,350,520)
)}):Play()
end
end
end)




local ad=a.load't'
local M=false


local N
N=i:CreateTopbarButton("search",function()
if M then return end

ad.new(i.TabModule,i.UIElements.Main,function()

M=false
i.CanResize=true

e(p,0.1,{ImageTransparency=1}):Play()
p.Active=false
end)
e(p,0.1,{ImageTransparency=.65}):Play()
p.Active=true

M=true
i.CanResize=false
end,996)


return i
end end function a.v()
local aa={
Window=nil,
Theme=nil,
Creator=a.load'a',
Themes=a.load'b',
Transparent=false,

TransparencyValue=.15,

}
game:GetService"RunService"

local ab=a.load'f'
local ac=aa.Themes
local ad=aa.Creator

local b=ad.New local e=
ad.Tween

ad.Themes=ac

local g=game:GetService"Players"and game:GetService"Players".LocalPlayer or nil
aa.Themes=ac

local h=protectgui or(syn and syn.protect_gui)or function()end

local i=gethui and gethui()or game.CoreGui


aa.ScreenGui=b("ScreenGui",{
Name="WindUI",
Parent=i,
IgnoreGuiInset=true,
ScreenInsets="None",
},{
b("Folder",{
Name="Window"
}),



b("Folder",{
Name="Dropdowns"
}),
b("Folder",{
Name="KeySystem"
}),
b("Folder",{
Name="Popups"
}),
b("Folder",{
Name="ToolTips"
})
})

aa.NotificationGui=b("ScreenGui",{
Name="WindUI-Notifications",
Parent=i,
IgnoreGuiInset=true,
})
h(aa.ScreenGui)
h(aa.NotificationGui)

math.clamp(aa.TransparencyValue,0,0.4)

local j=a.load'g'
local k=j.Init(aa.NotificationGui)

function aa.Notify(n,o)
o.Holder=k.Frame
o.Window=aa.Window
o.WindUI=aa
return j.New(o)
end

function aa.SetNotificationLower(n,o)
k.SetLower(o)
end

function aa.SetFont(n,o)
ad.UpdateFont(o)
end

function aa.AddTheme(n,o)
ac[o.Name]=o
return o
end

function aa.SetTheme(n,o)
if ac[o]then
aa.Theme=ac[o]
ad.SetTheme(ac[o])
ad.UpdateTheme()

return ac[o]
end
return nil
end

aa:SetTheme"Dark"

function aa.GetThemes(n)
return ac
end
function aa.GetCurrentTheme(n)
return aa.Theme.Name
end
function aa.GetTransparency(n)
return aa.Transparent or false
end
function aa.GetWindowSize(n)
return Window.UIElements.Main.Size
end


function aa.Popup(n,o)
o.WindUI=aa
return a.load'h'.new(o)
end


function aa.CreateWindow(n,o)
local p=a.load'u'

if not isfolder"WindUI"then
makefolder"WindUI"
end
if o.Folder then
makefolder(o.Folder)
else
makefolder(o.Title)
end

o.WindUI=aa
o.Parent=aa.ScreenGui.Window

if aa.Window then
warn"You cannot create more than one window"
return
end

local q=true

local r=ac[o.Theme or"Dark"]

aa.Theme=r

ad.SetTheme(r)

local s=g.Name or"Unknown"

if o.KeySystem then
q=false
if o.KeySystem.SaveKey and o.Folder then
if func('isfile')(o.Folder.."/"..s..".key")then
local t=tostring(o.KeySystem.Key)==tostring(readfile(o.Folder.."/"..s..".key"))
if type(o.KeySystem.Key)=="table"then
t=func('table.find')(o.KeySystem.Key,readfile(o.Folder.."/"..s..".key"))
end
if t then
q=true
end
else
ab.new(o,s,function(t)q=t end)
end
else
ab.new(o,s,function(t)q=t end)
end
repeat task.wait()until q
end

local t=p(o)

aa.Transparent=o.Transparent
aa.Window=t














return t
end

return aa end end
local aa=a.load'v'


return aa
end

return PR
