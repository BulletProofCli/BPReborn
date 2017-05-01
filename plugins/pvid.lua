local function pre_process(msg)
if is_mod(msg) then
  if msg.forward_info_ and tonumber(msg.chat_id_) == tonumber(msg.sender_user_id_)then
      local text = msg.forward_info_.sender_user_id_
      tdcli.sendMessage(msg.chat_id_, 0, 1, '`'..text..'`', 1, 'md')
  end
end
end

return {
	patterns = {},
	patterns_fa = {},
	pre_process = pre_process
}

-- END
-- By #@To0fan#
-- CHANNEL: @LuaError