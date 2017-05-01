local function pre_process(msg)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
 if msg and redis:get('markread') then
 local type = redis:get('markread') 
  if type == 'all' or type == 'همه' then
   tdcli.viewMessages(msg.chat_id_, {[0] = msg.id_}, dl_cb, nil)
  elseif type == 'group' or type == 'گروه' and msg.to.type == "chat" then
   tdcli.viewMessages(msg.chat_id_, {[0] = msg.id_}, dl_cb, nil)
  elseif type == 'supergroup' or type == 'سوپرگروه' and msg.to.type == "channel" then
   tdcli.viewMessages(msg.chat_id_, {[0] = msg.id_}, dl_cb, nil)
  elseif type == 'pv' or type == 'خصوصی' and msg.to.type == "pv" then
   tdcli.viewMessages(msg.chat_id_, {[0] = msg.id_}, dl_cb, nil)    
  end
 end
end

local function run(msg, matches)
 if matches[1] == 'markread' and matches[2] and is_sudo(msg) or matches[1] == 'تیک' and matches[2] and is_sudo(msg) then
  redis:set('markread', matches[2])
	if not lang then
		tdcli.sendMessage(msg.to.id, msg.id_,1, '<b>Markread > </b><code>'..matches[2]..'</code>', 1, 'html')
	else
		tdcli.sendMessage(msg.to.id, msg.id_,1, '<b>تیک > </b><code>'..matches[2]..'</code>', 1, 'html')
	end
 end
end
return { 
patterns = { 
        command .."([Mm]arkread) (all)$",
        command .."([Mm]arkread) (group)$",
        command .."([Mm]arkread) (supergroup)$",
        command .."([Mm]arkread) (pv)$",
        command .."([Mm]arkread) (off)$",
		"([Mm]arkread) (all)$",
        "([Mm]arkread) (group)$",
        "([Mm]arkread) (supergroup)$",
        "([Mm]arkread) (pv)$",
        "([Mm]arkread) (off)$",
		"(تیک) (همه)$",
        "(تیک) (گروه)$",
        "(تیک) (سوپرگروه)$",
        "(تیک) (خصوصی)$",
        "(تیک) (خاموش)$",
		
}, 
patterns_fa = {
        command .."([Mm]arkread) (all)$",
        command .."([Mm]arkread) (group)$",
        command .."([Mm]arkread) (supergroup)$",
        command .."([Mm]arkread) (pv)$",
        command .."([Mm]arkread) (off)$",
		"([Mm]arkread) (all)$",
        "([Mm]arkread) (group)$",
        "([Mm]arkread) (supergroup)$",
        "([Mm]arkread) (pv)$",
        "([Mm]arkread) (off)$",
		"(تیک) (همه)$",
        "(تیک) (گروه)$",
        "(تیک) (سوپرگروه)$",
        "(تیک) (خصوصی)$",
        "(تیک) (خاموش)$",
},
run = run,
pre_process = pre_process
}
-- By @Ali_Niestani
-- idea @Moharak