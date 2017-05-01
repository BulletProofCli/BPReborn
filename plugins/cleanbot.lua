local function run(msg, matches)
local hash = "gp_lang:"..msg.to.id
local lang = redis:get(hash)
if matches[1] == 'clean bots' and is_mod(msg) or matches[1] == 'پاک کردن ربات ها' and is_mod(msg) then
  function clbot(arg, data)
    for k, v in pairs(data.members_) do
      kick_user(v.user_id_, msg.to.id)
  end
  if not lang then
    tdcli.sendMessage(msg.to.id, msg.id, 1, '_All Bots was cleared._', 1, 'md')
  else
  tdcli.sendMessage(msg.to.id, msg.id, 1, '_پاکسازی ربات ها با موفقیت انجام شد_', 1, 'md')
  end
  end
  tdcli.getChannelMembers(msg.to.id, 0, 'Bots', 200, clbot, nil)
  end
end

return { 

patterns ={ 
command ..'(clean bot)$',
'^(clean bots)$',
'^(پاک کردن ربات ها)$'
 },
 patterns_fa = {
 command ..'(clean bots)$',
'^(clean bots)$',
'^(پاک کردن ربات ها)$'
},
  run = run
}