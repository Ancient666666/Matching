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


-- ��ȦȦ���ܺ���

-- ��ȦȦ
-- ���� EI.DrawTarCr(sz,dwID,top,nR,nD,color,a1,a2)
-- ����������
-- sz:ȦȦ�ı�ʶ(����ɾ��ȦȦ��)
-- dwID:��Ҫ��ȦȦ�Ķ���ID
-- top�����Ƶ�ƫ����
-- nR:���ư뾶
-- nD:���ƽǶ�
-- color:������ɫ��Ŀǰֻ��ʹ�����õģ�"red","green","blue",yellow",purple","pink","white")
-- a1:ȦȦ���Ĳ�͸����
-- a2:ȦȦ��Ե��͸����
-- ʾ���� EI.DrawTarCr(��baofa",1234,0,4,180,"red",100,100) --��ID1234�Ľŵ��»���180��4�ߴ��ȦȦ

-- ����������
-- ������EI.DrawTarTx(szShadowName,dwID,top,color,a,nScale,text)
-- ����������
-- szShadowName:�����ֱ�ʶ
-- dwID:��Ҫ�������ֵĶ���ID
-- top:���Ƶ�ƫ����
-- color:ͬ������
-- a:͸����
-- nScale:����ֵ
-- text:��������
-- ʾ����EI.DrawTarTx("baofa",1234,0,"red",100,1,"��û�����"�� --��ID1234�Ľŵ��»�������

-- ����Ļ����
-- ������EI.DrawScTx(szShadowName, x, y, nScale, text, r, g, b, a)
-- ����������
-- szShadowName:�����ֱ�ʶ
-- x:��Ļ����X
-- y:��Ļ����Y
-- nScale:����ֵ
-- text:��������
-- r,g,b,a:��ɫ
-- ʾ����EI.DrawScTx("tishi",500,500,1,"XXX������",255,255,255,255) --����Ļ����500��500�ĵط�����һ������

-- ɾ�����ƵĶ���
-- ������EI.KillShadow(hI,szShadowName)
-- ����������
-- hI:�������ͷֱ��Ӧ�������֣���1��EI.DelQuan��2��EI.DelObjTx��3��EI.DelPingMu��
-- szShadowName:ȦȦ�����ֱ�ʶ
-- ʾ����
-- EI.KillShadow(EI.DelQuan,"baofa") --ɾ�����ֽ�baofa��ȦȦ
-- EI.KillShadow(EI.DelObjTx,"baofa") --ɾ�����ֽ�baofa������
-- EI.KillShadow(EI.DelPingMu,"tishi") --ɾ�����ֽ�tishi����Ļ����


--�ж��Ƿ�Ϊ�Լ���ͼID
local function ChiJiMapID()

    local mapID=player.GetMapID()

    
    if mapID==296 or mapID==297 or mapID==410 or mapID==512 or mapID==532 or mapID==645 or mapID==332 then
       return true
    end

    return false
end

--�ù���GCD����������ȥ�ж��������
local function GCDTime(dwSkillID) 
	local SkillLevel = player.GetSkillLevel(dwSkillID)
    local information = {player.GetSkillCDProgress(dwSkillID, SkillLevel)}
    local gcdTime = information[2] / 16 -- ��֡������16�Ա�ʾ����
  
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