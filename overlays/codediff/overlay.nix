final: prev: {
	vimPlugins = prev.vimPlugins // {
		vscode-diff-nvim = prev.vimUtils.buildVimPlugin rec {
			pname = "codediff.nvim";
			version = "2.18.0";

			src = prev.fetchFromGitHub {
				owner = "esmuellert";
				repo = "codediff.nvim";
				tag = "v${version}";
				hash = "sha256-qi/aBgKbTco6tKQMxvbf+MWkJYYmo/SvweZiGCMm9t4=";
			};

			dependencies = [ prev.vimPlugins.nui-nvim ];
			buildInputs = [ prev.gcc.cc.lib ];

			nativeBuildInputs = [ prev.cmake ];
			dontUseCmakeConfigure = true;

			buildPhase = ''
				runHook preBuild
				make
				runHook postBuild
			'';
			postInstall = ''
				ln -s ${prev.gcc.cc.lib}/lib/libgomp.so.1 $out/libgomp_linux_x64_2.9.3.so.1
				# Also link the standard name just in case
				ln -s ${prev.gcc.cc.lib}/lib/libgomp.so.1 $out/libgomp.so.1
			'';
		};
	};
}


