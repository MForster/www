{ pkgs, ... }:

{
  packages = with pkgs; [ hugo go ];
  pre-commit.hooks.markdownlint.enable = true;
  processes.hugo.exec = "hugo server -D";

  scripts.featured-screenshot.exec = ''
    ${pkgs.imagemagick}/bin/convert $(printf "%s\n" ~/tmp/screenshot-* | tail -1) -trim featured.png
  '';
}
