local ScriptName = "Çevirsene"
local Version = "1.0.0"

if Cevirsene then
	menu.notify("Çevirsene zaten yüklenmiş", ScriptName, 10, 0xFF0000FF)
	return
end

if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_HTTP) then
	menu.notify("Menünün çalismasi için \"Trusted Http\" seçenegini açmaniz gerekir", ScriptName .. " v" .. Version, 10, 0xFF0000FF)
end

Cevirsene = true

local Languages = {
	{ Name = "Afrika dili", Key = "af" },
	{ Name = "Arnavutça", Key = "sq" },
	{ Name = "Habeşçe", Key = "am" },
	{ Name = "Arapça", Key = "ar" },
	{ Name = "Ermenice", Key = "hy" },
	{ Name = "Assamca", Key = "as" },
	{ Name = "Aymaraca", Key = "ay" },
	{ Name = "Azerice", Key = "az" },
	{ Name = "Bambara dili", Key = "bm" },
	{ Name = "Baskça", Key = "eu" },
	{ Name = "Belarusça", Key = "be" },
	{ Name = "Bengalce", Key = "bn" },
	{ Name = "Arayanice", Key = "bho" },
	{ Name = "Boşnakça", Key = "bs" },
	{ Name = "Bulgarca", Key = "bg" },
	{ Name = "Katalanca", Key = "ca" },
	{ Name = "Sabuanca", Key = "ceb" },
	{ Name = "Çevaca", Key = "ny" },
	{ Name = "Çince", Key = "zh-CN" },
	{ Name = "Korsikaca", Key = "co" },
	{ Name = "Hırvatça", Key = "hr" },
	{ Name = "Çekçe", Key = "cs" },
	{ Name = "Danca", Key = "da" },
	{ Name = "Maldivce", Key = "dv" },
	{ Name = "Dogri dili", Key = "doi" },
	{ Name = "Felemenkçe", Key = "nl" },
	{ Name = "İngilizce", Key = "en" },
	{ Name = "Esperanto dili", Key = "eo" },
	{ Name = "Estonca", Key = "et" },
	{ Name = "Ewece", Key = "ee" },
	{ Name = "Filipince", Key = "tl" },
	{ Name = "Fince", Key = "fi" },
	{ Name = "Fransızca", Key = "fr" },
	{ Name = "Frizce", Key = "fy" },
	{ Name = "Galiçyaca", Key = "gl" },
	{ Name = "Gürcüce", Key = "ka" },
	{ Name = "Almanca", Key = "de" },
	{ Name = "Yunanca", Key = "el" },
	{ Name = "Guaranice", Key = "gn" },
	{ Name = "Güceratça", Key = "gu" },
	{ Name = "Haiti Kreolü", Key = "ht" },
	{ Name = "Hausaca", Key = "ha" },
	{ Name = "Havaice", Key = "haw" },
	{ Name = "İbranice", Key = "iw" },
	{ Name = "Hintçe", Key = "hi" },
	{ Name = "Hmong dili", Key = "hmn" },
	{ Name = "Macarca", Key = "hu" },
	{ Name = "İzlandaca", Key = "is" },
	{ Name = "İbo dili", Key = "ig" },
	{ Name = "İlokano dili", Key = "ilo" },
	{ Name = "Endonezce", Key = "id" },
	{ Name = "İrlandaca", Key = "ga" },
	{ Name = "İtalyanca", Key = "it" },
	{ Name = "Japonca", Key = "ja" },
	{ Name = "Cavaca", Key = "jw" },
	{ Name = "Kannadaca", Key = "kn" },
	{ Name = "Kazakça", Key = "kk" },
	{ Name = "Kmerce", Key = "km" },
	{ Name = "Ruandaca", Key = "rw" },
	{ Name = "Konkani dili", Key = "gom" },
	{ Name = "Korece", Key = "ko" },
	{ Name = "Krio dili", Key = "kri" },
	{ Name = "Laoca", Key = "lo" },
	{ Name = "Latince", Key = "la" },
	{ Name = "Letonca", Key = "lv" },
	{ Name = "Lingala dili", Key = "ln" },
	{ Name = "Litvanca", Key = "lt" },
	{ Name = "Luganda dili", Key = "lg" },
	{ Name = "Lüksemburgca", Key = "lb" },
	{ Name = "Makedonca", Key = "mk" },
	{ Name = "Maithili dili", Key = "mai" },
	{ Name = "Malgaşça", Key = "mg" },
	{ Name = "Malayca", Key = "ms" },
	{ Name = "Malayalamca", Key = "ml" },
	{ Name = "Maltaca", Key = "mt" },
	{ Name = "Maorice", Key = "mi" },
	{ Name = "Maratice", Key = "mr" },
	{ Name = "Meitei dili", Key = "mni-Mtei" },
	{ Name = "Mizo dili", Key = "lus" },
	{ Name = "Moğolca", Key = "mn" },
	{ Name = "Burmaca", Key = "my" },
	{ Name = "Nepalce", Key = "ne" },
	{ Name = "Norveççe", Key = "no" },
	{ Name = "Oriya dili", Key = "or" },
	{ Name = "Oromca", Key = "om" },
	{ Name = "Peştuca", Key = "ps" },
	{ Name = "Farsça", Key = "fa" },
	{ Name = "Lehçe", Key = "pl" },
	{ Name = "Portekizce", Key = "pt" },
	{ Name = "Pencapça", Key = "pa" },
	{ Name = "Keçuva dili", Key = "qu" },
	{ Name = "Rumence", Key = "ro" },
	{ Name = "Rusça", Key = "ru" },
	{ Name = "Samoaca", Key = "sm" },
	{ Name = "Sanskritçe", Key = "sa" },
	{ Name = "İskoçça", Key = "gd" },
	{ Name = "Kuzey Sotho dili", Key = "nso" },
	{ Name = "Sırpça", Key = "sr" },
	{ Name = "Güney Sotho dili", Key = "st" },
	{ Name = "Şona dili", Key = "sn" },
	{ Name = "Sintçe", Key = "sd" },
	{ Name = "Seylanca", Key = "si" },
	{ Name = "Slovakça", Key = "sk" },
	{ Name = "Slovence", Key = "sl" },
	{ Name = "Somalice", Key = "so" },
	{ Name = "İspanyolca", Key = "es" },
	{ Name = "Sunda dili", Key = "su" },
	{ Name = "Savahilice", Key = "sw" },
	{ Name = "İsveççe", Key = "sv" },
	{ Name = "Tacikçe", Key = "tg" },
	{ Name = "Tamilce", Key = "ta" },
	{ Name = "Tatarca", Key = "tt" },
	{ Name = "Teluguca", Key = "te" },
	{ Name = "Tayca", Key = "th" },
	{ Name = "Tigrinya dili", Key = "ti" },
	{ Name = "Tsongaca", Key = "ts" },
	{ Name = "Türkçe", Key = "tr" },
	{ Name = "Türkmence", Key = "tk" },
	{ Name = "Akan dili", Key = "ak" },
	{ Name = "Ukraynaca", Key = "uk" },
	{ Name = "Urduca", Key = "ur" },
	{ Name = "Uygurca", Key = "ug" },
	{ Name = "Özbekçe", Key = "uz" },
	{ Name = "Vietnamca", Key = "vi" },
	{ Name = "Galce", Key = "cy" },
	{ Name = "Zosa dili", Key = "xh" },
	{ Name = "Yidce", Key = "yi" },
	{ Name = "Yorubaca", Key = "yo" },
	{ Name = "Zuluca", Key = "zu" },
}

