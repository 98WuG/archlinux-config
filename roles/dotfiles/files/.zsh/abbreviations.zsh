setopt extendedglob

typeset -A abbrevs

# General aliases
abbrevs=(
  "ll"          "ls -al"
  "l1"          "ls -1A"
  ":q"          "exit"
  "sz"          "source ~/.zshrc"
  "spoweroff"   "sudo systemctl stop zfs-syncoid-remote && sudo systemctl stop zfs-syncoid-local && sudo systemctl stop NetworkManager && poweroff"
  "sreboot"     "sudo systemctl stop zfs-syncoid-remote && sudo systemctl stop zfs-syncoid-local && sudo systemctl stop autofs && sudo systemctl stop NetworkManager && reboot"
  "wreboot"     "sudo efibootmgr --bootnext DC5B && sreboot"
  "mpv"         "devour mpv"
  "pifs"        "πfs"
  "zback1"      "sudo zpool import -f -d /dev/disk/by-id/ata-Samsung_SSD_850_EVO_500GB_S2RANX0J441149V-part1 zbackup && sudo zfs load-key zbackup && sudo zpool set cachefile=none zbackup"
  "rp"          "kquitapp5 plasmashell && kstart5 plasmashell"
  "lf"          "lf-ueberzug"
  "ethmine"     "tmuxinator start mine"
  "pchrome"     "firejail --private chromium"
  "locate"      "plocate"
  "fzfbat"      "fzf --preview 'bat --style=numbers --color=always --line-range=:500 {}'"
  "|xc"         "| xclip -sel clip"
  "|g"          "| grep"
  "pwc"         "pwgen --secure --num-passwords 1 __CURSOR__ | tr -d '\n' | xclip -sel clip"
  "pws"         "pwgen --secure --symbols --num-passwords 1 __CURSOR__ | tr -d '\n' | xclip -sel clip"
  "ydl"         "youtube-dl"
)

# Paths
abbrevs+=(
  "awp"   "~/Anime/Wallpaper/"
  "tt"    "/tmp/tmp/"
)

# topgrade
abbrevs+=(
  "tg"    "topgrade"
  "tgt"   "topgrade --tmux"
)

# apt
abbrevs+=(
  "aptu"  "sudo apt update"
  "aptU"  "sudo apt upgrade"
  "aptuU" "sudo apt update && sudo apt upgrade"
  "aptr"  "sudo apt remove"
  "aptar" "sudo apt autoremove"
  "aptp"  "sudo apt purge"
  "apti"  "sudo apt install"
  "apts"  "apt search"
)

# pacman
abbrevs+=(
  "pacU"	"sudo pacman -Syu"
  "paci"	"sudo pacman -S"
  "pacs"	"pacman -Ss"
  "pacQ"	"pacman -Q"
  "pacq"	"pacman -Qs"
  "pacr"	"sudo pacman -Rcns"
  "pacR"	"sudo pacman -Runs"
)

# aur
abbrevs+=(
  "ac"	"aur sync --pacman-conf /etc/pacman_chroot.conf --makepkg-conf /etc/makepkg_chroot.conf -c"
  "avd"	"aur vercmp-devel"
)

# flatpak
abbrevs+=(
  "flatl"	"flatpak list"
  "flatr"	"flatpak run"
  "flati"	"flatpak install flathub"
)

# snap
abbrevs+=(
  "snapf"  "sudo snap find"
  "snapl"  "sudo snap list"
  "snapr"  "sudo snap remove"
  "snapu"  "sudo snap refresh"
  "snape"  "sudo snap enable"
  "snapd"  "sudo snap disable"
  "snapi"  "sudo snap install"
)

# rsync
abbrevs+=(
  "rs1"   "rsync --progress --partial --archive"
  "rz1"   "rsync --progress --partial --archive --compress"
  "rs2"   "rsync --info=progress2 --partial --archive"
  "rz2"   "rsync --info=progress2 --partial --archive --compress"
  "rsf1"  "rsync --progress --partial --archive --hard-links --acls --xattrs"
  "rzf1"  "rsync --progress --partial --archive --hard-links --acls --xattrs --compress"
  "rsf2"  "rsync --info=progress2 --partial --archive --hard-links --acls --xattrs"
  "rzf2"  "rsync --info=progress2 --partial --archive --hard-links --acls --xattrs --compress"
)

# systemd
abbrevs+=(
  "scl"   "systemctl status"
  "scs"   "sudo systemctl start"
  "sce"   "sudo systemctl enable"
  "scse"  "sudo systemctl enable --now"
  "sct"   "sudo systemctl stop"
  "scd"   "sudo systemctl disable"
  "sctd"  "sudo systemctl disable --now"
)

# firewalld
abbrevs+=(
  "fdl"  "sudo firewall-cmd --list-all"
  "fds"  "sudo firewall-cmd --permanent --add-service="
  "fdp"  "sudo firewall-cmd --permanent --add-port="
  "fdr"  "sudo firewall-cmd --reload"
)

# Ansible
abbrevs+=(
  "ap"    "ansible-playbook"
  "aall"  "ansible all -m"
  "aa"    "ansible actuv -m"
  "aps"   "ansible-playbook setup.yml"
  "apv"   "ansible-playbook vm_setup.yml"
  "ar"    "rm *.retry"
)

