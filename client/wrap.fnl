(local repl (require "lib.stdio"))
(local push (require :deps/push))

(love.graphics.setDefaultFilter "nearest" "nearest")

(local (game-width game-height) (values 256 240))
(local (window-width window-height) (love.graphics.getDimensions))

(push:setupScreen game-width game-height window-width window-height)

;; set the first mode
(var mode (require "modes/test-mode"))

(fn set-mode [mode-name ...]
  (set mode (require mode-name))
  (when mode.activate
    (mode.activate ...)))

(fn love.load []
  (repl.start))

(fn love.draw []
  (push:start)
  (love.graphics.clear)
  (mode.draw)
  (love.graphics.setColor 1 1 1)
  (push:finish))

(fn love.update [dt]
  (mode.update dt set-mode))

(fn love.keypressed [key]
  (if (and (love.keyboard.isDown "lctrl" "rctrl" "capslock") (= key "q"))
      (love.event.quit)
      ;; add what each keypress should do in each mode
      (mode.keypressed key set-mode)))
