do

-- Check Member
local function check_member_autorealm(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Faal!',
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_name = 'Faal!',
          lock_photo = 'Gheyre Faal*',
          lock_member = 'Gheyre Faal*',
          flood = 'Faal!'
        }
      }
      save_data(_config.moderation.data, data)
      local realms = 'realms'
      if not data[tostring(realms)] then
        data[tostring(realms)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(realms)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'Be realm jadide khod khosh amadid! !')
    end
  end
end
local function check_member_realm_add(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Faal!',
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_name = 'Faal!',
          lock_photo = 'Gheyre Faal*',
          lock_member = 'Gheyre Faal*',
          flood = 'Faal!'
        }
      }
      save_data(_config.moderation.data, data)
      local realms = 'realms'
      if not data[tostring(realms)] then
        data[tostring(realms)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(realms)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'Realm add shod!!')
    end
  end
end
function check_member_group(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Group',
        moderators = {},
        set_owner = member_id ,
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_name = 'Faal!',
          lock_photo = 'Gheyre Faal*',
          lock_member = 'Gheyre Faal*',
          flood = 'Faal!',
        }
      }
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'Shoma be onvane ~Modir set shodid!.')
    end
  end
end
local function check_member_modadd(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration
      data[tostring(msg.to.id)] = {
        group_type = 'Group',
        moderators = {},
        set_owner = member_id ,
        settings = {
          set_name = string.gsub(msg.to.print_name, '_', ' '),
          lock_name = 'Faal!',
          lock_photo = 'Gheyre Faal*',
          lock_member = 'Gheyre Faal*',
          flood = 'Faal!',
        }
      }
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = {}
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = msg.to.id
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'Gorooh add shod va Shoma be onvane ~Modir set shodid! ')
    end
  end
end
local function automodadd(msg)
  local data = load_data(_config.moderation.data)
  if msg.action.type == 'chat_created' then
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_group,{receiver=receiver, data=data, msg = msg})
  end
end
local function autorealmadd(msg)
  local data = load_data(_config.moderation.data)
  if msg.action.type == 'chat_created' then
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_autorealm,{receiver=receiver, data=data, msg = msg})
  end
