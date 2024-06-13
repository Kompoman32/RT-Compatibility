class CfgPatches
{
    class RT_Teleport
    {
        name = "RT Compatibility - Teleport";
        requiredAddons[] = {"RT_Main"};
        units[] = {"Teleporter_To_Positions_Module", "Teleport_Position_Module"};

        weapons[] = {};

        author = "Kompoman32";
        requiredVersion = 1.60;
        skipWhenMissingDependencies = 0;
    };
};