# Tmux
abbrevs+=(
  "ta"    "tmux attach"
  "tan"   "tmux attach || tmux new -n editor"
  "tsw"   "tmux split-window"
  "tswrc" "tmux split-window rails c"
  "tswrs" "tmux split-window rails s"
  "tswv"  "tmux split-window vim"
  "tnw"   "tmux new-window"
  "tnwa"  "tnw; tnws; tnwb; tmux select-window -t 1"
  "tnws"  "tmux new-window -n server bin/webpack-dev-server \; split-window -v rails s"
  "tnwb"  "tmux new-window -n boards vim -p board-now.md board-later.md board-scratch-pad.md"
  "tnwl"  "tmux new-window -n logs \"while ((1)) { heroku logs -t -r production }\""
  "tnwp"  "tmux new-window -n ping ping 8.8.8.8"

  "tks"   "tmux kill-session"

  "cr7t"  "chmod -R 777 /tmp/tmux-501"
)

# Docker
abbrevs+=(
  "dk"    "docker"
  "dkrit" "docker run -it"
  "dki"   "docker images"
  "dkig"  "docker images | grep __CURSOR__ | awk '{print \$3}'"
  "dm"    "docker-machine"
  "dmssh" "docker-machine ssh"
  "dc"    "docker-compose"
  "dkbd"  "docker build ."
  "dkbt"  "docker build -t __CURSOR__ ."
  "drid"  "docker rmi -f \$(docker images -q -f \"dangling=true\")"
)

# Podman
abbrevs+=(
  "pd"    "podman"
  "pdrit" "podman run -it"
  "pdi"   "podman images"
  "pdig"  "podman images | grep __CURSOR__ | awk '{print \$3}'"
  "pc"    "podman-compose"
  "pcu"   "podman-compose up"
  "pcdu"  "podman-compose down && podman-compose up"
  "pcb"   "podman-compose build"
  "pdbd"  "podman build ."
  "pdbt"  "podman build -t __CURSOR__ ."
  "prid"  "podman rmi -f \$(docker images -q -f \"dangling=true\")"
  "pdsp"  "podman system prune"
)

# kubectl
abbrevs+=(
  "kc"    "kubectl"
  "kgn"   "kubectl get nodes"
  "kgp"   "kubectl get pods"
  "kgpa"  "kubectl get pods --all-namespaces"
  "kgs"   "kubectl get service"
  "kgsa"  "kubectl get service --all-namespaces"
  "kgi"   "kubectl get ingress"
  "kgia"  "kubectl get ingress --all-namesapces"
  "kgv"   "kubectl get pv"
  "kgva"  "kubectl get pv --all-namesapces"
  "kgc"   "kubectl get pvc"
  "kgca"  "kubectl get pvc --all-namesapces"
  "ka"    "kubectl apply"
  "kaf"   "kubectl apply -f"
  "kak"   "kubectl apply -k ."
  "kd"    "kubectl delete"
  "kdf"   "kubectl delete -f"
  "kdk"   "kubectl delete -k ."
  "kb"    "kustomize build ."
  "kbka"  "kustomize build . | kubectl apply -f -"
)

# dav
abbrevs+=(
  "khc"   "khal calendar now 7d"
  "khi"   "khal interactive"
  "td"    "todo | tac"
)

for abbr in ${(k)abbrevs}; do
  alias $abbr="${abbrevs[$abbr]}"
done

magic-enter () {
  # If commands are not already set, use the defaults
  [ -z "$MAGIC_ENTER_GIT_COMMAND" ] && MAGIC_ENTER_GIT_COMMAND="git status -u ."
  [ -z "$MAGIC_ENTER_OTHER_COMMAND" ] && MAGIC_ENTER_OTHER_COMMAND="ls -lh ."

  if [[ -z $BUFFER ]]; then
    echo ""
    if git rev-parse --is-inside-work-tree &>/dev/null; then
      eval "$MAGIC_ENTER_GIT_COMMAND"
    else
      eval "$MAGIC_ENTER_OTHER_COMMAND"
    fi
    zle redisplay
  else
    zle accept-line
  fi
}

magic-abbrev-expand() {
  local MATCH
  LBUFFER=${LBUFFER%%(#m)[_a-zA-Z0-9]#}
  command=${abbrevs[$MATCH]}
  LBUFFER+=${command:-$MATCH}

  if [[ "${command}" =~ "__CURSOR__" ]]; then
    RBUFFER=${LBUFFER[(ws:__CURSOR__:)2]}
    LBUFFER=${LBUFFER[(ws:__CURSOR__:)1]}
  else
    zle self-insert
  fi
}

magic-abbrev-expand-and-execute() {
  magic-enter
  magic-abbrev-expand
  zle backward-delete-char
}

no-magic-abbrev-expand() {
  LBUFFER+=' '
}

zle -N magic-enter
zle -N magic-abbrev-expand
zle -N magic-abbrev-expand-and-execute
zle -N no-magic-abbrev-expand

bindkey " " magic-abbrev-expand
bindkey "^M" magic-abbrev-expand-and-execute
bindkey "^x " no-magic-abbrev-expand
bindkey -M isearch " " self-insert

# vim: ts=2 sw=2 sts=2 et smartindent