end
local function check_member_realmrem(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Realm configuration removal
      data[tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      local realms = 'realms'
      if not data[tostring(realms)] then
        data[tostring(realms)] = nil
        save_data(_config.moderation.data, data)
      end
      data[tostring(realms)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'Realm hazf shod!!')
    end
  end
end
local function check_member_modrem(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local data = cb_extra.data
  local msg = cb_extra.msg
  for k,v in pairs(result.members) do
    local member_id = v.id
    if member_id ~= our_id then
      -- Group configuration removal
      data[tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      local groups = 'groups'
      if not data[tostring(groups)] then
        data[tostring(groups)] = nil
        save_data(_config.moderation.data, data)
      end
      data[tostring(groups)][tostring(msg.to.id)] = nil
      save_data(_config.moderation.data, data)
      return send_large_msg(receiver, 'Gorooh hazf shod!)
    end
  end
end
--End Check Member
local function show_group_settingsmod(msg, data, target)
 	if not is_momod(msg) then
    	return "Faghat baraye Moderator ha!!"
  	end
  	local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
     	if data[tostring(msg.to.id)]['settings']['flood_msg_max'] then
        	NUM_MSG_MAX = tonumber(data[tostring(msg.to.id)]['settings']['flood_msg_max'])
        	print('custom'..NUM_MSG_MAX)
      	else
        	NUM_MSG_MAX = 5
      	end
    end
    local bots_protection = "Faal!"
    if data[tostring(msg.to.id)]['settings']['lock_bots'] then
    	bots_protection = data[tostring(msg.to.id)]['settings']['lock_bots']
   	end
    local leave_ban = "Gheyre Faal*"
    if data[tostring(msg.to.id)]['settings']['leave_ban'] then
    	leave_ban = data[tostring(msg.to.id)]['settings']['leave_ban']
   	end
  local settings = data[tostring(target)]['settings']
  local text = "Tanzimate gorooh ~:\nLock group name : "..settings.lock_name.."\nLock group photo : "..settings.lock_photo.."\nLock group member : "..settings.lock_member.."\nLock group leave : "..leave_ban.."\nflood sensitivity : "..NUM_MSG_MAX.."\nBot protection : "..bots_protection--"\nPublic: "..public
  return text
end

local function set_descriptionmod(msg, data, target, about)
  if not is_momod(msg) then
    return "Faghat baraye Moderator ha!!"
  end
  local data_cat = 'Etelaate gorooh ~'
  data[tostring(target)][data_cat] = about
  save_data(_config.moderation.data, data)
  return 'Etelaate gorooh Update shod be ~:\n'..about
end
local function get_description(msg, data)
  local data_cat = 'Etelaate gorooh ~'
  if not data[tostring(msg.to.id)][data_cat] then
    return 'Etelaate gorooh Mojood nist!.'
  end
  local about = data[tostring(msg.to.id)][data_cat]
  local about = string.gsub(msg.to.print_name, "_", " ")..':\n\n'..about
  return 'About '..about
end
local function lock_group_arabic(msg, data, target)
  if not is_momod(msg) then
    return "Faghat baraye Moderator ha!!"
  end
  local group_arabic_lock = data[tostring(target)]['settings']['lock_arabic']
  if group_arabic_lock == 'Faal!' then
    return 'Arabic ghofl ast!'
  else
    data[tostring(target)]['settings']['lock_arabic'] = 'Faal!'
    save_data(_config.moderation.data, data)
    return 'Arabic ghofl shod!'
  end
end

local function unlock_group_arabic(msg, data, target)
  if not is_momod(msg) then
    return "Faghat baraye Moderator ha!!"
  end
  local group_arabic_lock = data[tostring(target)]['settings']['lock_arabic']
  if group_arabic_lock == 'Gheyre Faal*' then
    return 'Arabic Baz ast!'
  else
    data[tostring(target)]['settings']['lock_arabic'] = 'Gheyre Faal*'
    save_data(_config.moderation.data, data)
    return 'Arabic Baz shod!'
  end
end

local function lock_group_bots(msg, data, target)
  if not is_momod(msg) then
    return "Faghat baraye Moderator ha!!"
  end
  local group_bots_lock = data[tostring(target)]['settings']['lock_bots']
  if group_bots_lock == 'Faal!' then
    return 'Antibot faal ast!'
  else
    data[tostring(target)]['settings']['lock_bots'] = 'Faal!'
    save_data(_config.moderation.data, data)
    return 'Antibot faal shod!'
  end
end

local function unlock_group_bots(msg, data, target)
  if not is_momod(msg) then
    return "Faghat baraye Moderator ha!!"
  end
  local group_bots_lock = data[tostring(target)]['settings']['lock_bots']
  if group_bots_lock == 'Gheyre Faal*' then
    return 'Antibot gheyre faal ast!'
  else
    data[tostring(target)]['settings']['lock_bots'] = 'Gheyre Faal*'
    save_data(_config.moderation.data, data)
    return 'Antibot gheyre faal shod!'
  end
end

local function lock_group_namemod(msg, data, target)
  if not is_momod(msg) then
    return "Faghat baraye Moderator ha!!"
  end
  local group_name_set = data[tostring(target)]['settings']['set_name']
  local group_name_lock = data[tostring(target)]['settings']['lock_name']
  if group_name_lock == 'Faal!' then
    return 'Esme gorooh ghofl ast!'
  else
    data[tostring(target)]['settings']['lock_name'] = 'Faal!'
    save_data(_config.moderation.data, data)
    rename_chat('chat#id'..target, group_name_set, ok_cb, false)
    return 'Esme gorooh ghofl shod!'
  end
end
local function unlock_group_namemod(msg, data, target)
  if not is_momod(msg) then
    return "Faghat baraye Moderator ha!!"
  end
  local group_name_set = data[tostring(target)]['settings']['set_name']
  local group_name_lock = data[tostring(target)]['settings']['lock_name']
  if group_name_lock == 'Gheyre Faal*' then
    return 'Esme gorooh baz ast!'
  else
    data[tostring(target)]['settings']['lock_name'] = 'Gheyre Faal*'
    save_data(_config.moderation.data, data)
    return 'Esme gorooh baz shod!'
  end
end
local function lock_group_floodmod(msg, data, target)
  if not is_owner(msg) then
    return "Faghat adminha mitavanand az in dastoor estefade konand!"
  end
  local group_flood_lock = data[tostring(target)]['settings']['flood']
  if group_flood_lock == 'Faal!' then
    return 'Antispam gorooh faal ast!'
  else
    data[tostring(target)]['settings']['flood'] = 'Faal!'
    save_data(_config.moderation.data, data)
    return 'Antispam gorooh faal shod!'
  end
end

local function unlock_group_floodmod(msg, data, target)
  if not is_owner(msg) then
    return "Faghat adminha mitavanand az in dastoor estefade konand!"
  end
  local group_flood_lock = data[tostring(target)]['settings']['flood']
  if group_flood_lock == 'Gheyre Faal*' then
    return 'Antispam gorooh gheyrefaal ast!'
  else
    data[tostring(target)]['settings']['flood'] = 'Gheyre Faal*'
    save_data(_config.moderation.data, data)
    return 'Antispam gorooh gheyrefaal shod!'
  end
end

local function lock_group_membermod(msg, data, target)
  if not is_momod(msg) then
    return "Faghat baraye Moderator ha!!"
  end
  local group_member_lock = data[tostring(target)]['settings']['lock_member']
  if group_member_lock == 'Faal!' then
    return 'Addmember ghofl ast!'
  else
    data[tostring(target)]['settings']['lock_member'] = 'Faal!'
    save_data(_config.moderation.data, data)
  end
  return 'Addmember ghofl shod!'
end

local function unlock_group_membermod(msg, data, target)
  if not is_momod(msg) then
    return "Faghat baraye Moderator ha!!"
  end
  local group_member_lock = data[tostring(target)]['settings']['lock_member']
  if group_member_lock == 'Gheyre Faal*' then
    return 'Addmember baz ast!'
  else
    data[tostring(target)]['settings']['lock_member'] = 'Gheyre Faal*'
    save_data(_config.moderation.data, data)
    return 'Addmember baz shod!'
  end
end


local function set_public_membermod(msg, data, target)
  if not is_momod(msg) then
    return "Faghat baraye Moderator ha!!"
  end
  local group_member_lock = data[tostring(target)]['settings']['Hamegani!]
  if group_member_lock == 'Faal!' then
    return 'Gorooh hamegani ast!'
  else
    data[tostring(target)]['settings']['Hamegani!] = 'Faal!'
    save_data(_config.moderation.data, data)
  end
  return 'Vaziate gorooh~: Hamegani!
end

local function unset_public_membermod(msg, data, target)
  if not is_momod(msg) then
    return "Faghat baraye Moderator ha!!"
  end
  local group_member_lock = data[tostring(target)]['settings']['Hamegani!]
  if group_member_lock == 'Gheyre Faal*' then
    return 'Gorooh hamegani nist!!
  else
    data[tostring(target)]['settings']['Hamegani!] = 'Gheyre Faal*'
    save_data(_config.moderation.data, data)
    return 'Vaziate gorooh~: not Hamegani!
  end
end

local function lock_group_leave(msg, data, target)
  if not is_momod(msg) then
    return "Faghat baraye Moderator ha!!"
  end
  local leave_ban = data[tostring(msg.to.id)]['settings']['leave_ban']
  if leave_ban == 'Faal!' then
    return 'Khorooj : Ban az gorooh!'
  else
    data[tostring(msg.to.id)]['settings']['leave_ban'] = 'Faal!'
    save_data(_config.moderation.data, data)
  end
  return 'Khorooj : Ban az gorooh!'
end

local function unlock_group_leave(msg, data, target)
  if not is_momod(msg) then
    return "Faghat baraye Moderator ha!!"
  end
  local leave_ban = data[tostring(msg.to.id)]['settings']['leave_ban']
  if leave_ban == 'Gheyre Faal*' then
    return 'Khorooj : Ban nashodan az gorooh!'
  else
    data[tostring(msg.to.id)]['settings']['leave_ban'] = 'Gheyre Faal*'
    save_data(_config.moderation.data, data)
    return 'Khorooj : Ban nashodan az gorooh!'
  end
end

local function unlock_group_photomod(msg, data, target)
  if not is_momod(msg) then
    return "Faghat baraye Moderator ha!!"
  end
  local group_photo_lock = data[tostring(target)]['settings']['lock_photo']
  if group_photo_lock == 'Gheyre Faal*' then
    return 'Axe gorooh ghofl nist!'
  else
    data[tostring(target)]['settings']['lock_photo'] = 'Gheyre Faal*'
    save_data(_config.moderation.data, data)
    return 'Axe gorooh baz shod!'
  end
end

local function set_rulesmod(msg, data, target)
  if not is_momod(msg) then
    return "Faghat baraye Moderator ha!!"
  end
  local data_cat = 'rules'
  data[tostring(target)][data_cat] = rules
  save_data(_config.moderation.data, data)
  return 'Taghire ghavanine gorooh be~:\n'..rules
end
local function modadd(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_admin(msg) then
    return "Khata! : shoma admin nistid!"
  end
  local data = load_data(_config.moderation.data)
  if is_group(msg) then
    return 'Gorooh add shode ast!.'
  end
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_modadd,{receiver=receiver, data=data, msg = msg})
end
local function realmadd(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_admin(msg) then
    return "Khata! : shoma admin nistid!"
  end
  local data = load_data(_config.moderation.data)
  if is_realm(msg) then
    return 'Realm add shode ast!.'
  end
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_realm_add,{receiver=receiver, data=data, msg = msg})
end
-- Global functions
function modrem(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_admin(msg) then
    return "Khata! : shoma admin nistid!"
  end
  local data = load_data(_config.moderation.data)
  if not is_group(msg) then
    return 'Gorooh add nashode ast!.'
  end
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_modrem,{receiver=receiver, data=data, msg = msg})
end

function realmrem(msg)
  -- superuser and admins only (because sudo are always has privilege)
  if not is_admin(msg) then
    return "Khata! : shoma admin nistid!"
  end
  local data = load_data(_config.moderation.data)
  if not is_realm(msg) then
    return 'Realm add shode ast!.'
  end
    receiver = get_receiver(msg)
    chat_info(receiver, check_member_realmrem,{receiver=receiver, data=data, msg = msg})
end
local function get_rules(msg, data)
  local data_cat = 'rules'
  if not data[tostring(msg.to.id)][data_cat] then
    return 'Ghavanine gorooh yaft nashod!.'
  end
  local rules = data[tostring(msg.to.id)][data_cat]
  local rules = 'Ghavanine gorooh ~:\n'..rules
  return rules
end

local function set_group_photo(msg, success, result)
  local data = load_data(_config.moderation.data)
  local receiver = get_receiver(msg)
  if success then
    local file = 'data/photos/chat_photo_'..msg.to.id..'.jpg'
    print('File download mishavad dar:', result)
    os.rename(result, file)
    print('File moved to:', file)
    chat_set_photo (receiver, file, ok_cb, false)
    data[tostring(msg.to.id)]['settings']['set_photo'] = file
    save_data(_config.moderation.data, data)
    data[tostring(msg.to.id)]['settings']['lock_photo'] = 'Faal!'
    save_data(_config.moderation.data, data)
    send_large_msg(receiver, 'Ax save shod!!', ok_cb, false)
  else
    print('Khataye download!: '..msg.id)
    send_large_msg(receiver, 'Khata !,lotfan dobare emtehan konid!!', ok_cb, false)
  end
end

local function promote(receiver, member_username, member_id)
  local data = load_data(_config.moderation.data)
  local group = string.gsub(receiver, 'chat#id', '')
  if not data[group] then
    return send_large_msg(receiver, 'Gorooh add nashode ast!.')
  end
  if data[group]['moderators'][tostring(member_id)] then
    return send_large_msg(receiver, member_username..' Be onvane moderator set shod!.')
  end
  data[group]['moderators'][tostring(member_id)] = member_username
  save_data(_config.moderation.data, data)
  return send_large_msg(receiver, member_username..' Promote shod!.')
end

local function promote_by_reply(extra, success, result)
    local msg = result
    local full_name = (msg.from.first_name or '')..' '..(msg.from.last_name or '')
    if msg.from.username then
      member_username = '@'.. msg.from.username
    else
      member_username = full_name
    end
    local member_id = msg.from.id
    if msg.to.type == 'chat' then
      return promote(get_receiver(msg), member_username, member_id)
    end
end

local function demote(receiver, member_username, member_id)
  local data = load_data(_config.moderation.data)
  local group = string.gsub(receiver, 'chat#id', '')
  if not data[group] then
    return send_large_msg(receiver, 'Gorooh add nashode ast!.')
  end
  if not data[group]['moderators'][tostring(member_id)] then
    return send_large_msg(receiver, member_username..' Moderator nist!.')
  end
  data[group]['moderators'][tostring(member_id)] = nil
  save_data(_config.moderation.data, data)
  return send_large_msg(receiver, member_username..' Demote shod!.')
end

local function demote_by_reply(extra, success, result)
    local msg = result
    local full_name = (msg.from.first_name or '')..' '..(msg.from.last_name or '')
    if msg.from.username then
      member_username = '@'..msg.from.username
    else
      member_username = full_name
    end
    local member_id = msg.from.id
    if msg.to.type == 'chat' then
      return demote(get_receiver(msg), member_username, member_id)
    end
end

local function setowner_by_reply(extra, success, result)
  local msg = result
  local receiver = get_receiver(msg)
  local data = load_data(_config.moderation.data)
  local name_log = msg.from.print_name:gsub("_", " ")
  data[tostring(msg.to.id)]['set_owner'] = tostring(msg.from.id)
      save_data(_config.moderation.data, data)
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] Set shod! ["..msg.from.id.."] Be onvane modir!")
      local text = msg.from.print_name:gsub("_", " ").." Modir shod!"
      return send_large_msg(receiver, text)
end

local function promote_demote_res(extra, success, result)
--vardump(result)
--vardump(extra)
      local member_id = result.id
      local member_username = "@"..result.username
      local chat_id = extra.chat_id
      local mod_cmd = extra.mod_cmd
      local receiver = "chat#id"..chat_id
      if mod_cmd == 'promote' then
        return promote(receiver, member_username, member_id)
      elseif mod_cmd == 'demote' then
        return demote(receiver, member_username, member_id)
      end
end

local function modlist(msg)
  local data = load_data(_config.moderation.data)
  local groups = "groups"
  if not data[tostring(groups)][tostring(msg.to.id)] then
    return 'Gorooh add nashode ast!.'
  end
  -- determine if table is empty
  if next(data[tostring(msg.to.id)]['moderators']) == nil then --fix way
    return 'Moderator dar in gorooh vojood nadarad!.'
  end
  local i = 1
  local message = '\nList of moderators for ' .. string.gsub(msg.to.print_name, '_', ' ') .. ':\n'
  for k,v in pairs(data[tostring(msg.to.id)]['moderators']) do
    message = message ..i..' - '..v..' [' ..k.. '] \n'
    i = i + 1
  end
  return message
end

local function callbackres(extra, success, result)
--vardump(result)
  local user = result.id
  local name = string.gsub(result.print_name, "_", " ")
  local chat = 'chat#id'..extra.chatid
  send_large_msg(chat, user..'\n'..name)
  return user
end


local function help()
  local help_text = tostring(_config.help_text)
  return help_text
end

local function cleanmember(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local chat_id = "chat#id"..result.id
  local chatname = result.print_name
  for k,v in pairs(result.members) do
    kick_user(v.id, result.id)
  end
end

local function killchat(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local chat_id = "chat#id"..result.id
  local chatname = result.print_name
  for k,v in pairs(result.members) do
    kick_user_any(v.id, result.id)
  end
end

local function killrealm(cb_extra, success, result)
  local receiver = cb_extra.receiver
  local chat_id = "chat#id"..result.id
  local chatname = result.print_name
  for k,v in pairs(result.members) do
    kick_user_any(v.id, result.id)
  end
end

local function user_msgs(user_id, chat_id)
  local user_info
  local uhash = 'user:'..user_id
  local user = redis:hgetall(uhash)
  local um_hash = 'msgs:'..user_id..':'..chat_id
  user_info = tonumber(redis:get(um_hash) or 0)
  return user_info
end

local function kick_zero(cb_extra, success, result)
    local chat_id = cb_extra.chat_id
    local chat = "chat#id"..chat_id
    local ci_user
    local re_user
    for k,v in pairs(result.members) do
        local si = false
        ci_user = v.id
        local hash = 'chat:'..chat_id..':users'
        local users = redis:smembers(hash)
        for i = 1, #users do
            re_user = users[i]
            if tonumber(ci_user) == tonumber(re_user) then
                si = true
            end
        end
        if not si then
            if ci_user ~= our_id then
                if not is_momod2(ci_user, chat_id) then
                  chat_del_user(chat, 'user#id'..ci_user, ok_cb, true)
                end
            end
        end
    end
end

local function kick_inactive(chat_id, num, receiver)
    local hash = 'chat:'..chat_id..':users'
    local users = redis:smembers(hash)
    -- Get user info
    for i = 1, #users do
        local user_id = users[i]
        local user_info = user_msgs(user_id, chat_id)
        local nmsg = user_info
        if tonumber(nmsg) < tonumber(num) then
            if not is_momod2(user_id, chat_id) then
              chat_del_user('chat#id'..chat_id, 'user#id'..user_id, ok_cb, true)
            end
        end
    end
    return chat_info(receiver, kick_zero, {chat_id = chat_id})
end

local function run(msg, matches)
  local data = load_data(_config.moderation.data)
  local receiver = get_receiver(msg)
   local name_log = user_print_name(msg.from)
  local group = msg.to.id
  if msg.media then
    if msg.media.type == 'photo' and data[tostring(msg.to.id)]['settings']['set_photo'] == 'waiting' and is_chat_msg(msg) and is_momod(msg) then
      load_photo(msg.id, set_group_photo, msg)
    end
  end
  if matches[1] == 'add' and not matches[2] then
    if is_realm(msg) then
       return 'Error: Already a realm.'
    end
    print("group "..msg.to.print_name.."("..msg.to.id..") added")
    return modadd(msg)
  end
   if matches[1] == 'add' and matches[2] == 'Faal!' then
    if is_group(msg) then
       return 'Khata ! gorooh vojood darad!.'
    end
    print("group "..msg.to.print_name.."("..msg.to.id..") Realm add kard!")
    return realmadd(msg)
  end
  if matches[1] == 'rem' and not matches[2] then
    print("group "..msg.to.print_name.."("..msg.to.id..") Hazf shod!")
    return modrem(msg)
  end
  if matches[1] == 'rem' and matches[2] == 'Faal!' then
    print("group "..msg.to.print_name.."("..msg.to.id..") Realm hazf shod!")
    return realmrem(msg)
  end
  if matches[1] == 'chat_created' and msg.from.id == 0 and group_type == "group" then
    return automodadd(msg)
  end
  if matches[1] == 'chat_created' and msg.from.id == 0 and group_type == "realm" then
    return autorealmadd(msg)
  end

  if msg.to.id and data[tostring(msg.to.id)] then
    local settings = data[tostring(msg.to.id)]['settings']
    if matches[1] == 'chat_add_user' then
      if not msg.service then
        return "Are you trying to troll me?"
      end
      local group_member_lock = settings.lock_member
      local user = 'user#id'..msg.action.user.id
      local chat = 'chat#id'..msg.to.id
      if group_member_lock == 'Faal!' and not is_owner2(msg.action.user.id, msg.to.id) then
        chat_del_user(chat, user, ok_cb, true)
      elseif group_member_lock == 'Faal!' and tonumber(msg.from.id) == tonumber(our_id) then
        return nil
      elseif group_member_lock == 'Gheyre Faal*' then
        return nil
      end
    end
    if matches[1] == 'chat_del_user' then
      if not msg.service then
         -- return "Are you trying to troll me?"
      end
      local user = 'user#id'..msg.action.user.id
      local chat = 'chat#id'..msg.to.id
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] User hazf shod!  "..user)
    end
    if matches[1] == 'chat_delete_photo' then
      if not msg.service then
        return "Are you trying to troll me?"
      end
      local group_photo_lock = settings.lock_photo
      if group_photo_lock == 'Faal!' then
        local picturehash = 'Ax avaz shod!:'..msg.to.id..':'..msg.from.id
        redis:incr(picturehash)
        ---
        local picturehash = 'Ax avaz shod!:'..msg.to.id..':'..msg.from.id
        local picprotectionredis = redis:get(picturehash)
        if picprotectionredis then
          if tonumber(picprotectionredis) == 4 and not is_owner(msg) then
            kick_user(msg.from.id, msg.to.id)
          end
          if tonumber(picprotectionredis) ==  8 and not is_owner(msg) then
            ban_user(msg.from.id, msg.to.id)
            local picturehash = 'Ax avaz shod!:'..msg.to.id..':'..msg.from.id
            redis:set(picturehash, 0)
          end
        end

        savelog(msg.to.id, name_log.." ["..msg.from.id.."] Talash kard ta axe gorooh ra hazf konad ama natoonest!  ")
        chat_set_photo(receiver, settings.set_photo, ok_cb, false)
      elseif group_photo_lock == 'Gheyre Faal*' then
        return nil
      end
    end
    if matches[1] == 'chat_change_photo' and msg.from.id ~= 0 then
      if not msg.service then
        return "Are you trying to troll me?"
      end
      local group_photo_lock = settings.lock_photo
      if group_photo_lock == 'Faal!' then
        local picturehash = 'Ax avaz shod!:'..msg.to.id..':'..msg.from.id
        redis:incr(picturehash)
        ---
        local picturehash = 'Ax avaz shod!:'..msg.to.id..':'..msg.from.id
        local picprotectionredis = redis:get(picturehash)
        if picprotectionredis then
          if tonumber(picprotectionredis) == 4 and not is_owner(msg) then
            kick_user(msg.from.id, msg.to.id)
          end
          if tonumber(picprotectionredis) ==  8 and not is_owner(msg) then
            ban_user(msg.from.id, msg.to.id)
          local picturehash = 'Ax avaz shod!:'..msg.to.id..':'..msg.from.id
          redis:set(picturehash, 0)
          end
        end

        savelog(msg.to.id, name_log.." ["..msg.from.id.."] tried to change picture but failed  ")
        chat_set_photo(receiver, settings.set_photo, ok_cb, false)
      elseif group_photo_lock == 'Gheyre Faal*' then
        return nil
      end
    end
    if matches[1] == 'chat_rename' then
      if not msg.service then
        return "Are you trying to troll me?"
      end
      local group_name_set = settings.set_name
      local group_name_lock = settings.lock_name
      local to_rename = 'chat#id'..msg.to.id
      if group_name_lock == 'Faal!' then
        if group_name_set ~= tostring(msg.to.print_name) then
          local namehash = 'Esm avaz shod!:'..msg.to.id..':'..msg.from.id
          redis:incr(namehash)
          local namehash = 'Esm avaz shod!:'..msg.to.id..':'..msg.from.id
          local nameprotectionredis = redis:get(namehash)
          if nameprotectionredis then
            if tonumber(nameprotectionredis) == 4 and not is_owner(msg) then
              kick_user(msg.from.id, msg.to.id)
            end
            if tonumber(nameprotectionredis) ==  8 and not is_owner(msg) then
              ban_user(msg.from.id, msg.to.id)
              local namehash = 'Esm avaz shod!:'..msg.to.id..':'..msg.from.id
              redis:set(namehash, 0)
            end
          end

          savelog(msg.to.id, name_log.." ["..msg.from.id.."] tried to change name but failed  ")
          rename_chat(to_rename, group_name_set, ok_cb, false)
        end
      elseif group_name_lock == 'Gheyre Faal*' then
        return nil
      end
    end
    if matches[1] == 'setname' and is_momod(msg) then
      local new_name = string.gsub(matches[2], '_', ' ')
      data[tostring(msg.to.id)]['settings']['set_name'] = new_name
      save_data(_config.moderation.data, data)
      local group_name_set = data[tostring(msg.to.id)]['settings']['set_name']
      local to_rename = 'chat#id'..msg.to.id
      rename_chat(to_rename, group_name_set, ok_cb, false)

      savelog(msg.to.id, " { "..msg.to.print_name.." }  Esme gorooh avaz shod be[ "..new_name.." ] tavasote"..name_log.." ["..msg.from.id.."]")
    end
    if matches[1] == 'setphoto' and is_momod(msg) then
      data[tostring(msg.to.id)]['settings']['set_photo'] = 'waiting'
      save_data(_config.moderation.data, data)
      return 'Please send me new group photo now'
    end
    if matches[1] == 'promote' and not matches[2] then
      if not is_owner(msg) then
        return "Faghat ~Modir mitavanad moderatore jadid set konad!"
      end
      if type(msg.reply_id)~="nil" then
          msgr = get_message(msg.reply_id, promote_by_reply, false)
      end
    end
    if matches[1] == 'promote' and matches[2] then
      if not is_momod(msg) then
        return
      end
      if not is_owner(msg) then
        return "Faghat ~Modir mitavanad promote konad!"
      end
	local member = matches[2]
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] Promote shod! @".. member)
	local cbres_extra = {
	chat_id = msg.to.id,
        mod_cmd = 'promote',
	from_id = msg.from.id
	}
	local username = matches[2]
	local username = string.gsub(matches[2], '@', '')
	return res_user(username, promote_demote_res, cbres_extra)
    end
    if matches[1] == 'demote' and not matches[2] then
      if not is_owner(msg) then
        return "Faghat ~Modir mitavanad Demote konad!"
      end
      if type(msg.reply_id)~="nil" then
          msgr = get_message(msg.reply_id, demote_by_reply, false)
      end
    end
    if matches[1] == 'demote' and matches[2] then
      if not is_momod(msg) then
        return
      end
      if not is_owner(msg) then
        return "Faghat ~Modir mitavanad Demote konad!"
      end
      if string.gsub(matches[2], "@", "") == msg.from.username and not is_owner(msg) then
        return "Shoma nemitavanid khodeton ro demote konid!"
      end
	local member = matches[2]
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] Demote shod! @".. member)
	local cbres_extra = {
	chat_id = msg.to.id,
        mod_cmd = 'demote',
	from_id = msg.from.id
	}
	local username = matches[2]
	local username = string.gsub(matches[2], '@', '')
	return res_user(username, promote_demote_res, cbres_extra)
    end
    if matches[1] == 'modlist' then
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] Darkhast baraye modlist...")
      return modlist(msg)
    end
    if matches[1] == 'Etelaate gorooh ~' then
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] Darkhast baraye Etelaate gorooh...")
      return get_description(msg, data)
    end
    if matches[1] == 'rules' then
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] Darkhast baraye Ghavanine gorooh...")
      return get_rules(msg, data)
    end
    if matches[1] == 'set' then
      if matches[2] == 'rules' then
        rules = matches[3]
        local target = msg.to.id
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] Ghavanine gorooh ra avaz kard be ~ ["..matches[3].."]")
        return set_rulesmod(msg, data, target)
      end
      if matches[2] == 'Etelaate gorooh ~' then
        local data = load_data(_config.moderation.data)
        local target = msg.to.id
        local about = matches[3]
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] Etelaate gorooh ra avaz kard be ~ ["..matches[3].."]")
        return set_descriptionmod(msg, data, target, about)
      end
    end
    if matches[1] == 'lock' then
      local target = msg.to.id
      if matches[2] == 'name' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] Esm ghofl shod! ")
        return lock_group_namemod(msg, data, target)
      end
      if matches[2] == 'member' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] Addmember ghofl shod! ")
        return lock_group_membermod(msg, data, target)
        end
      if matches[2] == 'flood' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] Antispam faal shod! ")
        return lock_group_floodmod(msg, data, target)
      end
      if matches[2] == 'arabic' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] Arabic ghofl shod! ")
        return lock_group_arabic(msg, data, target)
      end
      if matches[2] == 'bots' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] Antibot faal shod! ")
        return lock_group_bots(msg, data, target)
      end
    if matches[2] == 'leave' then
       savelog(msg.to.id, name_log.." ["..msg.from.id.."] Khorooj ghofl shod! ")
       return lock_group_leave(msg, data, target)
     end
   end
    if matches[1] == 'unlock' then
      local target = msg.to.id
      if matches[2] == 'name' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] Esm baz shod! ")
        return unlock_group_namemod(msg, data, target)
      end
      if matches[2] == 'member' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] Addmember baz shod! ")
        return unlock_group_membermod(msg, data, target)
      end
      if matches[2] == 'photo' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] Axe gorooh baz shod! ")
        return unlock_group_photomod(msg, data, target)
      end
      if matches[2] == 'flood' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] Antispam gheyre faal shod! ")
        return unlock_group_floodmod(msg, data, target)
      end
      if matches[2] == 'arabic' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] Arabic baz shod! ")
        return unlock_group_arabic(msg, data, target)
      end
      if matches[2] == 'bots' then
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] Antibot gheyre faal shod! ")
        return unlock_group_bots(msg, data, target)
      end
    if matches[2] == 'leave' then
       savelog(msg.to.id, name_log.." ["..msg.from.id.."] khorooj baz shod! ")
       return unlock_group_leave(msg, data, target)
     end
   end
    if matches[1] == 'settings' then
      local target = msg.to.id
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] Darkhast baraye tanzimate gorooh... ")
      return show_group_settingsmod(msg, data, target)
    end

  --[[if matches[1] == 'Hamegani! then
    local target = msg.to.id
    if matches[2] == 'Faal!' then
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] set group to: public")
      return set_public_membermod(msg, data, target)
    end
    if matches[2] == 'Gheyre Faal*' then
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] set group to: not public")
      return unset_public_membermod(msg, data, target)
    end
  end]]

    if matches[1] == 'newlink' and not is_realm(msg) then
      if not is_momod(msg) then
        return "Faghat baraye Moderator ha!!"
      end
      local function callback (extra , success, result)
        local receiver = 'chat#'..msg.to.id
        if success == 0 then
           return send_large_msg(receiver, '*Error: Invite link failed* \nReason: Not creator.')
        end
        send_large_msg(receiver, "Linke jadid sakhte shod!")
        data[tostring(msg.to.id)]['settings']['set_link'] = result
        save_data(_config.moderation.data, data)
      end
      local receiver = 'chat#'..msg.to.id
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] revoked group link ")
      return export_chat_link(receiver, callback, true)
    end
    if matches[1] == 'link' then
      if not is_momod(msg) then
        return "Faghat baraye Moderator ha!!"
      end
      local group_link = data[tostring(msg.to.id)]['settings']['set_link']
      if not group_link then
        return "Baraye sakhte linke gorooh az dastoore /newlink estefade konid! !"
      end
       savelog(msg.to.id, name_log.." ["..msg.from.id.."] Darkhaste linke gorooh... ["..group_link.."]")
      return "Group link:\n"..group_link
    end
    if matches[1] == 'setowner' and matches[2] then
      if not is_owner(msg) then
        return "For owner only!"
      end
      data[tostring(msg.to.id)]['set_owner'] = matches[2]
      save_data(_config.moderation.data, data)
      savelog(msg.to.id, name_log.." ["..msg.from.id.."]  ["..matches[2].."]be onvane ~Modir set shod!")
      local text = matches[2].." ~Modir add shod!"
      return text
    end
    if matches[1] == 'setowner' and not matches[2] then
      if not is_owner(msg) then
        return "Faghat baraye ~Modir!"
      end
      if type(msg.reply_id)~="nil" then
          msgr = get_message(msg.reply_id, setowner_by_reply, false)
      end
    end
    if matches[1] == 'owner' then
      local group_owner = data[tostring(msg.to.id)]['set_owner']
      if not group_owner then
        return "~Modir mojood nist...Lotfan az adminha bekhahid ta baraye goroohetan modir set konand!"
      end
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] used /owner")
      return "Group owner is ["..group_owner..']'
    end
    if matches[1] == 'setgpowner' then
      local receiver = "chat#id"..matches[2]
      if not is_admin(msg) then
        return "For admins only!"
      end
      data[tostring(matches[2])]['set_owner'] = matches[3]
      save_data(_config.moderation.data, data)
      local text = matches[3].." ~Modir add shod!"
      send_large_msg(receiver, text)
      return
    end
    if matches[1] == 'setflood' then
      if not is_momod(msg) then
        return "Faghat baraye Moderator ha!!"
      end
      if tonumber(matches[2]) < 5 or tonumber(matches[2]) > 20 then
        return "Khata! Shomareye morede nazare shoma bayad beyne adade [5 ta20]bashad!"
      end
      local flood_max = matches[2]
      data[tostring(msg.to.id)]['settings']['flood_msg_max'] = flood_max
      save_data(_config.moderation.data, data)
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] Floode  tanzim shod be ["..matches[2].."]")
      return 'Floode gorooh tanzim shod be '..matches[2]
    end
    if matches[1] == 'clean' then
      if not is_owner(msg) then
        return "Faghat ~Modir mitavanad member hara pak konad!"
      end
      if matches[2] == 'member' then
        if not is_owner(msg) then
          return "Faghat adminha mitavanand member hara kick pak konand!"
        end
        local receiver = get_receiver(msg)
        chat_info(receiver, cleanmember, {receiver=receiver})
      end
      if matches[2] == 'modlist' then
        if next(data[tostring(msg.to.id)]['moderators']) == nil then --fix way
          return 'Moderator dar in gorooh vojood nadarad!.'
        end
        local message = '\nList of moderators for ' .. string.gsub(msg.to.print_name, '_', ' ') .. ':\n'
        for k,v in pairs(data[tostring(msg.to.id)]['moderators']) do
          data[tostring(msg.to.id)]['moderators'][tostring(k)] = nil
          save_data(_config.moderation.data, data)
        end
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] Modlist pak shod!")
      end
      if matches[2] == 'rules' then
        local data_cat = 'rules'
        data[tostring(msg.to.id)][data_cat] = nil
        save_data(_config.moderation.data, data)
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] Ghavanin pak shodand!")
      end
      if matches[2] == 'Etelaate gorooh ~' then
        local data_cat = 'Etelaate gorooh ~'
        data[tostring(msg.to.id)][data_cat] = nil
        save_data(_config.moderation.data, data)
        savelog(msg.to.id, name_log.." ["..msg.from.id.."] Etelaate gorooh pak shod!")
      end
    end
    if matches[1] == 'kill' and matches[2] == 'chat' then
      if not is_admin(msg) then
          return nil
      end
      if not is_realm(msg) then
          local receiver = get_receiver(msg)
          return modrem(msg),
          print("Closing Group..."),
          chat_info(receiver, killchat, {receiver=receiver})
      else
          return 'In yek realm ast!'
      end
   end
    if matches[1] == 'kill' and matches[2] == 'Faal!' then
     if not is_admin(msg) then
         return nil
     end
     if not is_group(msg) then
        local receiver = get_receiver(msg)
        return realmrem(msg),
        print("Closing Realm..."),
        chat_info(receiver, killrealm, {receiver=receiver})
     else
        return 'In yek gorooh ast!'
     end
   end
    if matches[1] == 'help' then
      if not is_momod(msg) or is_realm(msg) then
        return
      end
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] Az dastoore /help estefade konid!")
      return help()
    end
    if matches[1] == 'res' and is_momod(msg) then
      local cbres_extra = {
        chatid = msg.to.id
      }
      local username = matches[2]
      local username = username:gsub("@","")
      savelog(msg.to.id, name_log.." ["..msg.from.id.."] Az dastoore /res estefade konid! "..username)
      return res_user(username,  callbackres, cbres_extra)
    end
    if matches[1] == 'kickinactive' then
      --send_large_msg('chat#id'..msg.to.id, 'I\'m in matches[1]')
	    if not is_momod(msg) then
	      return 'Faghat moderator mitavanad inactive user hara kick konad!'
	    end
	    local num = 1
	    if matches[2] then
	        num = matches[2]
	    end
	    local chat_id = msg.to.id
	    local receiver = get_receiver(msg)
      return kick_inactive(chat_id, num, receiver)
    end
  end
