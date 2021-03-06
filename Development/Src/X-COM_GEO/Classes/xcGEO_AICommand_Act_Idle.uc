class xcGEO_AICommand_Act_Idle extends xcGEO_AICommand_Act;

//=============================================================================
// Variables
//=============================================================================


//=============================================================================
// Events
//=============================================================================
event Popped()
{
	StopLatentExecution();
	if (Pawn != none) SetDesiredRotation(Pawn.Rotation);
}

//=============================================================================
// State
//=============================================================================
AUTO state Idle
{

	
Begin:
	//`log("xT_AICommand_Idle executed");

Idleing:
	Sleep(WorldInfo.DeltaSeconds * 5);
	CheckForEnemyReported();
	Goto('Idleing');
}

//=============================================================================
// DefaultProperties
//=============================================================================
defaultproperties
{
}
