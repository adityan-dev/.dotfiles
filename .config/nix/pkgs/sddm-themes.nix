{ stdenv, fetchFromGitHub, lib, pkgs, config, ... }:
{
  corners = stdenv.mkDerivation rec {
    pname = "sddm-theme-corners";
    version = "a76d451";
    dontBuild = true;
    installPhase = ''
      mkdir -p $out/share/sddm/themes
      cp -aR $src/corners $out/share/sddm/themes/corners
    '';
    src = fetchFromGitHub {
      owner = "aczw";
      repo = "sddm-theme-corners";
      rev = "a76d4517f163bbc7787f51ab074a0357bbf5e527";
      hash = "sha256-nqQdEdGDc8CHc8m5IypqvYSb4jPen8sH+tr0mMsz9ls=";
    };
  };
}

   #   echo -e "[General]\nbackground=/home/adi/Pictures/voyager-tophx-panda-cover-fa-samurai-individual.jpeg" >> $src/corners/theme.conf