end

return {
  patterns = {
  "^[!/](add)$",
  "^[!/](add) (realm)$",
  "^[!/](rem)$",
  "^[!/](rem) (realm)$",
  "^[!/](rules)$",
  "^[!/](about)$",
  "^[!/](setname) (.*)$",
  "^[!/](setphoto)$",
  "^[!/](promote) (.*)$",
  "^[!/](promote)",
  "^[!/](help)$",
  "^[!/](clean) (.*)$",
  "^[!/](kill) (chat)$",
  "^[!/](kill) (realm)$",
  "^[!/](demote) (.*)$",
  "^[!/](demote)",
  "^[!/](set) ([^%s]+) (.*)$",
  "^[!/](lock) (.*)$",
  "^[!/](setowner) (%d+)$",
  "^[!/](setowner)",
  "^[!/](owner)$",
  "^[!/](res) (.*)$",
  "^[!/](setgpowner) (%d+) (%d+)$",-- (group id) (owner id)
  "^[!/](unlock) (.*)$",
  "^[!/](setflood) (%d+)$",
  "^[!/](settings)$",
-- "^[!/](public) (.*)$",
  "^[!/](modlist)$",
  "^[!/](newlink)$",
  "^[!/](link)$",
  "^[!/](kickinactive)$",
  "^[!/](kickinactive) (%d+)$",
  "%[(photo)%]",
  "^!!tgservice (.+)$",
  },
  run = run
}
end


