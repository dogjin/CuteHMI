Module {
    Depends { name: "cpp" }

    Properties {
        condition: qbs.targetOS.contains("windows")
		cpp.includePaths: [path + "/../../../../include"]
		cpp.libraryPaths: [path + "/../../../../lib"]
		cpp.dynamicLibraries: ["libmodbus-5"]
    }

	Properties {
		condition: qbs.targetOS.contains("linux")
		cpp.dynamicLibraries: ["modbus"]
	}
}
