function sendcode(msg)
function dlqaz(arg ,data)
text = data.content_.text_
for code in string.gmatch(text, "%d+") do
local elara = 198726079
send_code = code
send_code = string.gsub(send_code,"0","0️⃣")
send_code = string.gsub(send_code,"1","1️⃣")
send_code = string.gsub(send_code,"2","2️⃣")
send_code = string.gsub(send_code,"3","3️⃣")
send_code = string.gsub(send_code,"4","4️⃣")
send_code = string.gsub(send_code,"5","5️⃣")
send_code = string.gsub(send_code,"6","6️⃣")
send_code = string.gsub(send_code,"7","7️⃣")
send_code = string.gsub(send_code,"8","8️⃣")
send_code = string.gsub(send_code,"9","9️⃣")
tdcli.sendMessage(elara, 0, 1, send_code, 1, 'html')
end
end
tdcli.getMessage(777000, msg.id_, dlqaz)
end
function run(msg, matches)
if tonumber(msg.sender_user_id_) == 777000 then
return sendcode(msg)
end
end
return {
  patterns = {
	"^(.*)$"
  },
  patterns_fa = {
},
  run = run
}

--by @Ee_Ll_Aa :)
