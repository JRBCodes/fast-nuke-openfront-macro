#Requires AutoHotkey v2.0

CoordMode "Mouse", "Screen" ; Absolute screen position for 1920 x 1080 screens! Modify if necessary. 

; panel: 
; y -70 = top
; y +70 = bottom
; x -70 = left
; x +70 = right
; x, y absolute screen pos
; right click -> left (menu)
; atom bomb: 580, 500
; mirv: 730, 500
; hydro: 880, 500
; warship: 1030, 500
; port: 1180, 500
; missle silo: 1330, 500
; SAM: 800, 680
; defence post: 950, 680
; city: 1100, 680

FastNuke(x, y) {
    Click('Right')          ; open menu
    MouseMove(-70, 0,, "R") ; go to shop selector
    Sleep(100)
    Click                   ; open shop
    MouseMove(580, 500,)    ; go to nuke
    Sleep(100)
    Click                   ; fire!
    MouseMove(x, y)         ; return to starting position
    Sleep(100)
}

FastHydro(x, y) {
    Click('Right')
    MouseMove(-70, 0,, "R")
    Sleep(100)
    Click
    MouseMove(880, 500,)
    Sleep(100)
    Click
    MouseMove(x, y)
    Sleep(100)
}

FastBuildCity(x, y) {
    Click('Right')
    MouseMove(-70, 0,, "R")
    Sleep(100)
    Click
    MouseMove(1100, 680,)
    Sleep(100)
    Click
    MouseMove(x, y)
    Sleep(100)
}

FastBuildLauncher(x, y) {
    Click('Right')
    MouseMove(-70, 0,, "R")
    Sleep(100)
    Click
    MouseMove(1330, 500,)
    Sleep(100)
    Click
    MouseMove(x, y)
    Sleep(100)
}

FastBuildSAM(x, y) {
    Click('Right')
    MouseMove(-70, 0,, "R")
    Sleep(100)
    Click
    MouseMove(800, 680,)
    Sleep(100)
    Click
    MouseMove(x, y)
    Sleep(100)
}

FastBuildShip(x, y) {
    Click('Right')
    MouseMove(-70, 0,, "R")
    Sleep(100)
    Click
    MouseMove(1030, 500,)
    Sleep(100)
    Click
    MouseMove(x, y)
    Sleep(100)
}

+n::{ ; shift n
    clicks := 0 ; helper vars

    MouseGetPos(&orig_x, &orig_y)

    input_result := InputBox("Fire nukes:", "QUICK NUKES", "w50 h100")
    n_initial := input_result.Value
    action := input_result.Result

    if (action == "OK") {
        if (n_initial == "f") {
            input_result2:= InputBox("Input code:", "FIRST STRIKE", "w50 h100")
            n_code := input_result2.Value
            action := input_result2.Result

            if (action == "OK") {
                code_array := StrSplit(n_code)
                for ,code in code_array {
                    code := StrLower(code)
                    if (code == "n"){
                        Sleep(50)
                        FastNuke(orig_x, orig_y)
                    }

                    else If (code == "h"){
                        Sleep(50)
                        FastHydro(orig_x, orig_y)
                    }

                    ; if you wanna add more shit

                    else {
                        ToolTip(code . " is not a valid command.")
                        Sleep(1200)
                        ToolTip()
                    }
                    
                }
            }

        }

        else If (n_initial == "b") {
            input_result2:= InputBox("Input code:", "INFRASTRUCTURE", "w50 h100")
            n_code := input_result2.Value
            action := input_result2.Result
            
            if (action == "OK") {
                code_array := StrSplit(n_code)
                for ,code in code_array {
                    code := StrLower(code)
                    if (code == "c"){
                        Sleep(50)
                        FastBuildCity(orig_x, orig_y)
                    }

                    else If (code == "l"){
                        Sleep(50)
                        FastBuildLauncher(orig_x, orig_y)
                    }

                    else If (code == "s"){
                        Sleep(50)
                        FastBuildSAM(orig_x, orig_y)
                    }

                    else If (code == "w"){
                        Sleep(50)
                        FastBuildShip(orig_x, orig_y)
                    }
                    
                    ; if you wanna add more shit

                    else {
                        ToolTip(code . " is not a valid command.")
                        Sleep(1200)
                        ToolTip()
                    }

                }
            }

        }


        else If IsInteger(n_initial) {
            while (clicks < n_initial) {
                FastNuke(orig_x, orig_y)
                clicks += 1
            }
        }

        else {
            ToolTip(n_initial . " is not a valid command.")
            Sleep(1200)
            ToolTip()
        }

        }
    }


^x::{ ; ctrl x
    ExitApp
}
