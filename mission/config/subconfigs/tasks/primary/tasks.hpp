class capture_zone : task
{
	taskcategory = "PRI";
	tasktitle = "Capture %1";
	taskname = "Capture %1";
	taskdesc = "Defeat hostile forces and sites in %1. Sites spawn inside the yellow circle.";
	tasktype = "attack";
	taskimage = "vn\missions_f_vietnam\data\img\mikeforce\p\vn_ui_mf_task_p1.jpg";
	rankpoints = 30;

	taskScript = "vn_mf_fnc_state_machine_task_system";

	//Data for the script to use to customise behaviour
	class parameters 
	{
		stateMachineCode = "vn_mf_fnc_task_pri_capture";
		timeout = -1;
	};

	class destroy_hq_sites
	{
		taskname = "Destroy HQ Supply Line";
		taskdesc = "Destroy HQ supplies and the sites they're delivered to. You might find intel inside for the locations to the rest of the sites!";
	};

	class destroy_factory_sites
	{
		taskname = "Destroy Factory Supply Line";
		taskdesc = "Destroy Factory supplies and the sites they're delivered to. You might find intel inside for the locations to the rest of the sites!";
	};
};

class prepare_zone : task
{
	taskcategory = "PRI";
	tasktitle = "Prepare for %1";
	taskname = "Prepare for %1";
	taskdesc = "Gather resources to setup a COP/FOB near %1!";
	tasktype = "repair";
	taskimage = "vn\missions_f_vietnam\data\img\mikeforce\p\vn_ui_mf_task_p1.jpg";
	rankpoints = 30;

	taskScript = "vn_mf_fnc_state_machine_task_system";

	//Data for the script to use to customise behaviour
	class parameters 
	{
		stateMachineCode = "vn_mf_fnc_task_pri_prepare";
		timeout = -1;
	};

	//Data for subtasks. These are specific to the script.
	class prepare
	{
		taskname = "Gather Supplies";
		taskdesc = "Get some ammo, and supplies to build a FOB/COP.";
	};
};

class build_fob : task
{
	taskcategory = "PRI";
	tasktitle = "Build FOB";
	taskname = "Build FOB";
	taskdesc = "Build an FOB to begin claiming zones within %1ms of it.";
	taskformatdata = "[mf_s_baseZoneUnlockDistance]";
	tasktype = "repair";
	taskimage = "vn\missions_f_vietnam\data\img\mikeforce\p\vn_ui_mf_task_p1.jpg";
	rankpoints = 10;

	taskScript = "vn_mf_fnc_state_machine_task_system";

	//Data for the script to use to customise behaviour
	class parameters 
	{
		stateMachineCode = "vn_mf_fnc_task_pri_build_fob";
		timeout = -1;
	};

	//Data for subtasks. These are specific to the script.
	class build
	{
		taskname = "Build a HQ";
		taskdesc = "Construct a HQ building to create a base.";
	};
};