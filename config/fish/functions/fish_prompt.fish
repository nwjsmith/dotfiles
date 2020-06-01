function fish_prompt --description "Write out the prompt"
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

  echo -n -s (set_color $color_cwd) (prompt_pwd) $normal \
    (set_color blue) (__fish_git_prompt) $normal \
    (set_color magenta) " $suffix " $normal
end
