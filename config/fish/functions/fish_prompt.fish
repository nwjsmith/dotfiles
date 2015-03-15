function fish_prompt --description 'Write out the prompt'
  printf "%s[%s] %s%s\n%s%s%s " (set_color $fish_color_host) (hostname -s) (set_color $fish_color_cwd) (prompt_pwd) (set_color $fish_color_prompt_symbol) λ (set_color $fish_color_normal)
end
