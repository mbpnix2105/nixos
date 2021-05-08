{ config, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    dotDir = ".config/zsh";
    enableAutosuggestions = true;
    defaultKeymap = "viins";
    history.path = "${config.xdg.dataHome}/zsh/zsh_history";
    shellAliases = {
      ls = "exa --color=always -l --group-directories-first";
      ll = "exa --color=always -al --group-directories-first";
    };
    localVariables = {
      PROMPT = "%F{red}>%f%F{yellow}>%f%F{green}>%f ";
    };
    initExtra = ''
      # autoloads
      autoload -U compinit 
      compinit

      # search history based on what's typed in the prompt
      # group functions
      zle -N history-beginning-search-backward-end history-search-end
      zle -N history-beginning-search-forward-end history-search-end
      # bind functions to up and down arrow keys
      bindkey "^[[A" history-beginning-search-backward-end
      bindkey "^[[B" history-beginning-search-forward-end

      # git integration
      autoload -Uz vcs_info
      precmd_vcs_info() { vcs_info }
      precmd_functions+=( precmd_vcs_info )
      setopt prompt_subst
      RPROMPT=\$vcs_info_msg_0_
      zstyle ':vcs_info:git:*' formats '%F{blue}(%b)%f'
      zstyle ':vcs_info:*' enable git

      # case insensitive tab completion
      zstyle ':completion:*' completer _complete _ignored _approximate
      zstyle ':completion:*' list-colors '\'
      zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
      zstyle ':completion:*' menu select
      zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
      zstyle ':completion:*' verbose true
      _comp_options+=(globdots)

      # flakes completion
      ${builtins.readFile ./nix-completions.sh}
    '';
    shellAliases = {
    x="xclip -selection c -i";
    c="xclip -selection c -i -f";
    v="xclip -selection c -o";
    };
  };
}
