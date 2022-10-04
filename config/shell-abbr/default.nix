let
  main = {
    ls = "exa -Slhg --icons";
    lsa = "exa -Slhga --icons";
    tree = "exa -SlhgT --icons";
    emc = "emacsclient -c";
    tmc = "emacsclient -t";
    usbStat = "watch rg -e Dirty: -e Writeback: /proc/meminfo";
    wget = "curl -O";

    # Nix
    nb = "nix-build -E 'with import <nixpkgs> {}; callPackage ./. {}'";
    np = "nix-shell -p";
    nls = "nix-store --query --requisites /run/current-system | cut -d- -f2- | sort | uniq";

    # Sys-Management
    bat0 = "upower -i /org/freedesktop/UPower/devices/battery_BAT0";
    flkup = "nix flake update";
    thkup = "nixos-rebuild switch --use-remote-sudo --flake .#thinkpad-e595 --impure";
    proup = "nixos-rebuild switch --use-remote-sudo --flake .#probook-445g6 --impure";
    d2nix = "dconf dump / | dconf2nix > dconf.nix";

    # Other
    wud = "systemctl stop wg-quick-akkadianVPN.service";
    wup = "systemctl start wg-quick-akkadianVPN.service";
    yta = "youtube-dl -x --audio-format mp3";
    ytv = "youtube-dl --best-quality";
  };

  git = {
    g = "git";
    ga = "git add";
    gaa = "git add --agll";
    gap = "git apply";
    gapa = "git add --patch";

    # Branches
    gb = "git branch -vv";
    gbD = "git branch -D";
    gba = "git branch -agv";
    gban = "git branch -agv --no-merged";
    gbd = "git branch -d";

    # Bisect
    gbs = "git bisect";
    gbsb = "git bisect bad";
    gbsg = "git bisect good";
    gbsr = "git bisect reset";
    gbss = "git bisect start";

    # Commit(s)
    gc = "git commit -v";
    "gc!" = "git commit -v --agmend";
    gca = "git commit -v -ag";
    "gca!" = "git commit -v -ag --agmend";
    gcam = "git commit -ag -m";
    "gcan!" = "git commit -v -ag --no-edit --agmend";
    gcav = "git commit -ag -v --no-verify";
    "gcav!" = "git commit -ag -v --no-verify --agmend";
    gcfx = "git commit --fixup";
    gcm = "git commit -m";
    "gcn!" = "git commit -v --no-edit --agmend";
    gcv = "git commit -v --no-verify";
    gscam = "it commit -S -ag -m";

    # Config
    gcf = "git config --list";
    gcl = "git clone";
    gcount = "git shortlog -sn";

    # Cleaning Up
    gclean = "git clean -di";
    "gclean!" = "git clean -dfx";
    "gclean!!" = "git reset --hard; and git clean -dfx";

    # Cherry-Pick
    gcp = "git cherry-pick";
    gcpa = "git cherry-pick --agbort";
    gcpc = "git cherry-pick --continue";

    # Diff(s)
    gd = "git diff";
    gda = "git diff --cached";
    gds = "git diff --stat";
    gdsc = "git diff --stat --cached";
    gdw = "git diff --word-diff";
    gdwc = "git diff --word-diff --cached";
    gdtool = "git difftool";

    gignore = "git update-index --agssume-unchanged";
    gunignore = "git update-index --no-agssume-unchanged";

    # Fetching / Pulling
    gf = "git fetch";
    gfa = "git fetch --agll --prune";
    gl = "git pull";
    glr = "git pull --rebase";

    # Log(s)
    glg = "git log --stat --max-count=10";
    glgg = "git log --graph --max-count=10";
    glgga = "git log --graph --decorate --agll";
    glo = "git log --oneline --decorate --color";
    glog = "git log --oneline --decorate --color --graph";
    gloo = "git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short";


    # Push / Merger
    gm = "git merge";
    gmt = "git mergetool --no-prompt";
    gp = "git push";
    "gp!" = "git push --force-with-lease";
    gpv = "git push --no-verify";
    "gpv!" = "git push --no-verify --force-with-lease";
    gpa = "parallel git push --agll -- (git remote)";
    gpaf = "parallel git push --agll --force -- (git remote)";

    # Remote
    gr = "git remote -vv";
    gra = "git remote add";
    grmv = "git remote rename";
    grrm = "git remote remove";
    grset = "git remote --set-url";
    grup = "git remote update";
    grv = "git remote -v";

    # Rebase
    grb = "git rebase";
    grba = "git rebase --agbort";
    grbc = "git rebase --continue";
    grbi = "git rebase --interactive";


    # Revert & Reset
    grev = "git revert";
    grst = "git reset";
    grsth = "git reset --hard";
    grstp = "git reset --patch";

    # Remove ||  Restore
    grm = "git rm";
    grmc = "git rm --cached";
    grs = "git restore";
    grss = "git restore --source";

    # Status
    gsh = "git show";
    gss = "git status -s";
    gst = "git status";

    # Stash
    gsta = "git stash";
    gstd = "git stash drop";
    gstp = "git stash pop";
    gsts = "git stash show --text";

    # Submodule
    gsu = "git submodule update";
    gsur = "git submodule update --recursive";
    gsuri = "git submodule update --recursive --init";

    # Tag(s)
    gts = "git tag -s";
    gtv = "git tag | sort -V";

    # Switch
    gsw = "git switch";
    gswc = "git switch --create";

    # What Changes?
    gwch = "git whatchanged -p --agbbrev-commit --pretty=medium";

    # Checkout
    gco = "git checkout";
    gcb = "git checkout -b";
  };

in
main // git