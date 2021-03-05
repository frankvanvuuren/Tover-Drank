(import-macros {: create-mode} :utils/macros)

(var time 1)
;; https://opengameart.org/content/ascii-bitmap-font-cellphone
(local tile-set (love.graphics.newImage :assets/charmap-cellphone_white.png))
(local tile-width 7)
(local tile-height 9)
(local tileset-width (tile-set:getWidth))
(local tileset-height (tile-set:getHeight))

(local character-keys [" " "!" "\"" "#" "$" "%" "&"  "'" "(" ")" "*" "+" "," "-" "." "/" "0" "1"
                       "2" "3" "4"  "5" "6" "7" "8"  "9" ":" ";" "<" "=" ">" "?" "@" "A" "B" "C"
                       "D" "E" "F"  "G" "H" "I" "J"  "K" "L" "M" "N" "O" "P" "Q" "R" "S" "T" "U"
                       "V" "W" "X"  "Y" "Z" "[" "\\" "]" "^" "_" "`" "a" "b" "c" "d" "e" "f" "g"
                       "h" "i" "j"  "k" "l" "m" "n"  "o" "p" "q" "r" "s" "t" "u" "v" "w" "x" "y"
                       "z" "{" "|"  "}" "~"])
(var characters {})
(each [index character (ipairs character-keys)]
  (tset characters character (love.graphics.newQuad
    (*  (% (- index 1) 18) tile-width)
    (* (math.floor (/ index 18)) tile-height)
    tile-width tile-height
    tileset-width
    tileset-height)))


(create-mode

  (draw [message]
    (love.graphics.print "Welkom bij Tover Drank")
    (love.graphics.draw tile-set (. characters "H") 100 100)
    (love.graphics.draw tile-set (. characters "e") 107 100)
    (love.graphics.draw tile-set (. characters "l") 114 100)
    (love.graphics.draw tile-set (. characters "l") 121 100)
    (love.graphics.draw tile-set (. characters "o") 128 100)
    (love.graphics.draw tile-set (. characters " ") 135 100)
    (love.graphics.draw tile-set (. characters "W") 142 100)
    (love.graphics.draw tile-set (. characters "o") 149 100)
    (love.graphics.draw tile-set (. characters "r") 156 100)
    (love.graphics.draw tile-set (. characters "l") 163 100)
    (love.graphics.draw tile-set (. characters "d") 170 100)
    (love.graphics.draw tile-set (. characters "!") 177 100))

  (update [dt set-mode]
    (set time (+ time dt))
    (when (> time 3) nil))

  (keypressed [key set-mode] (love.event.quit)))
