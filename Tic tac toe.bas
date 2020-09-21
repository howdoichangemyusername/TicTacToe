global player
player = 1
dim moves(2, 2)

graphicbox #handle.gbox, 0, 0, 300, 300
open "Drawing" for window as #handle
print #handle.gbox, "home" 'center the pen
print #handle.gbox, "down; size 3" 'ready to draw
print #handle.gbox, "line 100 0 100 300;line 200 0 200 300;line 0 100 300 100;line 0 200 300 200"
print #handle.gbox, "flush" 'make the graphics stick
print #handle.gbox, "up"
print #handle.gbox, "when leftButtonDown [move]"
wait

[move]
    call draw
    call wincondition
    print "x: ";MouseX
    print "y: ";MouseY
    print int(MouseX/100)
    wait

sub draw
    Squarex = 100*int(MouseX/100) + 50 'determine which square the circle/x goes
    Squarey = 100*int(MouseY/100) + 50
    print #handle.gbox, "goto ";Squarex;" ";Squarey
    if moves(int(MouseX/100), int(MouseY/100)) = 0 then
        if player = 1 then
            print #handle.gbox, "down;color red;backcolor red;circlefilled 35;up"
        else
            print #handle.gbox, "down;color blue;backcolor blue;circlefilled 35;up"
        end if
        moves(int(MouseX/100), int(MouseY/100)) = player
    end if
end sub

sub wincondition 'fucked this part up
    select case
        case (moves(0, 0) = player) and (moves(1, 1) = player) and (moves(2, 2) = player)
            end
        case (moves(2, 0) = player) and (moves(1, 1) = player) and (moves(0, 2) = player)
            end
        case (moves(0, 0) = player) and (moves(1, 0) = player) and (moves(2, 0) = player)
            end
        case (moves(0, 1) = player) and (moves(1, 1) = player) and (moves(2, 1) = player)
            end
        case (moves(2, 2) = player) and (moves(1, 2) = player) and (moves(0, 2) = player)
            end
        case (moves(2, 0) = player) and (moves(2, 1) = player) and (moves(2, 2) = player)
            end
        case (moves(1, 0) = player) and (moves(1, 1) = player) and (moves(1, 2) = player)
            end
        case (moves(2, 0) = player) and (moves(2, 1) = player) and (moves(2, 2) = player)
            end
    end select
    if player = 1 then
        player = player + 1
    else
        player = player - 1
    end if
end sub
