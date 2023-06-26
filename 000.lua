if loadeasy then
    loadeasy()
end



-- function FindNPCWithBuffID(dwBuffID)
    -- local nearbyNPCs = GetNearbyNpcList()
    -- local NNPPCC = nil
    -- for i, dwID in ipairs(GetNearbyNpcList()) do
        -- if xbuff(dwID, dwBuffID) then
            -- NNPPCC = dwID
        -- end
    -- end
    
    -- if NNPPCC then
		-- FastSet(NNPPCC)
	-- end
	
	
-- end


-- function SelectEnemyWithBuff()
    -- FastSet(0) 

    -- local nearbyEnemies = GetID("NPC", "Enemy", 30) 

    -- for i, enemyID in ipairs(nearbyEnemies) do 
        -- if not xbuff(enemyID, 10014) and xbuff(enemyID, 9693) and enemyID then
            -- FastSet(enemyID)
            -- return 
        -- end
    -- end
-- end


-- 画圈圈功能函数

-- 画圈圈
-- 函数 EI.DrawTarCr(sz,dwID,top,nR,nD,color,a1,a2)
-- 参数描述：
-- sz:圈圈的标识(用于删除圈圈用)
-- dwID:需要画圈圈的对象ID
-- top：绘制点偏移量
-- nR:绘制半径
-- nD:绘制角度
-- color:绘制颜色，目前只能使用内置的（"red","green","blue",yellow",purple","pink","white")
-- a1:圈圈中心不透明度
-- a2:圈圈边缘不透明度
-- 示例： EI.DrawTarCr(“baofa",1234,0,4,180,"red",100,100) --在ID1234的脚底下绘制180度4尺大的圈圈

-- 画对象文字
-- 函数：EI.DrawTarTx(szShadowName,dwID,top,color,a,nScale,text)
-- 参数描述：
-- szShadowName:画文字标识
-- dwID:需要绘制文字的对象ID
-- top:绘制点偏移量
-- color:同上描述
-- a:透明度
-- nScale:缩放值
-- text:文字内容
-- 示例：EI.DrawTarTx("baofa",1234,0,"red",100,1,"他没解控了"） --在ID1234的脚底下绘制文字

-- 画屏幕文字
-- 函数：EI.DrawScTx(szShadowName, x, y, nScale, text, r, g, b, a)
-- 参数描述：
-- szShadowName:画文字标识
-- x:屏幕坐标X
-- y:屏幕坐标Y
-- nScale:缩放值
-- text:文字内容
-- r,g,b,a:颜色
-- 示例：EI.DrawScTx("tishi",500,500,1,"XXX出现了",255,255,255,255) --在屏幕坐标500，500的地方绘制一段文字

-- 删除绘制的对象
-- 函数：EI.KillShadow(hI,szShadowName)
-- 参数描述：
-- hI:三种类型分别对应上面三种；（1、EI.DelQuan；2、EI.DelObjTx；3、EI.DelPingMu）
-- szShadowName:圈圈或文字标识
-- 示例：
-- EI.KillShadow(EI.DelQuan,"baofa") --删除名字叫baofa的圈圈
-- EI.KillShadow(EI.DelObjTx,"baofa") --删除名字叫baofa的文字
-- EI.KillShadow(EI.DelPingMu,"tishi") --删除名字叫tishi的屏幕文字


--判断是否为吃鸡地图ID
local function ChiJiMapID()

    local mapID=player.GetMapID()

    
    if mapID==296 or mapID==297 or mapID==410 or mapID==512 or mapID==532 or mapID==645 or mapID==332 then
       return true
    end

    return false
end

--用共用GCD的其他技能去判断这个技能
local function GCDTime(dwSkillID) 
	local SkillLevel = player.GetSkillLevel(dwSkillID)
    local information = {player.GetSkillCDProgress(dwSkillID, SkillLevel)}
    local gcdTime = information[2] / 16 -- 将帧数除以16以表示秒数
  
    return gcdTime
end


function Sword3_Helper_main()



	local DengObj = nil
	for i, npcID in ipairs(GetNearbyNpcList()) do
		local npc = GetNpc(npcID)
		if npc and npc.dwTemplateID == 101050 and npc.dwEmployer == ID() then
			DengObj = Object(npcID)
			break
		end
	end

	if DengObj and xdis(DengObj) <= 7.5 then
		cast(19828)
	else
		Debug("NPC not found")
	end

	----------------------------------------------------------
	
	if theight() > 9 and GCDTime(19737) < 0.08 then
		xcast(TID(), 20641)
	end
	
	if theight() > 8 and NoLast(20641, 0.08) and CD(20641) then
		xcast(TID(), 20804)

	end
	--xcast(TID(), 20246)
	
	

end