project "googletest"
	kind "StaticLib"
	language "C++"
	staticruntime "On"

	baseBinDir = "../../../bin/"
	baseBinDir = "../../../bin-int/"


	targetdir (baseBinDir .. outputdir .. "/%{prj.name}")
	objdir (baseBinIntDir .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/include/**.h",
		"%{prj.name}/src/**.cc"
	}

	includedirs
	{
		"%{prj.name}/include"
	}

	filter "system:linux"
		systemversion "latest"

	filter "system:windows"
		systemversion "latest"

		defines 
		{
			"_CRT_SECURE_NO_WARNINGS"
		}

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "speed"

    filter "configurations:Dist"
		runtime "Release"
		optimize "speed"
        symbols "off"
