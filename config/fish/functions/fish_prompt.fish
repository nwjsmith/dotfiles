function fish_prompt --description "Write out the prompt"
  # Just calculate this once, to save a few cycles when displaying the prompt
  if not set --query __fish_prompt_hostname
    set --global __fish_prompt_hostname (hostname|cut -d . -f 1)
  end

  set --local normal (set_color normal)

  set --local color_cwd
  set --local suffix
  switch $USER
  case root
    if set -q fish_color_cwd_root
      set color_cwd $fish_color_cwd_root
    else
      set color_cwd $fish_color_cwd
    end
    set suffix '#'
  case '*'
    set color_cwd $fish_color_cwd
    set suffix 'λ'
  end

  echo -n -s (set_color brown) "[$__fish_prompt_hostname] " $normal \
    (set_color $color_cwd) (prompt_pwd) $normal \
    (set_color blue) (__fish_git_prompt) $normal \
    \n (set_color magenta) "$suffix " $normal
end