local LangKeys = {}
local LangIndexes = {}
local LangLookupByName = {}
local LangLookupByKey = {}

for i=1,#Languages do
	local Language = Languages[i]
	LangKeys[i] = Language.Name
	LangIndexes[Language.Key] = i
	LangLookupByName[Language.Name] = Language.Key
	LangLookupByKey[Language.Key] = Language.Name
end

table.sort(LangKeys)

local Settings = {}
Settings.EnableTranslation = true
Settings.TargetLang = "en"
Settings.TranslateSelf = true
Settings.SendToTeamChat = false
Settings.TranslateMethod = "Google 1"
Settings.NotificationSeconds = 10

local ExcludedLanguages = {}

local Paths = {}
Paths.Root = utils.get_appdata_path("PopstarDevs", "2Take1Menu")
Paths.Cfg = Paths.Root .. "\\cfg"
Paths.LogFile = Paths.Root .. "\\" .. ScriptName .. ".log"
Paths.Scripts = Paths.Root .. "\\scripts"

local function SaveSettings(SettingsFile, SettingsTbl)
	assert(SettingsFile, "Nil passed for SettingsFile to SaveSettings")
	assert(type(SettingsTbl) == "table", "Not a table passed for SettingsTbl to SaveSettings")
	local file = io.open(Paths.Cfg .. "\\" .. SettingsFile .. ".cfg", "w")
	local keys = {}
	for k in pairs(SettingsTbl) do
		keys[#keys + 1] = k
	end
	table.sort(keys)
	for i=1,#keys do
		file:write(tostring(keys[i]) .. "=" .. tostring(SettingsTbl[keys[i]]) .. "\n")
	end
	file:close()
end

local function LoadSettings(SettingsFile, SettingsTbl)
	assert(SettingsFile, "Nil passed for SettingsFile to LoadSettings")
	assert(type(SettingsTbl) == "table", "Not a table passed for SettingsTbl to LoadSettings")
	SettingsFile = Paths.Cfg .. "\\" .. SettingsFile .. ".cfg"
	if not utils.file_exists(SettingsFile) then
		return false
	end
	for line in io.lines(SettingsFile) do
		local separator = line:find("=", 1, true)
		if separator then
			local key = line:sub(1, separator - 1)
			local value = line:sub(separator + 1)
			local num = tonumber(value)
			if num then
				value = num
			elseif value == "true" then
				value = true
			elseif value == "false" then
				value = false
			end
			num = tonumber(key)
			if num then
				key = num
			end
			SettingsTbl[key] = value
		end
	end
	return true
end

LoadSettings(ScriptName, Settings)
LoadSettings(ScriptName .. " Excluded Languages", ExcludedLanguages)

local basePrint = print
local function print(...)
	basePrint(...)
	local success, result = pcall(function(...)
		local args = {...}
		if #args == 0 then
			return
		end
		
		local currTime = os.date("*t")
		local file = io.open(Paths.LogFile, "a")
		
		for i=1,#args do
			file:write(string.format("[%02d-%02d-%02d %02d:%02d:%02d] <%s> %s\n", currTime.year, currTime.month, currTime.day, currTime.hour, currTime.min, currTime.sec, Version, tostring(args[i])))
		end
		
		file:close()
	end, ...)
	if not success then
		basePrint("Error writing log: " .. result)
	end
end

local notif = menu.notify
local function notify(message, title, seconds, colour)
	title = title or (ScriptName .. " v" .. Version)
	seconds = seconds or 10
	colour = colour or 0xFF0000FF
	notif(message, title, seconds, colour)
	print(string.format("[%s] %s > %s", ScriptName .. " v" .. Version, title, message))
end

local EscapeChars = {
	["\\"] = "\\",
	["r"] = "\r",
	["n"] = "\n",
	["t"] = "\t",
}
local function ProcessEscapeChar(char)
	return EscapeChars[char] or char
end

local function ProcessEscapeCode(code)
	return string.char(tonumber(code, 16))
end

local function GoogleTranslate1(encodedText, targetLang)
	print("Translating with Google 1")
	
	local statusCode, body = web.get("https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=" .. targetLang .. "&dt=t&dj=1&source=input&q=" .. encodedText)
	
	if statusCode ~= 200 then
		return false, body
	end
	
	local sentences, sourceLang = body:match('{"sentences":(%b[]),"src":"(.-)"')
	
	if sentences == nil then
		return false, body
	end
	
	local translationTbl = {}
	for sentence in sentences:gmatch('{"trans":"(.-)","orig"') do
		translationTbl[#translationTbl + 1] = sentence
	end
	
	local translation = table.concat(translationTbl)
	translation = translation:gsub("\\u([a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9])", ProcessEscapeCode)
	translation = translation:gsub("\\(.)", ProcessEscapeChar)
	
	return true, translation, sourceLang
end

local function GoogleTranslate2(encodedText, targetLang)
	print("Translating with Google 2")
	
	local statusCode, body = web.get("https://clients5.google.com/translate_a/t?client=dict-chrome-ex&sl=auto&tl="..targetLang.."&q="..encodedText)
	
	if statusCode ~= 200 then
		return false, body
	end
	
	local translation, sourceLang = body:match('^%[%["(.-)","(.-)"%]%]')
	
	if translation == nil then
		return false, body
	end
	
	translation = translation:gsub("\\u([a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9])", ProcessEscapeCode)
	translation = translation:gsub("\\(.)", ProcessEscapeChar)
	
	return true, translation, sourceLang
end

local function DeepLUsage(isFree, key)
	if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_HTTP) then
		return false, "HTTP trusted flag not enabled."
	end
	
	if key == nil or type(key) ~= "string" or key:len() == 0 then
		return false, "Key not set."
	end
	
	local statusCode, body = web.get("https://" .. (isFree and "api-free" or "api") .. ".deepl.com/v2/usage?auth_key=" .. web.urlencode(key))
	
	if statusCode ~= 200 then
		if statusCode == 429 or statusCode == 456 then
			return false, "Daily Request Limit reached."
		end
		if statusCode == 403 then
			return false, "Anahtar geçersiz."
		end
		return false, body
	end
	
	local used, limit = body:match('^{"character_count":(%d+),"character_limit":(%d+)}$')
	if not used or not limit then
		return false, "Unknown API response.\n" .. body
	end
	
	used = tonumber(used)
	limit = tonumber(limit)
	
	return true, (used / limit) * 100
end

local DeepLLanguages = {["de"] = true,["ar"] = true,["bg"] = true,["cs"] = true,["zh"] = true,["da"] = true,["id"] = true,["et"] = true,["nl"] = true,["fi"] = true,["fr"] = true,["en-us"] = true,["es"] = true,["sv"] = true,["it"] = true,["ja"] = true,["ko"] = true,["pl"] = true,["lv"] = true,["lt"] = true,["hu"] = true,["nb"] = true,["pt"] = true,["ro"] = true,["ru"] = true,["sk"] = true,["sl"] = true,["tr"] = true,["uk"] = true,["el"] = true}

local function DeepLTranslate(isFree, key, encodedText, targetLang)
	if targetLang == "zh-CN" then
		targetLang = "zh"
	elseif targetLang == "pt-PT" then
		targetLang = "pt"
	elseif targetLang == "en-US" then
		targetLang = "en"
	elseif not DeepLLanguages[targetLang] then
		print(targetLang)
		notify("DeepL çeviri motoru seçilen " .. (LangLookupByKey[targetLang] or targetLang) .. " kaynagini desteklemiyor.")
		return false, "Dil desteklenmiyor"
	end


	
	local statusCode, body = web.get("https://" .. (isFree and "api-free" or "api") .. ".deepl.com/v2/translate?auth_key=" .. web.urlencode(key) .. "&target_lang=" .. targetLang .. "&text=" .. encodedText)
	
	if statusCode ~= 200 then
		if statusCode == 429 or statusCode == 456 then
			return false, "Daily Request Limit reached."
		end
		if statusCode == 403 then
			return false, "Anahtar geçersiz."
		end
		return false, body
	end
	
	local translations = body:match('{"translations":(%b[])')
	
	if translations == nil then
		return false, body
	end
	
	local sourceLang
	
	local translationTbl = {}
	for lang, text in translations:gmatch('{"detected_source_language":"(.-)","text":"(.-)"}') do
		sourceLang = lang
		translationTbl[#translationTbl + 1] = text
	end
	
	local translation = table.concat(translationTbl)
	translation = translation:gsub("\\u([a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9])", ProcessEscapeCode)
	translation = translation:gsub("\\(.)", ProcessEscapeChar)
	
	sourceLang = sourceLang:lower()
	if sourceLang == "zh" then
		sourceLang = "zh-CN"
	end
	
	return true, translation, sourceLang
end
local function DeepLFreeTranslate(encodedText, targetLang)
	print("DeepL Ücretsiz Sürüm ile çeviri")
	
	if not Settings.DeepLFreeKey or Settings.DeepLFreeKey:len() == 0 then
		return false, "Ayarlarda kayitli anahtar yok"
	end
	
	return DeepLTranslate(true, Settings.DeepLFreeKey, encodedText, targetLang)
end

local function DeepLProTranslate(encodedText, targetLang)
	print("DeepL Pro Sürüm ile çeviri")
	
	if not Settings.DeepLProKey or Settings.DeepLProKey:len() == 0 then
		return false, "Ayarlarda kayitli anahtar yok"
	end
	
	return DeepLTranslate(false, Settings.DeepLProKey, encodedText, targetLang)
end

local TranslateMethods = {
	["Google 1"] = GoogleTranslate1,
	["Google 2"] = GoogleTranslate2,
	["DeepL Ücretsiz Sürüm"] = DeepLFreeTranslate,
	["DeepL Pro Sürüm"] = DeepLProTranslate,
}

local TranslateMethodKeys = {}
for k in pairs(TranslateMethods) do
	TranslateMethodKeys[#TranslateMethodKeys + 1] = k
end
table.sort(TranslateMethodKeys)

local TranslateMethodIndexes = {}
for i=1,#TranslateMethodKeys do
	TranslateMethodIndexes[TranslateMethodKeys[i]] = i
end

local function Translate(text, targetLang)
	local encoded = web.urlencode(text)
	if targetLang then
		targetLang = web.urlencode(targetLang)
	else
		targetLang = "en"
	end
	
	return (TranslateMethods[Settings.TranslateMethod] or GoogleTranslate1)(encoded, targetLang)
end

local function TranslateChat(event)
	local pid = event.sender
	if not menu.is_trusted_mode_enabled(eTrustedFlags.LUA_TRUST_HTTP) then
		notify("\"Trusted Http\" seçenegi etkinlestirilmedigi için sohbet mesaji çevrilemedi.", nil, nil, 0xFF0000FF)
		return
	end
	if (Settings.TranslateSelf or pid ~= player.player_id()) and player.is_player_valid(pid) then
		local name = player.get_player_name(pid)
		
		local success, translation, sourceLang = Translate(event.body, Settings.TargetLang)
		
		if not success then
			notify("Çeviride hata olustu. Konsolu kontrol edin.", nil, Settings.NotificationSeconds)
			print(translation)
			return
		end
		
		if sourceLang ~= Settings.TargetLang and event.body ~= translation and not ExcludedLanguages[sourceLang] then
			notify(translation, name .. ": (" .. (LangLookupByKey[sourceLang] or sourceLang) .. " kaynagindan çevrildi)", nil, 0xFFFFFF00)
		end
	end
end

local ParentId = menu.add_feature(ScriptName, "parent").id

local EnableTranslationFeat = menu.add_feature("Çeviriyi etkinlestir", "toggle", ParentId, function(f)
	Settings.EnableTranslation = f.on
	print("Set EnableTranslation to: " .. tostring(Settings.EnableTranslation))
	if f.on then
		if f.data then
			return
		end
		
		f.data = event.add_event_listener("chat", TranslateChat)
	else
		if not f.data then
			return
		end
		
		event.remove_event_listener("chat", f.data)
		f.data = nil
	end
end)
EnableTranslationFeat.on = Settings.EnableTranslation

local EngineParentId = menu.add_feature("Çeviri motoru", "parent", ParentId).id

local EngineFeat = menu.add_feature("Kullanilacak uygulama", "autoaction_value_str", EngineParentId, function(f)
	Settings.TranslateMethod = TranslateMethodKeys[f.value + 1]
	print("Set TranslateMethod to: " .. Settings.TranslateMethod)
end)
EngineFeat:set_str_data(TranslateMethodKeys)
EngineFeat.value = TranslateMethodIndexes[Settings.TranslateMethod] - 1

local DeepLFreeKeyFeat = menu.add_feature("DeepL Ücretsiz Sürüm anahtarini ayarla", "action", EngineParentId, function(f)
	local r, s
	repeat
		r, s = input.get("DeepL Ücretsiz Sürüm anahtarini girin", Settings.DeepLFreeKey or "", 39, 0)
		if r == 2 then return HANDLER_POP end
		system.wait(0)
	until r == 0
	
	local key = s:match("^[a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]%-[a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]%-[a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]%-[a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]%-[a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]:fx$")
	if not key then
		notify("Girilen deger DeepL anahtari formatiyla eslesmiyor, deger söyle olmali:\nxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx:fx")
		return
	end
	
	Settings.DeepLFreeKey = key
	print("Set DeepL Free Key to: " .. Settings.DeepLFreeKey)
end)

local DeepLProKeyFeat = menu.add_feature("DeepL Pro Sürüm anahtarini ayarla", "action", EngineParentId, function(f)
	local r, s
	repeat
		r, s = input.get("DeepL Pro Sürüm anahtarini girin", Settings.DeepLProKey or "", 39, 0)
		if r == 2 then return HANDLER_POP end
		system.wait(0)
	until r == 0
	
	local key = s:match("^[a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]%-[a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]%-[a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]%-[a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]%-[a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]:fx$")
	if not key then
		notify("Girilen deger DeepL anahtari formatiyla eslesmiyor, deger söyle olmali:\nxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx:fx")
		return
	end
	
	Settings.DeepLProKey = key
	print("Set DeepL Pro Key to: " .. Settings.DeepLProKey)
end)

menu.add_feature("DeepL Ücretsiz Sürüm anahtarini kontrol et", "action", EngineParentId, function(f)
	if not Settings.DeepLFreeKey or Settings.DeepLFreeKey:len() == 0 then
		notify("DeepL Ücretsiz Sürüm verisi alinamadi: Anahtar girilmemis")
		return
	end
	
	local success, usage = DeepLUsage(true, Settings.DeepLFreeKey)
	if success then
		notify(string.format("DeepL Ücretsiz Sürüm kullanimi: %.3f%%", usage), nil, nil, 0xFF00FF00)
	else
		notify("DeepL Ücretsiz Sürüm kullanimi basarisiz oldu: " .. usage)
	end
end)

menu.add_feature("DeepL Pro Sürüm anahtarini kontrol et", "action", EngineParentId, function(f)
	if not Settings.DeepLProKey or Settings.DeepLProKey:len() == 0 then
		notify("DeepL Pro Sürüm verisi alinamadi: Anahtar girilmemis")
		return
	end
	
	local success, usage = DeepLUsage(false, Settings.DeepLProKey)
	if success then
		notify(string.format("DeepL Pro Sürüm kullanimi: %.3f%%", usage), nil, nil, 0xFF00FF00)
	else
		notify("DeepL Pro Sürüm kullanimi basarisiz oldu: " .. usage)
	end
end)

local TargetLangFeat = menu.add_feature("Yazilanin çevrilecegi dil", "autoaction_value_str", ParentId, function(f)
	Settings.TargetLang = LangLookupByName[LangKeys[f.value + 1]]
	print("Set TargetLang to: " .. Settings.TargetLang)
end)
TargetLangFeat:set_str_data(LangKeys)
TargetLangFeat.value = LangIndexes[Settings.TargetLang] - 1

local TranslateSelfFeat = menu.add_feature("Çevrilen yazilarini gor", "toggle", ParentId, function(f)
	Settings.TranslateSelf = f.on
	print("Set TranslateSelf to: " .. tostring(Settings.TranslateSelf))
end)
TranslateSelfFeat.on = Settings.TranslateSelf

local function Clamp(val, min, max)
	if val < min then return min end
	if val > max then return max end
	return val
end

local NotificationSecondsFeat = menu.add_feature("Bildirim saniyesi", "autoaction_value_i", ParentId, function(f)
	if f.value == Settings.NotificationSeconds then
		local r, s
		repeat
			r, s = input.get("Bildirimi görüntülemek için saniye girin", tostring(f.value), 3, 0)
			if r == 2 then return HANDLER_POP end
			system.wait(0)
		until r == 0
		f.value = Clamp(tonumber(s), f.min, f.max)
	end
	Settings.NotificationSeconds = f.value
	print("Set NotificationSeconds to: " .. f.value)
end)
NotificationSecondsFeat.min = 1
NotificationSecondsFeat.max = 60
NotificationSecondsFeat.mod = 1
NotificationSecondsFeat.value = Clamp(Settings.NotificationSeconds, NotificationSecondsFeat.min, NotificationSecondsFeat.max)

local ExcludedParentId = menu.add_feature("Hariç tutulan diller", "parent", ParentId).id
local SendOptionsId = menu.add_feature("X mesaji gönderme seçenekleri (bakimda)", "parent", ParentId).id

menu.add_feature("Ayarlari kaydet", "action", ParentId, function(f)
	SaveSettings(ScriptName, Settings)
	SaveSettings(ScriptName .. " Excluded Languages", ExcludedLanguages)
	notify("Ayarlar kaydedildi", nil, nil, 0xFF00FF00)
end)

menu.add_feature("Mesaji takima at", "toggle", ParentId, function(f)
	Settings.SendToTeamChat = f.on
	print("Set SendToTeamChat to: " .. tostring(Settings.SendToTeamChat))
end)
TranslateSelfFeat.on = Settings.SendToTeamChat

menu.add_feature("Çevrilmis mesaj gönder", "action_value_str", ParentId, function(f)
	local TargetLang = LangLookupByName[LangKeys[f.value + 1]]
	
	local r, s
	repeat
		r, s = input.get("Göndermek istediginiz mesaji girin", "", 255, 0)
		if r == 2 then return HANDLER_POP end
		system.wait(0)
	until r == 0
	
	local success, translation, sourceLang = Translate(s, TargetLang)
		
	if not success then
		notify("Çeviride hata olustu. Konsolu kontrol edin.")
		print(translation)
		return
	end
	
	network.send_chat_message(translation, Settings.SendToTeamChat)
end):set_str_data(LangKeys)

local ShowSend = {}

local function ExcludeLanguage(f)
	if f.on then
		ExcludedLanguages[f.data] = true
	else
		ExcludedLanguages[f.data] = nil
	end
end

local function SetSendLanguage(f)
	if f.on then
		Settings["ShowSend_" .. f.data] = true
		ShowSend[f.data].hidden = false
	else
		Settings["ShowSend_" .. f.data] = nil
		ShowSend[f.data].hidden = true
	end
end

local function SendLanguage(f)
	local TargetLang = f.data
	
	local r, s
	repeat
		r, s = input.get("Çevrilecek metni girin", "", 255, 0)
		if r == 2 then return HANDLER_POP end
		system.wait(0)
	until r == 0
	
	local success, translation, sourceLang = Translate(s, TargetLang)
		
	if not success then
		notify("Çeviride hata olustu. Konsolu kontrol edin.")
		print(translation)
		return
	end
	
	network.send_chat_message(translation, Settings.SendToTeamChat)
end

for i=1,#Languages do
	local language = Languages[i]
	
	local excludeFeat = menu.add_feature(language.Name, "toggle", ExcludedParentId, ExcludeLanguage)
	excludeFeat.data = language.Key
	if ExcludedLanguages[language.Key] then
		excludeFeat.on = true
	end
	
	local showFeat = menu.add_feature(language.Name, "toggle", SendOptionsId, SetSendLanguage)
	showFeat.data = language.Key
	if Settings["ShowSend_" .. language.Key] then
		showFeat.on = true
	end
	
	local sendFeat = menu.add_feature("Send " .. language.Name .. " Message", "action", ParentId, SendLanguage)
	sendFeat.data = language.Key
	if not Settings["ShowSend_" .. language.Key] then
		sendFeat.hidden = true
	end
	sendFeat.data = language.Key
	ShowSend[language.Key] = sendFeat
end