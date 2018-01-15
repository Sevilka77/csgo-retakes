#include <sourcemod>
#include <sdktools>
#include <cstrike>
#include <retakes>

public Plugin:myinfo =
{
	name = "CS:GO Retakes: Site Announcements",
	author = "sEvilka77",
	description = "Provides CTs PrintHintMessage on Bomb Site",
	version = "1.0.0",
	url = "https://github.com/sevilka77/csgo-retakes"
};

public OnPluginStart()
{

	HookEvent("round_freeze_end", Event_PrintHud);
}

public Action Event_PrintHud(Handle event, const char[] name, bool dontBroadcast)
{
	if (!Retakes_Live())
	{
		return;
	}
	
	Bombsite bombsite = Retakes_GetCurrrentBombsite();
	
	if (!Retakes_InEditMode())
	{
		for (int client = 1; client <= MaxClients; client++)
		{
			if (IsClientInGame(client) && !IsFakeClient(client))
			{
				if (GetClientTeam(client) == CS_TEAM_CT)
				{
					if (bombsite == BombsiteA)
					{
						SetHudTextParams(0.475, 0.4, 3.0, 0, 255, 0, 200, 0, 0.1, 0.01, 0.01);
						ShowHudText(client,3,"Retake A");
					}
					else
					{
						SetHudTextParams(0.475, 0.4, 3.0, 255, 0, 0, 200, 0, 0.1, 0.01, 0.01);
						ShowHudText(client,3,"Retake B");
					}
				}
			}
		}
		
	}
}




