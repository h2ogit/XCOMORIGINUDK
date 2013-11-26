class X_COM_DamageType_Vehicle_Explosion extends X_COM_DamageType;
	
static function SpawnHitEffect(Pawn P, float Damage, vector Momentum, name BoneName, vector HitLocation)
{
	local X_COM_Emit_BodyFlame BF;
	local vector EffectLocation;
	local TraceHitInfo MyHitInfo;
	local X_COM_Pawn lPawn;

	lPawn = X_COM_Pawn(P);
	if ( (lPawn != None) && (Damage > FMin(95, 0.19 * P.HealthMax)) )
	{
		EffectLocation = HitLocation;

		if ( BoneName == '' )
		{
			MyHitInfo.HitComponent = P.Mesh;
			P.CheckHitInfo( MyHitInfo, P.Mesh, Momentum, EffectLocation );
			BoneName = MyHitInfo.BoneName;
			if ( (BoneName == '') && (X_COM_Pawn(P) != None) )
			{
				EffectLocation = 0.5 * (HitLocation + P.Location);
				EffectLocation.Z = HitLocation.Z;
			}
		}

		BF = P.Spawn(class'X_COM_Emit_BodyFlame',P,, EffectLocation, rotator(Momentum));
		BF.AttachTo(P, BoneName);
		BF.LifeSpan = GetHitEffectDuration(P, Damage);
	}
}

static function float GetHitEffectDuration(Pawn P, float Damage)
{
	return (P.Health <= 0) ? 5.0 : 5.0 * FClamp(Damage * 0.01, 0.5, 1.0);
}

defaultproperties
{
	bThrowRagdoll=true
	KDamageImpulse=1000.0
}
