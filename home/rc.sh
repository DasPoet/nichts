function open-gitlab {
    local origin

    origin=$(git remote get-url origin)
    origin=${origin/git@git-ac.soptim.net:/https:\/\/git-ac.soptim.net\/}

    wslview $origin
}
