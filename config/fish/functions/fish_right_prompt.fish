function fish_right_prompt --description "Write out the right prompt"
  set mode_string (
    switch $fish_bind_mode
    case default
      echo -n "N"
    case insert
      echo -n "I"
    case visual
      echo -n "V"
    end
  )
  echo -n -s (set_color 93a1a1) $mode_string (set_color normal)
end
