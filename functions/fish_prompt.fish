function fish_prompt --description "it comes from 'disco' and 'astronaut' "
    set -l last_status $status
    set -l normal (set_color normal)
    set -l status_color (set_color brgreen)
    set -l cwd_color (set_color $fish_color_cwd)
    set -l prompt_status ""

    set -l suffix '>'

    # Test if there's a error
    if test $last_status -ne 0
        set status_color (set_color $fish_color_error)

        # Color the prompt in red on error
        set prompt_status $status_color "[" $last_status "]" $normal
    end


    # Unfortunately this only works if we have a sensible locale
    string match -qi "*.utf-8" -- $LANG $LC_CTYPE $LC_ALL
    and set -g __fish_git_prompt_char_dirtystate \U1F4a9
    set -g __fish_git_prompt_char_untrackedfiles "?"

    # Since we display the prompt on a new line allow the directory names to be longer.
    set -q fish_prompt_pwd_dir_length
    or set -lx fish_prompt_pwd_dir_length 0


    # Color the prompt differently when we're root
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set cwd_color (set_color $fish_color_cwd_root)
        end
        set suffix '#'
    end

    echo -s (prompt_login) ' ' $cwd_color (prompt_pwd) ' ' $normal ' ' $prompt_status
    echo -n -s $status_color $suffix ' ' $normal
end

