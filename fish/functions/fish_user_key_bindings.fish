function fish_user_key_bindings
    bind --preset u up-or-search
    bind --preset j down-or-search
    bind --preset k forward-char
    bind --preset -M visual h backward-char
    bind --preset -M visual k forward-char
    bind --preset -M visual u up-line
    bind --preset -M visual j down-line
    bind --preset h backward-char
    bind --preset LL undo
end
