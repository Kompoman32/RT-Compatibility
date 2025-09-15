
class CfgVehicles
{
    class Logic;
    class Module_F : Logic
    {
        class AttributesBase
        {
            class Default;
            class Edit;
            class Combo;
            class Checkbox;
            class CheckboxNumber;
            class ModuleDescription;
            class Units;
        };

        class ModuleDescription
        {
            class AnyStaticObject;
        };
    };

    class Teleporter_To_Positions_Module : Module_F
    {
        author = "Kompoman32 & Voxtell";
        displayName = "RT Teleporter to positions";
        category = "RT_Teleport";
        icon = "\a3\3den\data\displays\display3den\panelleft\entitylist_location_ca.paa";
        portrait = "\a3\3den\data\displays\display3den\panelleft\entitylist_location_ca.paa";

        scope = 2;
        scopeCurator = 0;
		curatorCanAttach = 0;

        is3DEN = 1;
        isGlobal = 1;
        isTriggerActivated = 1;
        isDisposable = 0;

        canSetArea = 1;
        canSetAreaShape = 1;
        canSetAreaHeight = 1;

		function = "RT_Teleport_fnc_initTeleporterToPositions";
		functionPriority = 1;	

        class AttributeValues
        {
            size3[] = {2, 2, 3};
            isRectangle = 1;
        };
    };

    class Teleport_Position_Module : Module_F
    {
        author = "Kompoman32 & Voxtell";
        displayName = "RT Teleport position for Teleporter";
        category = "RT_Teleport";
        icon = "\rt\teleport\assets\tp.paa";
        portrait = "\rt\teleport\assets\tp.paa";

        scope = 2;
        scopeCurator = 0;
		curatorCanAttach = 0;

        is3DEN = 1;
        isGlobal = 1;
        isTriggerActivated = 1;
        isDisposable = 0;

        canSetArea = 1;
        canSetAreaShape = 1;
        canSetAreaHeight = 1;

		function = "RT_Teleport_fnc_initTeleportPosition";
		functionPriority = 1;	

        class AttributeValues
        {
            size3[] = {2, 2, 3};
            isRectangle = 1;
        };

        class Attributes: AttributesBase
		{
			class Title
			{
                displayName = "Title of the position";
                tooltip = "Title of the position for teleport in teleporter";
                property = "RT_Teleport_Teleport_Position_Title";
                control = "Edit"; 

                expression = "_this setVariable ['%s',_value];";
                defaultValue = "'Position'";

                unique = 0;
                condition="logicModule";
                typeName = "STRING";
			};
		};
    };

};

class CfgFactionClasses
{
    class NO_CATEGORY;
    class RT_Teleport : NO_CATEGORY
    {
        displayName = "RT Teleports";
    };
};