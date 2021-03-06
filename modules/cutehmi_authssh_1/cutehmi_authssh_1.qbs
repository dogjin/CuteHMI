import qbs

ModuleLib {
	name: "cutehmi_authssh_1"

	files: [
        "cutehmi_authssh_1.json",
        "cutehmi_authssh_1.qrc",
        "include/cutehmi/authssh/AbstractChannel.hpp",
        "include/cutehmi/authssh/Client.hpp",
        "include/cutehmi/authssh/Exception.hpp",
        "include/cutehmi/authssh/ForwardChannel.hpp",
        "include/cutehmi/authssh/Session.hpp",
        "include/cutehmi/authssh/internal/ChannelsThread.hpp",
        "include/cutehmi/authssh/internal/TunnelEntrance.hpp",
        "include/cutehmi/authssh/internal/common.hpp",
        "include/cutehmi/authssh/internal/platform.hpp",
        "include/cutehmi/authssh/logging.hpp",
        "src/cutehmi/authssh/AbstractChannel.cpp",
        "src/cutehmi/authssh/Client.cpp",
        "src/cutehmi/authssh/ForwardChannel.cpp",
        "src/cutehmi/authssh/Session.cpp",
        "src/cutehmi/authssh/internal/ChannelsThread.cpp",
        "src/cutehmi/authssh/internal/TunnelEntrance.cpp",
        "src/cutehmi/authssh/logging.cpp",
        "src/cutehmi/authssh/plugin/AuthSSHNodeData.cpp",
        "src/cutehmi/authssh/plugin/AuthSSHNodeData.hpp",
        "src/cutehmi/authssh/plugin/Plugin.cpp",
        "src/cutehmi/authssh/plugin/Plugin.hpp",
        "src/cutehmi/authssh/plugin/PluginNodeData.cpp",
        "src/cutehmi/authssh/plugin/PluginNodeData.hpp",
    ]

	Depends { name: "Qt.network" }

	Depends { name: "cutehmi_1" }
	Depends { name: "cutehmi_xml_1" }

	Depends { name: "libssh" }

	Export {
		Depends { name: "Qt.network" }

		Depends { name: "cutehmi_1" }

		Depends { name: "libssh" }
	}
}
