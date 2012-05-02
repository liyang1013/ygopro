--竜巻海流壁
function c18605135.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetCondition(c18605135.actcon)
	c:RegisterEffect(e1)
	--avoid battle damage
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_FIELD)
	e2:SetCode(EFFECT_AVOID_BATTLE_DAMAGE)
	e2:SetRange(LOCATION_SZONE)
	e2:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e2:SetTargetRange(1,0)
	e2:SetCondition(c18605135.abdcon)
	c:RegisterEffect(e2)
	--self destroy
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_SINGLE)
	e3:SetProperty(EFFECT_FLAG_SINGLE_RANGE)
	e3:SetRange(LOCATION_SZONE)
	e3:SetCode(EFFECT_SELF_DESTROY)
	e3:SetCondition(c18605135.sdcon)
	c:RegisterEffect(e3)
end
function c18605135.filter(c)
	return c:IsFaceup() and c:IsCode(22702055)
end
function c18605135.actcon(e,tp,eg,ep,ev,re,r,rp)
	return Duel.IsExistingMatchingCard(c18605135.filter,e:GetHandlerPlayer(),LOCATION_ONFIELD,0,1,nil)
		or Duel.GetEnvironment()==22702055
end
function c18605135.abdcon(e)
	return Duel.GetAttackTarget()==nil or Duel.GetAttackTarget():IsAttackPos() or Duel.GetAttacker():GetAttack()>Duel.GetAttackTarget():GetDefence()
end
function c18605135.sdcon(e)
	return Duel.IsExistingMatchingCard(c18605135.filter,e:GetHandlerPlayer(),LOCATION_ONFIELD,0,1,nil)
		or Duel.GetEnvironment()==22702055
end
